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

;TOITABCO^INT^1^59547,74872^0
TOITABCO ;
 
 D CLEPAG^%VVIDEO S LILIM=20,DEV="ECR",DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("TABLEAUX DES RESULTATS") D TO4^%VZCD S DX=0,DY=10 X XY W $$^%QZCHW("Un instant...")
 D ^TOGTBRES,^TOTAVACO S %9SP($I,1)=28,%9SP($I,2)=15,%9SP($I,3)=6,%9SP($I,4)=8,%9SP($I,5)=8,%9SP($I,6)=6,%DEC=$S($D(^TABIDENT(WHOIS,"DECIMALES")):^TABIDENT(WHOIS,"DECIMALES"),1:2)
 I '($D(^POSENR($I))) D POCLEPA^%VVIDEO W $$^%QZCHW("Aucune comparaison n'a ete executee ! [RETURN] ") R *RET G END
SUPOR S DX=0,DY=8 D CLEBAS^%VVIDEO S LOSTAR="|"_$TR($J("",126),$$^%QZCHW(" "),$$^%QZCHW("-"))_"|",DX=0,DY=12,IMPR=0,DOLARI=$I X XY W $$^%QZCHW("Desirez-vous les resultats sur (E)cran ou sur (I)mprimante (abandon ")_$$L24^%QSLIB2_") ? "
REP R *SUP D TOUCHE^%INCCLAV(SUP,.SUP) G:SUP=1 END
 I (SUP=69)!(SUP=73) D @SUP G SUPOR
 D ^%VSQUEAK G REP
 
69 D CLEPAG^%VVIDEO,132^%VVIDEO
 S %DEV=$$^%QZCHW("E"),COUNT=0,LILIM=20,DEV="ECR"
 S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("TABLEAUX DES RESULTATS") D TO4^%VZCD
 S NBPAG=$S($D(^POSENR($I,PAGE)):PAGE,1:PAGE-1),PAGE=1,DX=0,DY=8 X XY G AFF1
SUIT D POCLEPA^%VVIDEO W $$L17^%QSLIB1("?:Repere") S PAG=$$^%QZCHW("Page ")_PAGE_"/"_NBPAG
 S DX=40-($L(PAG)\2),DY=6 X XY W PAG S DX=(($X-$L(NBPAG))-1)-$L(PAGE),DY=$Y D ^%VLEC O IMPR
 G ORD:Y1="?",1:CTRLA,6:CTRLF,SUIT:Y1="",61:(Y1="+")!(Y1="="),45:Y1=$$^%QZCHW("-")
SINON G:$A(Y1)<32 SUIT S PCH=Y1 D TO^%QZNBN1 G:'(ISNUM) SUIT S NPAG=Y1 G AFF
1 Q
6 Q
43 G 61
45 S NPAG=PAGE-1 G AFF
61 S NPAG=PAGE+1 G AFF
AFF I '($D(^POSENR($I,NPAG))) D ^%VSQUEAK G SUIT
 S PAGE=NPAG,DX=0,DY=8 D CLEBAS^%VVIDEO S DX=0,DY=7 X XY W !
AFF1 S DY=-1 F %QY=1:1 S DY=$N(^POSENR($I,PAGE,DY)) Q:DY=-1  S LG=DY D AFF20
 G SUIT
END D CLEPAG^%VVIDEO,80^%VVIDEO K %9COL,%9OBV,%9SP($I),%9CPT,PAG,LILIM,LOSTAR,LSTAR,%FIN,DEBP,INEXT,LI,I,PY,PX,NEXT,PAGE,U,CTRLE,CTRLA,CTRLL,CTRLZ,Y1,YG,NPAG,%QY,PAR,TYP Q
FIN Q
ORD S STOP=0,DX=0,DY=5 D CLEBAS^%VVIDEO S PG=-1 F I=1:1 S PG=$N(^POSFUL($I,PG)) Q:PG=-1  D ECORD Q:STOP=1
 I STOP'=1 D POCLEPA^%VVIDEO W $$^%QZCHW("Fin [RETURN] ") R *RET
 S DX=0,DY=5 D CLEBAS^%VVIDEO S DX=0,DY=7 X XY W ! G AFF1
