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

;TKINIT6^INT^1^59547,74869^0
TKINIT6 ;
 
BEG s I=1
B1 f I=I:1 s A=$t(TEXT+I) g:A="" EXIT i $p(A," ;")?1A.E s T=$p(A," ;") w !,?5,$p(A,";",2),?50,$$^%QZCHW("Initialize? (Y or N) ") r A#5 s A=$e(A) q:"Nn"'[A
 w !,$$^%QZCHW("Initializing "),T
 s M=0,^TK(0,T,M)="",H="" f I=I+1:1 s A=$t(TEXT+I) g:A="" B2 s:$p(A," ;")'="" I=I-1 g:$p(A," ;")'="" B2 s C=$p(A,";",2,99) d B3
B2 s:H'="" ^(M)="S "_$e(H,2,255) q:A=""  g B1
B3 i $p(C,"\")["*" s D=$p($p(C,"\"),"*",2),C=$p(C,"\",2,99) q:D'[OS
 f J=1:2:$l(C,"\")-1 s D=$p(C,"\",J),E=$p(C,"\",J+1),X="X="_E,@(X),^TK(0,T,D)=X w "." s Y=",TK("""_D_""")="_E s:($l(H)+$l(Y))>240 ^(M)="S "_$e(H,2,255),M=M+1,H="" s H=H_Y
EXIT q
 
INIT q:$d(TK("z"))  w !,$$^%QZCHW("Loading function keys.  Please wait.")
 d FUNC
 d MISC
 d PAGE:TK'="WY60AT"
 s TK("z")=1 q
 
MISC s from="- %#&*/qpr:\0123",inc=(64-47)+32
 f i=1:1:$l(from) s inc=inc+1 w *13,$e(from,i)," ",inc,*27,"Z0",$e(from,i),*27,"[",inc,"~",*127 h 1
 q
 
PAGE s from="rw",to=$c(27)_"[6~|"_$c(27)_"[5~" d MAP q
 
FUNC w ! f from=64:1:$s(TK="WY60AT":73,1:79) w *13,"F",from-63,*27,"z",$c(from),*27,"[",from-47,"~",*127 h 1 w *27,"z",$c(from+32),*27,"[",(from-47)+16,"~",*127 h 1
 
 w *13,"   " q
 
MAP f i=1:1:$l(from) w *27,"Z0",$e(from,i),$p(to,"|",i),*127 h 1
 q
 
WYSE60 
 
 
 
TEXT 
WY60AT 
 ;
 ;
 ;
 ;
 ;

