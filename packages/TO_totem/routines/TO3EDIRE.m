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

;TO3EDIRE^INT^1^59547,74870^0
TO3EDIRE ;
 
 
 
 
 D ^%AB3STAR
 S NIV=2,$ZT="",C1=$$^%QZCHW("IMPRIMANTE"),C2=$$^%QZCHW("ECRAN"),IMPR=^TABIDENT(WHOIS,"PRINTER")
QU D CLEPAG^%VVIDEO S DX=0,DY=10 X XY
 
 W $$^%QZCHW("Voulez-vous les resultats sur") S REP=$$^%VZESOR("E")
 I (REP'=1)&(REP'=0) G FIN
 S REP=$S(REP=1:"I",1:"E")
 I $E(REP,1)=$$^%QZCHW("I") S DEV="IMPR",LILIM=$S($D(^TABIDENT(WHOIS,"IMPRCOUR")):^TABIDENT(WHOIS,"IMPRCOUR")-15,1:45)
 E  S DEV="ECR",LILIM=17,IMPR=0
 D ^TOCHRESE
 S OKPH=0,OR=-1 F %UOR=1:1 S OR=$N(^ROUAUT($J,OR)) Q:OR=-1  S TUOR=^ROUAUT($J,OR) I TUOR="TO3RESPH" S OKPH=1 Q
 S %DIM=0 G:'($D(^[QUI]PHAS(NUFA))) OPEN
 I (TOUS=1)!(OKPH=0) G OPEN
 I ^TOZE($I,"PHASE")=0 G OPEN
 W !,!,?20,$$^%QZCHW("1 Gamme avec temps et couts"),!,?20,$$^%QZCHW("2 Gamme avec dimensions a l'outil"),!,!,?20,$$^%QZCHW("Votre choix : ")
 R *REP S REP=$C(REP) G:(REP'=1)&(REP'=2) QU S %DIM=$S(REP=1:0,1:1) D CLEPAG^%VVIDEO
OPEN S DOLARI=$I
 I IMPR'=0 S DX=0,DY=10 X XY W $$^%QZCHW("Impression en cours...") O IMPR U IMPR W *-1,*23
EDITION Q:'($D(^ROUAUT($J)))
 D ^%AB3STAR,ZD^%QMDATE4 S %DDATE=%DAT D ^%QMDAK0 S %HHEUR=HEURE,%PPAGE=0
 G:'($D(^[QUI]TREEWORK(NUFA))) PH
 S ANUFA=NUFA,NUM=-1,PNUFA=$P(NUFA,".",1) S:'($D(OSFA)) OSFA=$P(^[QUI]TREEWORK(NUFA,0),"^",4)
 D EDIT
 
 S NUFA=ANUFA G END
 
EDIT S (MSG1,%TTITR)=$$^%QZCHW("RESULTATS DE L'ETUDE NUMERO : ")_NUFA,MSG2=$P(^[QUI]TREEWORK(NUFA,0),"^",4)
 D:DEV="IMPR" ^%ABPRESI
 S NUDEBRO=-1,NURO=$N(^ROUAUT($J,-1)) I NURO=2 D ^TO3RESNO S NUDEBRO=2 G:$N(^ROUAUT($J,NURO))=-1 FIN G:CTRLA=1 FIN
 I NURO'=-1 S DURTOT=0,PRITOT=0,PRIMATOT=0,NUC=1,OROUT="",ADR="TRAIT^TO3EDIRE",NOMTREE="^[QUI]TREEWORK(NUFA" D ^%QCAGTU1 G:CTRLA FIN D:OROUT="TORESDCT" ^TORESDCT
 D ^TO3EDFIN G FIN
TRAIT 
 D ^TO3GREF
 S DATACOUR=@NOM,YA=$P(DATACOUR,"^",1),YB=$P(DATACOUR,"^",2),TOID=$P(DATACOUR,"^",4),QTEART=$P(DATACOUR,"^",3),QTEMAT=$P(DATACOUR,"^",5),SFMAT=$P(DATACOUR,"^",6)
 S STOP=0,NURO=NUDEBRO F %RR=1:1 S NURO=$N(^ROUAUT($J,NURO)) Q:NURO=-1  S RO=^ROUAUT($J,NURO) D GOROU S OROUT=RO Q:STOP=1
 
 G FIN
 
END I DEV="IMPR" S MSG=$$^%QZCHW($$PCONF^%INCASTO("NOMHOST")_" - YEXPERT ("_^INCONNE("VERSION")_")") U IMPR W !,!,!,LSTAR,!,"|",?40-($L(MSG)\2),MSG,?79,"|",!,LSTAR,!,# S %PORT=IMPR D CLEAR^%EDCI350 W # C IMPR
FIN K NURO Q
PH I '($D(^[QUI]PHAS(NUFA))) G END
 I '($D(^ROUAUT($J,"TO3RESPH"))) G END
 I DEV="ECR" D 132^%VVIDEO
 D ^TO3RESPH I DEV="ECR" D 80^%VVIDEO
 G END
GOROU S STOP=0 Q:RO="TORESDCT"  S RO="^"_RO
 
 D @RO,CLEPAG^%VVIDEO
 S:'($D(CTRLA)) CTRLA=0 I CTRLA=1 S STOP=1 Q
 I RO="^TO3RESPH" S:TOUS=1 %DIM=1 D:TOUS=1 @RO S %DIM=0
 Q

