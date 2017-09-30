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

;%AV1C^INT^1^59547,73867^0
%AV1C ;;11:23 AM  18 Oct 1993;
 
 
 
 
 
 
 
 
 
ANALYSE(chaine,MOTEUR,CONDITION,STOPOLO,msg) 
 n HEAP,HEAPINV,tottxt
 
 
 s HEAP=$$TEMP^%SGUTIL
 s HEAPINV=$$TEMP^%SGUTIL
 s tottxt=0,@HEAP@(tottxt)=""
 
 s msg=""
 s ERROR=0,polon="" k PV,PF
 s %expr(1)=chaine,tchaine=chaine,lchaine=$l(chaine)
 
 
 k %expr,exp,pere,fils,multi
 
 s nex=1,exp(nex)="",totx=1,nbp=0,ch=chaine,seppas1=$c(175),sep2="|",sepch=$c(178),sepmul=$c(179)
 s PCOUR=0,multi=0
cont s PCOUR=PCOUR+1
 s car=$e(ch,PCOUR) g:car="" epilo
 i "()"""'[car s exp(nex)=exp(nex)_car g cont
 g:car="(" parouv g:car=")" parfer g:car="""" quote
parfer s nbp=nbp-1 g:nbp<0 erreur
 s nex=pere(nex) g cont
parouv s nbp=nbp+1
 s totx=totx+1,pere(totx)=nex,fils(nex,totx)=""
 s exp(nex)=exp(nex)_seppas1_totx_seppas1,nex=totx,exp(nex)=""
 g cont
ptvir s nex=pere(nex)
 s totx=totx+1,pere(totx)=nex,fils(nex,totx)=""
 s exp(nex)=exp(nex)_seppas1_totx_seppas1,nex=totx,exp(nex)=""
 g cont
quote s txt=""
quote2 f %i=1:1 s PCOUR=PCOUR+1,car=$e(ch,PCOUR) g:car="" erreur q:car=""""  s txt=txt_car
 i $e(ch,PCOUR+1)="""" s txt=txt_"""",PCOUR=PCOUR+1 g quote2
 i txt'="",'($d(@HEAPINV@(txt))) s tottxt=tottxt+1,@HEAP@(tottxt)=txt,@HEAPINV@(txt)=tottxt
 s exp(nex)=exp(nex)_sepch_$s(txt="":0,1:@HEAPINV@(txt))_sepch
 g cont
epilo g:nbp'=0 erreur
 s pot=0
aga g:'($d(exp)) fin
 s iexp="" f %i=0:0 s iexp=$zp(exp(iexp)) q:'($d(fils(iexp)))
 g:$f(exp(iexp),";") param
 s pot=pot+1,%expr(pot)=exp(iexp)
 i '($d(pere(iexp))) k exp(iexp) g aga
 s pere=pere(iexp)
 s exp(pere)=$$ZSUBST^%QZCHSUB(exp(pere),seppas1_iexp_seppas1,sep2_pot_sep2)
 k fils(pere,iexp),exp(iexp)
 g aga
param s nbpart=$l(exp(iexp),";"),resu=""
 f xx=1:1:nbpart s pot=pot+1,%expr(pot)=$p(exp(iexp),";",(nbpart-xx)+1),resu=pot_sep2_resu
 s resu=$e(resu,1,$l(resu)-1)
 
 
 s multi=multi+1,multi(multi)=resu
 i '($d(pere(iexp))) k exp(iexp) g aga
 s pere=pere(iexp)
 s exp(pere)=$$ZSUBST^%QZCHSUB(exp(pere),seppas1_iexp_seppas1,sepmul_multi_sepmul)
 k fils(pere,iexp),exp(iexp)
 g aga
fin 
 
 
 
 
PHASE2 
 
 
 s k=0,tchaine1=tchaine
LOPHASE2 
 s k=k+1
 g:'($d(%expr(k))) FIN
 d ^%AV2C(%expr(k),CONDITION,MOTEUR,HEAP,.msg,.ERROR,.expres,$$CONCAS^%QZCHAD(STOPOLO,k)) s %exprpol(k)=expres
 g LOPHASE2
 
FIN 
 w !,?3,chaine," ",$s(ERROR:"erronnee",1:"OK")
 
 
 
 
 k @(HEAP),@(HEAPINV)
 q ERROR
 
ERROR(j) 
 i j=1 w !," erreur : expression mal parenthesee : ",!,chaine,!,$e(chaine,1,i) s ERROR=1 q
 i j=2 w !," erreur : expression mal parenthesee : ",!,chaine,!,$e(chaine,1,i) s ERROR=2 q
 q
 
SHOW 
 q
 w !,$e(chaine,1,i)
 q
TEST 
 u 0 w !,!," chaine : " r chaine q:chaine=""  w !,!,chaine
 w "cette chaine est-elle une condition(1) ou une action(0) " r ccc
 k ^TEST s STOPOLO="^TEST"
 s res=$$ANALYSE(chaine,"TRT",ccc,"^TEST",.msg)
 g TEST
 
TESTTRT 
 s TRT=""
LOOPTRT s TRT=$o(^[QUI]TTL(TRT)) q:TRT=""  w *7,!,?15,"===",TRT,"==="
REG s REG=""
NXRG s REG=$o(^[QUI]TTL(TRT,2,REG)) g:REG="" LOOPTRT
 s chaine=^[QUI]TTL(TRT,2,REG)
 u 0 w !,!," chaine : ",!,!,chaine
 s res=$$ANALYSE(chaine,"TRT",0,"^TEST("""_TRT_""","_REG_")",.msg)
 s ^TEST(TRT,REG)=res
 g NXRG
 ;

