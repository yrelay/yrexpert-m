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

;%AV1D^INT^1^59547,73867^0
%AV1D ;;06:24 PM  29 Oct 1993;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
ANALYSE(chaine,MOTEUR,CONDITION,STOPOLO,msg) 
 n HEAP,HEAPINV,tottxt
 
 
 s HEAP=$$TEMP^%SGUTIL
 s HEAPINV=$$TEMP^%SGUTIL
 s tottxt=0,@HEAP@(tottxt)=""
 
 s STOPOLC=$$CONCAS^%QZCHAD(STOPOLO,"POLC")
 s STOPOLA=$$CONCAS^%QZCHAD(STOPOLO,"POLA")
 n GEXPR s GEXPR=$$TEMP^%SGUTIL
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
parfer s nbp=nbp-1 i nbp<0 s ERROR=1 g erreur
 s nex=pere(nex) g cont
parouv s nbp=nbp+1,totx=totx+1,pere(totx)=nex,fils(nex,totx)=""
 s exp(nex)=exp(nex)_seppas1_totx_seppas1,nex=totx,exp(nex)=""
 g cont
quote s txt=""
quote2 s PCOUR=PCOUR+1,car=$e(ch,PCOUR)
 i car="" s ERROR=3 g erreur
 i car'="""" s txt=txt_car g quote2
 i $e(ch,PCOUR+1)="""" s txt=txt_"""",PCOUR=PCOUR+1 g quote2
 i txt'="",'($d(@HEAPINV@(txt))) s tottxt=tottxt+1,@HEAP@(tottxt)=txt,@HEAPINV@(txt)=tottxt
 s exp(nex)=exp(nex)_sepch_$s(txt="":0,1:@HEAPINV@(txt))_sepch
 g cont
epilo i nbp'=0 s ERROR=1 g erreur
 
 
 s ch1=exp(1)
 s psi=$$F(ch1,"SI"),palors=$$F(ch1,"ALORS")
 i psi=0 g:palors=0 simple s ERROR=4 g erreur
 i CONDITION s ERROR=4 g erreur
 i psi>palors s ERROR=4 g erreur
 i $$F($e(ch1,psi,$l(ch1)),"SI") s ERROR=4 g erreur
 i $$F($e(ch1,palors,$l(ch1)),"ALORS") s ERROR=4 g erreur
 
 s ifi="" f %f=0:0 s ifi=$o(fils(1,ifi)) q:ifi=""  s pos=$f(ch1,seppas1_ifi_seppas1),nat=$s(pos>palors:"A",1:"C"),exp(nat,ifi)="",pere(ifi)=nat k fils(1,ifi) s fils(nat,ifi)=""
 s exp("C")=$e(ch1,psi,(palors-$l("ALORS"))-1)
 s exp("A")=$e(ch1,palors,$l(ch1))
 s pot=0 d remake("C")
 f k=1:1 q:'($d(@GEXPR@(k)))  d ^%AV2C(@GEXPR@(k),1,MOTEUR,HEAP,.msg,.ERROR,.expres,$$CONCAS^%QZCHAD(STOPOLC,k)) s %exprpol(k)=expres
 k @(GEXPR)
 s pot=0 d remake("A")
 f k=1:1 q:'($d(@GEXPR@(k)))  d ^%AV2C(@GEXPR@(k),0,MOTEUR,HEAP,.msg,.ERROR,.expres,$$CONCAS^%QZCHAD(STOPOLA,k)) s %exprpol(k)=expres
 g fin
 
simple g:CONDITION simplec
 
 s pot=0 d remake(1)
 s @STOPOLC=0
 f k=1:1 q:'($d(@GEXPR@(k)))  d ^%AV2C(@GEXPR@(k),0,MOTEUR,HEAP,.msg,.ERROR,.expres,$$CONCAS^%QZCHAD(STOPOLA,k)) s %exprpol(k)=expres
 g fin
 
 
