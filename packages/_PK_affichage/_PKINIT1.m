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

;%PKINIT1^INT^1^59547,73874^0
PKINIT1 ;
BEG S I=1,OS=$S($D(^%PK("OS")):^("OS"),1:"")
B1 F I=I:1 S A=$T(TEXT+I) G:A="" EXIT I $P(A," ;;")?1A.E S T=$P(A," ;;") W !,?5,$P(A,";;",2),?50,$$^%QZCHW("Initialize? (Y or N) ") R A#5 S A=$E(A) Q:"Nn"'[A
 W !,$$^%QZCHW("Initializing "),T
 S M=0,^%PK(0,T,M)="",H="" F I=I+1:1 S A=$T(TEXT+I) G:A="" B2 S:$P(A," ;;")?1A.E I=I-1 G:$P(A," ;;")?1A.E B2 S C=$P(A,";;",2,99) D B3
B2 S:H'="" ^(M)="S "_$E(H,2,255) Q:A=""  G B1
B3 I $P(C,"\")["*" S D=$P($P(C,"\"),"*",2),C=$P(C,"\",2,99) Q:OS'=D
 F J=1:2:$L(C,"\")-1 S D=$P(C,"\",J),E=$P(C,"\",J+1),X="X="_E,@(X),^%PK(0,T,D)=X W "." S Y=",PK("""_D_""")="_E S:($L(H)+$L(Y))>240 ^(M)="S "_$E(H,2,255),M=M+1,H="" S H=H_Y
EXIT Q
 
TEXT 
VT100 ;;DEC VT100 without advanced video
 ;;BI\$C(14,118,15)\BLC\$C(14,109,15)\BRC\$C(14,106,15)\C\$C(56,48)\CL\$C(27,91,75)\CS\$C(27,91,74)\D\$C(27,91,66)\DL\""\F\$C(27,91,50,74,27,91,72)\H\$C(27,91,72)\
 ;;HI\""\HL\$C(14,113,15)\IN\""\L\$C(27,91,68)\LI\$C(14,116,15)\LO\""\P\"$C(27,91)_%R_"";""_%C_""H"""\
 ;;R\$C(50,52)\RI\$C(14,117,15)\ROF\$C(27,91,48,109)\RON\$C(27,91,55,109)\RT\$C(27,91,67)\SET\$C(27,41,48,27,61)\TI\$C(14,119,15)\TLC\$C(14,108,15)\TRC\$C(14,107,15)\U\$C(27,91,65)\
 ;;UF\$C(27,91,48,109)\UO\$C(27,91,52,109)\V\$C(49)\VL\$C(14,120,15)\X\$C(14,110,15)\Z\$C(27,91,48,109)\IL\"$C(27,91)_%R_$C(59,114,27,91)_%R_"";1H""_$C(27,77,27,91,50,59)_(PK(""R"")-2)_$C(114,27,91)_%R_"";1H""_$C(13)"
 ;;DT\"$C(27,91)_%R_$C(59,114,27,91)_PK(""R"")_$C(59,49,72,13,10,27,91,50,59)_(PK(""R"")-2)_$C(114,27,91)_%R_"";1H"""\SR\"$C(27,91)_%R_"";""_%C_""r"""\CSR\"$C(27,91,114)"
 ;;UK\$C(27,91,65)\DK\$C(27,91,66)\RK\$C(27,91,67)\LK\$C(27,91,68)\INK\$C(26)\DLK\$C(4)
 ;;*DSM\UK\$C(27,17)\DK\$C(27,18)\RK\$C(27,19)\LK\$C(27,20)
 ;;*DTM\UK\$C(128)\DK\$C(129)\RK\$C(130)\LK\$C(131)
 ;;BLK\$C(27,91,59,48,53,109)\RBLK\$C(27,91,48,59,53,59,55,109)
VT220 ;;DEC VT220 or compatible
 ;;BI\$C(14,118,15)\BLC\$C(14,109,15)\BRC\$C(14,106,15)\C\$C(56,48)\CL\$C(27,91,75)\CS\$C(27,91,74)\D\$C(27,91,66)\DL\$C(27,91,80)\F\$C(27,91,50,74,27,91,72)\IL\"$C(27,91,76)"\DT\"$C(27,91,77)"
 ;;H\$C(27,91,72)\HI\$C(27,91,49,109)\HL\$C(14,113,15)\IN\$C(27,91,64)\L\$C(27,91,68)\LI\$C(14,116,15)\LO\$C(27,91,50,50,109)\P\"$C(27,91)_%R_"";""_%C_""H"""\
 ;;R\$C(50,52)\RI\$C(14,117,15)\ROF\$C(27,91,50,55,109)\RON\$C(27,91,48,55,109)\RT\$C(27,91,67)\SET\$C(27,41,48)\TI\$C(14,119,15)\TLC\$C(14,108,15)\TRC\$C(14,107,15)\
 ;;U\$C(27,91,65)\UF\$C(27,91,50,52,109)\UO\$C(27,91,48,52,109)\V\$C(49)\VL\$C(14,120,15)\X\$C(14,110,15)\Z\$C(27,91,59,48,109)\SR\"$C(27,91)_%R_"";""_%C_""r"""\CSR\"$C(27,91,114)"
 ;;UK\$C(27,91,65)\DK\$C(27,91,66)\RK\$C(27,91,67)\LK\$C(27,91,68)\INK\$C(27,91,50,126)\DLK\$C(27,91,51,126)
 ;;*DSM\UK\$C(27,17)\DK\$C(27,18)\RK\$C(27,19)\LK\$C(27,20)\INK\$C(27,22)\DLK\$C(27,23)
 ;;*DTM\UK\$C(128)\DK\$C(129)\RK\$C(130)\LK\$C(131)\INK\$C(138)\DLK\$C(139)
 ;;BLK\$C(27,91,59,48,53,109)\RBLK\$C(27,91,48,59,53,59,55,109)
AMPEX ;;AMPEX D-81, D-175 or 230
 ;;BI\$C(27,71,72)\BLC\$C(27,71,67)\BRC\$C(27,71,68)\C\$C(56,48)\CL\$C(27,84)\CS\$C(27,89)\D\$C(10)\DL\$C(27,87)\F\$C(27,59)\H\$C(30)\HI\$C(27,40)\HL\$C(27,71,73)\IL\"$C(27,69)"\DT\"$C(27,82)"\
 ;;IN\$C(27,81)\L\$C(8)\LI\$C(27,71,71)\LO\$C(27,41)\P\"$C(27,61,%R+31,%C+31)"\R\$C(50,52)\RI\$C(27,71,70)\ROF\$C(27,107)\
 ;;RON\$C(27,106)\RT\$C(12)\SET\$C(27,65)\TI\$C(27,71,69)\TLC\$C(27,71,65)\TRC\$C(27,71,66)\U\$C(11)\UF\$C(27,109)\UO\$C(27,108)\V\$C(49)\VL\$C(27,71,74)\X\$C(27,71,75)\
 ;;Z\$C(27,107,27,109,27,40)\SR\""\CSR\""
 ;;UK\$C(11)\DK\$C(10)\RK\$C(12)\LK\$C(8)\INK\$C(27,81)\DLK\$C(27,87)

