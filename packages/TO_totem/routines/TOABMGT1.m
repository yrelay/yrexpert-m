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

;TOABMGT1^INT^1^59547,74871^0
%ABABMGT1 ;
LIST D ZD^%QMDATE4 S TIT=$$^%QZCHW(" Selection d'une abaque"),PROGTRA="FIN^%ABABMGT" D ^%ABPRESA S DX=0,DY=5 D CLEBAS^%VVIDEO G:'($D(^TACOMPIL($I))) END
OPE S DX=0,DY=7 D CLEBAS^%VVIDEO W $$^%QZCHW("Nom de l'operateur : ") S DX=$X D ^%VLEC G:CTRLA!CTRLF END S OPE=Y1 D PASS G:'(OK) END
 S DOLARI=$I,DX=0,DY=6 D CLEBAS^%VVIDEO S %IP=-1 F %I1=1:1 S %IP=$N(^TACOMPIL($I,%IP)) Q:%IP=-1  S %IL=-1 F %I2=1:1 S %IL=$N(^TACOMPIL($I,%IP,%IL)) Q:%IL=-1  D TRAIT
END K %IP,%I1,%IL,%I2,OK,REP,RESULT,RES,LIB,LIB1,QUW,DP,%DD,PX,PY,%VV,OPE,NOMG,%NORM,TYP,IDENT,DOLARI
FIN Q
PASS S B="INTERDIT" D ^%INCUPA S OK=$S(B["?":0,1:1)
 Q
TRAIT S RESULT=^TACOMPIL(DOLARI,%IP,%IL),NOMG=$P(RESULT,"^",1),%NORM=$P(RESULT,"^",2),IDENT=$P(RESULT,"^",3),TYP=$P(RESULT,"^",4),QUW=$S(TYP="(P)":QUI,$D(^TABIDENT(DOLARI,"%UCI")):^TABIDENT(DOLARI,"%UCI"),1:QUI)
 S DX=0,DY=8 D CLEBAS^%VVIDEO W $$^%QZCHW("Installer la bande pour l'abaque : "),!,NOMG,?40,%NORM D POCLEPA^%VVIDEO W $$^%QZCHW(" [RETURN]") R *REP D TOUCHE^%INCCLAV(REP,.REP) Q:(REP=1)!(REP=6)
 S DX=0,DY=8 D CLEBAS^%VVIDEO W $$^%QZCHW("Un instant,transfert en cours...")
 D ^%QMDAK0 O 47:("EFL":80:8000) U 47 W *-5 D TETE
 S DP=-1 F %DD=1:1 S DP=$N(^[QUW]OCGRIL(NOMG,%NORM,DP)) Q:DP=-1  I (DP'="zzNEXPOSI")&(DP'="z") F PX=10,33,56 F %VV="P","R" D TRAIT1
 U 47 W *-5 C 47 Q
TRAIT1 S LIB=$S(%VV="P":$$^%QZCHW("premisses"),1:$$^%QZCHW("conclusions")),RES=LIB D STO1
 S PY=-1 F %PP=1:1 S PY=$N(^[QUW]OCGRIL(NOMG,%NORM,DP,%VV,PY)) Q:PY=-1  D STO
 Q
STO Q:'($D(^[QUW]OCGRIL(NOMG,%NORM,DP,%VV,PY,PX)))  S LIB=$S($D(^[QUW]STRUCT(NOMG,2,%VV,PY,"FULL")):^[QUW]STRUCT(NOMG,2,%VV,PY,"FULL"),1:""),RES=^[QUW]OCGRIL(NOMG,%NORM,DP,%VV,PY,PX)
STO1 F BLK=1:1:40-$L(LIB) S LIB=LIB_" "
 F BLK=1:1:40-$L(RES) S RES=RES_" "
 S LIB=$E(LIB,1,40),RES=$E(RES,1,40) U 0 I $Y>21 S DX=0,DY=6 D CLEBAS^%VVIDEO
 D WRITE Q
WRITE S LIB1=LIB_RES U 47 W LIB1
 Q
TETE S (RES,LIB)=$$^%QZCHW("identification") D STO1 S LIB=$$^%QZCHW("TOTEM"),RES=$$^%QZCHW("Le : ")_%DAT_$$^%QZCHW(" a : ")_HEURE D STO1 S LIB=$$^%QZCHW("OPERATEUR : ")_OPE,RES="" D STO1 S LIB=$$^%QZCHW("ABAQUE : ")_NOMG,RES=$$^%QZCHW("NORME : ")_%NORM D STO1
 Q

