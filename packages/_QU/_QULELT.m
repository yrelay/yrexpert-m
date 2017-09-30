;!----------------------------------------------------------------------------!
;!                                                                            !
;! Licence et conditions d'utilisation                                        !
;! Yexpert : (your) Systeme Expert sous Mumps GT.M et GNU/Linux               !
;! Copyright (C) 2001-2015 by Hamid LOUAKED (HL).                             !
;!                                                                            !
;! Hamid LOUAKED                                                              !
;! 10, impasse Faraday                                                        !
;! 78520 LIMAY                                                                !
;! France                                                                     !
;!                                                                            !
;! yexpert@yrelay.fr                                                          !
;! http://www.yrelay.fr/                                                      !
;!                                                                            !
;! Ce programme est un logiciel libre ; vous pouvez le redistribuer           !
;! et/ou le modifier conformement aux dispositions de la Licence Publique     !
;! Generale GNU, telle que publiee par la Free Software Foundation ;          !
;! version 3 de la licence, ou encore (a votre choix) toute version ulterieure.
;!                                                                            !
;! Ce programme est distribue dans l'espoir qu'il sera utile,                 !
;! mais SANS AUCUNE GARANTIE ; sans meme la garantie implicite de             !
;! COMMERCIALISATION ou D'ADAPTATION A UN OBJET PARTICULIER.                  !
;! Pour plus de details, voir la Licence Publique Generale GNU.               !
;!                                                                            !
;! Un exemplaire de la Licence Publique Generale GNU doit etre fourni avec    !
;! ce programme ; si ce n'est pas le cas,                                     !
;! ecrivez a la Free Software Foundation Inc.,                                !
;! 675 Mass Ave, Cambridge, MA 02139, Etats-Unis.                             !
;!                                                                            !
;! Ce logiciel est telechargeable a l'adresse http://www.yrelay.fr/ ;         !
;! vous trouverez egalement, sur ce site, un mode d'emploi complet            !
;! et des informations supplementaires.                                       !
;!                                                                            !
;!----------------------------------------------------------------------------!
;!                                                                            !
;! GNU General Public License : http://www.gnu.org/copyleft/gpl.html          !
;!                                                                            !
;! Traduction francaise : http://dachary.org/loic/gpl-french.pdf              !
;!                                                                            !
;!----------------------------------------------------------------------------!

;!============================================================================!
;! Nomprog     :                                                              !
;! Module      :                                                              !
;! But         :                                                              !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%QULELT^INT^1^59547,73885^0
%QULELT ;
 
 
 
 
 
 
ALLTRT N Y1,MODECRA
 S MODECRA=0
 S Y1=$$GETSPE^%TLDIAL2("Traitement Racine (* pour tous) : ",.MODECRA)
 Q:Y1=""
 G:Y1="*" C11
 D ^%VZEATT
 D TRT("t."_Y1) Q
 
 
C1 
 I CTRLF S:$D(^[QUI]RQSDON("MEMTRT",$I)) Y1=^[QUI]RQSDON("MEMTRT",$I) I '($$EXISTE^%TLGEST(Y1)) G C1
 I Y1="" G C11
 I '($$EXISTE^%TLGEST(Y1)) D ^%VZEAVT($$^%QZCHW(" inconnu ")) G C1
 D MSG^%VZEATT($$^%QZCHW(" un instant "))
 S ^[QUI]RQSDON("MEMTRT",$I)=Y1 D TRT("t."_Y1) Q
C11 
 N TEMP,GRAP,X,Y,Z,%X,%Y,%Z,REP,LIEN,RAC,TITRE,UCONT
 D MSG^%VZEATT($$^%QZCHW(" un instant "))
 S REP="TRAITEMENT",LIEN="APPELLE",RAC=""
 S TEMP=$$TEMP^%SGUTIL K @(TEMP)
 S GRAP=$$CONCAS^%QZCHAD(TEMP,"G"),UCONT=$$CONCAS^%QZCHAD(TEMP,"U")
 S X="" F %X=0:0 S X=$$NXTRI^%QSTRUC8(REP,X) Q:X=""  I ($E(X)'="r")&($E(X)'="l") S @GRAP@(X)="" I $$AIR^%QSGE5(REP,X,LIEN) S Y="" F %Y=0:0 S Y=$$NXTRIAV^%QSTRUC8(REP,X,LIEN,Y) Q:Y=""  S @GRAP@(X,Y)=""
 D UCTRT
 S TITRE="1"_$C(0)_"20"_$C(0)_$$^%QZCHW("ARBRE D'APPEL DES TRAITEMENTS")
 D ^%QULELU(GRAP,GRAP,20,3,UCONT,TITRE)
 K @(TEMP)
 Q
