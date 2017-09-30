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

;%PKINIT6^INT^1^59547,73874^0
PKINIT6 ;
 
BEG s I=1
B1 f I=I:1 s A=$t(TEXT+I) g:A="" EXIT i $p(A," ;;")?1A.E s T=$p(A," ;;") w !,?5,$p(A,";;",2),?50,$$^%QZCHW("Initialize? (Y or N) ") r A#5 s A=$e(A) q:"Nn"'[A
 w !,$$^%QZCHW("Initializing "),T
 s M=0,^%PK(0,T,M)="",H="" f I=I+1:1 s A=$t(TEXT+I) g:A="" B2 s:$p(A," ;;")'="" I=I-1 g:$p(A," ;;")'="" B2 s C=$p(A,";;",2,99) d B3
B2 s:H'="" ^(M)="S "_$e(H,2,255) q:A=""  g B1
B3 i $p(C,"\")["*" s D=$p($p(C,"\"),"*",2),C=$p(C,"\",2,99) q:D'[OS
 f J=1:2:$l(C,"\")-1 s D=$p(C,"\",J),E=$p(C,"\",J+1),X="X="_E,@(X),^%PK(0,T,D)=X w "." s Y=",PK("""_D_""")="_E s:($l(H)+$l(Y))>240 ^(M)="S "_$e(H,2,255),M=M+1,H="" s H=H_Y
EXIT q
 
INIT q:$d(PK("z"))  w !,$$^%QZCHW("Loading function keys.  Please wait.")
 d FUNC
 d MISC
 d PAGE:PK'="WY60AT"
 s PK("z")=1 q
 
MISC s from="- %#&*/qpr:\0123",inc=(64-47)+32
 f i=1:1:$l(from) s inc=inc+1 w *13,$e(from,i)," ",inc,*27,"Z0",$e(from,i),*27,"[",inc,"~",*127 h 1
 q
 
PAGE s from="rw",to=$c(27)_"[6~|"_$c(27)_"[5~" d MAP q
 
FUNC w ! f from=64:1:$s(PK="WY60AT":73,1:79) w *13,"F",from-63,*27,"z",$c(from),*27,"[",from-47,"~",*127 h 1 w *27,"z",$c(from+32),*27,"[",(from-47)+16,"~",*127 h 1
 
 w *13,"   " q
 
MAP f i=1:1:$l(from) w *27,"Z0",$e(from,i),$p(to,"|",i),*127 h 1
 q
 
WYSE60 
 
 
 
TEXT 
WY60AT ;;WYSE 60 with PC-AT keyboard
 ;;C\(80)\R\(24)\SET\""\H\$C(30)\U\$C(11)\D\$C(10)\RT\$C(12)\L\$C(8)\F\$C(30,26)\CL\$C(27,84)\CS\$C(27,89)\IN\$C(27,81)\DL\$C(27,87)\IL\"$C(27,69)"\DT\"$C(27,82)"\RON\$C(27,71,52)\ROF\$C(27,71,48)\HI\$C(27,71,48)\LO\$C(27,71,112)\UO\$C(27,71,56)\
 ;;UF\$C(27,71,48)\P\"$C(27,97)_%R_""R""_%C_""C"""\HL\$C(27,72,58)\VL\$C(27,72,54)\TLC\$C(27,72,50)\TRC\$C(27,72,51)\BLC\$C(27,72,49)\BRC\$C(27,72,53)\TI\$C(27,72,48)\RI\$C(27,72,57)\BI\$C(27,72,61)\LI\$C(27,72,52)\X\$C(27,72,56)\SR\""\CSR\""\
 ;;UK\$C(11)\DK\$C(10)\RK\$C(12)\LK\$C(27,91,53,48,126)\INK\$C(27,91,53,55,126)\DLK\$C(27,91,53,51,126)\Z\$C(27,71,48)
 ;;*DTM\DLK\$C(151)\INK\$C(155)\LK\$C(148)
 ;;BLK\$C(27,91,59,48,53,109)\RBLK\$C(27,91,48,59,53,59,55,109)
 ;;

