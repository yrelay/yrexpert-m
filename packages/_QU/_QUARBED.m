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

;%QUARBED^INT^1^59547,73884^0
QUARBED ;
 
 
 
 
 
 
 N %ESP,NPAG,PAGT,PGC,Y1,TBMOV,ADR,ARR,CTR,DEP,MOD,NOEUD,REAF,X1,SDX,SDY,MENU
 
 D CONS
ECR 
 Q:'($D(^POS($J)))
 
 S MENU=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"MENU") K @(MENU)
 S @MENU@(1)="+"_"^PLUS",@MENU@(1,"EQU")="="
 S @MENU@(2)="-"_"^MOIN",@MENU@(3)="Page"_"^PAGE"
 I ROU'="" S @MENU@(4)="Acces"_"^OPT"
ENT 
 D TITRE,AFF
ACT D ^%VQUIKMN(30,80,23,MENU,.ADR,.CTR)
 I (CTR="A")!(CTR="F") K @(MENU),^ARBTHEO($J),^COMPNOM($J),^POS($J) D CLEPAG^%VVIDEO Q
 I CTR="J" D IMPR G ACT
 G:ADR'="" @ADR G ACT
 
PAGE 
 D POCLEPA^%VVIDEO S Y1=$$^%VZAME1(" "_$$^%QZCHW("page")_" : ") D POCLEPA^%VVIDEO
 G:Y1="" ACT G:'($$ADR^%QZNBN1(Y1)) ACT
 S NGAP=Y1 D AFF G ACT
MOIN 
 S NGAP=PGC-1 D AFF G ACT
PLUS 
 S NGAP=PGC+1 D AFF G ACT
 
TITRE D CLEPAG^%VVIDEO
 I TITRE'="" D ^%VZCDB($E(TITRE,1,70),0)
 Q
 
TETE N %VV
 S DX=0,DY=4 X XY
 F %VV=0:1:PFMAX-1 W ?(%VV*%ESP)+1,%VV
 W ! Q
 
IMPR 
 N IMPR,NP,NUM,PAG
 
 S IMPR=$S($D(^TABIDENT(WHOIS,"PRINTER")):^TABIDENT(WHOIS,"PRINTER"),1:0)
 D POCLEPA^%VVIDEO W $$^%QZCHW("impression en cours")_"..."
 O IMPR U IMPR W #,!
 U IMPR W ?40-($L(TITRE)\2),TITRE,!
 U IMPR W ?30,"(",$$^%QZCHW("profondeur maxi de")_" "_(PFMAX-1),")",!,!
 S NP=1
 U IMPR W ?35,$$^%QZCHW("page")," ",NP_"/"_PAGT,!
 D TETE
 S PAG="",NUM=6
AFFI 
 S PAG=$O(^POS($J,PAG)) I PAG="" G FIMPR
 S DY=""
AFYI S DY=$O(^POS($J,PAG,DY)) I DY="" G AFFI
 S DX=""
AFXI S DX=$O(^POS($J,PAG,DY,DX))
 
 I DX="" U IMPR W ! S NUM=NUM+1 D:NUM>55 AFFT G AFYI
 U IMPR W ?DX,^POS($J,PAG,DY,DX)
 G AFXI
AFFT 
 S NUM=5,NP=NP+1
 U IMPR W #,!,!,?35,$$^%QZCHW("page")," ",NP_"/"_PAGT
 D TETE
 Q
 
FIMPR U IMPR W # C IMPR
 U 0 D ^%VZEAVT($$^%QZCHW("impression terminee"))
 Q
 
AFF 
 I '($D(^POS($J,NGAP))) D ^%VSQUEAK Q
 N BLD
 S PGC=NGAP
 S DX=35,DY=2 X XY W $$^%QZCHW("page")," ",PGC_"/"_PAGT
 S DX=0,DY=4 D CLEBAS^%VVIDEO
 D TETE
 S DY=""
AFFY S DY=$O(^POS($J,PGC,DY)) Q:DY=""
 S DX=""
