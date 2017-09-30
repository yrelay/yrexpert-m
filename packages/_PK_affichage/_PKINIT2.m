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
;! HL002 ! HL     ! 01/02/07 ! Q:A="" -> Q:A=" "                              !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%PKINIT2^INT^1^59547,73874^0
PKINIT2 ;PS;06:33 PM  29 Dec 1995
BEG S I=1
 ;HL002 B1 F I=I:1 S A=$T(TEXT+I) G:A="" EXIT I $P(A," ;;")?1A.E S T=$P(A," ;;") W !,?5,$P(A,";;",2),?50,$$^%QZCHW("Initialize? (Y or N) ") R A#5 S A=$E(A) Q:"Nn"'[A
B1 F I=I:1 S A=$T(TEXT+I) G:A=" " EXIT I $P(A," ;;")?1A.E S T=$P(A," ;;") W !,?5,$P(A,";;",2),?50,$$^%QZCHW("Initialize? (Y or N) ") R A#5 S A=$E(A) Q:"Nn"'[A
 W !,$$^%QZCHW("Initializing "),T
 S M=0,^%PK(0,T,M)="",H="" F I=I+1:1 S A=$T(TEXT+I) G:A="" B2 S:$P(A," ;;")?1A.E I=I-1 G:$P(A," ;;")?1A.E B2 S C=$P(A,";;",2,99) D B3
B2 S:H'="" ^(M)="S "_$E(H,2,255) Q:A=""  G B1
B3 I $P(C,"\")["*" S D=$P($P(C,"\"),"*",2),C=$P(C,"\",2,99) Q:D'[OS
 F J=1:2:$L(C,"\")-1 S D=$P(C,"\",J),E=$P(C,"\",J+1),X="X="_E,@(X),^%PK(0,T,D)=X W "." S Y=",PK("""_D_""")="_E S:($L(H)+$L(Y))>240 ^(M)="S "_$E(H,2,255),M=M+1,H="" S H=H_Y
EXIT Q
 
TEXT 
FREEDOM ;;LIBERTY ELECTRONICS Freedom "200"
 ;;BI\$C(27,7,79)\BLC\$C(27,7,69)\BRC\$C(27,7,72)\C\$C(56,48)\CL\$C(27,84)\CS\$C(27,89)\CSR\""\D\$C(22)\DL\$C(27,87)\DLK\$C(27,87)\DT\"$C(27,82)"\F\$C(26)\H\$C(30)\
 ;;HI\$C(27,71,48)\HL\$C(27,7,75)\IL\$C(27,69)\IN\$C(27,81)\INK\$C(27,81)\L\$C(8)\LI\$C(27,7,77)\LO\$C(27,71,64)\P\$C(36,67,40,50,55,44,54,49,44,37,82,43,51,49,44,37,67,43,51,49,41)\
 ;;R\$C(50,52)\RI\$C(27,7,76)\ROF\$C(27,71,48)\RON\$C(27,71,52)\RT\$C(12)\SET\""\SR\""\TI\$C(27,7,73)\TLC\$C(27,7,70)\TRC\$C(27,7,71)\U\$C(11)\UF\$C(27,71,48)\
 ;;UO\$C(27,71,56)\V\$C(49)\VL\$C(27,7,74)\X\$C(27,7,73)\Z\$C(27,71,48,27,71,48,27,71,48)\
QVT102 ;;QVT102 AND QVT102A
 ;;BI\$C(27,36,111,27,37)\BLC\$C(27,36,101,27,37)\BRC\$C(27,36,104,27,37)\C\$C(56,48)\CL\$C(27,84)\CS\$C(27,89)\D\$C(10)\DL\$C(27,87)\F\$C(27,59)\H\$C(30)\HI\$C(27,40)\HL\$C(27,36,107,27,37)\IL\"$C(27,69)"\DT\"$C(27,82)"\
 ;;IN\$C(27,81)\L\$C(8)\LI\$C(27,36,109,27,37)\LO\$C(27,41)\P\"$C(27,61,%R+31,%C+31)"\R\$C(50,52)\RI\$C(27,36,108,27,37)\ROF\$C(27,71,48)\
 ;;RON\$C(27,71,52)\RT\$C(12)\SET\$C(0)\TI\$C(27,36,110,27,37)\TLC\$C(27,36,102,27,37)\TRC\$C(27,36,103,27,37)\U\$C(11)\UF\$C(27,71,48)\UO\$C(27,71,56)\V\$C(49)\VL\$C(27,36,106,27,37)\X\$C(27,36,105,27,37)\
 ;;Z\$C(27,71,48,27,40)\SR\""\CSR\""
 ;;UK\$C(11)\DK\$C(10)\RK\$C(12)\LK\$C(8)\INK\$C(27,81)\DLK\$C(27,87)
ADM3 ;;ADM3, ADM3A or emulations
 ;;BI\$C(27,71,72)\BLC\$C(27,71,67)\BRC\$C(27,71,68)\C\$C(56,48)\CL\$C(27,84)\CS\$C(27,89)\D\$C(10)\DL\$C(27,87)\F\$C(27,59)\H\$C(30)\HI\$C(27,40)\HL\$C(27,71,73)\IL\"$C(27,69)"\DT\"$C(27,82)"\
 ;;IN\$C(27,81)\L\$C(8)\LI\$C(27,71,71)\LO\$C(27,41)\P\"$C(27,61,%R+31,%C+31)"\R\$C(50,52)\RI\$C(27,71,70)\ROF\$C(27,107)\
 ;;RON\$C(27,106)\RT\$C(12)\SET\$C(27,65)\TI\$C(27,71,69)\TLC\$C(27,71,65)\TRC\$C(27,71,66)\U\$C(11)\UF\$C(27,109)\UO\$C(27,108)\V\$C(49)\VL\$C(27,71,74)\X\$C(27,71,75)\
 ;;Z\$C(27,107,27,109,27,40)\SR\""\CSR\""
 ;;UK\$C(11)\DK\$C(10)\RK\$C(12)\LK\$C(8)\INK\$C(27,81)\DLK\$C(27,87)

