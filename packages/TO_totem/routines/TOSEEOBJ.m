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

;TOSEEOBJ^INT^1^59547,74875^0
TOSEEOBJ ;
 
 D CLEPAG^%VVIDEO S LILIM=20,DEV="ECR",DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG="Objets du SAVOIR-FAIRE" D TO4^%VZCD S DX=0,DY=10 X XY W "Un instant..."
 D ^TOALLOBJ K ^VALPAR($I) S PTS=" " F I=1:1:75 S PTS=PTS_"."
 I '($D(^POSENR($I))) D POCLEPA^%VVIDEO W "Aucun Savoir-Faire n'a ete exprime ! [RETURN] " R *RET G END
 S NBPAG=$S($D(^POSENR($I,PAGE)):PAGE,1:PAGE-1),PAGE=1,DX=0,DY=6 D CLEBAS^%VVIDEO G AFF1
SUIT D POCLEPA^%VVIDEO W $$L20^%QSLIB2("aux objets,?:Repere") S PAG="Page "_PAGE_"/"_NBPAG
 S DX=40-($L(PAG)\2),DY=6 X XY W PAG S DX=(($X-$L(NBPAG))-1)-$L(PAGE),DY=$Y D ^%VLEC G ORD:Y1="?",1:CTRLA,6:CTRLF,65:CTRLE,SUIT:Y1="",61:(Y1="+")!(Y1="="),45:Y1="-"
SINON G:$A(Y1)<32 SUIT S PCH=Y1 D TO^%QZNBN1 G:'(ISNUM) SUIT S NPAG=Y1 G AFF
1 G END
6 G END
65 D ^TOTROBJ G SUIT
43 G 61
45 S NPAG=PAGE-1 G AFF
61 S NPAG=PAGE+1 G AFF
AFF I '($D(^POSENR($I,NPAG))) D ^%VSQUEAK G SUIT
 S PAGE=NPAG,DX=0,DY=7 D CLEBAS^%VVIDEO
AFF1 S DY=-1 F %QY=1:1 S DY=$N(^POSENR($I,PAGE,DY)) Q:DY=-1  S DX=5 X XY W $P(^POSENR($I,PAGE,DY),"^",1),$E(PTS,1,(75-$X)-1),$P(^POSENR($I,PAGE,DY),"^",2) I $D(^VALPAR($I,PAGE,DY)) D REV^%VVIDEO,BLD^%VVIDEO S DX=0 X XY W "D" D NORM^%VVIDEO
 G SUIT
END D MAJ K PAG,LILIM,LOSTAR,LSTAR,%FIN,DEBP,INEXT,ILS,I,PY,PX,NEXT,PAGE,U,CTRLE,CTRLA,CTRLF,CTRLL,CTRLZ,Y1,YG,NPAG,%QY,PAR,TYP Q
ON D REV^%VVIDEO,BLD^%VVIDEO S DX=1 X XY W " " D NORM^%VVIDEO Q
FIN Q
ORD S STOP=0,DX=0,DY=5 D CLEBAS^%VVIDEO S PG=-1 F I=1:1 S PG=$N(^POSFUL($I,PG)) Q:PG=-1  D ECORD Q:STOP=1
 I STOP'=1 D POCLEPA^%VVIDEO W "Fin [RETURN] " R *RET
 S DX=0,DY=5 D CLEBAS^%VVIDEO G AFF1
ECORD S DD=^POSFUL($I,PG),FF=$P(DD,"^",2),DD=$P(DD,"^",1)
 W !,"Page ",$S(PG<10:" ",1:""),PG,?9,DD,!,?9,FF D:$Y'<21 ALOR
 G FIN
ALOR D POCLEPA^%VVIDEO W $$L2^%QSLIB R *RET D TOUCHE^%INCCLAV(RET,.RET)
 G:(RET'=13)&(RET'=1) ALOR S:RET=1 STOP=1 S DX=0,DY=5 D CLEBAS^%VVIDEO X XY G FIN
MAJ Q:'($D(^POSENR($I)))  Q:'($D(^VALPAR($I)))  D POCLEPA^%VVIDEO W "Un instant..."
 S PG=-1 F I=1:1 S PG=$N(^VALPAR($I,PG)) Q:PG=-1  S ILS=-1 F JJ=1:1 S ILS=$N(^VALPAR($I,PG,ILS)) Q:ILS=-1  D DEL
 G FIN
DEL G:'($D(^POSENR($I,PG,ILS))) FIN S LIB=$P(^POSENR($I,PG,ILS),"^",1),OBJ=$P(^POSENR($I,PG,ILS),"^",2)
 D ^TODELOBJ G FIN

