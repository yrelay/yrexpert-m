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

;TOP0CHET^INT^1^59547,74873^0
TOP0CHET ;
 
 K ^EDICLI($J) S NBPAG=$S($D(^POSENR($I,PAGE)):PAGE,1:PAGE-1),PAGE=1,DX=0,DY=6 D CLEBAS^%VVIDEO,ENTET1 G AFF1
SUIT D POCLEPA^%VVIDEO W $$L20^%QSLIB2("aux objets, ?:Detail, (T)ous, CTRLJ:Imp.")
 S PAG="Page "_PAGE_"/"_NBPAG
 S DX=40-($L(PAG)\2),DY=5 X XY W PAG S DX=(($X-$L(NBPAG))-1)-$L(PAGE),DY=$Y D ^%VLEC G 1:CTRLA,6:CTRLF,65:CTRLE,10:CTRLJ,SUIT:Y1="",61:(Y1="+")!(Y1="="),45:Y1="-",84:Y1="T"
SINON G:$A(Y1)<32 SUIT S PCH=Y1 D TO^%QZNBN1 G:'(ISNUM) SUIT S NPAG=Y1 G AFF
1 G END
6 G END
84 D POCLEPA^%VVIDEO,^%VSQUEAK W "Un instant..." D TOUS,POCLEPA^%VVIDEO G END
10 S %GL="^POSENR(DOLARI,PAGE)",HPG="ARC^No d'etude^Date",%POS="3^30^60",BPG="" D ^TOP0EDPA G SUIT
65 D ^TOP0SELE G SUIT
43 G 61
45 S NPAG=PAGE-1 G AFF
61 S NPAG=PAGE+1 G AFF
AFF I '($D(^POSENR($I,NPAG))) D ^%VSQUEAK G SUIT
 S PAGE=NPAG,DX=0,DY=7 D CLEBAS^%VVIDEO
AFF1 S DY=-1 F %QY=1:1 S DY=$N(^POSENR($I,PAGE,DY)) D NORM^%VVIDEO Q:DY=-1  S LINE=^POSENR($I,PAGE,DY),ARC=$P(LINE,"^",1),NUFA=$P(LINE,"^",2),TAAD=$P(LINE,"^",3) X XY D ON W ?4,ARC,?31,NUFA,?60,TAAD
 G SUIT
END K PAG,LILIM,LOSTAR,LSTAR,%FIN,DEBP,INEXT,LI,I,PY,PX,NEXT,PAGE,U,CTRLE,CTRLA,CTRLF,CTRLL,CTRLZ,Y1,YG,NPAG,%QY,PAR,TYP,%PP,%LL Q
ON I $D(^EDICLI($J,ARC,NUFA)) D BLD^%VVIDEO,BLK^%VVIDEO S DX=0 X XY W "S"
 G FIN
FIN Q
ENTET1 S DX=0,DY=6 X XY W ?4,"ARC",?31,"No d'etude",?60,"Date"
 Q
TOUS F PAGE=1:1:NBPAG F LG=8:1:21 Q:'($D(^POSENR($I,PAGE,LG)))  S DATA=^POSENR($I,PAGE,LG),ARC=$P(DATA,"^",1),NUFA=$P(DATA,"^",2),TWREF=-1 F TW=1:1 S TWREF=$N(^[QUI]TREEWORK(NUFA,TWREF)) Q:TWREF=-1  S ^EDICLI($J,ARC,NUFA,TWREF)=1
 Q

