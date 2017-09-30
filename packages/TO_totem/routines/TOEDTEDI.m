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

;TOEDTEDI^INT^1^59547,74872^0
TOEDTEDI ;
 
Q1 S POS=$P($T(POS),";;",2),DX=0,DY=5 D CLEBAS^%VVIDEO S DY=10 X XY W $$^%QZCHW("Edition sur (E)cran ou (I)mprimante (A)bandon ") R *REP S REP=$C(REP) G:(REP'=$$^%QZCHW("E"))&((REP'=$$^%QZCHW("I"))&(REP'=$$^%QZCHW("A"))) Q1 G:REP=$$^%QZCHW("A") FIN
 S DOL=$I,IMPR=$S(REP=$$^%QZCHW("E"):0,1:$S($D(^TABIDENT(WHOIS,"PRINTER")):^TABIDENT(WHOIS,"PRINTER"),1:0)) S:IMPR=0 REP=$$^%QZCHW("E") G @REP
E D CLEPAG^%VVIDEO,132^%VVIDEO S DXG=0,DXD=65,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("Synthese d'etudes batch") D TO4^%VZCD S PAGE=1
AFF S DX=0,DY=5 D CLEBAS^%VVIDEO S DY=6,MSG=$$^%QZCHW("Page ")_PAGE_"/"_NBPAG,DX=66-($L(MSG)\2) X XY W MSG S DX=0,DY=7 X XY D TETE S DX=0,DY=10 X XY
 S LI=-1 F UU=1:1 S LI=$N(^TACOMPIL(DOL,PAGE,LI)) Q:LI=-1  S LIG=^TACOMPIL(DOL,PAGE,LI) D LIG
 W !,LOSTAR
Q2 D POCLEPA^%VVIDEO W $$L17^%QSLIB1("") S DX=$X D ^%VLEC G:CTRLA=1 FIN G:Y1="" Q2 S AD=$S(Y1="+":"PLUS",Y1="=":"PLUS",Y1="-":"MOIN",1:"NB") O $I G @AD
PLUS S PAG=PAGE+1 G:'($D(^TACOMPIL($I,PAG))) Q2 S PAGE=PAG G AFF
MOIN S PAG=PAGE-1 G:'($D(^TACOMPIL($I,PAG))) Q2 S PAGE=PAG G AFF
NB S %PCH=Y1 D ^%QZNBN1 G:'(ISNUM) Q2 G:'($D(^TACOMPIL($I,Y1))) Q2 S PAGE=Y1 G AFF
TETE W !,LOSTAR S LIG=L1 D LIG W !,LOSTAR Q
LIG W ! F %U=1:1 S PO=$P(POS,"^",%U) Q:PO=""  S CC=$P(LIG,"^",%U) W ?PO,CC
 Q
I O IMPR U IMPR S PAG=-1,LILIM=40,LIC=10,PAGE=0,LU=1 D TETI
 F %V=0:0 S PAG=$N(^TACOMPIL(DOL,PAG)) Q:PAG=-1  S LI=-1 F %V=0:0 S LI=$N(^TACOMPIL(DOL,PAG,LI)) Q:LI=-1  S LIG=^TACOMPIL(DOL,PAG,LI) D LIG S LIC=LIC+1,LU=LU+1 H:(LU#5)=0 6 I LIC>LILIM D TETI S LIC=10
 W !,LOSTAR,# C IMPR G FIN
TETI W:PAGE'=0 !,LOSTAR S PAGE=PAGE+1 W #,!,WHOIS S MSG=$$^%QZCHW("Page ")_PAGE W ?66-($L(MSG)\2),MSG,?120,%DAT,! D TETE Q
FIN D:IMPR=0 CLEPAG^%VVIDEO,80^%VVIDEO Q
POS ;;0^3^49^51^82^84^93^95^107^109^112^114^123^125^131^

