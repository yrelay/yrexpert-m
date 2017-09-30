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
;! Nomprog     : %LXMRINS                                                     !
;! Module      : LEXIQUE                                                      !
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

%LXMRINS ;
 
LOAD 
 D CHARGER(0)
 Q
DIRECT 
 D CHARGER(1)
 Q
 
CHARGER(DIRECT) 
 N ROUT,PREF,TYPHOST,NBROU,X0,X1,X2,SYNO,APPLI,MOT,LIG,NOLIG,NB,X3
 N NBMOT,RE,ROUTINI,PSYS,PROG,SYST
 S TYPHOST=$$PCONF^%INCASTO("TYPHOST")
 S PSYS=$$PCONF^%INCASTO("PSYS"),PROG=$$PCONF^%INCASTO("PROG")
 S PREF=$P("^%LXMRT","^",2),SYST=$E(PREF)="%"
 S ROUT=PREF_"0",ROUTINI=$P("^%LXMRIN","^",2)
 D CLEPAG^%VVIDEO
 I '($$EXIROU^%VROUTIN(ROUT)) D ^%VZEAVT($$^%QZCHW("Probleme dans l'installation des mots reserves. Veuillez contacter Yrelay")) Q
 D ^%VZEATT
 K ^MOTRES
 ;HL2 S X0="ZR  ZL @ROUT S LIG=$T(+2) ZR  ZL @ROUTINI"
 ;HL2 S X1="ZR  ZL @ROUT X X2 ZR  ZL @ROUTINI"
 ;HL2 S X2="F %I=0:0 S LIG=$T(DEB+NOLIG) Q:LIG=""""  S LIG2=$T(DEB+NOLIG+1),LIG3=$T(DEB+NOLIG+2) S NOLIG=NOLIG+3 X X3"
 S X0="ZL ""_""_$P(ROUT,""%"",2) S LIG=$T(DATA+1^@ROUT) ZL ""_""_$P(ROUTINI,""%"",2)"
 S X1="ZL ""_""_$P(ROUT,""%"",2) X X2 ZL ""_""_$P(ROUTINI,""%"",2)"
 S X2="F %I=0:0 S LIG=$T(DEB+NOLIG^@ROUT) Q:$F(LIG,"";;"")=0  S LIG2=$T(DEB+NOLIG+1^@ROUT),LIG3=$T(DEB+NOLIG+2^@ROUT) S NOLIG=NOLIG+3 X X3"
 S X3="S LIG=$P(LIG,"";;"",2),MOT=$P(LIG,"";""),RES=$P(LIG,"";"",2),LSYNO=$P(LIG2,"";;"",2),APPLI=$P(LIG3,"";;"",2)"
 S X3=X3_" "_$S(DIRECT:" D MAJMOT^%LXMRINS(MOT,RES,LSYNO,APPLI)",1:"S ^MOTRES(MOT)=RES,^MOTRES(MOT,""LSYNO"")=LSYNO,^MOTRES(MOT,""APPLI"")=APPLI")
 
 X X0
 
 S NBROU=$P(LIG,";;",2)
 S NB=0,NOLIG=1
 
BOUROU Q:NB>NBROU
 S ROUT=PREF_NB
 I '($$EXIROU^%VROUTIN(ROUT)) D ^%VZEAVT($$^%QZCHW("La routine")_" "_ROUT_" "_$$^%QZCHW("est inexistante.")_" "_$$^%QZCHW("Veuillez contacter Yrelay")) G BOUROU2

 X X1

BOUROU2 S NB=NB+1,NOLIG=1
 G BOUROU
 
 
SUPPRSY(TRACE) 
 N RE,MOT
 I TRACE W !,"SUPPRESSION DES MOTS RESERVES",!,"-----------------------------",!
 S MOT=""
 F RE=0:1 S MOT=$O(^[QUI]ZSYSMORE(MOT)) Q:MOT=""
 S ^[QUI]ZSYSMORE=RE
 S MOT=""
SUPPSY2 S MOT=$O(^MOTRES(MOT)) Q:MOT=""  W:TRACE !," ",MOT
 I $D(^[QUI]ZSYSMORE(MOT)) S ^[QUI]ZSYSMORE=^[QUI]ZSYSMORE-1 K ^[QUI]ZSYSMORE(MOT)
 S RE=$$SUPPMR^%LXSUPP(MOT)
 G SUPPSY2
 
 
 
SUPPRTO(TRACE) 
 I TRACE W !,"SUPPRESSION DES MOTS RESERVES",!,"-----------------------------",!
 N MOT,RE
 S MOT=""
SUPTO2 S MOT=$O(^[QUI]ZSYSMORE(MOT)) I MOT="" S ^[QUI]ZSYSMORE=0 Q
 I TRACE W !," ",MOT
 K ^[QUI]ZSYSMORE(MOT)
 S RE=$$SUPPMR^%LXSUPP(MOT)
 G SUPTO2
 
 
INSTAL(TRACE) N RES,MOT,TAPPLI,APPLI,LSYNO,TAPPLI
 S MOT=""
 I TRACE W !,!,"STOCKAGE DES MOTS RESERVES",!,"--------------------------",!
BMOT S MOT=$O(^MOTRES(MOT)) Q:MOT=""
 I TRACE W !," ",MOT
 S RES=^MOTRES(MOT)
 S COM1=$P(RES,"^",1),COM2=$P(RES,"^",2),COM3=$P(RES,"^",3),COM4=$P(RES,"^",4),COM5=$P(RES,"^",5)
 S UNIT=$P(RES,"^",6),ABUNIT=$P(RES,"^",7)
 S LIG=^MOTRES(MOT,"APPLI") K TAPPLI
 F %I=1:1 S APPLI=$P(LIG,"^",%I) Q:APPLI=""  S TAPPLI(%I)=APPLI
 S LIG=^MOTRES(MOT,"LSYNO") K LSYNO
 F %I=1:1 S APPLI=$P(LIG,"^",%I) Q:APPLI=""  S LSYNO(APPLI)=""
 D STOCK^%LXAJMOD(MOT,COM1,COM2,COM3,COM4,COM5,UNIT,ABUNIT,"LSYNO")
 D STOCK(MOT,^MOTRES(MOT))
 G BMOT
 
MAJMOT(MOT,RES,LIGSYNO,LIGAPPLI) 
 N COM1,COM2,COM3,COM4,COM5,UNIT,ABUNIT,TAPPLI,LSYNO
 S COM1=$P(RES,"^",1),COM2=$P(RES,"^",2),COM3=$P(RES,"^",3),COM4=$P(RES,"^",4),COM5=$P(RES,"^",5)
 S UNIT=$P(RES,"^",6),ABUNIT=$P(RES,"^",7)
 F %I=1:1 S APPLI=$P(LIGAPPLI,"^",%I) Q:APPLI=""  S TAPPLI(%I)=APPLI
 F %I=1:1 S APPLI=$P(LIGSYNO,"^",%I) Q:APPLI=""  S LSYNO(APPLI)=""
 D STOCK^%LXAJMOD(MOT,COM1,COM2,COM3,COM4,COM5,UNIT,ABUNIT,"LSYNO")
 D STOCK(MOT,RES)
 Q
 
 
STOCK(MOT,RES) 
 I '($D(^[QUI]ZSYSMORE(MOT))) S ^[QUI]ZSYSMORE(MOT)=RES,^[QUI]ZSYSMORE=$S(($D(^[QUI]ZSYSMORE(MOT))#10)=1:^[QUI]ZSYSMORE+1,1:1)
 Q

