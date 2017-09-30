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

;TOP01LET^INT^1^59547,74873^0
TOP01LET ;
 
 K ^POSENR($I) S PGE=1,LI=8,NU=-1 F %V=1:1 S NU=$N(^ETUARC($I,NU)) Q:NU=-1  D T0
 S NBPG=$S($D(^POSENR($I,PGE)):PGE,1:PGE-1),PGE=1,%OK=0 D AFF
QU D POCLEPA^%VVIDEO W $$L17^%QSLIB1("Sx:Selection du numero x") S DX=$X D ^%VLEC G:CTRLA=1 FIN G:Y1="" QU
 G PL:Y1="+",PL:Y1="-",MS:Y1="-" I Y1[$$^%QZCHW("S") S Y1=$P(Y1,"S",2) G:Y1="" QU G:'($D(^ETUARC($I,Y1))) QU S %OK=Y1 G FIN
 G:'($D(^POSENR($I,Y1))) QU
MS S NPG=PGE-1 G:'($D(^POSENR($I,NPG))) QU S PGE=NPG D AFF G QU
PL S NPG=PGE+1 G:'($D(^POSENR($I,NPG))) QU S PGE=NPG D AFF G QU
AFF S DX=0,DY=6 D CLEBAS^%VVIDEO S DY=6,MSG="page "_PGE_"/"_NBPG,DX=40-($L(MSG)\2) X XY W MSG S DX=0,DY=-1 F %U=1:1 S DY=$N(^POSENR($I,PGE,DY)) Q:DY=-1  X XY W ^POSENR($I,PGE,DY)
 G END
FIN S DX=0,DY=6 D CLEBAS^%VVIDEO
 K ^POSENR($I),PGE,LI,NU,%V,NBPG,Y1,CTRLA,CTRLF,CTRLR,CTRLL,CTRLZ,CTRLE,RS,NBC,%NBCAR,ART,LIG,CC,%U,LART,LIG Q
T0 S RS=$P(^ETUARC($I,NU),"^",1),%CAR="/" D ^%QZCHNBC S NBC=%NBCAR+1,ART=$P(RS,":",1),LIG=$S(NU<10:" ",1:"")_NU_"   "_ART_"/",LART=$L(ART),CC="     " F %U=1:1:LART S CC=CC_" "
 F %U=2:1:NBC S IT=$P(RS,"/",%U) D:($L(LIG)+$L(IT))>70 NLI S LIG=LIG_IT_"/"
 D:LIG'=(CC_"/") NLI G END
NLI S ^POSENR($I,PGE,LI)=LIG,LI=LI+1 I LI>21 S PGE=PGE+1,LI=8
 S LIG=CC_"/" G END
END Q

