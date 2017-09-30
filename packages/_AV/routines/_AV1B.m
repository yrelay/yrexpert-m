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

;%AV1B^INT^1^59547,73867^0
%AV1B ;;12:10 PM  1 Oct 1993;
 
 s X=$$ANALYSE(chaine,"TRT",1,"^TEST",.msg)
 q
 
 
 
 
 
 
 
 
 
ANALYSE(chaine,MOTEUR,CONDITION,STOPOLO,msg) 
 
 s msg=""
 s ERROR=0,polon="" k PV,PF
 s %expr(1)=chaine,tchaine=chaine,lchaine=$l(chaine)
 
 k %expr,exp,pere,fils
 s nex=1,exp(nex)="",totx=1,nbp=0,ch=chaine,sep="*",sep2="|"
cont s x1=$f(ch,"("),x2=$f(ch,")") g:(x1=0)&(x2=0) epilo
 g:x1=0 parfer g:x2=0 parouv
 g:x1<x2 parouv
 
 
 
 
 
 
parfer s nbp=nbp-1 g:nbp<0 erreur
 s prem=$e(ch,1,x2-2),ch=$e(ch,x2,$l(ch)),exp(nex)=exp(nex)_prem
 s nex=pere(nex) g cont
parouv s nbp=nbp+1
 s prem=$e(ch,1,x1-2),ch=$e(ch,x1,$l(ch)),exp(nex)=exp(nex)_prem
 s totx=totx+1
 s pere(totx)=nex,fils(nex,totx)=""
 s exp(nex)=exp(nex)_sep_totx_sep
 s nex=totx,exp(nex)=""
 g cont
epilo g:nbp'=0 erreur
 s exp(nex)=exp(nex)_ch
 s pot=0
aga g:'($d(exp)) fin
 s iexp="" f %i=0:0 s iexp=$zp(exp(iexp)) q:'($d(fils(iexp)))
 s pot=pot+1,%expr(pot)=exp(iexp)
 i '($d(pere(iexp))) k exp(iexp) g aga
 s pere=pere(iexp)
 s exp(pere)=$$ZSUBST^%QZCHSUB(exp(pere),sep_iexp_sep,sep2_pot_sep2)
 k fils(pere,iexp),exp(iexp)
 g aga
fin f i=1:1 q:'($d(%expr(i)))  w !,i,"  ",%expr(i)
 q 1
 
 
 
 
 
 
 
 
PHASE1 
 
 s NPAROUV=0,NPARFERM=0,PARMAX=0
 f i=1:1:lchaine s CAR=$e(chaine,i) d SHOW d:CAR="(" OUV d:CAR=")" FERM q:ERROR  i ((i=lchaine)&(NPARFERM=0))&(PARMAX>0) d ERROR(1) q
 i ERROR q
 i (NPARFERM'=1)&(PARMAX>0) d ERROR(2) q
 g PHASE2
 
OUV s NPAROUV=NPAROUV+1,PV(NPAROUV,i)="" i PARMAX<NPAROUV s PARMAX=NPAROUV
 q
FERM s NPARFERM=NPAROUV,NPAROUV=NPAROUV-1,PF(NPARFERM,i)=""
 i NPARFERM'>0 d ERROR(2)
 q
 
 
PHASE2 
 
 
 s k=0,tchaine1=tchaine
LOPHASE2 
 s k=k+1
 i PARMAX=0 s %expr(k)=tchaine1 w !,"<",k,"> ",%expr(k) d ^%AV2(%expr(k),CONDITION,MOTEUR,.msg,.ERROR,.expres,$$CONCAS^%QZCHAD(STOPOLO,k)) s %exprpol(k)=expres g FIN
 
 
 
 
 
 s lchaine=$l(tchaine1)
 s G=$zp(PV(PARMAX,"")),D=$zp(PF(PARMAX,""))
 
 
 s %expr(k)=$e(tchaine1,G+1,D-1),tchaine1=$e(tchaine1,1,G-1)_"|"_k_"|"_$e(tchaine1,D+1,lchaine)
 k PV(PARMAX,G),PF(PARMAX,D) i '($d(PV(PARMAX))) s PARMAX=PARMAX-1
 d POPCHAIN
 
 
 
 
 
 d ^%AV2(%expr(k),CONDITION,MOTEUR,.msg,.ERROR,.expres,$$CONCAS^%QZCHAD(STOPOLO,k)) s %exprpol(k)=expres i ERROR q
 g LOPHASE2
 
VISU 
 q
FIN 
 w !,?3,chaine," ",$s(ERROR:"erronnee",1:"OK")
 w !,?3," analysee en ",k," expressions : "
 f i=1:1:k w !,?3,i,?10,%expr(i),!,?10,%exprpol(i)
 q ERROR
 
ERROR(j) 
 i j=1 w !," erreur : expression mal parenthesee : ",!,chaine,!,$e(chaine,1,i) s ERROR=1 q
 i j=2 w !," erreur : expression mal parenthesee : ",!,chaine,!,$e(chaine,1,i) s ERROR=2 q
 q
POPCHAIN 
 
 
 s newl=2+$l(k),oldl=(D-G)+1,delta=newl-oldl
 s im="" f z=1:1 s im=$o(PV(im)) q:im=""  s pos="" f z1=1:1 s pos=$o(PV(im,pos)) q:pos=""  s PPV(im,$s(pos>G:pos+delta,1:pos))=PV(im,pos)
 k PV d COPY^%QCAGLC("PPV","PV") k PPV
 s im="" f z=1:1 s im=$o(PF(im)) q:im=""  s pos="" f z1=1:1 s pos=$o(PF(im,pos)) q:pos=""  s PPF(im,$s(pos>G:pos+delta,1:pos))=PF(im,pos)
 k PF d COPY^%QCAGLC("PPF","PF") k PPF
 
 q
SHOW 
 q
 w !,$e(chaine,1,i)
 q
TEST 
 s chaine="%A^C=B et (%B=(%B+$ACQ(MISE.EN.PROD;)B;c))"
 s chaine="%A$subex|0|^$indeval%courant"
 d ^%AV1
 q
TEST1 
 u 0 w !,!," chaine : " r chaine q:chaine=""  w !,!,chaine
 k ^TEST s STOPOLO="^TEST"
 s res=$$ANALYSE^%AV1(chaine,"TRT",1,"^TEST",.msg)
 g TEST1
 
TEST3 
 s TRT=""
LOOPTRT s TRT=$o(^[QUI]TTL(TRT)) q:TRT=""  w *7,!,?15,"===",TRT,"==="
REG s REG=""
NXRG s REG=$o(^[QUI]TTL(TRT,2,REG)) g:REG="" LOOPTRT
 s chaine=^[QUI]TTL(TRT,2,REG)
 u 0 w !,!," chaine : ",!,!,chaine
 d ^%AV1 h 2 g NXRG
 q
 ;

