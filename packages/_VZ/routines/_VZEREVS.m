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
;! Nomprog     : %VZEREVS                                                     !
;! Module      : VIDEO                                                        !
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

%VZEREVS ;
MMOVREVS ;
 
 N ZB
 S:'($D(IOM)) IOM=80
 D ECHOFF^%VVIDEO
LOOP1 I '($D(@TBMOV)) S X1=1 G FIN
 D CUROF^%VVIDEO S:'($D(IOM)) IOM=80 S ATT=^TOZE($I,"ATTENTE")
LOOP I $D(@TBMOV@(DY,DX)) S LIB=@TBMOV@(DY,DX) D REV^%VVIDEO X XY W LIB D NORM^%VVIDEO X XY
 ;HL2 R *X1:ATT
 R *X1:ATT S X1=$$^%VCONVT(X1)
 ;HL S:X1=-1 X1=13
 ;;NONDTM
 
 
 ;;FINNONDTM
 ;;DTM
 ;HL2 I $$FLECHE^%INCCLAV(X1,.X1,.X2,.X3) D REP,@X3 G LOOP
 I ($A($ZB)=27)&($$FLECHE^%INCCLAV(X1,.X1,.X2,.X3)) D REP,@X3 G LOOP
 D TOUCHE^%INCCLAV(X1,.X1)
 ;;FINDTM
 G:X1=27 27
 D CURON^%VVIDEO X XY G FIN
27 ;;NONDTM
 
 
 ;;FINNONDTM
 ;;DTM
 G:MODTM REFUS
 R *X2
 G:X2=91 271
 R *X3
 G REFUS
271 R *X3
 G:(X3<48)!(X3>57) REFUS
272 R *X3
 S X3=$C(X3)
 G:X3'="~" 272
 G REFUS
 ;;FINDTM
 ;;NONDTM
 
 
 ;;FINNONDTM
REFUS D ^%VSQUEAK G LOOP
FIN D ECHON^%VVIDEO Q
66 S DX=DX-1
661 S DY=$O(@TBMOV@(DY)) G:DY="" 661
67 S DX=$O(@TBMOV@(DY,DX)) G:DX="" 661 G TEST
65 S DX=DX+1
651 S DY=$ZP(@TBMOV@(DY)) G:DY="" 651
68 S DX=$ZP(@TBMOV@(DY,DX)) G:DX="" 651 G TEST
TEST I $D(@TBMOV@(ODY,ODX)) S LIB=@TBMOV@(ODY,ODX),NDX=DX,NDY=DY,DX=ODX,DY=ODY X XY W LIB S DX=NDX,DY=NDY
 Q
REP S ODX=DX,ODY=DY Q
SQUEAK D ^%VSQUEAK Q

