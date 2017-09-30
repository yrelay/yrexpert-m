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

;TOGETAJP^INT^1^59547,74872^0
TOGETAJP ;
 
AJOUT S TYMOD="AJOUT" D ^TO3TYMOD S PAGC=PAGE,(DPAG,PAG)=-1 F GF=0:0 S PAG=$N(^POSENR($I,PAG)) Q:PAG=-1  S DPAG=PAG
 K GF,PAG S PAGE=$S(DPAG=-1:1,1:DPAG) K DPAG S (DLIG,LIG)=-1 F GF=0:0 S LIG=$N(^POSENR($I,PAGE,LIG)) Q:LIG=-1  S DLIG=LIG
 S PY=$S(DLIG=-1:8,1:DLIG+1) I PY'<22 S PAGE=PAGE+1,PY=8
 K GF,LIG,DLIG I PAGE'=PAGC D ECR
GET S DY=PY,DX=0 X XY W "|",?2
 S DX=$X X XY D ^%VLEC I (CTRLA=1)!((CTRLF=1)!(Y1="")) S DE=DY,FI=DY,TYMOD=$$^%QZCHW("Saisie") D ^TO3TYMOD,^%ABNETTO G FIN
 S PARAM=Y1 W ?40," = " S DX=$X D ^%VLEC I (CTRLA=1)!((CTRLF=1)!(Y1="")) S DE=DY,FI=DY D ^%ABNETTO G GET
 S VAL=Y1 D ^TOGETAJT I REFUSE=1 S DX=2,DY=PY X XY F FG=1:1 G:FG=78 GET W " "
 S PY=PY+1 I PY'<22 S PAGE=PAGE+1,PY=8 D ECR
 G GET
FIN K PARAM,VAL,PAGC,DDY,GF Q
ECR S DX=0,DY=6,DDY=-1 D CLEBAS^%VVIDEO F GF=1:1 S DDY=$N(^POSENR($I,PAGE,DDY)) Q:DDY=-1  D ECRS
 S DY=6,MSG=$$^%QZCHW("Page ")_PAGE,DX=40-($L(MSG)\2) X XY W MSG K MSG,GF,DDY G FIN
ECRS S DY=DDY,DX=0 X XY W "|",?2 S PAR=$P(^POSENR($I,PAGE,DY),"^",1),TYP=$P(^POSENR($I,PAGE,DY),"^",2) D:TYP["E" BLD^%VVIDEO S DX=2 X XY W $E(PAR,1,37) D NORM^%VVIDEO S DX=40 X XY W " = ",^VALPAR($I,PAR) D NORM^%VVIDEO W ?75,TYP,?79,"|" D:^VALPAR($I,PAR)'="" ON Q

