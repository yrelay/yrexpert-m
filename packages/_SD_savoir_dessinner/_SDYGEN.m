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
;! HL001 ! HL     ! 01/01/01 ! Erreur %GTM-E-INVCMD -> $ZT="G ..."            !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%SDYGEN^INT^1^59547,73890^0
SDYGEN ;
 
 
 
 
 
 
 
 Q:'($D(WHOIS))
 Q:DTM
 N DIR,PART,HOST,PREF
DEB 
 D CLEPAG^%VVIDEO,^%VZCDB($$MAJ^%VMINUSC($$^%QZCHW("symboles"))_" : "_$$^%QZCHW("transfert des globals en routines"),0)
 S DX=0,DY=4 X XY W $$^%QZCHW("Donner le nom de la partition source")_" : " R PART
 Q:PART=""
 W !
 S HOST=$$PCONF^%INCASTO("TYPHOST") Q:HOST=""
 S DIR=$$PCONF^%INCASTO("PROG")
 I DIR="" D ^%VZEAVT("Probleme d'installation : partition systeme introuvable") Q
 
 I '($$EXIST^%QCSCDIR(PART)) D ^%VZEAVT($$^%QZCHW("partition inconnue")) G DEB
 
 S PREF="^%SDTX",PREF=$P(PREF,"^",2)
 S %N=0,X0="F %U=1:1 Q:'$D(^ROUTINE(PREF_%U))  ZR  ZS @(PREF_%U)" X X0
 S NP=0
 S NBG=1,NBS=0 K ^GLO
 F %ZZ=0:1 D BOUCLE Q:TAB=""
 S PART="^["""_PART_"""]"
 F %Z=1:1:NBG-1 S GL=^GLO($J,%Z),CL=$P(GL,"(",2),CL=$P(CL,")",1),Pr=$E(CL,1) S:Pr'="""" VIDE=0 S:Pr="""" VIDE=$S($L(CL)=2:1,1:0) S:VIDE EXISTE=0,EG=1 S:'(VIDE) EXISTE=$S(($D(@GL)=11)!($D(@GL)=1):1,1:0) S NP=NP+1,T=PART_$P(GL,"^",2) D TESTF,TR
 S X0="ZL @(PREF_1) ZR +1 ZI PREF_""1 ;;""_NP_"";""_%N ZS @(PREF_1)" X X0 D ZD^%QMDATE4 S DAT=$P(%DAT,"/",3)_$P(%DAT,"/",2)_$P(%DAT,"/",1) F %U=1:1:NP S ^PROGMOD(DAT,PREF_%U)=1
7 S %U=0 W !
LOPECR 
 Q
TR S NBL=0,X0="ZR  ZI PREF_NP_"" ;;"" X X1"
 S X4="S CL2=$P(T,""("",2),CL2=$P(CL2,"")"",1),pas=0 S PCL2=$E(CL2,1),CL2=$S(PCL2="""""""":""""""""_$P($P(CL2,"""""""",2),"""""""",1)_"""""""",1:$P(CL2,"","",1)) S EG=$S(CL2=CL:1,1:0) X:'EG X5"
 S X5="ZS @(PREF_NP)"
 S X1="F %U=1:1 S:F T=$ZO(@T) X:'VIDE X4 Q:'EG  S F=1,%=(T=""""!(T[""^ROUTINE(""_PREF)) X:% X3 Q:%  "
 S X1=X1_"W ""*"" S %N=%N+1,VN=@(PART_$P(T,""^"",2)) S LI="" ;;""_""^[QUI]""_$P(T,""^"",2)_""=""_VN ZI LI S T=PART_$P(T,""^"",2) S NBL=NBL+1 I NBL>80 S NBL=0 ZS @(PREF_NP) S NP=NP+1 ZR  ZI PREF_NP_"" ;;""",X3="ZS @(PREF_NP)"
 X X0 Q
TESTF S F=0
 S:VIDE!(('(VIDE))&('(EXISTE))) F=1
 Q
 
 
INSTAL 
 Q:'($D(WHOIS))
 N QUI,HOST,PREF,AUTO
 D CURRENT^%IS,VARSYS^%QCSAP
 S AUTO=0
QUES D CLEPAG^%VVIDEO,^%VZCDB($$MAJ^%VMINUSC($$^%QZCHW("symboles"))_" : "_$$^%QZCHW("transfert des routines en globals"),0)
 S DX=0,DY=4 X XY W $$^%QZCHW("Donner le nom de la partition de donnees cible")_" : " R QUI
 Q:QUI=""
