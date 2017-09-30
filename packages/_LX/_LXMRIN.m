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

;%LXMRIN^INT^1^59547,73870^0
LEXMRIN ;
 
 
 
 
INSTAL(QUI) 
INSTAL2 
 N ROUT,PREF,TYPHOST,NBROU,X0,X1,X2,SYNO,APPLI,MOT,LIG,NOLIG,NB
 N NBMOT,RE,TEMPLEX,ROUTINI,PSYS,PROG,SYST,TEMPLE2
 S TEMPLEX=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"INSTAL.MOT.RES")
 S TEMPLE2=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"SUP.MOT.RES")
 S TYPHOST=$$PCONF^%INCASTO("TYPHOST")
 S PSYS=$$PCONF^%INCASTO("PSYS")
 S PROG=$$PCONF^%INCASTO("PROG")
 S PREF=$P("^%LXMRT","^",2)
 S SYST=$E(PREF)="%"
 S ROUT=PREF_"0"
 S ROUTINI=$P("^%LXMRIN","^",2)
 D CLEPAG^%VVIDEO
 I '($$EXIROU^%VROUTIN(ROUT)) D ^%VZEAVT($$^%QZCHW("Probleme dans l'installation des mots reserves. Veuillez contacter YXP...")) Q
 D ^%VZEATT
 S X0="ZR  ZL @ROUT S LIG=$T(+2) ZR  ZL @ROUTINI"
 S X1="ZR  ZL @ROUT X X2 ZR  ZL @ROUTINI"
 S X2="F %I=0:0 S LIG=$T(DEB+NOLIG) Q:LIG=""""  S LIG2=$T(DEB+NOLIG+1),LIG3=$T(DEB+NOLIG+2) S NOLIG=NOLIG+3 X X3"
 S X3="S LIG=$P(LIG,"";;"",2),MOT=$P(LIG,"";""),RES=$P(LIG,"";"",2),LSYNO=$P(LIG2,"";;"",2),APPLI=$P(LIG3,"";;"",2) S @TEMPLEX@(MOT)=RES,@TEMPLEX@(MOT,""LSYNO"")=LSYNO,@TEMPLEX@(MOT,""APPLI"")=APPLI"
 X X0
 S NBROU=$P(LIG,";;",2)
 S NB=0,NOLIG=1
 
BOUROU G:NB>NBROU SUPPR
 S ROUT=PREF_NB
 I '($$EXIROU^%VROUTIN(ROUT)) D ^%VZEAVT($$^%QZCHW("La routine")_" "_ROUT_" "_$$^%QZCHW("est inexistante.")_" "_$$^%QZCHW("Veuillez contacter YXP...")) G BOUROU2
 X X1
BOUROU2 S NB=NB+1,NOLIG=1
 G BOUROU
 
 
SUPPR 
 D ADR^%QCAGLC("^MOTRES",$E(TEMPLE2,1,$L(TEMPLE2)-1))
 D ADR^%QCAGLC($E(TEMPLEX,1,$L(TEMPLEX)-1),$E(TEMPLE2,1,$L(TEMPLE2)-1))
 S APPLI=""
 W !,"SUPPRESSION DES MOTS RESERVES"
 W !,"-----------------------------",!
 S MOT=""
 F RE=0:1 S MOT=$O(^[QUI]ZSYSMORE(MOT)) Q:MOT=""
 S ^[QUI]ZSYSMORE=RE
 
SUPPR2 D ^%QCAGLK("^MOTRES")
 D ^%QCAGLK("^MOTRESY")
 D ^%QCAGLK("^MOTRESA")
 D ^%QCAGLK("^MOTRESAI")
 S MOT=""
BSUMOT S MOT=$O(@TEMPLE2@(MOT))
 G:MOT="" STOCK
 W !," ",MOT
 I $D(^[QUI]ZSYSMORE(MOT)) S ^[QUI]ZSYSMORE=^[QUI]ZSYSMORE-1 K ^[QUI]ZSYSMORE(MOT)
 S RE=$$SUPPMR^%LXSUPP(MOT)
 G BSUMOT
 
STOCK S MOT=""
 W !,!,"STOCKAGE DES MOTS RESERVES"
 W !,"--------------------------",!
BMOT S MOT=$O(@TEMPLEX@(MOT))
 G:MOT="" FIN
 W !," ",MOT
 S RES=@TEMPLEX@(MOT)
 S COM1=$P(RES,"^",1),COM2=$P(RES,"^",2),COM3=$P(RES,"^",3),COM4=$P(RES,"^",4),COM5=$P(RES,"^",5)
 S UNIT=$P(RES,"^",6),ABUNIT=$P(RES,"^",7)
 S LIG=@TEMPLEX@(MOT,"APPLI")
 K @TEMPLEX@(MOT,"APPLI")
 F %I=1:1 S APPLI=$P(LIG,"^",%I) Q:APPLI=""  S @TEMPLEX@(MOT,"APPLI",%I)=APPLI
 S LIG=@TEMPLEX@(MOT,"LSYNO")
 S LSYNO=$$CONCAT^%QZCHAD(TEMPLEX,""""_MOT_""",""LSYNO""")
 K @(LSYNO)
 F %I=1:1 S APPLI=$P(LIG,"^",%I) Q:APPLI=""  S @LSYNO@(APPLI)=""
 D STOCK^%LXAJMOD(MOT,COM1,COM2,COM3,COM4,COM5,UNIT,ABUNIT,LSYNO)
 D STOCK^%LXMRUC(MOT,COM1,COM2,COM3,COM4,COM5,UNIT,ABUNIT,LSYNO,$$CONCAT^%QZCHAD(TEMPLEX,""""_MOT_""",""APPLI"""))
 G BMOT
 
FIN K @(TEMPLEX)
 K @(TEMPLE2)
 Q
 ;
 ;

