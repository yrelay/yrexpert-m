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

;%AV1^INT^1^59547,73866^0
%AV1 ;
 
 S X=$$ANALYSE(chaine,"TRT",1,"^TEST",.msg)
 Q
 
 
 
 
 
 
 
 
 
ANALYSE(chaine,MOTEUR,CONDITION,STOPOLO,msg) 
 
 S msg=""
 S ERROR=0,polon="" K PV,PF
 S %expr(1)=chaine,tchaine=chaine,lchaine=$L(chaine)
 
 
 
 
 
 
 
 
 
PHASE1 
 
 S NPAROUV=0,NPARFERM=0,PARMAX=0
 F i=1:1:lchaine S CAR=$E(chaine,i) D SHOW D:CAR="(" OUV D:CAR=")" FERM Q:ERROR  I ((i=lchaine)&(NPARFERM=0))&(PARMAX>0) D ERROR(1) Q
 I ERROR Q
 I (NPARFERM'=1)&(PARMAX>0) D ERROR(2) Q
 G PHASE2
 
OUV S NPAROUV=NPAROUV+1,PV(NPAROUV,i)="" I PARMAX<NPAROUV S PARMAX=NPAROUV
 Q
FERM S NPARFERM=NPAROUV,NPAROUV=NPAROUV-1,PF(NPARFERM,i)=""
 I NPARFERM'>0 D ERROR(2)
 Q
 
 
PHASE2 
 
 
 S k=0,tchaine1=tchaine
LOPHASE2 
 S k=k+1
 I PARMAX=0 S %expr(k)=tchaine1 W !,"<",k,"> ",%expr(k) D ^%AV2(%expr(k),CONDITION,MOTEUR,.msg,.ERROR,.expres,$$CONCAS^%QZCHAD(STOPOLO,k)) S %exprpol(k)=expres G FIN
 
 
 
 
 
 S lchaine=$L(tchaine1)
 S G=$ZP(PV(PARMAX,"")),D=$ZP(PF(PARMAX,""))
 
 
 S %expr(k)=$E(tchaine1,G+1,D-1),tchaine1=$E(tchaine1,1,G-1)_"|"_k_"|"_$E(tchaine1,D+1,lchaine)
 K PV(PARMAX,G),PF(PARMAX,D) I '($D(PV(PARMAX))) S PARMAX=PARMAX-1
 D POPCHAIN
 
 
 
 
 
 D ^%AV2(%expr(k),CONDITION,MOTEUR,.msg,.ERROR,.expres,$$CONCAS^%QZCHAD(STOPOLO,k)) S %exprpol(k)=expres I ERROR Q
 G LOPHASE2
 
VISU 
 Q
FIN 
 W !,?3,chaine," ",$S(ERROR:"erronnee",1:"OK")
 W !,?3," analysee en ",k," expressions : "
 F i=1:1:k W !,?3,i,?10,%expr(i),!,?10,%exprpol(i)
 Q ERROR
 
ERROR(j) 
 I j=1 W !," erreur : expression mal parenthesee : ",!,chaine,!,$E(chaine,1,i) S ERROR=1 Q
 I j=2 W !," erreur : expression mal parenthesee : ",!,chaine,!,$E(chaine,1,i) S ERROR=2 Q
 Q
POPCHAIN 
 
 
 S newl=2+$L(k),oldl=(D-G)+1,delta=newl-oldl
 S im="" F z=1:1 S im=$O(PV(im)) Q:im=""  S pos="" F z1=1:1 S pos=$O(PV(im,pos)) Q:pos=""  S PPV(im,$S(pos>G:pos+delta,1:pos))=PV(im,pos)
 K PV D COPY^%QCAGLC("PPV","PV") K PPV
 S im="" F z=1:1 S im=$O(PF(im)) Q:im=""  S pos="" F z1=1:1 S pos=$O(PF(im,pos)) Q:pos=""  S PPF(im,$S(pos>G:pos+delta,1:pos))=PF(im,pos)
 K PF D COPY^%QCAGLC("PPF","PF") K PPF
 
 Q
SHOW 
 Q
 W !,$E(chaine,1,i)
 Q
TEST 
 S chaine="%A^C=B et (%B=(%B+$ACQ(MISE.EN.PROD;)B;c))"
 S chaine="%A$subex|0|^$indeval%courant"
 D ^%AV1
 Q
TEST1 
 U 0 W !,!," chaine : " R chaine Q:chaine=""  W !,!,chaine
 K ^TEST S STOPOLO="^TEST"
 S res=$$ANALYSE^%AV1(chaine,"TRT",1,"^TEST",.msg)
 G TEST1
 
TEST3 
 S TRT=""
LOOPTRT S TRT=$O(^[QUI]TTL(TRT)) Q:TRT=""  W *7,!,?15,"===",TRT,"==="
REG S REG=""
NXRG S REG=$O(^[QUI]TTL(TRT,2,REG)) G:REG="" LOOPTRT
 S chaine=^[QUI]TTL(TRT,2,REG)
 U 0 W !,!," chaine : ",!,!,chaine
 D ^%AV1 H 2 G NXRG
 Q
 ;

