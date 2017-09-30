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

;TO3GKEMP^INT^1^59547,74870^0
TO3GKEMP ;
 
DEB K ^TBK($J),LIART D CLEPAG^%VVIDEO S DX=0,DY=0 X XY W $$^%QZCHW("Cas d'emploi de parametres dans le Savoir-faire") S DX=0,DY=2 X XY
DEB1 S DX=0,DY=DY+1 X XY
 S DEV="ECR"
 W $$^%QZCHW("Article (TOUS) : ")
 S DX=$X D ^%VLEC
 G:CTRLA=1 FIN2
 G:CTRLF=1 QU
 I Y1=$$^%QZCHW("TOUS") S LIA=-1 F IY=0:0 S LIA=$N(^[QUI]KEMPLOI(LIA)) Q:LIA=-1  S LIP=-1 F IZ=0:0 S LIP=$N(^[QUI]KEMPLOI(LIA,LIP)) Q:LIP=-1  S ^TBK($J,LIA,LIP)=1
 G:Y1=$$^%QZCHW("TOUS") QU
 I $D(LIART),Y1="" X XY S Y1=LIART W LIART
GPAR S LIART=Y1 G:Y1="" DEB1 S DX=40 X XY W $$^%QZCHW("Parametre : ") S DX=$X D ^%VLEC G:(CTRLA=1)!(CTRLF=1) DEB1 S LIPAR=Y1 S:LIPAR="" LIPAR=$$^%QZCHW("TOUS") W:LIPAR=$$^%QZCHW("TOUS") $$^%QZCHW("(Tous)")
 I LIPAR=$$^%QZCHW("TOUS") S LIP=-1 F IZ=0:0 S LIP=$N(^[QUI]KEMPLOI(LIART,LIP)) Q:LIP=-1  I LIP'["$" S ^TBK($J,LIART,LIP)=1
 S:LIPAR'=$$^%QZCHW("TOUS") ^TBK($J,LIART,LIPAR)=1 G DEB1
QU D CLEPAG^%VVIDEO S DX=0,DY=10 X XY W $$^%QZCHW("(E)dition sur ecran ou sur (I)mprimante ? ") R *REP G:REP=13 FIN S REP=$C(REP) I (REP'=$$^%QZCHW("I"))&(REP'=$$^%QZCHW("E")) G QU
 I REP=$$^%QZCHW("I") S DEV="IMPR",IMPR=^TABIDENT(WHOIS,"PRINTER") O IMPR U IMPR W *-1,*23,#
 E  S DEV="ECR" D CLEPAG^%VVIDEO
 S LIART=-1 F IY=0:0 S LIART=$N(^TBK($J,LIART)) G:LIART=-1 FIN W:DEV="IMPR" # W !,?40-($L(LIART)\2),"*** ",LIART," ***" S LIPAR=-1 F IW=0:0 S LIPAR=$N(^TBK($J,LIART,LIPAR)) Q:LIPAR=-1  W !,!,!,?5,"- ",LIPAR,$$^%QZCHW(" -"),! D TRAIT
TRAIT S NUM=-1 F UU=0:0 S NUM=$N(^[QUI]KEMPLOI(LIART,LIPAR,NUM)) Q:NUM=-1  D TRAIT2
 Q
TRAIT2 Q:NUM="VU"  S RS=^[QUI]KEMPLOI(LIART,LIPAR,NUM) Q:(RS["$ARG")!(RS["%VAL")
 I RS[$$^%QZCHW("Abaque") W !,?20,"==> ",RS Q
 S GLOB=$P($P(RS," ",1),"(",1) W !,?20,"==> ",GLOB,$P(RS,")",2) Q
FIN I DEV'="IMPR" W !,!,"[RETURN]" R *RET
 C:DEV="IMPR" IMPR
FIN2 K ^TBK Q

