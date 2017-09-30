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

;%QMDAUT2^INT^1^59547,73877^0
%QMDAUT2 ;;03:16 PM  19 Jun 1992;
 
8 
A 
100 
110 W !,"Date: " R %DS I %DS="" K %DS S %DN=0 Q
120 I %DS["?" D ^%DJ G 100
130 D 300 K %DS I %DN<0 W " ??" G 100
 Q
INT 
300 
310 I %DS="" S %DN=0 Q
 I %DS?.E1L.E S %DI=%DS,%DS="" F %DK=1:1:$L(%DI) S %DS=%DS_$S($E(%DI,%DK)'?1L:$E(%DI,%DK),1:$C($A(%DI,%DK)-32))
320 G 400:(%DS?1N.N1P.P1N.N)!(%DS?1N.N1P.P1N.N1P.P1N.N),500:(%DS?1"T"1P1N.N)!(%DS="T")
330 G 600:(%DS?3A.A1P.P1N.N)!(%DS?3A.A1P.P1N.N1P.P1N.N),700:(%DS?1N.N1P.P3A.A)!(%DS?1N.N1P.P3A.A1P.P1N.N)
340 I (%DS?6N)!(%DS?8N) S %DI=$L(%DS),%DD=$E(%DS,%DI-1,%DI),%DM=$E(%DS,%DI-3,%DI-2)
350 I  S %DY=$E(%DS,1,%DI-4) G 900
380 S %DN=-1
390 K %DD,%DM,%DY,%DJ,%DI,%DK,%DL
 Q
400 
410 F %DI=2:1 Q:($E(%DS,%DI)?1N)=0
420 S %DM=$E(%DS,1,%DI-1)
430 S %DI=%DI+1 I $E(%DS,%DI)?1P G 430
440 F %DK=%DI+1:1 Q:($E(%DS,%DK)?1N)=0
450 S %DD=$E(%DS,%DI,%DK-1)
460 G 660
 Q
500 
520 S %DN=$P($H,",",1) I %DS?1"T+".E S %DN=%DN+$E(%DS,3,99)
530 E  I %DS?1"T-".E S %DN=%DN-$E(%DS,3,99)
540 E  I '(%DS="T") S %DN=-1
550 G 390
 Q
600 
610 F %DI=4:1 Q:($E(%DS,%DI)?1A)=0
620 S %DM=$E(%DS,1,3) D 800
630 S %DI=%DI+1 I $E(%DS,%DI)?1P G 630
640 F %DK=%DI+1:1 Q:($E(%DS,%DK)?1N)=0
650 S %DD=$E(%DS,%DI,%DK-1)
660 F %DI=%DK+1:1 Q:($E(%DS,%DI)?1P)=0
670 S %DY=$E(%DS,%DI,99)
675 I %DY="" S %DI=+($H),%DY=((((((((%DI\1461)*4)+((%DI#1461)\365))-59)*1000)+(((%DI#1461)#365)+1))-((((%DI#1461)\365)=4)*636))\1000)+1900
680 D 900 G 390
 Q
700 
710 F %DI=2:1 Q:($E(%DS,%DI)?1N)=0
720 S %DD=$E(%DS,1,%DI-1)
730 S %DI=%DI+1 I $E(%DS,%DI)?1P G 730
740 F %DK=%DI+3:1 Q:($E(%DS,%DK)?1A)=0
750 S %DM=$E(%DS,%DI,%DK-1) D 800
760 G 660
 Q
800 
810 S %DM=","_%DM_","
820 S %DM=($F(",JAN,FEB,MAR,APR,MAY,JUN,JUL,AUG,SEP,OCT,NOV,DEC,",%DM)-2)\4
 Q
900 
910 S %DD=%DD+0,%DM=%DM+0,%DY=%DY+0
920 I ((((%DM<1)!(%DM>12))!(%DD<1))!(%DD>31))!(%DY<0) S %DN=-1 Q
930 I %DY<100 S %DY=%DY+1900
935 I %DY<1841 S %DN=-1 Q
940 S %DL=0 I (%DY#4)=0,'(%DY=1900) S %DL=1
950 I %DD>30,(((%DM=4)!(%DM=6))!(%DM=9))!(%DM=11) S %DN=-1 Q
960 I %DM=2,((%DL=0)*(%DD>28))!((%DL=1)*(%DD>29)) S %DN=-1 Q
970 I %DL=0 S %DJ=$P("0,31,59,90,120,151,181,212,243,273,304,334",",",%DM)+%DD
971 E  S %DJ=$P("0,31,60,91,121,152,182,213,244,274,305,335",",",%DM)+%DD
980 D 1000
 Q
1000 
1010 S %DN=(%DJ+((%DY-1841)*365))+((%DY-1841)\4)
1020 I %DY>1900 S %DN=%DN-1
 Q

