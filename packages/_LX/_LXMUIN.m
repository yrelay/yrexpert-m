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

;%LXMUIN^INT^1^59547,73871^0
LEXMUIN ;
 
 
 
INSTAL(QUI) 
INSTAL2 
 N ROUT,PREF,TYPHOST,NBROU,X0,X1,X2,SYNO,APPLI,MOT,LIG,NOLIG,NB
 N NBMOT,RE,TEMPLEX,ROUTINI,PSYS,PROG,SYST,LIB
 D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("INSTAL. MOTS RESERVES UTILISATEURS"),0)
 S TEMPLEX=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"INSTAL.MOT.RES")
 D ^%VZEAVT($$^%QZCHW("Si cela na pas ete fait, les mots reserves ""systeme"" doivent d'abord etre reinstalles"))
 D POCLEPA^%VVIDEO
 I '($$MES^%VZEOUI($$^%QZCHW("continuons-nous ? "),"N")) D POCLEPA^%VVIDEO Q
 D POCLEPA^%VVIDEO
 
 
SUPPR 
 S APPLI=""
 S LIB=$$^%QZCHW("SUPPRESSION DES MOTS RESERVES UTILISATEURS")
 W !,LIB
 W !,$TR($J(" ",$L(LIB))," ","-")
 S MOT=""
BSUMOT S MOT=$O(^MOTREU2(MOT))
 G:MOT="" STOCK
 G:$D(^MOTRES(MOT))&('($D(^MOTREU(MOT)))) BSUMOT
 W !," ",MOT
 S ^[QUI]ZSYSMORE=^[QUI]ZSYSMORE-1
 K ^[QUI]ZSYSMORE(MOT)
 S RE=$$SUPPMR^%LXSUPP(MOT)
 G BSUMOT
 
STOCK S MOT=""
 K ^MOTREU2
 S LIB=$$^%QZCHW("INSTALLATION DES MOTS RESERVES UTILISATEUR")
 W !,!,LIB
 W !,$TR($J(" ",$L(LIB))," ","-")
BMOT S MOT=$O(^MOTREU(MOT))
 G:MOT="" FIN
 W !," ",MOT
 S ^MOTREU2(MOT)=""
 S RES=^MOTREU(MOT)
 S COM1=$P(RES,"^",1),COM2=$P(RES,"^",2),COM3=$P(RES,"^",3),COM4=$P(RES,"^",4),COM5=$P(RES,"^",5)
 S UNIT=$P(RES,"^",6),ABUNIT=$P(RES,"^",7)
 S LSYNO=$$CONCAT^%QZCHAD(TEMPLEX,""""_MOT_""",""LSYNO""")
 K @(LSYNO)
 S SYNO=""
 F %I=0:0 S SYNO=$O(^MOTREUY(MOT,SYNO)) Q:SYNO=""  S @LSYNO@(SYNO)=""
 D STOCK^%LXAJMOD(MOT,COM1,COM2,COM3,COM4,COM5,UNIT,ABUNIT,LSYNO)
 G BMOT
 
FIN K @(TEMPLEX)
 Q
 ;
 ;