simplec 
 s pot=0 d remake(1)
 s @STOPOLA=0
 f k=1:1 q:'($d(@GEXPR@(k)))  d ^%AV2C(@GEXPR@(k),1,MOTEUR,HEAP,.msg,.ERROR,.expres,$$CONCAS^%QZCHAD(STOPOLA,k)) s %exprpol(k)=expres
 g fin
 
 
fin 
 
 
 
 
 
PHASE2 
 
 
 
 
FIN 
 
 
 
 
 
 k @(HEAP),@(HEAPINV)
 q ERROR
 
erreur 
 i ERROR=1 s msg=" erreur : expression mal parenthesee " g FIN
 i ERROR=3 s msg=" erreur : probleme avec le decompte des guillemets " g FIN
 i ERROR=4 s msg=" erreur dans l'ecriture du SI ALORS " g FIN
 s msg="erreur" g FIN
 
ERROR(j) 
 i j=1 w !," erreur : expression mal parenthesee : ",!,chaine,!,$e(chaine,1,i) s ERROR=1 q
 i j=2 w !," erreur : expression mal parenthesee : ",!,chaine,!,$e(chaine,1,i) s ERROR=2 q
 q
 
SHOW 
 q
 w !,$e(chaine,1,i)
 q
 
 
remake(oldnum) 
 n ifi
 s ifi="" f %i=0:0 s ifi=$zp(fils(oldnum,ifi)) q:ifi=""  d remake(ifi)
 g:$f(exp(oldnum),";") para
 s pot=pot+1,@GEXPR@(pot)=exp(oldnum)
 q:'($d(pere(oldnum)))
 s pere=pere(oldnum)
 s exp(pere)=$$ZSUBST^%QZCHSUB(exp(pere),seppas1_oldnum_seppas1,sep2_pot_sep2)
 q
para 
 s nbpart=$l(exp(oldnum),";"),resu=""
 f xx=1:1:nbpart s pot=pot+1,@GEXPR@(pot)=$p(exp(oldnum),";",(nbpart-xx)+1),resu=pot_sep2_resu
 s resu=$e(resu,1,$l(resu)-1)
 s multi=multi+1,multi(multi)=resu
 q:'($d(pere(oldnum)))
 s pere=pere(oldnum)
 s exp(pere)=$$ZSUBST^%QZCHSUB(exp(pere),seppas1_oldnum_seppas1,sepmul_multi_sepmul)
 q
 
 
F(CH,EX) n POS,CH1,POS,C,B
 s CH1=CH
F2 s POS=$f(CH1,EX) q:POS=0 0 s C=$e(CH1,POS),B=$e(CH1,(POS-$l(EX))-1) q:(((C="")!(C=" "))!$$SEPAR^%AVXR(C))&(((B="")!(B=" "))!$$SEPAR^%AVXR(B)) POS s CH1=$e(CH1,POS,$l(CH1)) g F2
 
 
TEST u 0 w !,!," chaine : " r chaine q:chaine=""  w !,!,chaine
 w "cette chaine est-elle une condition(1) ou une action(0) " r ccc
 k ^TEST s STOPOLO="^TEST"
 s res=$$ANALYSE(chaine,"TRT",ccc,"^TEST",.msg)
 g TEST
 
TESTTRT 
 s TRT=""
LOOPTRT s TRT=$o(^[QUI]TTL(TRT)) q:TRT=""  w *7,!,?15,"===",TRT,"==="
 d UNTRT(TRT)
 g LOOPTRT
UNTRT(TRT) 
REG s REG=""
NXRG s REG=$o(^[QUI]TTL(TRT,2,REG)) q:REG=""
 s chaine=^[QUI]TTL(TRT,2,REG)
 u 0 w !,!," chaine : ",!,!,chaine
 s res=$$ANALYSE(chaine,"TRT",0,"^[QUI]RQSDON(""ANTRT"","""_TRT_""","_REG_")",.msg)
 
 s ^[QUI]RQSDON("ANTRT",TRT,REG)=res
 g NXRG

