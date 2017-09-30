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

;%QSATTR6^INT^1^59547,73880^0
QSATTR6 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
IMPR 
 N AT,I,IMP
 D MSG^%VZEATT($$^%QZCHW("impression en cours")_"...")
 S IMP=$S($D(^TABIDENT(WHOIS,"PRINTER")):^TABIDENT(WHOIS,"PRINTER"),1:0)
 O IMP U IMP I IMP'=0 W #
 D IMPTIT,IMPAG
 I IMP'=0 W #
 C IMP
 D ^%VZEAVT($$^%QZCHW("impression terminee")),HELP
 Q
 
IMPAG 
 F I=1:1 Q:'($D(^ATT($J,Z,I)))  S AT=^ATT($J,Z,I) W !,$E(AT,1,37),?38,$E($$AFFI^%QMDAUC(BA,$P(AT," (",1),^VAL($J,Z,I)),1,35),?73,$$UNIT^%LXSTOCK($P(AT," ("))
 Q
 
IMPTIT 
 W !,?20," ",BASE," : ",O," ",! Q
 
 
CHANG(BASE,ATT,VAL) 
 N TAB
 D ^%VZEATT
 D ^%QSATPR(BASE,ATT,VAL,.TAB)
 I TAB=0 D POCLEPA^%VVIDEO Q 0
 N I,AT,ATR,DL,ORDRE,VALA
 
 S DL=$ZP(^ATT($J,Z,"")),AT=""
 F I=1:1 S AT=$O(TAB(I,"")) Q:AT=""  S VALA=TAB(I,AT),ATR=$P(AT," (") I $$^%QSDROIT(BA,ATR,"C",JE) D INSER
 D POCLEPA^%VVIDEO
 Q 1
 
INSER S ORDRE=$$ORD(AT) G:ORDRE="" SORD
 G:'($$OAIR^%QSGE5(BA,O,ATR,ORDRE)) SUITE
 D ^%VZEAVT(ATR_" "_$$^%QZCHW("existe deja avec le numero d'ordre")_" "_ORDRE) Q
SORD I '($$AIR^%QSGEST5(BA,O,ATR)) S ORDRE=1 G SUITE
OK79 D POCLEPA^%VVIDEO S Y1=$$^%VZAME1($$^%QZCHW("no d'ordre de")_" "_ATR_" : ") Q:CTRLA!(Y1="")
 I $$OAIR^%QSGE5(BA,O,ATR,Y1) D ^%VZEAVT($$^%QZCHW("numero d'ordre existant")) G OK79
 S ORDRE=Y1
SUITE 
 D INST2^%QSATTR3(ATR,VALA,ORDRE,.DL),PA^%QSGESTI(BA,O,ATR,VALA,ORDRE)
 Q
 
ORD(A) N D
 S D=$P($P(A," (",2),")")
 S:$E(D)="""" D=$E(D,2,$L(D)-1) Q D
 
;Affiche les attributs d'un individu 
REAFF 
 N ORD,ATT
 S Z=^ATT($J)
 D CADR,TIT,PAGE,HELP
 Q
 
CADR D CLFEN^%VVIDEO(XG,YH,HA,LA),CARSP^%VVIDEO(XG,YH,HA,LA,1)
 Q
 
HELP S DX=XG+1,DY=(YH+HA)-1 X XY W " " D XY^%VZCFLE S DX=DX+9 X XY
 W $$^%QZCHW("(-),(+),CTRLH aide,CTRLJ imprimer,CTRLP page") K CGEN Q
 
CLEAR(D) 
 S DX=XG+1
 ;HL002 F DY=D:1:(YH+HA)-2 X XY W $J("",LA-2)
 F DY=D:1:(YH+HA)-2 X XY W $J("",LA-3)
 Q
 
PAGA(AT) S AA=""
 F %A=0:0 S AA=$O(^ATT($J,Z,AA)) Q:AA=""  Q:^ATT($J,Z,AA)=AT
 S LC=AA,PAGE=((LC-1)\(HA-4))+1,OPAGE=PAGE-1,LDEP=((PAGE-1)*(HA-4))+1,LFIN=PAGE*(HA-4),YC=((YH+2)+LC)-LDEP
 G PAGE
PAG S DEP=LC G PAG2
PAGE S DEP=LDEP
PAG2 S L=((YH+2)+DEP)-LDEP
 F I=DEP:1 Q:('($D(^ATT($J,Z,I))))!(((YH+HA)-2)=L)  D AFF
 D CLEAR(L),POCLEPA^%VVIDEO
 Q
;HL002 AFF S AA=^ATT($J,Z,I),DY=L,DX=XG+1 X XY W $J("",LA-2)
AFF S AA=^ATT($J,Z,I),DY=L,DX=XG+1 X XY W $J("",LA-3)
 G:'($D(^[QUI]RQSLIEN(BA,$P(AA," (",1)))) AFF2
 X XY I SUB="C-IBM PC" D UDL^%VVIDEO G AFF2
 D BLD^%VVIDEO
AFF2 S A=$$GETLBLAN^%VTLBLAN($$^%QZCHEV($P(AA," (",1),L1,"P")),ORD=$P($P(AA," (",2),")",1),DX=DX+1 X XY W A W:ORD'="" " (",$E(ORD,1,(L1-$L(A))-2),")"
 D NORM^%VVIDEO S DX=(DX+L1)+2 X XY W $E($$AFFI^%QMDAUC(BA,$P(^ATT($J,Z,I)," (",1),^VAL($J,Z,I)),1,L1)
 S DX=(DX+L1)+2 X XY W $$UNIT^%LXSTOCK($P(AA," (",1))
 S L=L+1
 Q
 
TIT 
 N XX
 S DX=XG+10,DY=YH X XY W " " D REV^%VVIDEO S DX=DX+1 X XY W BASE D NORM^%VVIDEO W " : " S DX=DX+4,XX=$L(O)+DX
 I (XX>XG)+LA S XX=((XG+LA)-$X)-6 D BLD^%VVIDEO,REV^%VVIDEO W $E(O,1,XX) S DX=XG+11,DY=DY+1 X XY W $E(O,$L(O)-(($L(O)-XX)-1),99) D NORM^%VVIDEO W " " S DY=DY-1 Q
 D BLD^%VVIDEO,REV^%VVIDEO W O D NORM^%VVIDEO W " " Q
 
NPAG 
 Q:OPAGE=PAGE
 S DX=XG+2,DY=YH X XY W " ",PAGE,"/",NBPAGE," "
 S OPAGE=PAGE Q
 
COUR 
 N M
 S M=$S(NBPAGE=0:"",COL:$$AFFI^%QMDAUC(BA,$P(^ATT($J,Z,LC)," (",1),^VAL($J,Z,LC)),1:^ATT($J,Z,LC))
 ;HL002 S DX=XG+1,DY=(YH+HA)-2 X XY W $J("",LA-2)
 S DX=XG+1,DY=(YH+HA)-2 X XY W $J("",LA-3)
 S DX=((XG+(LA\2))-($L(M)\2))-1 S:DX<XG DX=XG+1 X XY
 D BLD^%VVIDEO,REV^%VVIDEO X XY W $E(M,1,LA-2) X XY D NORM^%VVIDEO
 Q

