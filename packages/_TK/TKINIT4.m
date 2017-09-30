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

;TKINIT4^INT^1^59547,74869^0
TKINIT4 ;
 
BEG s I=1
B1 f I=I:1 s A=$t(TEXT+I) g:" ;"[A EXIT i $p(A," ;")?1A.E s T=$p(A," ;") w !,?5,$p(A,";",2),?50,$$^%QZCHW("Initialize? (Y or N) "),"Y" s A="Y" q:"Nn"'[A
 w !,$$^%QZCHW("Initializing "),T
 s M=0,^TK(0,T,M)="",H="" f I=I+1:1 s A=$t(TEXT+I) g:A="" B2 s:$p(A," ;")?1A.E I=I-1 g:$p(A," ;")?1A.E B2 s C=$p(A,";",2,99) d B3
B2 s:H'="" ^(M)="S "_$e(H,2,255) q:A=""  g B1
B3 i $p(C,"\")["*" s D=$p($p(C,"\"),"*",2),C=$p(C,"\",2,99) q:D'[OS
 f J=1:2:$l(C,"\")-1 s D=$p(C,"\",J),E=$p(C,"\",J+1),X="X="_E,@(X),^TK(0,T,D)=X w "." s Y=",TK("""_D_""")="_E s:($l(H)+$l(Y))>240 ^(M)="S "_$e(H,2,255),M=M+1,H="" s H=H_Y
EXIT q
 
TEXT 
DTMPC 
 
 
 
 
 
 
 
INIT s TK("in1")=$$getall^%mixinterp
 d @("I"_TK)
 s i=$$load^%mdevxlate(TK("ix"),ix,0)
 f i=0:1:9,11,12,14:1:26,28:1:31,128:1:178 d set^%mixinterp(i,19)
 d set^%mixinterp(127,3)
 s TK("in")=$$getall^%mixinterp
 q
 
IDTMPC s ix="" f i=59:1:93 s ix=ix_$c(2)_$c(0,i)_$c(1)_$c((128+i)-59)
 s ix=ix_$c(2,0,15)_$c(1,163)
 s ix=ix_$c(2,0,119)_$c(1,164)
 s TK("ix")=15 q
 
IVT100 
IVT220 s ix="",j=128
 f i=65:1:69 s ix=ix_$c(3)_$c(27,91,i)_$c(1)_$c(j),j=j+1
 f i="P","Q","R","S" s ix=ix_$c(3)_$c(27)_"O"_i_$c(1,j),j=j+1
 i TK="VT220" f i=49:1:54 s ix=ix_$c(4)_$c(27,91,i,126)_$c(1,j),j=j+1
 i  f i=55,56,57 s ix=ix_$c(5)_$c(27,91,49,i,126)_$c(1)_$c(j),j=j+1
 i  f i=48,49,51:1:57,59,60 s ix=ix_$c(5)_$c(27,91,50,i,126)_$c(1)_$c(j),j=j+1
 i  f i=49:1:52 s ix=ix_$c(5)_$c(27,91,51,i,126)_$c(1)_$c(j),j=j+1
 i TK="VT100" f i=77,108:1:110,112:1:121 s ix=ix_$c(3)_$c(27,79,i)_$c(1)_$c(j),j=j+1
 s TK("ix")=14
 q
 
IWY60AT d INIT^TKINIT6 s ix="",j=128
 w ! f from=64:1:$s(TK="WY60AT":73,1:79) s a=$c(27,91)_(from-47)_"~",b=$c(27,91)_((from-47)+16)_"~",ix=ix_$c($l(a))_a_$c(1,j)_$c($l(b))_b_$c(1,j+1),j=j+2
 s from="- %#&*/qpr:\0123",inc=(64-47)+32
 f i=1:1:$l(from) s inc=inc+1,a=$c(27,91)_inc_"~",ix=ix_$c($l(a))_a_$c(1,j),j=j+1
 s TK("ix")=14
 q