AFFX S DX=$O(^POS($J,PGC,DY,DX)) I DX="" G AFFY
 S BLD=^POS($J,PGC,DY,DX,"BLD")
 I BLD=1 X XY D BLD^%VVIDEO
 X XY W ^POS($J,PGC,DY,DX)
 I BLD=1 X XY D NORM^%VVIDEO
 G AFFX
 
OPT 
 S DY=$O(^POS($J,PGC,"")),DX=$O(^POS($J,PGC,DY,""))
 S TBMOV="^POS($J,PGC)"
CHX 
 X XY D ^%VZEREVS G:(X1="")!((X1<32)&(X1'=13)) ENT
 S REAF=0,MOD=0
 S NOEUD=^POS($J,PGC,DY,DX)
 
 D RECH(.DEP)
 
 S ARR=^POS($J,PGC,DY,DX,"INT")
 
 S SDX=DX,SDY=DY
 I ROU'["(" D @(ROU_"(DEP,ARR,.NOEUD)")
 I ROU["(" D @($P(ROU,")",1)_",DEP,ARR,.NOEUD)")
 S ^POS($J,PGC,SDY,SDX)=NOEUD
 
 I MOD=1 D CONSARB^%QUARBRE,CONS S REAF=1
 
 I REAF=1 D TITRE,AFF
 S DX=SDX,DY=SDY
 G CHX
 
RECH(PERE) 
 N %UY,%UX,%UP
 S %UX=DX,%UY=DY,%UP=PGC
LOOP S %UY=$ZP(^POS($J,%UP,%UY))
 I %UY="" G LOOPP
 S %UX=$ZP(^POS($J,%UP,%UY,""))
 I %UX="" S PERE="" Q
 I %UX'<DX G LOOP
 S PERE=^POS($J,%UP,%UY,%UX,"INT")
 Q
LOOPP 
 S %UP=$ZP(^POS($J,%UP)) I %UP="" S PERE="" Q
 G LOOP
 
CONS 
 N LI,LILIM,NOM,NOMTREE,PY,PX,STOP
 K ^POS($J)
 
 S PGC=1,LILIM=20,LI=4
 S %ESP=80\PFMAX
 S NOMTREE="^ARBTHEO($J",ADR="EDIT^%QUARBED"
 D TITRE,^%VZEATT
 
 S PY=5 D ^%QCAGTU1
 
 S PAGT=$S($D(^POS($J,PGC)):PGC,1:PGC-1)
 S (PGC,NGAP)=1
 Q
 
EDIT 
 N AT,BLD,INF1,INF2,NOEUD,CAR,%PROG,CG,CD,D,%I,%UU
 S CD="",CG=""
 S %PROG=@NOM
 S INF1=$P(%PROG,"^",1),NOEUD=$P(%PROG,"^",2)
 S INF2=$P(%PROG,"^",3),CAR=$P(%PROG,"^",4)
 S BLD=$P(%PROG,"^",5)
 S:CAR="*" CG="*",CD="*"
 S:CAR="!" CG="!!! ",CD=" !!!"
 S AT=NOEUD,AT=$$S^%QAX(AT)
 S INF1="<"_INF1_">" F %I=$L(INF1)+1:1:6 S INF1=INF1_"."
 S D=" "_INF1_CG_AT_CD
 
 
 S:(NOEUD=ORI)&(CAR'="!") D=" "_AT
 S:INF2'="" D=D_" ("_INF2_")"
 S PX=((%PR-2)*%ESP)+((2-$L(%PROG+1))\2)
 S ^POS($J,PGC,PY,PX)=D,^POS($J,PGC,PY,PX,"INT")=NOEUD
 
 S ^POS($J,PGC,PY,PX,"BLD")=BLD
 
 I ($L(D)+PX)>79 S PY=PY+1
 S PY=PY+1
 S LI=LI+1
 I LI'>LILIM Q
 
 S (PGC,PAGT)=PGC+1,LI=4,PY=5
 Q

