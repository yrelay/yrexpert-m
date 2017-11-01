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
;! HL002 ! HL     ! 01/11/17 ! Si la globale ^["YXP"]STRUCT n'existe pas      !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%ABLISAB^INT^1^59547,73864^0
%ABLISAB ;
 
 D CLEPAG^%VVIDEO S DXG=0,DXD=79,DYH=0,DYB=4,MSG=TIT,GRAPH=0 D TO4^%VZCD K DXG,DXD,DYH,DYB,GRAPH,MSG
 S DX=0,DY=10 X XY W $$^%QZCHW("Liste a partir de : ") S DX=$X D ^%VLEC G:(CTRLA=1)!(CTRLF=1) END S YC=$S(Y1="":-1,1:$E(Y1,1,$L(Y1)-1)_$C($A($E(Y1,$L(Y1)))-1)_"z")
 S DX=0,DY=10 D CLEBAS^%VVIDEO
 K ^POSENR($I),^TACOMPIL($I) S STOP=0,LB=20,LH=7,DX=66,DY=LB+2,PAGE=1 X XY W $$^%QZCHW("Page : "),PAGE S LI=LH,POSY=LH
LISTE S %UCI=^TABIDENT($I,"%UCI"),QUCOM=%UCI,I=1,QU=QUI
LIST0
 S $ZT="G ERRSTRUCT",NUL=$N(^[QU]STRUCT(Y1)) ;HL002
 S Y1=YC F UU=0:0 S Y1=$N(^[QU]STRUCT(Y1)) Q:Y1=-1  D TRAIT G:STOP=1 FIN
ERRSTRUCT S $ZT=""
 G:QU=QUCOM FIN S QU=QUCOM G LIST0
FIN S NBPAG=PAGE D ^%ABDLGPA Q
TRAIT Q:Y1="GAMLAC"  Q:Y1="z"  Q:Y1["/COMMENT"
 S NOMG=Y1,TYPGR=$S(QU=QUI:"(P)",1:"(C)") D ^%ABDLGBD
END Q

