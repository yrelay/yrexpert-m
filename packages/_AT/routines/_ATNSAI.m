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

;%ATNSAI^INT^1^59547,73866^0
%ATNSAI ;;07:25 PM  14 Dec 1992; ; 15 Dec 92  5:17 PM
 
 
 
 
EDITE(NOMATN) 
 N TEMP,GRAP,X,Y,Z,%X,%Y,%Z,REP,LIEN,RAC,TITRE,DEFETAT
 S GLOA="^[QUI]RQSGLO(""ATN"")"
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"NOM") K @(TEMP)
 S GLOA=$$CONCAS^%QZCHAD(GLOA,NOMATN)
 S GRAP=$$CONCAS^%QZCHAD(GLOA,"T")
 S DEFETAT=$$CONCAS^%QZCHAD(GLOA,"O")
 S @TEMP=NOMATN
 S UCONT=$$CONCAS^%QZCHAD(TEMP,"U")
 S RAC=$$CONCAS^%QZCHAD(TEMP,"R")
 I '($D(@GRAP)) S @GRAP@(0)=""
 S @RAC@(0)=""
 D MAKEUC
 S TITRE="1"_$C(0)_"20"_$C(0)_$$^%QZCHW("ATN")_" "_NOMATN
 D ON^%VZEATT
 D ^%QULELU(GRAP,RAC,3,3,UCONT,TITRE)
 D INITREM^%ATNREM(NOMATN)
 K @(TEMP)
 Q
 
 
MAKEUC S @UCONT@("AUTRE",1)="ETAT^%ATNSAI",@UCONT@("AUTRE",1,"TXT")=$$^%QZCHW("Etat"),@UCONT@("AUTRE",1,"COM")=$$^%QZCHW("Acceder au texte de l'etat"),@UCONT@("AUTRE",1,"CTR")="B"
 S @UCONT@("AUTRE",2)="TRANS^%ATNSAI",@UCONT@("AUTRE",2,"TXT")=$$^%QZCHW("Transition"),@UCONT@("AUTRE",2,"COM")=$$^%QZCHW("Acceder au texte de la transition")
 S @UCONT@("AUTRE",3)="AJETAT^%ATNSAI",@UCONT@("AUTRE",3,"TXT")=$$^%QZCHW("Ajouter"),@UCONT@("AUTRE",3,"COM")=$$^%QZCHW("Ajouter une transition a cet etat")
 S @UCONT@("AUTRE",4)="SUPTRANS^%ATNSAI",@UCONT@("AUTRE",4,"TXT")=$$^%QZCHW("Supprimer"),@UCONT@("AUTRE",4,"COM")=$$^%QZCHW("Supprimer la transition")
 S @UCONT@("AUTRE",5)="TERM^%ATNSAI",@UCONT@("AUTRE",5,"TXT")=$$^%QZCHW("Terminal"),@UCONT@("AUTRE",5,"COM")=$$^%QZCHW("Statut de l'etat (terminal ou non)")
 
 
 S @UCONT@("AFF")="$$TRTABRV^%ATNSAI"
 S @UCONT@("INFO")="$$INFO^%ATNSAI"
 S @UCONT@("FULL")="$$TRTFULL^%ATNSAI"
 S @UCONT@("MODEAFF")="$$MODEAFF^%ATNSAI"
 Q
 
 
ETAT(TP) 
 N OB,GLOETA,DEFETAT,LC
 S NOMATN=$$GETNOM
 S GLOETA=$$CONCAS^%QZCHAD("^[QUI]RQSGLO(""ATN"")",NOMATN)
 S DEFETAT=$$CONCAS^%QZCHAD($$CONCAS^%QZCHAD(GLOETA,"O"),@TP@("O"))
 D CLEPAG^%VVIDEO
 D CARSP^%VVIDEO(0,3,12,80,0)
 D REAFF^%QULIMO3(1,1,DEFETAT,0,3,80,12)
 S LC=1 D ^%QULIMO(0,3,80,12,DEFETAT,.LC,"SAISIE^%ATNSAI","SAISIE^%ATNSAI")
 S MODG=0,OKU=1
 D KILLREM^%ATNREM(NOMATN)
 Q
SAISIE S OK=1 Q
 
 
TRANS(TP) N OB
 N GLOETA,LC,DEFETAT,TRANSIT
 S NOMATN=$$GETNOM
 S GLOETA=$$CONCAS^%QZCHAD("^[QUI]RQSGLO(""ATN"")",NOMATN)
 S DEFETAT=$$CONCAS^%QZCHAD(GLOETA,"T")
 S TRANSIT=$$CONCAS^%QZCHAD($$CONCAS^%QZCHAD(DEFETAT,@TP@("P")),@TP@("O"))
 D CLEPAG^%VVIDEO
 D CARSP^%VVIDEO(0,3,5,80,0)
 D REAFF^%QULIMO3(1,1,TRANSIT,0,3,80,5)
 S LC=1 D ^%QULIMO(0,3,80,5,TRANSIT,.LC,"SAISIE^%ATNSAI","SAISIE^%ATNSAI")
 S MODG=0,OKU=1
 D KILLREM^%ATNREM(NOMATN)
 Q
