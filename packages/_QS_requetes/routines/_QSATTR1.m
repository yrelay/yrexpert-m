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

;%QSATTR1^INT^1^59547,73880^0
QSATTR1 ;
 
 
 
 
 
;Affiche les attributs d'un individu 
GO(ROU,AFF) 
 N CLE,%A,%VLL,%D,%F,%NUM,%V,A,AA,ATT,B,BASE,COL,D,DL,DEP,ETIQ,I,JE,L,L1
 N LC,LDEP,LFIN,OPAGE,NBPAGE,NUM,ORD,PAGE,REXT,TEM,TEMP,V,VAL,X1,X2,XC,Y2,YC,Z,NP
GO2 I '(TADTM) S:(XG+LA)>79 LA=79-XG
 S BASE=$$NOMLOG^%QSF(BA),JE=WHOIS,TEM=$$CONCAS^%QZCHAD("^TEMPO",$J_","_$P($ZPOS,"^",2))
 S:'($D(^ATT($J))) ^ATT($J)=0 S (Z,^ATT($J))=^ATT($J)+1
 S OPAGE=""
DEB D @$S(ROU'["(":ROU_"("_AFF_")",1:$P(ROU,")")_","_AFF_")")
DEB2 D REAFF^%QSATTR6
L0 S DL=$ZP(^ATT($J,Z,"")),NBPAGE=(DL\(HA-4))+((DL#(HA-4))'=0)
 D NPAG^%QSATTR6,COUR^%QSATTR6
 S DX=XC,DY=YC X XY D ECHOFF^%VVIDEO,ZFLECHE^%VZATOU,ECHON^%VVIDEO
 G:%F'="" @%F
 F I=1,2,4,6,7,8,9,10,12,13,14,16,18,22,26,28,43,45,61,95 G:I=X1 @I
DIR 
 G:(X1<31)!(X1>126) ERR
 I X1=63 G:XC=(XG+2) VISLEX
 G:XC=(XG+2) ERR G:VISU MVISU
 I '($D(^ATT($J,Z,LC))) G ERR
 S AA=^ATT($J,Z,LC),ATT=$P(AA," (",1),ORD=$P($P(AA,"(",2),")",1)
 S:ORD="" ORD=1
 S X2=X1,REXT=$$ROUTMAJ^%QSGESPE(BA,ATT)
 I REXT'="" D EXE^%QSGESP2("I",XG,YH,LA,HA,BA,O,ATT,^VAL($J,Z,LC),ORD,REXT) G L0
 I '($$^%QSDROIT(BA,ATT,"M",JE)) D ^%VZEAVT($$^%QZCHW("vous n'avez pas le droit de modifier cet attribut ")) G L0
SA S YG=$C(X2),PCX=XC,PCY=YC X XY W YG D BEG^%VLEC
 G:CTRLA!(Y1="") FL0
 S VAL=Y1 I '($$FINT^%QMDAUC(BA,ATT,.VAL)) D ^%VZEAVT($$^%QZCHW("saisie incorrecte")) S DX=XC,DY=YC X XY G SA
 I ORD="?" D CASINT S ^ATT($J,Z,LC)=ATT_$S(ORD=1:"",1:" ("_ORD_")"),DX=XG+2,DY=YC X XY W $J("",(LA\2)-2) X XY W ^ATT($J,Z,LC)
 S I=$$^%QSPRVAL(BA,ATT,.VAL,XG,YH,LA,HA)
 I I=1 D REAFF^%QSATTR6
 I I=2 D ^%VZEAVT($$^%QZCHW("valeur refusee")) S DX=XC,DY=YC X XY G SA
 I VAL="" G B
 S ^LATT($J,Z,ATT,ORD)=LC D MOD^%QSATTR2(ATT,VAL,ORD,LC)
 I $$CHANG^%QSATTR6(BASE,ATT,VAL)=1 D FINA^%QSATTR2(^ATT($J,Z,LC))
FL0 D AFFV^%QSATTR2(LC),POCLEPA^%VVIDEO G B
H 
 G:'($D(^ATT($J,Z,LC-1))) ERR G:LC'=LDEP HOK
 S PAGE=PAGE-1,LC=LC-1,LFIN=LDEP-1,LDEP=(LFIN-HA)+5,YC=(YH+HA)-3
 D PAGE^%QSATTR6 G L0
HOK S LC=LC-1,YC=YC-1 G L0
B 
 G:'($D(^ATT($J,Z,LC+1))) ERR G:LC'=LFIN BOK
 S PAGE=PAGE+1,LC=LC+1,LDEP=LFIN+1,LFIN=(LDEP+HA)-5,YC=YH+2
 D PAGE^%QSATTR6 G L0
BOK S LC=LC+1,YC=YC+1 G L0
G 
 G:(XG+2)=XC ERR
 S COL=0,XC=XG+2 G L0
D 
 G:(XG+2)'=XC ERR
 S COL=1,XC=(XC+L1)+2 G L0
1 
 G FIN
2 
 
 G LIEN^%QSATTR4
RET2 G @ETIQ
4 
 S AFF=(AFF+1)#3
 S ^OAFF($I)=AFF
 G DEB
6 
 G:'($D(VALJEU)) FIN
 F LC=1:1 Q:'($D(^ATT($J,Z,LC)))  S ORD=$P($P(^ATT($J,Z,LC),"(",2),")",1) S:ORD="" ORD=1 D PA^%QSGESTI(BA,O,$P(^ATT($J,Z,LC)," (",1),^VAL($J,Z,LC),ORD)
 G FIN
7 
 G:VISU MVISU S ETIQ="L0" D DELA^%QSATTR2 G @ETIQ
8 
 D ^%QSHELP G 18
9 
 G:VISU MVISU G:(XG+2)=XC ERR
 D MVAL^%QSATTR2 G B
10 
 D IMPR^%QSATTR6 G L0
12 
 G:VISU MVISU D INSA^%QSATTR2,POCLEPA^%VVIDEO G L0
13 
 
 G:(XG+2)=XC D
 I '($D(^ATT($J,Z,LC))) G ERR
 G:$$DAT^%QSATTR3(LC) B
 S ATT=$P(^ATT($J,Z,LC)," (",1),VAL=^VAL($J,Z,LC)
 I $$CHANG^%QSATTR6(BASE,ATT,VAL)=1 D PAGA^%QSATTR6(^ATT($J,Z,LC))
 G B
14 
 G:VISU MVISU G:(XG+2)=XC ERR
 D MCONT^%QSATTR2 G L0
16 
 D POCLEPA^%VVIDEO W $$^%QZCHW("no de page")," : "
 R NP D POCLEPA^%VVIDEO
 G:NP="" L0 G:(NP<1)!(NP=PAGE) ERR
 G:NP>PAGE S16
P16 
 S DP=(HA-4)*(PAGE-NP)
 S PAGE=NP,LC=LC-DP,LFIN=LFIN-DP,LDEP=LDEP-DP
 D PAGE^%QSATTR6 G L0
S16 
 S DP=(HA-4)*(NP-PAGE)
 G:'($D(^ATT($J,Z,LDEP+DP))) ERR
 S PAGE=NP,LDEP=LDEP+DP,LC=LDEP,LFIN=LFIN+DP,YC=YH+2
 D PAGE^%QSATTR6 G L0
18 D REAFF^%QSATTR6 G L0
22 
 G INDIVLIEN^%QSATTR4
RET3 G @ETIQ
28 
 D MODE^%QSATTR4(.ETIQ) G @ETIQ
43 
 G:'($D(^ATT($J,Z,LFIN+1))) ERR
 S PAGE=PAGE+1,LDEP=LFIN+1,LFIN=(LDEP+HA)-5,LC=LDEP,YC=YH+2
 D PAGE^%QSATTR6 G L0
61 G 43
95 G 45
45 
 G:'($D(^ATT($J,Z,LDEP-1))) ERR
 S PAGE=PAGE-1,LFIN=LDEP-1,LDEP=(LFIN-HA)+5,LC=LFIN,YC=(YH+HA)-3
 D PAGE^%QSATTR6 G L0
26 S B="RQS" D ^%INCUPA2 G:B'="RQS" L0
 D ^%VZEAVT($$^%QZCHW("vous avez acces a tous les attributs maintenant"))
 S JE="SYSTEME" G DEB
 
 I $D(DIA),DIA'="",$D(^[QUI]TLDIAL(DIA)),$D(^[QUI]TLDIALF(DIA)) D CHJEU^%QSATTR5(DIA,.NJEU) G DEB
 G L0
 
VISLEX 
 G:'($D(^ATT($J,Z,LC))) ERR
 D CLEPAG^%VVIDEO
 D AFF^%LXIQ($P(^ATT($J,Z,LC)," (",1)),^%VZEAVT("")
 D CLEPAG^%VVIDEO,@ROUTAFF
 G L0
FIN 
 K ^ATT($J,Z),^VAL($J,Z),^LATT($J,Z)
 S (Z,^ATT($J))=^ATT($J)-1
 K:Z=0 ^ATT($J),^VAL($J),^LATT($J)
 Q:$$^%QCAZG("^TEMPO("""_$J_""","""_$P($ZPOS,"^",2)_""")")=""
 S %ADR=@TEM,%ADR=@TEM@(%ADR,"RETOUR")
 G @%ADR
ERR 
 D ^%VSQUEAK G L0
MVISU 
 D ^%VZEAVT($$^%QZCHW("vous n'avez pas le droit de modifier les attributs")) G L0
 
CASINT 
 I '($$AIR^%QSGEST5(BA,O,ATT)) S ORD=1 Q
OKM79 D POCLEPA^%VVIDEO S Y1=$$^%VZAME1("No d'ordre : ")
 G:CTRLA!(Y1="") CASINT
 I $$OAIR^%QSGE5(BA,O,ATT,Y1) D ^%VZEAVT($$^%QZCHW("numero d'ordre existant ")) G OKM79
 S ORD=Y1 Q
 
 
PAGE(O,BA) 
 D ^%QSATTRI(O,BA,0,0,80,21) Q