TRT(RAC) 
 N TEMP,GRAP,X,Y,CPT,PILE,%I,REP,LIEN,TABRAC,TITRE,UCONT
 S REP="TRAITEMENT",LIEN="APPELLE"
 S TEMP=$$TEMP^%SGUTIL K @(TEMP)
 S GRAP=$$CONCAS^%QZCHAD(TEMP,"G"),PILE=$$CONCAS^%QZCHAD(TEMP,"P"),UCONT=$$CONCAS^%QZCHAD(TEMP,"U")
 S CPT=0,@PILE@(CPT)=RAC,@GRAP@(RAC)="",%I=1
 S CPT="" F %K=0:0 S CPT=$O(@PILE@(CPT)) Q:CPT=""  S X=@PILE@(CPT),Y="" F %I=%I:1 S Y=$$NXTRIAV^%QSTRUC8(REP,X,LIEN,Y) Q:Y=""  S @GRAP@(X,Y)="" S:'($D(@GRAP@(Y))) @GRAP@(Y)="",@PILE@(%I)=Y
 D UCTRT
 S TABRAC(RAC)=""
 S TITRE="1"_$C(0)_"20"_$C(0)_$$^%QZCHW("ARBRE D'APPEL DES TRAITEMENTS") D ^%QULELU(GRAP,"TABRAC",20,3,UCONT,TITRE)
 K @(TEMP)
 Q
 
 
UCTRT S @UCONT@("AUTRE",1)="TRTCTRB^%QULELT",@UCONT@("AUTRE",1,"TXT")=$$^%QZCHW("Editer"),@UCONT@("AUTRE",1,"COM")=$$^%QZCHW("Acceder au texte de l'objet"),@UCONT@("AUTRE",1,"CTR")="B"
 S @UCONT@("AUTRE",2)="TRTANA^%QULELT",@UCONT@("AUTRE",2,"TXT")=$$^%QZCHW("Analyser"),@UCONT@("AUTRE",2,"COM")=$$^%QZCHW("Reanalyser les regles")
 S @UCONT@("AUTRE",3)="TRTSUPP^%QULELT",@UCONT@("AUTRE",3,"TXT")=$$^%QZCHW("Supprimer"),@UCONT@("AUTRE",3,"COM")=$$^%QZCHW("Supprimer cet objet")
 S @UCONT@("AUTRE",4)="TRTACT^%QULELT1",@UCONT@("AUTRE",4,"TXT")=$$^%QZCHW("Activer"),@UCONT@("AUTRE",4,"COM")=$$^%QZCHW("Activer ce traitement")
 S @UCONT@("AUTRE",5)="SGPKOUT^%QULELT1",@UCONT@("AUTRE",5,"TXT")=$$^%QZCHW("Archiver"),@UCONT@("AUTRE",5,"COM")=$$^%QZCHW("Archiver cet objet et sa suite")
 S @UCONT@("AFF")="$$TRTABRV^%QULELT"
 S @UCONT@("INFO")="$$TRTINFO^%QULELT"
 S @UCONT@("FULL")="$$TRTFULL^%QULELT"
 Q
 
 
TRTCTRB(TP) N TY,OB
 S MODG=0,OKU=1,OB=@TP@("O"),TY=$E(OB),OB=$E(OB,3,$L(OB))
 D MEM^%QCAMEM
 K (QUI,WHOIS,TY,OB) D CURRENT^%IS,VARSYS^%QCSAP
 I TY="t" D ^%TLSAISI(OB) G TRTCTRBF
 I TY="m" D SAISIE^%EDGETMD(OB) G TRTCTRBF
 I TY="f" D ^%EDFDIAL(OB) G TRTCTRBF
 I TY="q" D MODIF^%QS8(OB)