AJETAT(TP) 
 N Y1,OBJ,GLOA,TEMP,GRAP,GLOETA
 S NOMATN=$$GETNOM
 D KILLREM^%ATNREM(NOMATN)
 S GLOETA=$$CONCAS^%QZCHAD("^[QUI]RQSGLO(""ATN"")",NOMATN)
 S GRAP=$$CONCAS^%QZCHAD(GLOETA,"T")
 S MODG=1,OKU=1,OBJ=@TP@("O")
 D POCLEPA^%VVIDEO W $$^%QZCHW("Etat : ") S DX=$X,DY=$Y D ^%VLEC
 I Y1="" S MODG=0 Q
 G:$D(@GLOETA@("O",Y1)) INDLI
 I '($$CONFIRM^%PKUTIL(2,14,60,$$^%QZCHW("Cet etat n'existe pas, voulez-vous le creer"))) S (OKU,MODG)=0 Q
 S @GLOETA@("O",Y1)=0
INDLI S @GRAP@(OBJ,Y1)=""
 S @GLOETA@("T",OBJ,Y1)=""
 Q
 
ENTREES(TP) 
 S NOMATN=$$GETNOM
 S GLOETA=$$CONCAS^%QZCHAD("^[QUI]RQSGLO(""ATN"")",NOMATN)
 S DEFETAT=$$CONCAS^%QZCHAD(GLOETA,"E")
 D CLEPAG^%VVIDEO
 D CARSP^%VVIDEO(0,3,12,80,0)
 D REAFF^%QULIMO3(1,1,DEFETAT,0,3,80,12)
 S LC=1 D ^%QULIMO(0,3,80,12,DEFETAT,.LC,"SAISIE^%ATNSAI","SAISIE^%ATNSAI")
 S MODG=0,OKU=1
 Q
SORTIES(TP) 
 S NOMATN=$$GETNOM
 S GLOETA=$$CONCAS^%QZCHAD("^[QUI]RQSGLO(""ATN"")",NOMATN)
 S DEFETAT=$$CONCAS^%QZCHAD(GLOETA,"S")
 D CLEPAG^%VVIDEO
 D CARSP^%VVIDEO(0,3,12,80,0)
 D REAFF^%QULIMO3(1,1,DEFETAT,0,3,80,12)
 S LC=1 D ^%QULIMO(0,3,80,12,DEFETAT,.LC,"SAISIE^%ATNSAI","SAISIE^%ATNSAI")
 S MODG=0,OKU=1
 Q
 S OK=1 Q
 
TERM(TP) 
 N NOMATN,GLOETA
 S NOMATN=$$GETNOM
 S GLOETA=$$CONCAS^%QZCHAD("^[QUI]RQSGLO(""ATN"")",NOMATN)
 S OBJ=@TP@("O")
 I ('($D(@GLOETA@("O",OBJ))))#10 S @GLOETA@("O",OBJ)=0
 I $$CONFIRM^%PKUTIL(2,14,60,"Cet etat est actuellement "_$S(@GLOETA@("O",OBJ):"",1:"non-")_"terminal, confirmez-vous son changement de statut ?") S @GLOETA@("O",OBJ)=1-@GLOETA@("O",OBJ)
 S MODG=0
 Q
SUPTRANS(TP) N OB
 N Y1,OBJ,GLOA,TEMP,GRAP,GLOETA
 S NOMATN=$$GETNOM
 D KILLREM^%ATNREM(NOMATN)
 S GLOETA=$$CONCAS^%QZCHAD("^[QUI]RQSGLO(""ATN"")",NOMATN)
 S GRAP=$$CONCAS^%QZCHAD(GLOETA,"T")
 S MODG=0,OKU=1,OBJ=@TP@("O"),PER=@TP@("P")
 I PER'="" K @GRAP@(PER,OBJ),@GLOETA@("T",PER,OBJ) S MODG=1
 Q
 
EXECMP(TP) D @("^xz"_$$GETNOM) Q
EXECMP(TP) ZE @("xz"_$$GETNOM) Q
 
 
GETNOM() N TEMP,NOM S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"NOM"),NOM=@TEMP Q NOM
 
TRTABRV(RIVX,LG) 
 
 N GAG S GAG=@RIVX
 Q GAG
 
MODEAFF(RIVX) 
 Q "NORM"
 N NOMATN,GLOETA,OBJ
 S OBJ=@RIVX
 S NOMATN=$$GETNOM
 S GLOETA=$$CONCAS^%QZCHAD("^[QUI]RQSGLO(""ATN"")",NOMATN)
 I ('($D(@GLOETA@("O",OBJ))))#10 S @GLOETA@("O",OBJ)=0
 
 Q $S(@GLOETA@("O",OBJ):"UDL",1:"NORM")
 Q $S(@GLOETA@("O",OBJ):"BLK",1:"NORM")
 Q $S(@GLOETA@("O",OBJ):"BLD",1:"NORM")
 
 
TRTFULL(TP) N OBJ
 S OBJ=@TP@("O") Q OBJ
 
INFO(TP) N OBJ,TY,TYP
 N Y1,OBJ,GLOA,TEMP,DEFETAT,NOMATN
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"NOM"),NOMATN=@TEMP
 S DEFETAT=$$CONCAS^%QZCHAD("^[QUI]RQSGLO(""ATN"")",NOMATN)
 S RES=""
 S PER=@TP@("P"),OBJ=@TP@("O")
 I PER'="",$D(@DEFETAT@("T",PER,OBJ,1)) S RES=RES_1_$C(0)_2_$C(0)_"condition de transition : "_@DEFETAT@("T",PER,OBJ,1)_$C(0)
 I $D(@DEFETAT@("O",OBJ,1)) S RES=RES_2_$C(0)_2_$C(0)_" action : "_@DEFETAT@("O",OBJ,1)
 Q RES
 ;
 ;
 ;
 ;

