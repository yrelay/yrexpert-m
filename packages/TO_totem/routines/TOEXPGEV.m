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

;TOEXPGEV^INT^1^59547,74872^0
TOEXPGEV ;
 S %FL=0,C="",POY=$O(^POSENR($I,PAGE,"")),DX=43
LEC S PAR=$P(^POSENR($I,PAGE,POY),"^",1),PY=POY,PX=$X,VAL=^VALPAR($I,PAR) D GET^%VLECFL2(VAL,46,POY,45,79,.CTR,.C) G ET:$E(CTR)="*",FIN:CTR="A",FIN:CTR="F",EXPLIC:C="?",FIN1
FIN S PY=$Y G:'($D(^POSENR($I,PAGE,PY))) END S PAR=$P(^POSENR($I,PAGE,PY),"^",1) G END
FIN1 I '($D(^DON($I,PAR))) G FIN2
 S ORD=^DON($I,PAR),CHP=^[QUI]EXPLICI(YA,ORD,PAR),VPD=$P(CHP,"^",18) I C="" S C=VPD,DX=46,DY=PY X XY W C G FIN2
 S VPA=C,PARA=PAR D ^TOTVLEG I VOK=0 D EFF S ^VALPAR($I,PAR)="",DX=46,DY=PY X XY G LEC
 D POCLEPA^%VVIDEO
FIN2 S ^VALPAR($I,PAR)=C G B
 Q
EFF S DX=46,DY=PY X XY W "                          " X XY Q
EXPLIC S PARA=^POSFUL($I,PAGE,PY),ORD=^DON($I,PARA) D ^TOEXPMEM I AQI'=0 S ^VALPAR($I,PARA)=AQI
 D AFF^TOEXPGET S DX=PX,DY=PY G LEC
END K DE,FI,CHP,ADY,PARA,VPA,VPD,C,Y1,YG Q
ET S CTR=$P(CTR,"*",2),DIR=$S(CTR=65:"H",CTR=68:"H",CTR=66:"B",1:"B") G @DIR
H G:'($D(^POSENR($I,PAGE,POY-1))) LEC S POY=POY-1 G LEC
B G:'($D(^POSENR($I,PAGE,POY+1))) LEC S POY=POY+1 G LEC