ACT W !
 S HOST=$$PCONF^%INCASTO("TYPHOST") Q:HOST=""
 S DIR=$$PCONF^%INCASTO("PROG")
 I DIR="" D ^%VZEAVT("Probleme d'installation : partition systeme introuvable") Q
 
 I '($$EXIST^%QCSCDIR(QUI)) D ^%VZEAVT(QUI_" : "_$$^%QZCHW("partition inconnue")),^%VZEAVT("SDX : installation des symboles abortee") Q:AUTO  G QUES
 F I="^[QUI]SDSYMBO","^[QUI]SDSYMBT","^[QUI]SDSYMBC" D ^%QCAGLK(I)
 S NB=0,PREF="^%SDTX",PREF=$P(PREF,"^",2)
 S Y0="ZL @(PREF_1) S LIM=+$P($P($T(+1),"";;"",2),"";"",1),%N=+$P($P($T(+1),"";;"",2),"";"",2)"
 S $ZT="G LOP"
 X Y0
 S X0="ZL @(PREF_I) F J=2:1 S LI=$T(+J) Q:LI=""""  S LI=$P(LI,"";;"",2,500),RF=$P(LI,"")="",1)_"")"",VL=$P(LI,"")="",2,500),@RF=VL,NB=NB+1 W ""*""",I=0 X Y0
LOP S I=I+1 Q:I>LIM  X X0 G LOP
 
 Q
BOUCLE S TAB=$P($T(TAB+%ZZ),";;",2),NBS=0 Q:TAB=""
 S POS0=$F(TAB,"*"),PAR=$F(TAB,"(")
 I POS0=0 S:PAR=0 ^GLO($J,NBG)="^"_TAB_"("_""""""_")",NBG=NBG+1 Q:PAR=0  S RES=$E(TAB,PAR,50),TAB=$E(TAB,1,PAR-1),QUOT=$S($A(RES)<65:"",1:""""),^GLO($J,NBG)="^"_TAB_QUOT_RES_QUOT_")",NBG=NBG+1
 Q:POS0=0
 S POS1=$F(TAB,"*",POS0) D ^%GLO
 I (PAR=0)!(POS0<PAR) D PREFIXE Q:PAR=0
 D CLE Q
PREFIXE 
 S PREF=$E(TAB,1,POS0-2),P=$E(PREF,1),AP=$A(P),L=$L(PREF),VAR=0
 F %W=1:1 S SUIV=$O(^UTILITY("GLO",VAR)),PREFS=$E(SUIV,1,L),PS=$E(PREFS,1),APS=$A(PS) D:PREFS=PREF GLPREF S VAR=SUIV Q:APS>AP
 Q
GLPREF I PAR=0 S ^GLO($J,NBG)="^"_SUIV_"("_""""""_")",NBG=NBG+1 Q
 S NBS=NBS+1,^GLS($J,NBS)="^"_SUIV Q
CLE I (POS1=0)&(POS0<PAR) D CLEFIXE Q
 D CLEVAR Q
CLEFIXE 
 S CLEF=$E(TAB,PAR,50)
 F I=1:1:NBS S GBLS=^GLS($J,I),VAR="" D GBCLEF
 K ^GLS
 Q
GBCLEF F II=1:1 S SUIV=$O(@GBLS@(VAR)) S:SUIV=CLEF QUOT=$S($A(SUIV)<65:"",1:""""),^GLO($J,NBG)=GBLS_"("_QUOT_SUIV_QUOT_")",NBG=NBG+1 Q:SUIV=CLEF  S VAR=SUIV Q:VAR=""
 Q
CLEVAR S BORNE=$S(POS1=0:POS0-2,1:POS1-2),CLEV=$E(TAB,PAR,BORNE),LC=$L(CLEV)
 I POS1=0 S TAB=$E(TAB,1,PAR-2),GBLS="^"_TAB,VAR="" D GBCLEV Q
 W !," NBS=",NBS
 F I=1:1:NBS S GBLS=^GLS($J,I),VAR="" D GBCLEV
 K ^GLS
 Q
GBCLEV F II=1:1 S SUIV=$O(@GBLS@(VAR)),PCS=$E(SUIV,1,LC) S:PCS=CLEV QUOT=$S($A(SUIV)<65:"",1:""""),^GLO($J,NBG)=GBLS_"("_QUOT_SUIV_QUOT_")",NBG=NBG+1 S VAR=SUIV Q:VAR=""
 Q
 
 
AUTO N HOST,PREF,AUTO
 D CURRENT^%IS,VARSYS^%QCSAP
 S AUTO=1
 G ACT
 
TAB ;;SDSYMBO
 ;;SDSYMBT
 ;;SDSYMBC