TRTCTRBF 
 D RMEM^%QCAMEM Q
 Q
TRTANA(TP) N TY,OB,LISTE,ANALOK
 S MODG=0,OKU=1,OB=@TP@("O"),TY=$E(OB),OB=$E(OB,3,$L(OB))
 D MEM^%QCAMEM
 K (QUI,WHOIS,TY,OB) D CURRENT^%IS,VARSYS^%QCSAP
 I TY="t" S LISTE="LISTE",LISTE(OB)="" D PART^%TLALLAN(.LISTE) G TRTANAF
 I TY="m" S LISTE="LISTE",LISTE(OB)="" D ANAL^%EDMALLA(LISTE,0,1) G TRTANAF
 I TY="f" S LISTE="LISTE",LISTE(OB)="" D ANAL^%EDFALLA(LISTE,0,1) G TRTANAF
 I TY="q" D ANAL2^%QS9(OB,0,0,.ANALOK)
TRTANAF 
 D RMEM^%QCAMEM Q
 Q
TRTSUPP(TP) N TY,OB,LISTOK
 S MODG=0,OKU=1,OB=@TP@("O"),PE=@TP@("P"),TY=$E(OB),OB=$E(OB,3,$L(OB))
 D MEM^%QCAMEM
 K (QUI,WHOIS,TY,OB,PE) D CURRENT^%IS,VARSYS^%QCSAP
 I TY="t" D POCLEPA^%VVIDEO G:$$CONFIRM^%VZEOUI($$^%QZCHW("Voulez-vous supprimer le traitement ")_OB_" ? : ")'=1 TRTSUPPF S LISTOK=0 D MSG^%VZEATT($$^%QZCHW(" un instant ")),SUPP^%TLGEST(OB),POCLEPA^%VVIDEO G TRTSPF2
 I TY="m" D POCLEPA^%VVIDEO G:$$CONFIRM^%VZEOUI($$^%QZCHW("Voulez-vous supprimer le modele ")_OB_" ? ")'=1 TRTSUPPF D MSG^%VZEATT($$^%QZCHW(" un instant ")),SUPP^%EDDGEST(OB) G TRTSPF2
 I TY="f" D POCLEPA^%VVIDEO G:$$CONFIRM^%VZEOUI($$^%QZCHW("Voulez-vous supprimer le format ")_OB_" ?")'=1 TRTSUPPF D MSG^%VZEATT($$^%QZCHW(" un instant ")),SUPP^%EDFGEST(OB) G TRTSPF2
 I TY="q" D POCLEPA^%VVIDEO G:$$CONFIRM^%VZEOUI($$^%QZCHW("Voulez-vous supprimer la requete ")_OB_" ?")'=1 TRTSUPPF D MSG^%VZEATT($$^%QZCHW(" un instant ")),^%QSUPREQ(OB,1) G TRTSPF2
TRTSUPPF 
 D RMEM^%QCAMEM Q
TRTSPF2 D RMEM^%QCAMEM
 K @GRAP@(TY_"."_OB)
 I PE'="" K @GRAP@(PE,TY_"."_OB)
 S MODG=1 Q
 
TRTABRV(RIVX,LG) N GAG S GAG=@RIVX Q $E(GAG,3,$L(GAG))
 
TRTFULL(TP) N OBJ
 S OBJ=@TP@("O") Q $E(OBJ,3,$L(OBJ))
 
TRTINFO(TP) N OBJ,TY,TYP
 S OBJ=@TP@("O"),TY=$E(OBJ)
 S TYP=$S(TY="t":"traitement",TY="m":"modele",TY="f":"format",TY="r":"repertoire",TY="q":"requete",1:"")
 S RES=1_$C(0)_1_$C(0)_TYP_$C(0)_1_$C(0)_($L(TYP)+2)_$C(0)_$E(OBJ,3,$L(OBJ))
 Q RES
 ;

