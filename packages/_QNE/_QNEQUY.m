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

;%QNEQUY^INT^1^59547,73879^0
QNEQUY ;
 
 
 
 
INIT 
 D MSG^%VZEATT($$^%QZCHW("Calcul de l'equilibrage"))
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S LIGN=$$CONCAS^%QZCHAD(TEMP,"GLOBAL.ERREURS")
 S P=$$CONCAS^%QZCHAD(TEMP,"P")
 S ADR=$$CONCAT^%QZCHAD(ADR,"M,.LMN,.LM")
 S INFO=$$CONCAT^%QZCHAD(INFO,"IND,TEMPS")
 S DEL=$$CONCAT^%QZCHAD(DEL,"LMN")
 
 F I="LIND","LH","INSEPL","LG" S @I=@VT@(I),M=I_"S",@M=$$ADRLIS^%QSGEST7(@I)
 S @VT@("LIGN")=LIGN
 
 S ABANDON=0
 S CARDL=$$CARD^%QSGEST7(LISTIND)
 S ERREUR="",SF=(TAL'="")!(TAG'="")
 S M=1,CARDP=0
 Q
 
FIN 
 I $D(LMN),$$CARD^%QSGES11(LMN) D ELIMI^%QSGES11(LLISTEN,LMN),DEL^%QNEQUI(DEL,LMN)
 D AJTYP^%QNEQUI3(@VT@("ETUDE"),"AUTOMATIQUE"),MAJ^%QNEQUI3(@VT@("ETUDE"))
 F I="LISTES.SORTIE.PARTITION","LISTES.SORTIE.OK","INCOMP.LISTES.SORTIE" D STATSET^%QNEQUI8(VT,I,1)
 F I="MAJ.INDICATEURS","SORTIE.AFFECTATIONS","SORTIE.CUMULS" D STATSET^%QNEQUI8(VT,I,0)
 Q
 
 
CONDTRT() 
 N %Z,%Q,A,I,VCYCLE,VINCOMP,T,F,CTR,ESC,OK
 
 
 F I=0:0 Q:ICOUR=""  S INDCOUR=@L@(ICOUR) Q:$$SKIP  S ICOUR=$O(@L@(ICOUR))
 
 I ICOUR="" Q 1
 
 D MSG^%VZEATT(INDCOUR)
 S ERREUR=""
 S A=$$MORE^%VZATOU(.T,.F,.CTR,.ESC,0,0)
 I CTR="A" D POCLEPA^%VVIDEO S ABANDON=$$MES^%VZEOUI($$^%QZCHW("Souhaitez vous abandonner l'equilibrage automatique en cours"),"N") Q 1
 
 S MULT(2)=MULT(1)
 
 
 
 S CINSIND=$$CINSIND^%QNEQUI9(INFO,.TEMPS,INDCOUR,INSEPI,INSEP)
 
 S (VCYCLE,VINCOMP)=0,OK=1
 S %Q=0 F %Z=2:1:NCOADDI S:(CINSIND(%Z)+CLM(%Z))>C(%Z) %Q=1 Q:%Q>0
 I %Q>0 Q 1
 I (CINSIND+CLM)>(C*MULT(1)) Q:$$MULT 1
 
 
 
 I $$PRECEDE(INDCOUR,LM) Q 1
 I $$LIENCOMPAT Q 1
 ;;I $$LIENPRECE() Q 1
 
 I $D(@INCOMPL@(INDCOUR)) S VINCOMP=1,OK=0 I '(SF) Q 1
 
 I SF G SF
 
 D DMULT
 Q 0
SF I $$^%QNEQUI5(LISTIND,@VT@("ETUDE"),TAL,TAG,LIND,INSEPL,LH,LG,C,CLM,CINSIND,INDCOUR,INSEPI,LMN,LLISTEN,MODAF,OK,VCYCLE,VINCOMP,DMULT,NAFF,.MULT,.ERREUR,.ABANDON) D DMULT Q 0
 S:ERREUR="" ERREUR=$$^%QZCHW("le placement de")_" "_INDCOUR_" "_$$^%QZCHW("est interdit par le savoir faire")
 I ERREUR'[$$^%QZCHW("le cycle est depasse par") D ADD(LIGN,ERREUR)
 Q 1
 
 
 
 
