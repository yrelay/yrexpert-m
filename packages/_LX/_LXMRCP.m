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

;%LXMRCP^INT^1^59547,73870^0
LEXMRCP ;
 
 
 
 
 
 
 N TEMP,TEMPO,TEMP1,TYPH,TEMPLO,TEMPL1,TEMPL
 S TYPH=$$PCONF^%INCASTO("TYPHOST")
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"ROUT")
 S TEMP1=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"PREM.ROUT")
 S TEMPLO=TEMPO,TEMPL1=TEMP1
 D CLEPAG^%VVIDEO
 D POCLEPA^%VVIDEO
 I '($D(^MOTRES)) D ^%VZEAVT("Le global est inexistant...") Q
 S PSYS=$$PCONF^%INCASTO("PSYS")
 S PROG=$$PCONF^%INCASTO("PROG")
 S PREF=$P("^%LXMRT","^",2)
 S ROUTINI=$P("^%LXMRCP","^",2)
 S SYST=$E(PREF)="%"
 I SYST S TEMPLO="^["""_PROG_"""]"_$P(TEMPO,"^",2),TEMPL1="^["""_PROG_"""]"_$P(TEMP1,"^",2)
 D ^%VZEATT
 W " ---> Destruction des anciennes routines"
 S NOMROU=PREF_"0"
 G:'($$EXIROU^%VROUTIN(NOMROU)) STOCK
 S X="ZR  ZS @ROUT  ZL @ROUTINI D:SYST GOTO^%QCSCDIR(PROG)"
 S X2="ZR  ZL @NOMROU S LIG=$T(@NOMROU+1) ZR  ZL @ROUTINI"
 X X2
 S NBROU=$P(LIG,";;",2)
 S NB=0
BTUER G:NB>NBROU STOCK
 S ROUT=PREF_NB
 W !,ROUT
 G:'($$EXIROU^%VROUTIN(ROUT)) BTUER
 D:SYST GOTO^%QCSCDIR(PSYS)
 X X
 S NB=NB+1
 G BTUER
 
STOCK S NB=-1
 S XSTOROU="ZR  X XST2 D:SYST GOTO^%QCSCDIR(PROG) ZL @ROUTINI"
 S XST2="D:SYST GOTO^%QCSCDIR(PSYS) X XST3 ZS @NOMROUT ZR"
 S XST3="F %I=1:1:NBLIG ZI @TEMPL@(%I)"
 W !,!,"TRAITEMENT DES MOTS RESERVES"
 W !,"----------------------------"
 W !
 S TEMP=TEMP1
 D STICI
 S MOT=""
BMOT S MOT=$O(^MOTRES(MOT))
 G:MOT="" FIN
 G:MOT="z" FIN
 W !,MOT
 S LIG=" ;;"_MOT_";"_^MOTRES(MOT)
 S LIG2=""
 S SYNO=""
 F %I=0:0 S SYNO=$O(^MOTRESY(MOT,SYNO)) Q:SYNO=""  S LIG2=LIG2_"^"_SYNO
 S LIG2=" ;;"_$P(LIG2,"^",2,999)
 S LIG3=""
 S APPLI=""
 F %I=0:0 S APPLI=$O(^MOTRESA(MOT,APPLI)) Q:APPLI=""  S LIG3=LIG3_"^"_APPLI
BMOT2 S LIG3=" ;;"_$P(LIG3,"^",2,999)
 S @TEMP@(NBLIG+1)=LIG
 S @TEMP@(NBLIG+2)=LIG2
 S @TEMP@(NBLIG+3)=LIG3
 S NBLIG=NBLIG+3
 D:NBLIG>80 STOROU
 G BMOT
 
FIN G:NB=1 FIN2
 G:NBLIG=1 FIN2
 D STOROU
FIN2 S @TEMP1@(2)=" ;;"_(NB-1)
 S TEMP=TEMP1,TEMPL=TEMPL1
 S NOMROUT=PREF_"0"
 S NBLIG=$ZP(@TEMP1@(""))
 X XSTOROU
 K @(TEMP1)
 K @(TEMPO)
 Q
 
STOROU I TEMP=TEMP1 S TEMP=TEMPO,TEMPL=TEMPLO G STICI
 X XSTOROU
STICI K @(TEMP)
 S NBLIG=2
 S NB=NB+1
 S NOMROUT=PREF_NB
 S @TEMP@(1)=NOMROUT_" ;; Mots reserves compiles : routine numero "_NB
 I TEMP=TEMP1 S @TEMP@(2)=" ;;",NBLIG=3
 S @TEMP@(NBLIG)="DEB ;;"
 Q

