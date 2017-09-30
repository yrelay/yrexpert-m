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

;%QUBKKA^INT^1^59547,73884^0
%QUBKKA ;;09:39 AM  15 Oct 1992;
 
 
 
 N DEFETU
 S DEFETU=$$^%QUBKKEC("")
 Q:DEFETU=""
 D CLEPAG^%VVIDEO
 D ACTIV(DEFETU,0,0)
 Q
 
 
 
 
 
 
 
 
ACTIV(DEFETU,MUET,HERIT) 
 N GL,LIS,TEMP,CO,%CO,FE,%FE,DEFB,GLODEF,CORR,REP,ADRL,IIND,IND,%II,VAL,%IJ,GLOVAL,TRTTAG,Y1,NBCOL,TITRE,RES,LISTE,NOMSM,CONDIT,IMH
 
 S NOMSM=$P(DEFETU,$C(0)),LISTE=$P(DEFETU,$C(0),3)
 S TITRE=$P(DEFETU,$C(0),5)
 S GLODEF=$$CONCAS^%QZCHAD("^[QUI]RQSGLO(""QUBKGR"")",NOMSM) Q:'($D(@GLODEF))
 
 S GLOVAL=$$CONCAS^%QZCHAD("^[QUI]RQSDON(""QUBKGR"")",NOMSM) Q:'($D(@GLOVAL))
 
 S GL=$$CONCAS^%QZCHAD(GLOVAL,"G")
 
 S DEFB=@GLODEF@("D")
 
 S TEMP=$$TEMP^%SGUTIL
 S LIS=$$CONCAS^%QZCHAD(TEMP,"L")
 S CORR=$$CONCAS^%QZCHAD(TEMP,"C")
 
 S (@TEMP@("ADCONDIT"),CONDIT)=$$CONCAS^%QZCHAD(GLOVAL,"C")
 S @TEMP@("ADGLODEF")=GLODEF
 
 S @TEMP@("ADKEMPL")=$$CONCAS^%QZCHAD(GLOVAL,"K")
 S @TEMP@("ADFORM")=$$CONCAS^%QZCHAD(GLOVAL,"F")
 S @TEMP@("ADFORM2")=$$CONCAS^%QZCHAD(GLOVAL,"F2")
 
 S (@TEMP@("VNBCOL"),NBCOL)=@GLOVAL@("VNBCOL")
 S @TEMP@("VNBFEN")=@GLOVAL@("VNBFEN")
 S @TEMP@("VLISTE")=LISTE,@TEMP@("VHERIT")=HERIT
 S (@TEMP@("VREP"),REP)=$$BASE^%QSGEST7(LISTE)
 S @GL@("TI")=TITRE
 S @GL@("SUPPLEM")="SUPPLEM^%QUBKKA"
 
 S MENUH=$$TEMP^%SGUTIL
 S @MENUH="22^10^79"
 S IMH=1,@MENUH@(IMH)=$$^%QZCHW("principale")_"^PRINC",@MENUH@(IMH,"COM")=$$^%QZCHW("entrer dans la fenetre principale")
 I @CONDIT@("NBCOND")'=0 S IMH=IMH+1,@MENUH@(IMH)=$$^%QZCHW("conditionnelle")_"^COND",@MENUH@(IMH,"COM")=$$^%QZCHW("entrer dans la fenetre conditionelle")
 S IMH=IMH+1,@MENUH@(IMH)=$$^%QZCHW("abandon")_"^ABAND",@MENUH@(IMH,"COM")=$$^%QZCHW("abandon sans sauvegarde des valeurs dans DKBMS")
 S IMH=IMH+1,@MENUH@(IMH)=$$^%QZCHW("fin")_"^FINSTO",@MENUH@(IMH,"COM")=$$^%QZCHW("arret de la saisie et sauvegarde des valeurs dans DKBMS")
 I $P(DEFB,"^",6)'="" S TRTTAG=$P(DEFB,"^",6) I $$EXISTE^%TLGEST(TRTTAG) S IMH=IMH+1,@MENUH@(IMH)=$$^%QZCHW("tag")_"^TAG",@MENUH@(IMH,"COM")=$$^%QZCHW("activation du traitement d'acceptation globale"),@TEMP@("VTRTTAG")=TRTTAG
 S IMH=IMH+1,@MENUH@(IMH)=$$^%QZCHW("largeur")_"^LARG",@MENUH@(IMH,"COM")=$$^%QZCHW("modification de la largeur des fenetres de l'ecran")
 S IMH=IMH+1,@MENUH@(IMH)=$$^%QZCHW("rafraichir")_"^RAFR",@MENUH@(IMH,"COM")=$$^%QZCHW("rafraichissement de l'ecran")
 
 
 S @GL@("UCONT","CTRB")="CTRB^%QUBKKU"
 D DEFSTRU^%QUBKKAI
 D LOAD^%QUBKKAI
 G:MUET FINSTD
 
 I @CONDIT@("NBCOND")'=0 S @TEMP@("LIGCOUR")=1
 D AFFALL
 
