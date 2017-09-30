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

;%EDFALLA^INT^1^59547,73869^0
%EDFALLA ;;09:11 AM  13 Jun 1991;
 
 
 
 
 
 
 
 
 
 
 
 
 N ENSEM,Y1,I,RES,MENU1
 S ENSEM=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LFOR")
AFF K @(ENSEM)
 D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("REANALYSE DE FORMAT"))
 S MENU1(1)=$$^%QZCHW("SELECTION")_"^SEL"
 S MENU1(2)=$$^%QZCHW("TOUS")_"^TOUS"
DIAL2 D ^%VQUIKMN(23,78,22,"MENU1",.AD,.CONTR)
 I (CONTR="A")!(CONTR="F") Q
 I AD'="" G @AD
 G DIAL2
 
TOUS D ANAL("^[QUI]EDFORMAT",0,1) G FINAL
 
SEL 
LEC S DX=0,DY=5 D CLEBAS^%VVIDEO
 S DX=0,DY=10 X XY W $$^%QZCHW("Format : ") S DX=$X D ^%VLEC
 G:(Y1="")!CTRLA AFF G:"*?"'[$E(Y1,$L(Y1)) UN
SELEC 
 K @(ENSEM)
 D INIT^%QUCHOIP("^[QUI]EDFORMAT",1,"",0,5,80,17),AFF^%QUCHOIP
 D ^%QUCHOYP(ENSEM) I '($D(@ENSEM)) G AFF
 D ANAL(ENSEM,0,1)
 D END^%QUCHOIP G FINAL
UN I '($D(^[QUI]EDFORMAT(Y1))) D POCLEPA^%VVIDEO W $$^%QZCHW("le format ")_Y1_$$^%QZCHW(" n'existe pas ") H 2 G LEC
 S @ENSEM@(Y1)=""
 D ANAL(ENSEM,0,1)
 
FINAL D VISU
 G AFF
 
 
 
ALL N SOR
 D POCLEPA^%VVIDEO
 W $$^%QZCHW("Impression sur ") S SOR=$$^%VZESOR("E") Q:(SOR'=1)&(SOR'=0)
 D ANAL("^[QUI]EDFORMAT",SOR,1)
 Q:SOR=1
 Q:'($D(^[QUI]PBMANA("FORMAT")))
 I $$MES^%VZEOUI($$^%QZCHW("Consultation des problemes recontres ?"),"O") D VISU
 K ^[QUI]PBMANA("FORMAT")
 Q
 
 
INT D ANAL("^[QUI]EDFORMAT",0,1) Q
 
 
ANAL(LIST,SOR,TRACE) 
 N MDL,%Y,RES,I,CTRLA,ABANDON,IMP
 G @SOR
1 D POCLEPA^%VVIDEO W $$^%QZCHW("Edition de la reanalyse en cours ... ")
 S IMP=$S($D(^TABIDENT(WHOIS,"PRINTER")):^TABIDENT(WHOIS,"PRINTER"),1:0)
 O IMP U IMP
0 D POCLEPA^%VVIDEO
 S MDL="",ABANDON=0
 K ^[QUI]PBMANA("FORMAT")
 F %Y=0:0 S MDL=$O(@LIST@(MDL)) Q:(MDL="")!(MDL="z")  W !,! D REV^%VVIDEO W MDL D NORM^%VVIDEO S RES=$$^%EDFANAL(MDL,TRACE) D POCLEPA^%VVIDEO I $$ISCTRLA^%SYSCLAV D ARRET Q:ABANDON
 Q:SOR=0
 Q:'($D(^[QUI]PBMANA("FORMAT")))
 W # F %Y=1:1 Q:'($D(^[QUI]PBMANA(%Y)))  W !,^[QUI]PBMANA(%Y)
 C IMP
 Q
 
VISU D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("Formats : pbmes d'analyse"),0)
 I $D(^[QUI]PBMANA("FORMAT"))'=11 D ^%VZEAVT($$^%QZCHW("Pas de probleme d'analyse rencontre")) Q
 D CARSP^%VVIDEO(0,2,21,79,1)
 D REAFF^%QULIMO3(1,1,"^[QUI]PBMANA(""FORMAT"")",0,2,79,21)
 D VISU^%QULIMO(0,2,79,23,"^[QUI]PBMANA(""FORMAT"")",1)
 Q
 
ARRET I SOR=1 C IMP
 D POCLEPA^%VVIDEO
 S ABANDON=$$MES^%VZEOUI($$^%QZCHW("Arret immediat ?"),"O")
 I (SOR=0)&(ABANDON=0) O IMP U IMP
 Q

