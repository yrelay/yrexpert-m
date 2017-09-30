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

;%VMOV002^INT^1^59547,74035^0
%VMOV002 ;;02:47 PM  11 Jun 1993; ; 11 Jun 93  3:54 PM
 
 
 
 
 
 N %F
BEG N ES,FL,RS,CT
 S:'($D(IOM)) IOM=80 U 0
LOOP1 I '($D(@TBMOV)) S X1=1 G FIN
 D CUROF^%VVIDEO S:'($D(IOM)) IOM=80 S ATT=^TOZE($I,"ATTENTE")
LOOP I $D(@TBMOV@(DY,DX)) S LIB=@TBMOV@(DY,DX) D REV^%VVIDEO X XY W LIB D NORM^%VVIDEO X XY
 S RS=$$MORE^%VZATOU(.X1,.FL,.CT,.ES,ATT,0)
 S:'(RS) FL="RETURN"
 I (((FL="H")!(FL="D"))!(FL="B"))!(FL="G") S X3=$S(FL="H":65,FL="D":67,FL="B":66,FL="G":68) D REP,@X3 G LOOP
 G:ES'="" BELL
 S X1=$S(X1'="":X1,CT'="":$A(CT)-64,FL="RETURN":13,FL="DEL":127)
 D CURON^%VVIDEO X XY G FIN
FIN U 0 Q
BELL D ^%VSQUEAK G LOOP
66 S DX=DX-1
661 S DY=$O(@TBMOV@(DY)) G:DY="" 661
67 S DX=$O(@TBMOV@(DY,DX)) G:DX="" 661 G TEST
65 S DX=DX+1
651 S DY=$ZP(@TBMOV@(DY)) G:DY="" 651
68 S DX=$ZP(@TBMOV@(DY,DX)) G:DX="" 651 G TEST
TEST I $D(@TBMOV@(ODY,ODX)) S LIB=@TBMOV@(ODY,ODX),NDX=DX,NDY=DY,DX=ODX,DY=ODY X XY W LIB S DX=NDX,DY=NDY
 Q
REP S ODX=DX,ODY=DY Q
SQUEAK W *7,*7,*-1 Q
ADR(TBMOV,DX,DY) 
 N ATT,NDX,NDY,ODX,ODY,X1,X2,X3 D BEG Q X1

