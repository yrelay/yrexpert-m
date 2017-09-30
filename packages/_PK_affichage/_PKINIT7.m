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

;%PKINIT7^INT^1^59547,73874^0
PKINIT7 ;
 
BEG S I=1,OS=$S($D(^%PK("OS")):^("OS"),1:"")
B1 F I=I:1 S A=$T(TEXT+I) G:" ;"[A EXIT I $P(A," ;;")?1A.E S T=$P(A," ;;") W !,?5,$P(A,";;",2),?50,$$^%QZCHW("Initialize? (Y or N) "),"Y" S A="Y" Q:"Nn"'[A
 W !,$$^%QZCHW("Initializing "),T
 S M=0,^%PK(0,T,M)="",H="" F I=I+1:1 S A=$T(TEXT+I) G:A="" B2 S:$P(A," ;;")?1A.E I=I-1 G:$P(A," ;;")?1A.E B2 S C=$P(A,";;",2,99) D B3
B2 S:H'="" ^(M)="S "_$E(H,2,255) Q:A=""  G B1
B3 I $P(C,"\")["*" S D=$P($P(C,"\"),"*",2),C=$P(C,"\",2,99) Q:D'[OS
 F J=1:2:$L(C,"\")-1 S D=$P(C,"\",J),E=$P(C,"\",J+1),X="X="_E,@(X),^%PK(0,T,D)=X W "." S Y=",PK("""_D_""")="_E S:($L(H)+$L(Y))>240 ^(M)="S "_$E(H,2,255),M=M+1,H="" S H=H_Y
EXIT Q
 
TEXT 
MSMPC ;;MSM PC Monitor
 ;;BI\$C(193)\BLC\$C(192)\BRC\$C(217)\C\"80"\CL\$C(27,91,75)\CS\$C(27,91,74)\D\$C(27,91,66)\DL\$C(27,91,80)\F\$C(27,91,50,74,27,91,72)\IL\"$C(27,91,76)"\DT\"$C(27,91,77)"
 ;;H\$C(27,91,72)\HI\$C(27,91,49,109)\HL\$C(196)\IN\$C(27,91,64)\L\$C(27,91,68)\LI\$C(195)\LO\$C(27,91,50,109)\P\"$C(27,91)_%R_"";""_%C_""H"""\
 ;;R\"24"\RI\$C(180)\ROF\$C(27,91,48,109)\RON\$C(27,91,55,109)\RT\$C(27,91,67)\SET\""\TI\$C(194)\TLC\$C(218)\TRC\$C(191)\
 ;;U\$C(27,91,65)\UF\$C(27,91,48,109)\UO\$C(27,91,52,109)\V\$C(49)\VL\$C(179)\X\$C(197)\Z\$C(27,91,48,109)\SR\"$C(27,91)_%R_"";""_%C_""r"""\CSR\"$C(27,91,114)"
 ;;UK\$C(27,17)\DK\$C(27,18)\RK\$C(27,19)\LK\$C(27,20)\INK\$C(1)\DLK\$C(26)