BCL S DX=0,DY=21 D CLEBAS^%VVIDEO,^%VQUIKMN(1,80,23,MENUH,.ADRES,.CONTR)
 G:CONTR="" @ADRES
 G:CONTR="A" FIN
 G:CONTR="F" FINSTD
 I CONTR="R" D AFFALL G BCL
 G BCL
 
 
PRINC S RES=$$^%QUBKVR(@TEMP@("NUMSTRU"))
 G BCL
 
RAFR D AFFALL G BCL
 
LARG D ^%QUBKKLF
 D AFFALL
 G BCL
 
 
FINSTD D ^%QUBKKAF
 I $D(@TEMP@("VTRTTAG")) S R=$S(@TEMP@("VHERIT"):$$CALLCXT,1:$$CALLNORM)
 G FIN
 
 
ABAND G FIN
 
 
FINSTO D ^%QUBKKAF G FIN
 
 
 
 
COND S %II=0
 S FE="" F %FE=0:0 S FE=$O(@TEMP@("VALCOND",@TEMP@("LIGCOUR"),FE)) Q:FE=""  S %II=@TEMP@("VALCOND",@TEMP@("LIGCOUR"),FE) Q:%II
 G:'(%II) BCL
 S RES=$$^%QUBKVR(@TEMP@("FCOND",@TEMP@("LIGCOUR"),"NUMSTRU"))
 G BCL
 
 
TAG D ^%QUBKKAF
 S RES=$S(@TEMP@("VHERIT"):$$CALLCXT,1:$$CALLNORM)
 D LOAD^%QUBKKAI,AFFALL G BCL
 
CALLCXT() 
 N CXT,ABANDON,TRT,LISTE
 S TRT=@TEMP@("VTRTTAG"),LISTE=@TEMP@("VLISTE")
 I $$EXISTE^%TLINTER(TRT),$$EX^%QS0(LISTE) Q $$CONTEXTL^%TLIACTI(TRT,LISTE,0,0,0,.CXT,.ABANDON)
 Q 0
CALLNORM() 
 N TRT,LISTE
 S TRT=@TEMP@("VTRTTAG"),LISTE=@TEMP@("VLISTE")
 I $$EXISTE^%TLINTER(TRT),$$EX^%QS0(LISTE) Q $$ACTIVL^%TLIACTI(TRT,LISTE,0,0)
 Q 0
 
 
FIN 
 S LIGCOUR="" F %I=0:0 S LIGCOUR=$O(@TEMP@("FCOND",LIGCOUR)) Q:LIGCOUR=""  K @(@TEMP@("FCOND",LIGCOUR,"ADLIS")) D END^%QUBKVI(@TEMP@("FCOND",LIGCOUR,"NUMSTRU"))
 D END^%QUBKVI(@TEMP@("NUMSTRU"))
 K @(MENUH),@(TEMP)
 Q
 
 
AFFALL 
 D ^%QUBKVA(@TEMP@("NUMSTRU"))
 
 I @CONDIT@("NBCOND")'=0 D ^%QUBKVA(@TEMP@("FCOND",@TEMP@("LIGCOUR"),"NUMSTRU"))
 Q
 
 
 
SUPPLEM(TEMP) 
 N CONDIT
 S CONDIT=@TEMP@("ADCONDIT")
 I @CONDIT@("NBCOND")'=0 D ^%QUBKVA(@TEMP@("FCOND",LIGCOUR,"NUMSTRU"))
 S @TEMP@("LIGCOUR")=LIGCOUR
 Q
 ;

