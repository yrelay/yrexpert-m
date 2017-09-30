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

;TORQS3EX^INT^1^59547,74875^0
TORQS3EX ;
 
 S %FL=0,C="",POY=$O(^POSENR($I,PAGE,"")),DX=43
LEC S PAR=$P(^POSENR($I,PAGE,POY),"^",1),PX=$X,VAL=^VALPAR($I,PAR) D GET^%VLECFL2(VAL,46,POY,42,80,.CTR,.C) G ET:$E(CTR)="*",FIN:CTR="A",TERM:CTR="F",EXPLIC:C="?",VIDE:(C="")&(CTR'="F")
 G FIN1
SUITE S ^VALPAR($I,PAR)=C
 D:PAR="QUANTITE" PA^%QSGESTI(BASEL,INDIVIDU,PAR,C,1)
 D:PAR'="QUANTITE" PA^%QSGESTI(BASEP,INDP,PAR,C,1)
 G B
ET S CTR=$P(CTR,"*",2),DIR=$S(CTR=65:"H",CTR=68:"H",CTR=66:"B",1:"B") G @DIR
H G:'($D(^POSENR($I,PAGE,POY-1))) LEC S POY=POY-1 G LEC
B G:'($D(^POSENR($I,PAGE,POY+1))) LEC S POY=POY+1 G LEC
VIDE W $$^%QZCHW("VALEUR OBLIGATOIRE...[RETURN]") R *REP:^TOZE($I,"ATTENTE") S DX=$X-29,DY=$Y X XY W "                             " S DX=$X-29,DY=$Y X XY G LEC
TERM S SUIV="" F I=1:1 S SUIV=$O(^VALPAR($I,SUIV)) Q:SUIV=""  G:^VALPAR($I,SUIV)="" NTERM
 G FIN
NTERM D POCLEPA^%VVIDEO,BLD^%VVIDEO W $$^%QZCHW("Les valeurs des parametres explicites sont obligatoires ") D BLK^%VVIDEO W $$^%QZCHW("...[RETURN]") D NORM^%VVIDEO R *REP:^TOZE($I,"ATTENTE")
MESS D POCLEPA^%VVIDEO W $$L21^%QSLIB2 S DX=46,DY=9+I X XY G LEC
FIN S PY=$S(CTR="F":$Y-2,1:$Y) S:CTR="F" X1=X1-5
 G:'($D(^POSENR($I,PAGE,PY))) END
 S PAR=$P(^POSENR($I,PAGE,PY),"^",1) I X1'=13 G END
 
FIN1 I '($D(^DON($I,PAR))) G SUITE
 S ORD=^DON($I,PAR),CHP=^[QUI]EXPLICI(YA,ORD,PAR),VPD=$P(CHP,"^",18) I C="" S C=VPD,DX=43,DY=PY X XY W C G SUITE
 S VPA=C,PARA=PAR,BATCH=1 D ^TOTVLEG I VOK=0 W " VOK=",VOK S ^VALPAR($I,PAR)="",I=PY-9 G MESS
 G SUITE
 
EXPLIC G:PAR="QUANTITE" LEC D SAV S PARA=^POSFUL($I,PAGE,POY),ORD=^DON($I,PARA)
 D ^TOEXPMEM I AQI'=0 S ^VALPAR($I,PARA)=AQI
 D RES,AFF^TOEXPGET
 D:AQI'=0 PA^%QSGESTI(BASEP,INDP,PARA,AQI,1)
 D POCLEPA^%VVIDEO,BLD^%VVIDEO W $$^%QZCHW("Utiliser : FLECHES ") D NORM^%VVIDEO W $$^%QZCHW("pour ajouter un parametre,") D BLD^%VVIDEO W $$^%QZCHW("CTRLF ") D NORM^%VVIDEO W $$^%QZCHW("pour fin,")
 D BLD^%VVIDEO W $$^%QZCHW($S('(DTM):"CTRLA",MODTM:"ESCP",1:"BREAK"))," "
 D NORM^%VVIDEO W $$^%QZCHW("pour abandon") S DX=PX,DY=POY G LEC
SAV K ^SAVEX($J) S DE=$P($T(VAR),";;",2) F %U=1:1 S FI=$P(DE,",",%U) Q:FI=""  S ^SAVEX($J,FI)=@FI
 Q
RES S DE=-1 F %U=1:1 S DE=$N(^SAVEX($J,DE)) Q:DE=-1  S @DE=^SAVEX($J,DE)
 K ^SAVEX($J) Q
VAR ;;MPASX,MPASY,PX,POY,NXI,NXS,NYI,NYS
END 
 Q

