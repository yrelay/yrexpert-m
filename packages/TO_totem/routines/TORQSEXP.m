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

;TORQSEXP^INT^1^59547,74875^0
TORQSEXP ;
 
 
 
 S C="",POY=$O(^POSENR($I,PAGE,"")),DX=43
LEC S PAR=$P(^POSENR($I,PAGE,POY),"^",1),PX=$X,VAL=^VALPAR($I,PAR) D GET^%VLECFL2(VAL,46,POY,42,80,.CTR,.C) S C=$$GETLBLAN^%VTLBLAN(C) G ET:$E(CTR)="*",FIN:CTR="A",TERM:CTR="F",EXPLIC:C="?",VIDE:(C="")&(CTR'="F")
 N OUI I PAR="OBJET.TOTEM" S OUI=0,SUIV="" F I=1:1 S SUIV=$O(^[QUI]EXPLICI(SUIV)) Q:SUIV=""  S:SUIV=C OUI=1 Q:OUI=1
 I PAR="OBJET.TOTEM",OUI=0 D ^%VZEAVT($$^%QZCHW("OBJET.TOTEM inconnu")) G LEC
 G FIN1
SUITE I C'="?" S ^VALPAR($I,PAR)=C D PA^%QSGESTI(BASEL,INDIVIDU,PAR,C,1)
 
 
 I PAR="OBJET.TOTEM" S PREM=0,RECOM=1 Q
 G B
ET S CTR=$P(CTR,"*",2),DIR=$S(CTR=65:"H",CTR=68:"H",CTR=66:"B",1:"B") G @DIR
H G:'($D(^POSENR($I,PAGE,POY-1))) LEC S POY=POY-1 G LEC
B G:'($D(^POSENR($I,PAGE,POY+1))) LEC S POY=POY+1 G LEC
VIDE D ^%VZEAVT($$^%QZCHW("VALEUR OBLIGATOIRE"))
 S DX=43,DY=POY X XY G LEC
TERM 
 S SUIV="" F I=1:1 S SUIV=$O(^VALPAR($I,SUIV)) Q:SUIV=""  G:^VALPAR($I,SUIV)="" NTERM
 G FIN
NTERM D ^%VZEAVT($$^%QZCHW("Les valeurs des parametres explicites sont obligatoires"))
 D MESS S DX=46,DY=9+I X XY G LEC
FIN 
 
 ;;S PY=$S(CTR="F":($Y-2),1:$Y) S:CTR="F" X1=X1-5
 
 S PY=$S(CTR="F":$Y-2,1:$Y)
 G:'($D(^POSENR($I,PAGE,PY))) END
 
 ;;S PAR=$P(^POSENR($I,PAGE,PY),"^",1) I X1'=13 G END
 
 S PAR=$P(^POSENR($I,PAGE,PY),"^",1) G END
FIN1 I '($D(^DON($I,PAR))) G SUITE
 S ORD=^DON($I,PAR),CHP=^[QUI]EXPLICI(YA,ORD,PAR),VPD=$P(CHP,"^",18) I C="" S C=VPD,DX=43,DY=PY X XY W C G SUITE
 S VPA=C,PARA=PAR,BATCH=1 D ^TOTVLEG I VOK=0 W " VOK=",VOK S ^VALPAR($I,PAR)="" D MESS S DX=46,DY=PY X XY G LEC
 G SUITE
EXPLIC G:PAR="QUANTITE" LEC G:PAR="OBJET.TOTEM" OBJT D SAV S PARA=^POSFUL($I,PAGE,POY),ORD=^DON($I,PARA)
 D ^TOEXPMEM I AQI'=0 S ^VALPAR($I,PARA)=AQI
 D RES,AFF^TOEXPGET
 D:AQI'=0 PA^%QSGESTI(BASEL,INDIVIDU,PARA,AQI,1)
 D MESS G SUITE
 S DX=PX,DY=POY G LEC
SAV K ^SAVEX($J) S DE=$P($T(VAR),";;",2) F %U=1:1 S FI=$P(DE,",",%U) Q:FI=""  S ^SAVEX($J,FI)=@FI
 Q
OBJT S DX=0,DY=9 X XY D CLEBAS^%VVIDEO,INIT^%QUCHOIP("^[QUI]EXPLICI",1,"",4,9,70,12),AFF^%QUCHOIP S C=$$UN^%QUCHOIP D END^%QUCHOIP S DX=0,DY=9 X XY D CLEBAS^%VVIDEO
 I C'="" S ^VALPAR($I,PAR)=C,PREM=0,RECOM=1 D PA^%QSGESTI(BASEL,INDIVIDU,"OBJET.TOTEM",C,1),RES,AFF^TOEXPGET Q
 D RES,AFF^TOEXPGET,MESS G LEC
RES S DE=-1 F %U=1:1 S DE=$N(^SAVEX($J,DE)) Q:DE=-1  S @DE=^SAVEX($J,DE)
 K ^SAVEX($J) Q
MESS D POCLEPA^%VVIDEO W $$L21^%QSLIB2
 Q
VAR ;;MPASX,MPASY,PX,POY,NXI,NXS,NYI,NYS
END 
 Q

