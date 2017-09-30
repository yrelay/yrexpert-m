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

;%SYSGLO1^INT^1^59547,73892^0
GLOSTAT ;
 
 
 
 n act,counts,i,j
 s $zt="quit" b 1 d static
choice w !,"Continue (c), zero statistics (z), timed stats (# sec > 0), quit?  " r act
 i "Qq"'[act g action
quit w ! q
action i "Cc"[act d static g choice
 i "Zz"[act d zero g choice
 i act?1N.N,act>0 d timing g choice
 w " ???" g choice
static w ! d get s j=0 d show
 q
zero w ! f i=2:1:7 v i*4:-2:4:0
 q
timing w !,!,"Counts per second for ",act," seconds...",! d get h act
 s counts(1)=($v(8,-2,2)-counts(1))/act,counts(2)=($v(10,-2,2)-counts(2))/act
 f i=4:1:7 s counts(i)=($v(i*4,-2,4)-counts(i))/act
 f i=3 s counts(i)=((($v(i*4,-2,2)*65536)+$v((i*4)+2,-2,2))-counts(i))/act
 s j=2 d show
 q
get s counts(1)=$v(8,-2,2),counts(2)=$v(10,-2,2)
 f i=3:1:7 s counts(i)=$v(i*4,-2,4)
 f i=3 s counts(i)=($v(i*4,-2,2)*65536)+$v((i*4)+2,-2,2)
 q
show n b,bl,k,l s b=$j("",15),bl=$l(b)
 s %D=$j(counts(3),1,j) d comma s l=$f(%DG,"."),l=$s(l:l-2,1:$l(%DG))
 s l(3)=$e(b,1,bl-l)_%DG
 s %D=$j(counts(7),1,j) d comma s l=$f(%DG,"."),l=$s(l:l-2,1:$l(%DG))
 s l(7)=$e(b,1,bl-l)_%DG
 s %D=$j(counts(1),1,j) d comma s l=$f(%DG,"."),l=$s(l:l-2,1:$l(%DG))
 s l(1)=$e(b,1,bl-l)_%DG
 s %D=$j(counts(2),1,j) d comma s l=$f(%DG,"."),l=$s(l:l-2,1:$l(%DG))
 s l(2)=$e(b,1,bl-l)_%DG
 s %D=$j(counts(4),1,j) d comma s l=$f(%DG,"."),l=$s(l:l-2,1:$l(%DG))
 s l(4)=$e(b,1,bl-l)_%DG
 s %D=$j(counts(5),1,j) d comma s l=$f(%DG,"."),l=$s(l:l-2,1:$l(%DG))
 s l(5)=$e(b,1,bl-l)_%DG
 s %D=$j(counts(6),1,j) d comma s l=$f(%DG,"."),l=$s(l:l-2,1:$l(%DG))
 s l(6)=$e(b,1,bl-l)_%DG
 g:'(counts(5)+counts(6)) show2
 s %D=$j((counts(1)+counts(3))/(counts(5)+counts(6)),1,2) d comma s l=$f(%DG,"."),l=$s(l:l-2,1:$l(%DG))
 s l(0)=$e(b,1,bl-l)_%DG
show2 i '(counts(2)) g write
 s %D=$j(counts(1)/counts(2),1,2) d comma s l=$f(%DG,"."),l=$s(l:l-2,1:$l(%DG))
 s l(20)=$e(b,1,bl-l)_%DG
write w "Global (not routine) references",?33,l(3),!
 w "Global sets and kills",?33,l(7),!
 w "Routine loads and saves",?33,l(1),!
 w "Routine buffer transfers ",?33,l(2),!
 w "Logical block requests",?33,l(4),!
 w "Physical block reads",?33,l(5),!
 w "Physical block writes",?33,l(6),!
 i counts(5)+counts(6) w "Global & Routine Accesses /",!,?5,"Physical Disk Accesses",?33,l(0),!
 i counts(2) w "Routine loads / buffer transfer",?33,l(20),!
 q
 
comma n %i,%l
 s %l=$l($p(%D,".",1)),%i=%l#3 s:'(%i) %i=3
 s %DG=$e(%D,1,%i) f %i=%i+1:3:%l s %DG=%DG_","_$e(%D,%i,%i+2)
 s %i=$f(%D,".") i %i s %DG=%DG_$e(%D,%i-1,999)
 q

