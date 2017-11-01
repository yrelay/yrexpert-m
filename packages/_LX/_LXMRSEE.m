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
;! HL002 ! HL     ! 01/11/17 ! %GTM-E-FALLINTOFLST, Fall-through to a label with formallist is not allowed !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%LXMRSEE^INT^1^59547,73870^0
LEXMRSEE ;
 
 
 
 
 D CLEPAG^%VVIDEO,^%VZCD(0,39,0,4,1,0,$$^%QZCHW("Mots RESERVES"))
 D ^%VZEATT
 K ^POSENR($I),^POSFUL($I),^VALPAR($I)
 S LILIM=20,DEV="ECR",PAGE=1,PY=8,INEXT="",%FIN=0
 F I=1:1 S JNEXT=INEXT,INEXT=$O(^[QUI]ZSYSMORE(INEXT)) Q:INEXT=""  D EXP
 I $D(^POSFUL($I,PAGE)) S ^POSFUL($I,PAGE)=^POSFUL($I,PAGE)_"^"_JNEXT
 G:'($D(^POSENR($I))) END
 S NBPAG=$S($D(^POSENR($I,PAGE)):PAGE,1:PAGE-1),PAGE=1
 S DX=0,DY=6 D CLEBAS^%VVIDEO G AFF1
 
SUIT S PAG="Page "_PAGE_"/"_NBPAG
 S DX=40-($L(PAG)\2),DY=6 X XY W PAG
 D POCLEPA^%VVIDEO W $$^%QZCHW("?:Repere, CTRLE:acces aux mots, CTRLA:Abandon, +, -, page")
 ;HL002 D ^%VZATOU(.Y1,.%F,"",0)
 D VVZATOU^%VZATOU(.Y1,.%F,"",0)
 G 1:Y1=1,6:Y1=6,65:Y1=5 S Y1=$C(Y1) G ORD:Y1="?",61:(Y1="+")!(Y1="="),45:Y1="-",PAGE:Y1="P",SUIT
SINON G:$A(Y1)<32 SUIT S PCH=Y1 D TO^%QZNBN1 G:'(ISNUM) SUIT S NPAG=Y1 G AFF
1 G END
6 G END
65 D ^%LXTR G SUIT
43 G 61
PAGE D POCLEPA^%VVIDEO S DX=10,DY=23 X XY W $$^%QZCHW("Page")," : " S DX=$X D ^%VLEC
 G SUIT:CTRLA,SUIT:CTRLF,SUIT:Y1="" S NPAG=Y1 G AFF
45 S NPAG=PAGE-1 G AFF
61 S NPAG=PAGE+1 G AFF
AFF I '($D(^POSENR($I,NPAG))) D ^%VSQUEAK G SUIT
 S PAGE=NPAG,DX=0,DY=7 D CLEBAS^%VVIDEO
AFF1 S DY="" F %QY=1:1 S DY=$O(^POSENR($I,PAGE,DY)) Q:DY=""  S DX=5 X XY W ^POSENR($I,PAGE,DY) I $D(^VALPAR($I,PAGE,DY)) D REV^%VVIDEO,BLD^%VVIDEO S DX=0 X XY W "D" D NORM^%VVIDEO
 G SUIT
 
END D MAJ K PAG,LILIM,%FIN,INEXT,LI,I,PY,PAGE,CTRLE,CTRLA,CTRLF,CTRLL,CTRLZ,Y1,NPAG,%QY,%F Q
 
ON D REV^%VVIDEO,BLD^%VVIDEO S DX=1 X XY W " " D NORM^%VVIDEO Q
 
ORD S STOP=0,DX=0,DY=5 D CLEBAS^%VVIDEO S PG="" F I=1:1 S PG=$O(^POSFUL($I,PG)) Q:PG=""  D ECORD Q:STOP=1
 I STOP'=1 D ^%VZEAVT($$^%QZCHW("Fin "))
 S DX=0,DY=5 D CLEBAS^%VVIDEO G AFF1
ECORD S DD=^POSFUL($I,PG),FF=$P(DD,"^",2),DD=$P(DD,"^",1)
 W !,"Page ",$S(PG<10:" ",1:""),PG,?9,DD,!,?9,FF D:$Y'<21 ALOR
 Q
;HL002 ALOR D POCLEPA^%VVIDEO W $$^%QZCHW("[RETURN] pour continuer, CTRLA pour abandonner ") D ^%VZATOU(.Y1,.%F,"",0)
ALOR D POCLEPA^%VVIDEO W $$^%QZCHW("[RETURN] pour continuer, CTRLA pour abandonner ") D VVZATOU^%VZATOU(.Y1,.%F,"",0)
 G:(Y1'=13)&(Y1'=1) ALOR S:Y1=1 STOP=1
 S DX=0,DY=5 D CLEBAS^%VVIDEO X XY Q
MAJ Q:'($D(^POSENR($I)))  Q:'($D(^VALPAR($I)))
 D ^%VZEATT
 S PG="" F I=1:1 S PG=$O(^VALPAR($I,PG)) Q:PG=""  S LI="" F J=1:1 S LI=$O(^VALPAR($I,PG,LI)) Q:LI=""  D DEL
 D NEW^%LXMAJ Q
DEL Q:'($D(^POSENR($I,PG,LI)))
 D DEL^%LXSTOCK(^POSENR($I,PG,LI)),SUPMOTR^%LXUCRES(QUI,^POSENR($I,PG,LI))
 Q
 
 
 
 
EXP Q:INEXT="z"
 S:PY=8 ^POSFUL($I,PAGE)=INEXT
 S ^POSENR($I,PAGE,PY)=INEXT,PY=PY+1 I PY>LILIM S ^POSFUL($I,PAGE)=^POSFUL($I,PAGE)_"^"_INEXT,PAGE=PAGE+1,PY=8
 Q