ECORD S DD=^POSFUL($I,PG),FF=$P(DD,"^",2),DD=$P(DD,"^",1)
 W !,$$^%QZCHW("Page "),$S(PG<10:$$^%QZCHW(" "),1:""),PG,?9,DD,?60,FF D:$Y'<22 ALOR
 G FIN
ALOR D POCLEPA^%VVIDEO W $$L2^%QSLIB R *RET D TOUCHE^%INCCLAV(RET,.RET)
 G:(RET'=13)&(RET'=1) ALOR S:RET=1 STOP=1
 S DX=0,DY=5 D CLEBAS^%VVIDEO X XY G FIN
 
73 S %DEV=$$^%QZCHW("I") D ZD^%QMDATE4 S DATE=%DAT
 S IMPR=$S($D(^TABIDENT(WHOIS,"PRINTER")):^TABIDENT(WHOIS,"PRINTER"),1:0) O IMPR I IMPR=0 S SUP=69 G 69
 S %LIM=$S($D(^TABIDENT(WHOIS,"IMPRCOUR")):^TABIDENT(WHOIS,"IMPRCOUR"),1:0) S:%LIM<20 %LIM=60 S:%LIM>60 %LIM=60
 S RDA=$S($D(^TABIDENT(WHOIS,"TYP.IMPR")):^TABIDENT(WHOIS,"TYP.IMPR"),1:"LC35") S:RDA="" RDA="LC35" S RDA1=RDA_"O^%VPRXCA",RDA2=RDA_"F^%VPRXCA" U IMPR D @RDA1
 D ENTET F PAGE=1:1 Q:'($D(^POSENR(DOLARI,PAGE)))  F LG=8:1 Q:'($D(^POSENR(DOLARI,PAGE,LG)))  D AFF20
ENDIMP D CORIGHT,@RDA2 C IMPR Q
 
AFF20 Q:LG<8  S LINE=^POSENR(DOLARI,PAGE,LG) I LINE="" U IMPR W ! S COUNT=COUNT+1 D TFP Q
 G:$P(LINE,"^",1)'="TITRE" SUITAF S TITRE=$P(LINE,"^",2)
TIT S:'($D(TITRE)) TITRE=$$^%QZCHW("Suite") S SP=126-$L(TITRE),SP=SP/2,SP1=SP S:SP[".5" SP1=SP+5E-1,SP=SP-5E-1 U IMPR W !,"|" F BL=1:1:SP W $$^%QZCHW(" ")
 W TITRE F BL=1:1:SP1 W $$^%QZCHW(" ")
 W "|" S COUNT=COUNT+1 D TFP Q
SUITAF G:LINE'["LOSTAR" TAF U IMPR I (((LINE="LOSTARTET")&(SUP=73))&(PAGE'=1))&(LG'=8) W # S COUNT=0
 W !,LOSTAR S COUNT=COUNT+1 D TFP Q
TAF U IMPR S (LIB,%LIB)=$P(LINE,"^",2) D PD^TOABSPEC W !,$P(LINE,"^",1),?2,$E(%ABSP,1,20),?25,$P(LINE,"^",3)
 S L=4 F XX=27:17:112 S PCH=$P(LINE,"^",L),SEP=$P(LINE,"^",L+1) S:SEP="" SEP="|" S ISNUM=0 D:LIB'=$$^%QZCHW("ARTICLE") TO^%QZNBN1 S:ISNUM PCH=$J(PCH,15,%DEC) W ?XX,PCH,?XX+15,SEP S L=L+2
 S COUNT=COUNT+1 D TFP Q
CORIGHT U IMPR W !,!,LOSTAR,!,"|",?57,$$PCONF^%INCASTO("NOMHOST")_" - YEXPERT ("_^INCONNE("VERSION")_")",?131,"|",!,LOSTAR,# Q
ENTET U IMPR W !,WHOIS,?50,$$^%QZCHW("RECAPITULATIF D'ETUDES TOTEM"),?115,$$^%QZCHW("LE : "),DATE,!,!,! S COUNT=4 Q
TFP Q:%DEV=$$^%QZCHW("E")  Q:COUNT<%LIM  U IMPR W # D ENTET W LOSTAR D TIT W !,LOSTAR,! S COUNT=COUNT+2 Q

