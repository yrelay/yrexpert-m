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

;%DLMACH2^INT^1^59547,73868^0
%DLMACH2 ;
 
 
 
 
 
 
 N GLTEMP,ANCSTRU,NOUSTRU,FAM,CH,MAC1,MAC2,NUM,GLTEMP2
 D CLEPAG^%VVIDEO
 D ^%VZCDB("Recuperation des donnees",0)
 D ^%VZEATT
 S GLTEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"RECUP")
 S GLTEMP2=$P(GLTEMP,")")
 K @(GLTEMP)
 S ANCSTRU="^[QUI]PLJ"
 S NOUSTRU="^[QUI]DLJ"
 S NOUSTR2="^[QUI]DLJCOND"
 D ADR^%QCAGLC(ANCSTRU,GLTEMP2)
 D ^%QCAGLK(ANCSTRU)
 D ^%QCAGLK(NOUSTRU)
 D ^%QCAGLK(NOUSTR2)
 D POCLEPA^%VVIDEO
 S DX=0,DY=3 X XY
 S FAM=""
BFAM S FAM=$O(@GLTEMP@(FAM))
 I (FAM="")!(FAM="z") K @(GLTEMP) Q
 W !,"FAMILLE TECHNOLOGIQUE ",FAM,!
 S MAC1=""
BMAC1 S MAC1=$O(@GLTEMP@(FAM,MAC1))
 G:MAC1="" BFAM
 S MAC2=""
BMAC2 S MAC2=$O(@GLTEMP@(FAM,MAC1,MAC2))
 G:MAC2="" BMAC1
 S NUM=""
BNUM S NUM=$O(@GLTEMP@(FAM,MAC1,MAC2,NUM))
 G:NUM="" BMAC2
 W !,MAC1," ",MAC2," ",NUM
 S CH=@GLTEMP@(FAM,MAC1,MAC2,NUM)
 S @NOUSTRU@(FAM,MAC1,MAC2,NUM)=$P(CH,"^",17)_"^"
 S @NOUSTR2@(FAM,MAC1,MAC2,NUM,1)=$P(CH,"^",1,16)_"^"
 G BNUM
 
 
LANC(REPL,LANC) 
 N GLO,MA,JOUR,OR,ATMAC,ATDAT,REPMACH,ATCHARG,JOUR2,CHA,EXMACH
 D CLEPAG^%VVIDEO
 S EXMACH=$$RMACH^%DLCON2
 D ^%VZCDB($$^%QZCHW("Mise a jour des individus")_" "_EXMACH,0)
 D ^%VZEATT
 S GLO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"MACHI")
 K @(GLO)
 Q:'($$IR^%QSGE5(REPL,LANC))
 S ATMAC=$$MACHINE^%DLCON2
 S ATDAT=$$DATEJAL^%DLCON2
 S REPMACH=$$MACH^%DLCON2
 S ATCHARG=$$CHARGE^%DLCON2
 S OR=""
BORG S OR=$$NXTRIAO^%QSTRUC8(REPL,LANC,ATMAC,OR)
 G:OR="" MAJL
 S MA=$$NXTRIAO^%QSTRUC8(REPL,LANC,ATMAC,OR)
 S JOUR=$$^%QSCALIN(REPL,LANC,ATDAT,OR)
 G:JOUR="" BORG
 S JOUR2=$$DATENO3^%QMDATE(JOUR)
 G:(JOUR2="")!(JOUR=JOUR2) BORG
 S @GLO@(MA,JOUR2)=""
 G BORG
 
MAJL S MA=""
 S DX=0,DY=3 X XY
 D POCLEPA^%VVIDEO
 S DY=3
BMAJLM S MA=$O(@GLO@(MA))
 G:MA="" FINLANC
 S DY=DY+1 I DY=21 S DY=3 D CLEBAS^%VVIDEO
 X XY W EXMACH_" "_MA
 S JOUR=""
BMAJLS S JOUR=$O(@GLO@(MA,JOUR))
 G:JOUR="" BMAJLM
 S CHA=$P(^[QUI]MACAP(MA,JOUR),"^",2)+0
 S DY=DY+1 I DY=21 S DY=3 D CLEBAS^%VVIDEO
 X XY W "   "_$$^%QZCHW("Le")_" "_JOUR_" "_ATCHARG_" : "_CHA
 D:'($$IR^%QSGE5(REPMACH,MA)) PA^%QSGESTI(REPMACH,MA,"NOM",MA,1)
 D PA^%QSGESTI(REPMACH,MA,ATCHARG,CHA,JOUR)
 G BMAJLS
 
FINLANC K @(GLO)
 Q

