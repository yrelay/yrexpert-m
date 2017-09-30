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

;TOTQUER^INT^1^59547,74876^0
TOTQUER ;
SU(NE) 
 D SX^%QSGESTI("TOT",NE)
 Q
AJ(NE) 
 G:'($D(^[QUI]TREEWORK(NE))) REFUS
 
 D SU(NE)
ETUDE S CONT=^[QUI]TREEWORK(NE,0),TITRE=$P(CONT,"^",4),ARTICLE=$P(CONT,"^",2),ANTE=$$^%QCAZG("^[QUI]ANTETUDE(ARTICLE,NE,0)") G:ANTE="" REFUS S HEURE=$P(ANTE,"^",4),ETAD=$P(ANTE,"^",3),DATE=$P(ETAD,"/",3)_$P(ETAD,"/",2)_$P(ETAD,"/",1)
 S ATTR=$$^%QZCHW("ETUDE.TOTEM") D PA^%QSGESTI("TOT",NE,ATTR,NE,1)
 F ATTR=$$^%QZCHW("ARTICLE"),"TITRE","DATE",$$^%QZCHW("HEURE") S VAL=@ATTR D PA^%QSGESTI("TOT",NE,ATTR,VAL,1)
 
COMPO S NCP=0,NOMTREE="^[QUI]TREEWORK("""_NE_"""",%TAD="TAD^TOTQUER" D ^%QCAGTW
 G FIN
PA(A,B,C,D,E) 
 W !,A,$$^%QZCHW(" "),?10,B,$$^%QZCHW(" "),?30,C,$$^%QZCHW(" "),?45,D,?75,E Q
REFUS 
 G FIN
FIN K NOMTREE,%TAD Q
TAD 
 
 S NCP=NCP+1,CONT=@%T,TWREF=$P($P(%T,")",1),NE_""",",2),TW=$TR(TWREF,",","/")
 S ARTICLE=$P(CONT,"^",2),IDC=NE_","_ARTICLE_"/"_TW
 D PA^%QSGESTI("TOT",NE,"COMPOSANT.TOTEM",ARTICLE_"/"_TW,NCP),PA^%QSGESTI("TOTC",IDC,"ETUDE.TOTEM",NE,1),PA^%QSGESTI("TOTC",IDC,"NUFA",NE,1),PA^%QSGESTI("TOTC",IDC,"TWREF",TWREF,1)
 
 S PAR="%" F U=0:0 S PAR=$O(^[QUI]TVPAR(NE,TWREF,PAR)) Q:PAR=""  I PAR'["%VAL" S X=^[QUI]TVPAR(NE,TWREF,PAR),PAR1=$S(PAR="%MACHINE":"MACHINE",1:PAR) D PA^%QSGESTI("TOTC",IDC,PAR1,X,1)
 
 G:'($D(^[QUI]TVPAR(NE,TWREF,"MATIERE"))) OP S IDMAT=IDC_","_^[QUI]TVPAR(NE,TWREF,"MATIERE") D PA^%QSGESTI("TOTMAT",IDMAT,"COMPOSANT.TOTEM",IDC,1)
 S PAR="%" F U=0:0 S PAR=$O(^[QUI]PARMAT(NE,TWREF,PAR)) Q:PAR=""  I PAR'["%VAL" S X=^[QUI]PARMAT(NE,TWREF,PAR) D PA^%QSGESTI("TOTMAT",IDMAT,PAR,X,1)
OP 
 G:'($D(^[QUI]PHAS(NE,TWREF))) FTAD S NOP=-1,NOOP=0
LOP S NOP=$N(^[QUI]PHAS(NE,TWREF,NOP)) G:NOP=-1 FOP S FLNOP=^[QUI]PHAS(NE,TWREF,NOP),IDOP=IDC_","_FLNOP,NOOP=NOOP+1
 D PA^%QSGESTI("TOTC",IDC,"OPERATION.TOTEM",FLNOP,NOOP)
 D PA^%QSGESTI("TOTOP",IDOP,"COMPOSANT.TOTEM",IDC,1)
 
 G:'($D(^[QUI]SECT(NE,TWREF,FLNOP))) OP1 S MAC=$$^%QCAZG("^[QUI]SECT(NE,TWREF,FLNOP)") G:MAC="" OP1 S IDMAC=IDOP_","_MAC
 D PA^%QSGESTI("TOTOP",IDOP,"MACHINE",MAC,1) G:'($D(^[QUI]PARMAC(NE,TWREF,FLNOP))) OP1
 
 S PAR="%" F U=0:0 S PAR=$O(^[QUI]PARMAC(NE,TWREF,FLNOP,PAR)) Q:PAR=""  I PAR'["%VAL" S X=^[QUI]PARMAC(NE,TWREF,FLNOP,PAR) D PA^%QSGESTI("TOTMAC",IDMAC,PAR,X,1)
 D PA^%QSGESTI("TOTMAC",IDMAC,"OPERATION.TOTEM",IDOP,1)
OP1 
 I $D(^[QUI]DUREE(NE,TWREF,FLNOP)) S X=^[QUI]DUREE(NE,TWREF,FLNOP) D PA^%QSGESTI("TOTOP",IDOP,"DUREE",X,1)
 I $D(^[QUI]COUT(NE,TWREF,FLNOP)) S X=^[QUI]COUT(NE,TWREF,FLNOP) D PA^%QSGESTI("TOTOP",IDOP,"COUT",X,1)
 I $D(^[QUI]CARATPC(NE,TWREF,FLNOP)) S P="%" F U=0:0 S P=$O(^[QUI]CARATPC(NE,TWREF,FLNOP,P)) Q:P=""  S X=^[QUI]CARATPC(NE,TWREF,FLNOP,P) D PA^%QSGESTI("TOTOP",IDOP,P,X,1)
 I $D(^[QUI]CONS(NE,TWREF,FLNOP)) S CNS=^[QUI]CONS(NE,TWREF,FLNOP) F I=1:1 S CI=$P(CNS,"|",I) Q:CI=""  D PA^%QSGESTI("TOTOP",IDOP,"CONSIGNE",CI,I)
 G LOP
FOP Q
FTAD Q

