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

;%PBMGRA2^INT^1^59547,73873^0
PTGRAPH2 ;
 
 
 
 
 K ^MEMN($J),^NIV($J),^PERE($J) S TY=3119,BASEX=200,BASEY=150,LIMY=TY-400,LIMX=4090,ECARTX=(LIMX-(2*BASEX))\NBNH,ECARTY=(LIMY-(2*BASEY))\(NBNV+1)
 S PREF="PREF^%PBMGRA2",POSF="POSF^%PBMGRA2",FILS="FILS^%PBMGRA2",FRERE="FRERE^%PBMGRA2",%N=TETE,NBNIV=0 D ^TOTBPAR2
 S NBP=(NBNIV\NBNV)+((NBNIV#NBNV)'=0) D ^%PBPZALF,POCLEPA^%VVIDEO W "Le graphe tient sur au moins ",NBP," niveau(x) ... [RETURN]" R *BIDON D POCLEPA^%VVIDEO,^%PBPZGRA
 S %FONC="TAILLE",%9MOD=3E-1 D ^%PBPZ S %FONC="DIMP",%9HOR=1,%9VER=2E-1 D ^%PBPZ
 F P=1:1:NBP D NIVEAU
 K BASEX,BASEY,BIDON,C,CI,CF,DL,ECARTX,ECARTY,%FONC,%9HOR,I1,I2,L,L1,LI,LF,LIMX,LIMY,^MEMN($J),%9MOD,N,%N,NBC,NBNH,NBNV,NBNIV,NBP,^NIV($J),NNP,P,%P,PC,^PERE($J),PP,PREF,POSF,S,SLI,SLF,TY,%9VER Q
PREF 
 D @$S($D(^MEMN($J,%N)):"MODNIV",1:"AJNIV") S:%NIV>NBNIV NBNIV=%NIV S:%AN'="" ^PERE($J,%N,%AN)="" Q
AJNIV S:'($D(^NIV($J,%NIV))) ^NIV($J,%NIV)=0 S ^NIV($J,%NIV)=^NIV($J,%NIV)+1,^NIV($J,%NIV,^NIV($J,%NIV))=%N,^MEMN($J,%N)=%NIV_"^"_^NIV($J,%NIV) Q
MODNIV S I1=$P(^MEMN($J,%N),"^",1) Q:I1'<%NIV  S I2=$P(^MEMN($J,%N),"^",2) F N=I2+1:1:^NIV($J,I1) S ^NIV($J,I1,N-1)=^NIV($J,I1,N),^MEMN($J,^NIV($J,I1,N))=I1_"^"_(N-1)
 K ^NIV($J,I1,^NIV($J,I1)) S ^NIV($J,I1)=^NIV($J,I1)-1 D AJNIV Q
POSF Q
FILS S %R=$N(^ARBRE($J,%P,-1)) Q
FRERE S %R=$N(^ARBRE($J,%AN,%P)) Q
 
NIVEAU D ^%PBPZALF,POCLEPA^%VVIDEO W "Niveau ",P," ... [RETURN]" R *BIDON D POCLEPA^%VVIDEO,^%PBPZGRA S NBC=0,LI=((P-1)*NBNV)+1,LF=(LI+NBNV)-1 F L=LI:1:LF Q:'($D(^NIV($J,L)))  S:^NIV($J,L)>NBC NBC=^NIV($J,L)
 S NBC=(NBC\NBNH)+((NBC#NBNH)'=0) F C=1:1:NBC D IMPAGE
 Q
IMPAGE D ^%PBPZALF,POCLEPA^%VVIDEO W "Mettez une feuille de papier ... [RETURN]" R *BIDON D POCLEPA^%VVIDEO,^%PBPZGRA K NNP
 S %FONC="CLEAR" D ^%PBPZ
 S %FONC="CADRE" D ^%PBPZ S %FONC="CRAYON",%9TC="FEUTRE",%9CL="NOIR" D ^%PBPZ
 D TEXT
 S CI=((C-1)*NBNH)+1,CF=(CI+NBNH)-1 F L=LI:1:LF Q:'($D(^NIV($J,L)))  D IMPL
 D COMPL,TIRE
 Q
TEXT S %FONC="TAILLE",%9MOD=1/3E-1 D ^%PBPZ S %FONC="DIMP" K %9VER,%9HOR D ^%PBPZ
 S %FONC="SEGMENT",%9X1=0,%9X2=LIMX,(%9Y1,%9Y2)=LIMY D ^%PBPZ
 F L=1:1:2 D TEXL
 S %FONC="MOUV",%9X=BASEX,%9Y=TY-300 D ^%PBPZ S %FONC="TEXT",%9STR="Feuille : "_P_"."_C D ^%PBPZ
 S %FONC="TAILLE",%9MOD=3E-1 D ^%PBPZ S %FONC="DIMP",%9HOR=1,%9VER=2E-1 D ^%PBPZ
 Q
TEXL I $D(TEXT(L)) S %FONC="MOUV",%9X=BASEX,%9Y=TY-(100*L) D ^%PBPZ S %FONC="TEXT",%9STR=TEXT(L) D ^%PBPZ Q
IMPL S S="^NIV($J,L,PC)" F PC=CI:1:CF Q:'($D(^NIV($J,L,PC)))  D IMPN
 Q
IMPN S %FONC="MOUV",%9X=((PC-CI)*ECARTX)+BASEX,%9Y=LIMY-((((L-LI)+1)*ECARTY)+BASEY),%9STR=@S,NNP(%9STR)=%9X_"^"_%9Y D ^%PBPZ,NOEUD S %FONC="CRAYON",%9TC="FEUTRE",%9CL="NOIR" D ^%PBPZ S %FONC="MOUVREL",%9X=50,%9Y=0 D ^%PBPZ S %FONC="TEXT" D ^%PBPZ Q
 Q
NOEUD S %FONC="CRAYON",%9TC="FEUTRE",%9CL="VERT" D ^%PBPZ
 I '($D(^ARBRE($J,%9STR))) S %FONC="MOUVREL",%9X=20,%9Y=-20 D ^%PBPZ S %FONC="LBREL",%9LXY="0,40,-40,0,0,-40,40,0" D ^%PBPZ S %FONC="MOUVREL",%9X=-20,%9Y=20 D ^%PBPZ Q
 I ^ARBRE($J,%9STR)="TRIANGLE" S %FONC="MOUVREL",%9X=20,%9Y=-20 D ^%PBPZ S %FONC="LBREL",%9LXY="-20,40,-20,-40,40,0" D ^%PBPZ S %FONC="MOUVREL",%9X=-20,%9Y=20 D ^%PBPZ Q
 S %FONC="CERCLE",%9R=20 D ^%PBPZ S %FONC="MOUVREL",%9X=-20,%9Y=0 D ^%PBPZ
 Q
 
COMPL 
 
 
 K L1,DL S (L1,DL)=0,N=-1 F %N=0:0 S N=$N(NNP(N)) Q:N=-1  D TC
 S SLI=LI,SLF=LF
 S S="L1(PC)",(LI,CI)=1,L=0 F PC=1:1 Q:('($D(L1(PC))))!(PC>NBNH)  D IMPN
 S S="DL(PC)",CI=1,LI=1,L=NBNV+1 F PC=1:1 Q:('($D(DL(PC))))!(PC>NBNH)  D IMPN
 S LI=SLI,LF=SLF Q
TC I $D(^PERE($J,N)) S PP=-1 F %P=0:0 S PP=$N(^PERE($J,N,PP)) Q:PP=-1  S:(('($D(NNP(PP))))&('($D(L1("S",PP)))))&(($P(^MEMN($J,PP),"^",1)<LI)!($P(^MEMN($J,PP),"^",1)>LF)) L1=L1+1,L1("S",PP)=L1,L1(L1)=PP
 I $D(^ARBRE($J,N)) S PP=-1 F %P=0:0 S PP=$N(^ARBRE($J,N,PP)) Q:PP=-1  S:(('($D(NNP(PP))))&('($D(DL("S",PP)))))&(((($P(^MEMN($J,PP),"^",1)<LI)!($P(^MEMN($J,PP),"^",1)>LF))!($P(^MEMN($J,PP),"^",2)<CI))!($P(^MEMN($J,PP),"^",2)>CF)) DL=DL+1,DL("S",PP)=DL,DL(DL)=PP
 Q
TIRE 
 
 S %FONC="CRAYON",%9TC="FEUTRE",%9CL="ROUGE" D ^%PBPZ
 S %FONC="SEGMENT",PP=-1 F %P=0:0 S PP=$N(NNP(PP)) Q:PP=-1  S PF=-1 F %PP=0:0 S PF=$N(^ARBRE($J,PP,PF)) Q:PF=-1  I $D(NNP(PF)) S %9X1=$P(NNP(PP),"^",1),%9Y1=$P(NNP(PP),"^",2),%9X2=$P(NNP(PF),"^",1),%9Y2=$P(NNP(PF),"^",2) D:%9Y1>%9Y2 ^%PBPZ
 Q
 
TEST K ^ARBRE($J),TETE W !,"Tete de l'arbre : " R TETE Q:TETE=""
LN W !,"Arc de : " R D G:D="" CAL W !," vers : " R F S ^ARBRE($J,D,F)="" G LN
CAL S %FONC="INIT",%TERM=^TABIDENT(WHOIS,"TYPTAB"),%PORT=^TABIDENT(WHOIS,"TABTRA") C %PORT O %PORT D ^%PBPZ,PTGRAPH2 C %PORT G TEST

