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

;%PBMGRA^INT^1^59547,73873^0
PTGRAPH ;
 
 
 
 D PROF
 S BASEX=300,BASEY=-150,ECARTX=500,LIMY=3120,LIMX=4096,NBN=10,ECARTY=(LIMY-(2*BASEY))\(NBN+1),NBPAGE=(PROF\NBN)+(1-((PROF#NBN)=0)),PREF="PREF^%PBMGRA",POSF="POSF^%PBMGRA"
 D POCLEPA^%VVIDEO W "Le graphe tient sur ",NBPAGE," page",$S(NBPAGE=1:"",1:"s"),"  [RETURN]" R *BIDON
 S %FONC="TAILLE",%9MOD=3E-1 D ^%PBPZ
 S %FONC="DIMP",%9HOR=1,%9VER=3E-1 D ^%PBPZ
 F %IP=1:1:NBPAGE D IMPAGE
 K %IP,BI,BIDON,BS,DEFPAG,DEPGRA,ECARTX,ECARTY,^ARBRE($J),L,%L,LIMX,LIMY,LOC,MEMN,N1,%N1,N2,%N2,NBN,NBPAGE,P,%P,POSF,PREF,PROF,TETE Q
IMPAGE D POCLEPA^%VVIDEO W "Mettez une feuille de papier ... [RETURN]" R *BIDON
 D POCLEPA^%VVIDEO W "Impression en cours ... Un instant ..."
 K DEFPAG,DEPGRA,LOC,MEMN,POS S %N=TETE,BI=((%IP-1)*(NBN-1))+1,BS=(BI+NBN)-1 F %L=1:1:NBN S POS(%L)=0
 D ^TOTBPAR2,AFF
 D POCLEPA^%VVIDEO W "Feuille imprimee ... [RETURN]" R *BIDON Q
PREF 
 D:(%NIV'<BI)&(%NIV'>BS) AJN Q
POSF Q
AJN S:'($D(MEMN(%N))) POS((%NIV-BI)+1)=POS((%NIV-BI)+1)+1,(MEMN(%N),DEFPAG((%NIV-BI)+1,POS((%NIV-BI)+1)))=%N,LOC(%N)=(((POS((%NIV-BI)+1)-1)*ECARTX)+BASEX)_"^"_((LIMY-((%NIV-BI)*ECARTY))+BASEY)
 S:%AN'="" DEPGRA(%AN,%N)="" Q
AFF S %FONC="CRAYON",%9TC="FEUTRE",%9CL="NOIR" D ^%PBPZ
 S L=-1 F %L=0:0 S L=$N(DEFPAG(L)) Q:L=-1  D IMPL
 S %FONC="CRAYON",%9TC="FEUTRE",%9CL="ROUGE" D ^%PBPZ
 S N1=-1 F %N1=0:0 S N1=$N(DEPGRA(N1)) Q:N1=-1  S N2=-1 F %N2=0:0 S N2=$N(DEPGRA(N1,N2)) Q:N2=-1  D TRAIT
 Q
TRAIT I $D(LOC(N1)) S %FONC="CRAYON",%9X1=$P(LOC(N1),"^",1),%9Y1=$P(LOC(N1),"^",2),%9X2=$P(LOC(N2),"^",1),%9Y2=$P(LOC(N2),"^",2),%9CL=$S(%9Y1>%9Y2:"ROUGE",1:"VERT"),%9TC="FEUTRE" D ^%PBPZ S %FONC="SEGMENT" D ^%PBPZ
 Q
IMPL S P=-1 F %P=0:0 S P=$N(DEFPAG(L,P)) Q:P=-1  D IMPN
 Q
IMPN S %FONC="MOUV",%9X=$P(LOC(DEFPAG(L,P)),"^",1)-20,%9Y=$P(LOC(DEFPAG(L,P)),"^",2) D ^%PBPZ
 I $D(^ARBRE($J,DEFPAG(L,P))) S %FONC="ARCREL",%9X=20,%9Y=0,%9R=20,%9AD=0,%9AF=3599E-1 D ^%PBPZ S %FONC="MOUVREL",%9X=50,%9Y=0 D ^%PBPZ
 I '($D(^ARBRE($J,DEFPAG(L,P)))) S %FONC="CARREL",%9X=0,%9Y=-20,%9L=40 D ^%PBPZ S %FONC="MOUVREL",%9X=50,%9Y=20 D ^%PBPZ
 S %FONC="TEXT",%9STR=DEFPAG(L,P) D ^%PBPZ Q
PROF 
 S %N=TETE,FILS="FILS^%PBMGRA",FRERE="FRERE^%PBMGRA",PREF="PREFP^%PBMGRA",POSF="POSFP^%PBMGRA",PROF=0 D ^TOTBPAR2
 Q
FILS S %R=$N(^ARBRE($J,%P,-1)) Q
FRERE S %R=$N(^ARBRE($J,%AN,%P)) Q
PREFP 
 S:%NIV>PROF PROF=%NIV Q
POSFP 
 Q
TEST K ^ARBRE($J),TETE
 W !,"Tete de l'arbre : " R TETE Q:TETE=""
LN W !,"Arc de : " R D G:D="" CAL W !," vers : " R F S ^ARBRE($J,D,F)="" G LN
CAL S %FONC="INIT",%TERM=^TABIDENT(WHOIS,"TYPTAB"),%PORT=^TABIDENT(WHOIS,"TABTRA") C %PORT O %PORT D ^%PBPZ,PTGRAPH C %PORT G TEST