MULT() I '($D(@INSEPI@(INDCOUR))) G MULTNO
 
 S MULT(2)=((CLM+CINSIND)\C)+1
 
 I MULT(2)>DMULT G MULTNO
 S OK=1
 Q 0
 
MULTNO S ERREUR=$$^%QZCHW("le cycle est depasse par")_" "_INDCOUR_" ("_(CINSIND+CLM)_") "_$$^%QZCHW("effectif.poste")_" : "_MULT(1)
 
 S VCYCLE=1,OK=0
 I '(SF) Q 1
 Q 0
 
 
 
DMULT I MULT(2)=MULT(1) Q
 D ADDA^%QS0(LMN,"EFFECTIF.POSTE",MULT(2)) S MULT(1)=MULT(2)
 Q
 
 
 
SKIP() 
 N VAL
 I $D(@P@(INDCOUR)) Q 0
 S VAL=$$VAL^%QNEQUI(INFO,INDCOUR,TEMPS)
 I VAL="" D ADD(LIGN,$$^%QZCHW("L'individu")_" "_INDCOUR_" , "_$$^%QZCHW("qui ne porte pas l'attribut")_" "_TEMPS_" , "_$$^%QZCHW("n'a pu etre place")) S @P@(INDCOUR)="IMPLACABLE" Q 0
 Q 1
 
 
ADD(OO,TXT) 
 S @OO@($ZP(@OO@(""))+1)=TXT
 Q
 
 
 
 
APPEL(APPEL,GOTO,HERE) 
 
 I GOTO="",'($$PILEVIDE^%QCASTA(APPEL)) S GOTO=$$POP^%QCASTA(APPEL) Q GOTO
 
 I GOTO'="" D PUSH^%QCASTA(APPEL,HERE) Q GOTO
 
 Q ""
LIENCOMPAT() 
 N X,%I,%Q
 S %Q=0,X="" F %I=0:0 S X=$$NXTRIAV^%QSTRUC8(BASEL,INDCOUR,"INCOMPATIBLE.AVEC",X) Q:X=""  S:$$LOCATE(LM,X) %Q=1 Q:%Q=1
 Q:%Q=1 %Q
 S %Q=0,X="" F %I=0:0 S X=$$NXTRIAV^%QSTRUC8(BASEL,INDCOUR,"INCOMPATIBLE.DE",X) Q:X=""  S:$$LOCATE(LM,X) %Q=1 Q:%Q=1
 Q:%Q=1 %Q
 Q 0
 
LOCATE(LM,X) 
 Q $D(@LM@(X))
 
LIENPRECE() 
 N X,%I,%Q
 S %Q=0,X="" F %I=0:0 S X=$$NXTRIAV^%QSTRUC8(BASEL,INDCOUR,"DOIT.SUIVRE",X) Q:X=""  S:'($D(@P@(X))) %Q=1 Q:%Q=1
 Q:%Q=1 %Q
 Q 0
 
REINIT 
 
 N GROAFF,UTIL
 S GROAFF=@VT@("GRO"),UTIL=""
 D AFFEC^%QFGROMA(VT,LISTIND,LLISTEN,UTIL,.GROAFF)
 D AUT1^%QFGRDEC
 Q
PRECEDE(INDCOUR,LM) 
 
 
 
 N VAL,%Z,Z
 S VAL=0
 I PRECEDE S Z="" F %Z=1:1 S Z=$O(@LM@(Z)) Q:Z=""  D P1 Q:VAL=1  D P2 Q:VAL=1
 ;;;
 Q VAL
P1 
 S VAL=$$EXILIEN^%QEPRIM(REP,NOMLIEN,INDCOUR,Z)
 Q
P2 
 S VAL=$$EXILIEN^%QEPRIM(REP,NOMLIEN,Z,INDCOUR)
 Q

