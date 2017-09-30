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

;%QSCOLF3^INT^1^59547,73880^0
QSCOLF3 ;
 
 
 
 
 
 
 
 
 
 
 
MES(M) 
 D POCLEPA^%VVIDEO X XY W $$^%QZCHW(M) Q
 
REAFF 
 D OPEN^%SYSUTI1($I,LE,""),CLFEN^%VVIDEO(XG,YH,HA,LA)
 D OPEN^%SYSUTI1($I,LE,""),CARSP^%VVIDEO(XG,YH,HA,LA,1)
 D OPEN^%SYSUTI1($I,LE,""),TITR,COL,TI,HE,POCLEPA^%VVIDEO
 Q
TITR 
 K LARG,POSIT N STOP
 S L=0,STOP=0,DX=XG+2,DY=YH+1
 F C=COLDEP:1 D TTIT Q:STOP!('($D(@COLON@(C+1))))
 S PAGE(TABH)=COLDEP,COLFIN=C Q
TTIT 
 S CH=@COLON@(C),LC=$P(CH,"^",3) S:(L+LC)>(LA-4) LC=(LA-4)-L,STOP=1
 D AFFT S L=(L+LC)+1 Q
AFFT 
 S LARG(C)=LC,POSIT(C)=DX,AT=$P(CH,"^",2)
 D:AT'="" VID X XY W $E($P(CH,"^",1),1,LC)
 D:AT'="" NORM^%VVIDEO S DX=(DX+LC)+1 Q
VID 
 F I=1:1 S J=$P(AT,",",I) Q:J=""  D @(J_"^%VVIDEO")
 Q
COL 
 N A F C=COLDEP:1:COLFIN D TC
 Q
TC 
 S DY=YH+2 F L=LIGDEP:1:(LIGDEP+HA)-5 D TL S DY=DY+1
 Q
TL I '($D(@DONNE@(L,C))) Q
 S DX=POSIT(C) S:C=1 A=@DONNE@(L,C)
 S:C=2 A=$$AFFI^%QMDAUC(REP,$P(@DONNE@(L,1)," (",1),@DONNE@(L,C))
 X XY W $E(A,1,LARG(C))
 
 I C=2 S DX=(DX+LARG(C))+2 X XY W $$UNIT^%LXSTOCK($P(@DONNE@(L,1)," (",1))
 Q
HE 
 S DX=XG+2,DY=(YH+HA)-1 X XY W " " D XY^%VZCFLE
 W $$^%QZCHW("(CTRLJ)Imprimer,(CTRLP)Page,CTRLA") Q
TI 
 S DX=XG+2,DY=YH X XY W $$^%QZCHW(" Page : "),NOPAG Q
 
IMPR 
 N A,COLFIN,IMP
 D MES("Impression en cours ...")
 S IMP=$S($D(^TABIDENT(WHOIS,"PRINTER")):^TABIDENT(WHOIS,"PRINTER"),1:0)
 O IMP U IMP I IMP'=0 W #
 D TITRI,COLI
 I IMP'=0 W #
 C IMP
 D COL^%VZEAVT($$^%QZCHW("Impression terminee"),XG,79) Q
TITRI 
 W ! S DX=0
 F C=COLDEP:1 Q:'($D(@COLON@(C)))  S CH=@COLON@(C),LC=$P(CH,"^",3) W ?DX,$P(CH,"^",1) S DX=(DX+LC)+1
 W !,! S COLFIN=C-1 Q
COLI 
 F L=LIGDEP:1 Q:L>@DONNE  D TLIG
 Q
TLIG 
 S DX=0 W ! F C=COLDEP:1:COLFIN D TCOL
 Q
TCOL 
 S LARG=$P(@COLON@(C),"^",3) S:C=1 A=@DONNE@(L,C)
 S:C=2 A=$$AFFI^%QMDAUC(REP,$P(@DONNE@(L,1)," (",1),@DONNE@(L,C))
 W ?DX,$E(A,1,LARG) S DX=(DX+LARG)+1
 I C=2 W ?DX,$$UNIT^%LXSTOCK($P(@DONNE@(L,1)," (",1)) S DX=(DX+LARG)+1
 Q
 
ATTPRED(NEW) 
 N T,I,ATT
 S T=0
 I PC=1 G FATT
 Q:'($D(@DONNE@(PL,1)))
 S ATT=$P(@DONNE@(PL,1)," (",1) I ATT="NOM" G FATT
 D MES("Un instant ... "),ATPRDAT^%QSATPR($$NOMLOG^%QSF(REP),ATT,NEW,1,.T)
 I T=0 D MES("") G FATT
 N AT,ATR,CPT,ORDRE,PCO,PLACE,PLO,VALA
 S PLACE=$ZP(@DONNE@("")),AT="",PCO=PC,PC=1,PLO=PL,CPT=0
 F I=1:1 S AT=$O(T(I,"")) Q:AT=""  S VALA=T(I,AT),ATR=$P(AT," (",1) I $$^%QSDROIT(REP,ATR,"C",WHOIS) D INSER
 D MES("")
 S PC=PCO,PL=PLO
FATT D NEXT^%QSCOLF(.I)
 I (I=0)&(T'=0) D REAFF
 Q
INSER 
 S ORDRE=$$ORD^%QSINDIV(AT) G:ORDRE="" SORD
 G:'($D(@GATT@(ATR,ORDRE))) SUITE
 D COL^%VZEAVT(ATR_" "_$$^%QZCHW("existe deja avec le numero d'ordre")_" "_ORDRE,XG,79) Q
SORD I '($D(@GATT@(ATR))) S ORDRE=1 G SUITE
AT79 D MES("") S Y1=$$^%VZAME1($$^%QZCHW("No d'ordre de")_" "_ATR_" : ") Q:CTRLA!(Y1="")
 S ORDRE=Y1 I $D(@GATT@(ATR,ORDRE)) D COL^%VZEAVT($$^%QZCHW("Numero d'ordre existant"),XG,79) G AT79
SUITE 
 S CPT=CPT+1,PL=PLACE+CPT,@DONNE@(PL,PC+1)=VALA
 D OK("","",ATR,ORDRE) Q
 
OK(OLD,ORD,NEW,ORDRE) 
 
 
 N IT S @DONNE@(PL,PC)=NEW_$S((PC=1)&(ORDRE'=1):" ("_ORDRE_")",1:"")
 I PC=1 S:NEW'="" @GATT@(NEW,ORDRE)=PL I (OLD'="")&((OLD'=NEW)!(ORD'=ORDRE)) K @GATT@(OLD,ORD)
 I $D(@COLON@(PC,"TRT")) S IT="(OLD,NEW,"_PC_","_PL_",$$ADR^%QZCHDG(ORD),$$ADR^%QZCHDG(ORDRE))" D @(@COLON@(PC,"TRT")_IT)
 Q
 
SUP(OLD,ORD,NEW,ORDRE,PL) 
 
 S PC=1,PX=POSIT(1)
 S DX=PX,DY=PY D ^%VCRIFLD($J("",(XG+LA)-4),DX,DY,DX,(DX+LA)-3)
 D OK(OLD,ORD,NEW,ORDRE),FULL^%QSCOLF
 S PC=1,PX=POSIT(PC),@DONNE@(PL,PC+1)="",SUP=1
 K @DONNE@(PL)
 Q
 
AJ(OLD,ORD,ATTR,ORDRE,PL,PC) 
 D AFF(ATTR,ORDRE),OK(OLD,ORD,ATTR,ORDRE),FULL^%QSCOLF Q
 
MOD(OLD,ORD,ATTR,NEW,ORDRE,PL) 
 
 
 S @DONNE@(PL,1)=ATT_$S(ORDRE=1:"",1:" ("_ORDRE_")")
 K @GATT@(ATTR,ORD) S @GATT@(ATTR,ORDRE)=PL
 S @DONNE@(PL,2)=NEW
 I $D(@COLON@(2,"TRT")) S IT="(OLD,NEW,2,"_PL_",$$ADR^%QZCHDG(ORD),$$ADR^%QZCHDG(ORDRE))" D @(@COLON@(2,"TRT")_IT)
 D FULL^%QSCOLF
 Q
 
NET 
 D OPEN^%SYSUTI1($I,515,"") S DX=PX,DY=PY X XY W $J("",LARG(PC)) Q
 
AFF(M,O) 
 D NET I PC=2 S DX=DX+LARG(2) X XY W $J("",8)
 S DX=PX,DY=PY X XY W $E($S(PC=1:M,M="":M,1:$$AFFI^%QMDAUC(REP,$P(@DONNE@(PL,1)," ("),M)),1,LARG(PC)) I (O'=1)&(O'="") S DX=$X,DY=$Y X XY W " (",O,")"
 I PC=2,$D(@DONNE@(PL,1)) S DX=(PX+LARG(2))+2 X XY W $$UNIT^%LXSTOCK($P(@DONNE@(PL,1)," ("))
 Q

