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
;! HL002 ! HL     ! 14/07/12 ! L'individu traité n'existe pas                 !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;TOEXPGET^INT^1^59547,74872^0
TOEXPGET ;
 
 K ^VALPAR($I),^DON($I)
BEG S TBFIG($P($ZPOS,"^",2),1)="CADRE" D ^%VZCFIG S DX=0,DY=8 D CLEBAS^%VVIDEO S LILIM=21,DEV="ECR",%ABAND=0,DX=0,DY=7 X XY D ^%AB3STAR
 K ^POSENR($I),^VBIS($I),^POSFUL($I) S PAGE=1,LI=10,^POSENR($I,PAGE,LI)=$$^%QZCHW("QUANTITE"),^VALPAR($I,$$^%QZCHW("QUANTITE"))=$S($D(^VALPAR($I,$$^%QZCHW("QUANTITE"))):^VALPAR($I,$$^%QZCHW("QUANTITE")),$D(^[QUI]TVPAR(NUFA,TWREF,$$^%QZCHW("QUANTITE"))):^[QUI]TVPAR(NUFA,TWREF,$$^%QZCHW("QUANTITE")),1:1)
 S ^POSFUL($I,PAGE,LI)=$$^%QZCHW("QUANTITE"),LI=LI+1
 S %PAR=$$^%QZCHW("E"),INEXT=-1 F I=1:1 S INEXT=$N(^[QUI]EXPLICI(YA,INEXT)) G:INEXT=-1 FEXP D EXP
EXP S NEXT=$N(^[QUI]EXPLICI(YA,INEXT,-1)) D U S ^POSENR($I,PAGE,LI)=NEXT_"^"_UN,^POSFUL($I,PAGE,LI)=NEXT,^DON($I,NEXT)=I,^VALPAR($I,NEXT)=$S($D(^VALPAR($I,NEXT)):^VALPAR($I,NEXT),1:$P(^[QUI]EXPLICI(YA,INEXT,NEXT),"^",18)),LI=LI+1
 I LI>LILIM S LI=10,PAGE=PAGE+1
 G FIN
U S U="^[QUI]UNITE(YA,NEXT)",UN=$S($D(@U):@U,1:"") Q
FEXP S NBP=$S($D(^POSENR($I,PAGE)):PAGE,1:PAGE-1),PAGE=1 D AFF
SUIT D POCLEPA^%VVIDEO W $$L20^%QSLIB2("aux parametres, (CTRLF) fin")
 S DX=$X+1,DY=$Y D ^%VLEC G 1:CTRLA,6:CTRLF,65:CTRLE,SUIT:Y1="",61:(Y1="+")!(Y1="="),45:Y1=$$^%QZCHW("-") S PCH=Y1 D TO^%QZNBN1 G SUIT:'(ISNUM),SUIT:Y1=PAGE,SUIT:'($D(^POSENR($I,Y1))) S PAGE=Y1 D EFF,AFF0 G SUIT
1 S %ABEND=1 G END
6 S %ABEND=0 G END
65 D ^TOEXPGEG G SUIT
13 G:%FIN=1 SUIT S DX=0,DY=6 D CLEBAS^%VVIDEO S DX=0,DY=7,LI=7,PAGE=PAGE+1 X XY G FIN
43 G 61
45 S NPAG=PAGE-1 G:'($D(^POSENR($I,NPAG))) SUIT S PAGE=NPAG D EFF,AFF0 G SUIT
61 S NPAG=PAGE+1 G:'($D(^POSENR($I,NPAG))) SUIT S PAGE=NPAG D EFF,AFF0 G SUIT
AFF
 S DX=0,DY=5 D CLEBAS^%VVIDEO S %FIG="CADRE" D DES^%VZCFIG S DY=6
 I $D(^TRAITES($J,"CARD")),$D(NBTOT) S LIB=$$^%QZCHW("Individu traite ")_^TRAITES($J,"CARD")_$$^%QZCHW("/")_NBTOT_$$^%QZCHW(" "),DX=38-($L(LIB)\2) D BLD^%VVIDEO,REV^%VVIDEO X XY W LIB K LIB D NORM^%VVIDEO
 I '$D(^TRAITES($J,"CARD")),'$D(NBTOT) S LIB=$$^%QZCHW("Individu traite ")_"?"_$$^%QZCHW("/")_"?"_$$^%QZCHW(" "),DX=38-($L(LIB)\2) D BLD^%VVIDEO,REV^%VVIDEO X XY W LIB K LIB D NORM^%VVIDEO ;HL002
 
AFF0 D CUROF^%VVIDEO S MSG=$$^%QZCHW("Page ")_PAGE_"/"_NBP,DX=34,DY=8 X XY W MSG S DY=-1 F %U=1:1 S DY=$N(^POSENR($I,PAGE,DY)) Q:DY=-1  D AFF1
 D CURON^%VVIDEO
FIN Q
EFF D CUROF^%VVIDEO S DX=3 F DY=10:1:21 X XY W $J("",73)
 S DX=33,DY=8 X XY W $J("",12) D CURON^%VVIDEO Q
AFF1 S LI=^POSENR($I,PAGE,DY),NEXT=$P(LI,"^",1),UN=$P(LI,"^",2),DX=4 D BLD^%VVIDEO X XY W NEXT S DX=$X D NORM^%VVIDEO X XY W $S(UN'="":" ("_UN_")",1:"") S LI=$TR($J("",45-$X),$$^%QZCHW(" "),".") W LI,?46,^VALPAR($I,NEXT) Q
END S DX=0,DY=5 D CLEBAS^%VVIDEO K PAG,LILIM,LOSTAR,LSTAR,%FIN,DEBP,INEXT,LI,I,PY,PX,NEXT,PAGE,U,CTRLE,CTRLA,CTRLF,CTRLL,CTRLZ,Y1,YG,NPAG,%QY,PAR,TYP
 G:%ABEND=1 ENDF D ^TOEXPGEA
ENDF K ^VALPAR($I),^DON($I) Q
ON D REV^%VVIDEO,BLD^%VVIDEO S DX=1 X XY W $$^%QZCHW(" ") D NORM^%VVIDEO Q
CADRE ;;~L~H~74~3~5/~L~H~74~3~7/~L~H~74~3~9/~L~H~74~3~22/~L~V~1~2~6/~L~V~12~2~10/~L~V~1~32~8/~L~V~1~45~8/~L~V~1~77~6/~L~V~12~77~10/~KS~l~2~5/~KS~m~2~7/~KS~l~2~9/~KS~m~2~22/~KS~w~32~7/~KS~v~32~9/~KS~w~45~7/~KS~v~45~9/~KS~k~77~5/~KS~j~77~7/~KS~k~77~9/~KS~j~77~22/
 ;;

