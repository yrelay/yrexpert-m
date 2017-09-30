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

;TKDEV6^INT^1^59547,74869^0
TKDEV6 ;
 
 
FREEDOM S ^TK(1E-1,TK,1)="F I=1:1:21 W *27,""|"",*$P(""49,50,51,52,53,54,55,56,57,58,60,61,62,63,64,4,5,8,9,10,11"","","",I),1,*27,""["",$E(""ABCDEFGHIJKLMNOPPQRST"",I),*25"
 S ^(2)="27,91,65`27,91,75`27,91,66`27,91,81`27,91,82`27,69`27,82`27,91,80`27,91,72`27,91,69`27,91,73`27,91,67`27,91,68`27,91,78"
 S ^(3)="```````````````27,91,76`27,91,70`27,91,71`27,91,74`27,91,84`27,91,77`30`27,81`27,87`5"
 S ^TK(1E-1,TK,5)="F1`Shift F1`F2`SCROLL UP`SCROLL DN`INS LINE`DEL LINE`CLEAR EOL`F8`F50`F9`F3`F4`Shift F4"
 S ^(6)="```````````````Shift F2`F6`F7`F10`WORD >l W`Shift F3`HOME`INS CHAR`DEL CHAR`Control E" Q
AMPEX S ^TK(1E-1,TK,1)="S %R=23,%C=1 W @TKP,*27,""A"",*27,""p"" X ""F I=0:1:9 W *27,""""eA"""",I,*27,""""S"""",*27,""""["""",*65+I,*27,""""x"""",*27,""""eB"""",I,*27,""""S"""",*27,""""["""",*75+I,*27,""""x"""""" W *27,""q"""
 S ^(2)="27,91,76`27,91,77`27,91,78`27,91,80`27,91,79`27,69`27,82`27,59`27,91,75`27,91,67`27,91,66`27,91,68`27,91,70`27,91,71`27,91,72"
 S ^(3)="```````````````27,91,73`27,91,74`27,91,65`27,91,69`23`31`30`27,81`27,87`5"
 S ^(5)="PROG B + 1`PROG B + 2`PROG B + 3`PROG B + 5`PROG B + 4`LINE INS`LINE DEL`CLEAR`PROG B + 0`PROG A + 2`PROG A + 1`PROG A + 3`PROG A + 5`PROG A + 6`PROG A + 7"
 S ^(6)="```````````````PROG A + 8`PROG A + 9`PROG A + 0`PROG A + 4`Control W`New Line`HOME`CHAR INS`CHAR DEL`Control E" Q
 
WY60AT S ^TK(1E-1,TK,1)="G:'$D(TK(""z"")) INIT^TKINIT6"
 S A=^TK("OS"),^TK(1E-1,TK,7)="W *27,""`;""\W *27,""`:""\$C(27,113)\$C(27,114)"
 I A="DTM" S ^(2)="157`158`154`136`137`132`133`140`152`128`129`134`138`139`159",^(3)="```````````````130`144`145`146`23`142`153`155`151`5`1`142`143" G W2
 S ^(2)="27,91,53,57,126`27,91,54,48,126`27,91,53,54,126`27,91,50,49,126`27,91,51,55,126`27,91,49,57,126"
 S ^(2)=(^(2))_"`27,91,51,53,126`27,91,50,51,126`27,91,53,52,126`27,91,49,55,126`27,91,51,51,126`27,91,50,48,126`27,91,50,50,126`27,91,51,56,126`27,91,54,49,126"
 S ^(3)="```````````````27,91,49,56,126`27,91,50,53,126`27,91,52,49,126`27,91,50,54,126`23`27,91,50,52,126`27,91,53,53,126`27,91,53,55,126`27,91,53,51,126`5`1`27,91,50,52,126`27,91,52,48,126"
W2 S ^TK(1E-1,TK,5)="PG DN`PG UP`SHIFT HOME`F5`SHIFT F5`F3`SHIFT F3`F7`SHIFT TAB`F1`SHIFT F1`F4`F6`SHIFT F6`END",^(6)="```````````````F2`F9`SHIFT F9`F10`CTRL W`F8`HOME`INS`DEL`CTRL E`CTRL A`F8`SHIFT F8" Q
 
MSMPC S ^TK(1E-1,TK,1)="",^(2)="14`16`6```27,34`27,36`27,38`20`27,32`25`27,35`27,37`18`4"
 S ^(3)="```````````````27,33`27,40`12`27,41`23`27,39`21`1`26`5`11`27,37`27,39"
 S ^TK(1E-1,TK,5)="CTRL N`CTRL P`CTRL F```F3`F5`F7`CTRL T`F1`CTRL Y`F4`F6`CTRL R`CTRL D",^(6)="```````````````F2`F9`CTRL L`F10`CTRL W`F8`CTRL U`CTRL A`CTRL Z`CTRL E`CTRL K`F6`F8" Q
 ;

