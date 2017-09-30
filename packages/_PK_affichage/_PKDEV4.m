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

;%PKDEV4^INT^1^59547,73874^0
PKDEV4 ;
 
 
INIT I $T(@PK)="" W !,!,!,!,!,PK,$$^%QZCHW(" NOT FOUND IN DEFAULT TABLES") Q
 G @PK
VT220 
 D DEC S ^(7)=^%PK(1E-1,PK,7)_"\$C(27,91)_""4h""\$C(27,91)_""4l"""
 I ^%PK("OS")="DTM" S ^%PK(1E-1,PK,2)="142`141`149`150`151`144`143`160`158`153`157`145`147`146`136",^(3)="```````````````137`154`159`148`133`140`135`138`139`134`1`158`159" G VT220A
 S ^%PK(1E-1,PK,2)="27,91,54,126`27,91,53,126`27,91,50,52,126`27,91,50,53,126`27,91,50,54,126`27,91,49,56,126`27,91,49,55,126`27,91,51,52,126`27,91,51,50,126`27,91,50,56,126`27,91,51,49,126`27,91,49,57,126`27,91,50,49,126`27,91,50,48,126`27,79,83"
 S ^(3)="```````````````27,91,49,126`27,91,50,57,126`27,91,51,51,126`27,91,50,51,126`27,79,80`27,91,52,126`27,79,82`27,91,50,126`27,91,51,126`27,79,81`1`27,91,51,50,126`27,91,51,51,126"
VT220A S ^%PK(1E-1,PK,5)="NEXT SCREEN`PREV SCREEN`F12`F13`F14`F7`F6`F20`F18`HELP`F17`F8`F10`F9`PF4",^(6)="```````````````FIND`DO`F19`F11`PF1`SELECT`PF3`INSERT HERE`REMOVE`PF2`CTRL A`F17`F18" G END
 
VT100 
 D DEC G VT100P
 
 I ^%PK("OS")="DTM" S ^%PK(1E-1,PK,2)="14`16````12`4`5`20`26`31`133`134`135`2",^(3)="```````````````6`18`11`24`23`136`21`1`8`28`29`135`136" G VT100A
 S ^%PK(1E-1,PK,2)="14`16````12`4`5`20`26`31`27,79,80`27,79,81`27,79,82`2"
 S ^(3)="```````````````6`18`11`24`23`27,79,83`21`1`8`28`29`27,79,82`27,79,83"
VT100A S ^%PK(1E-1,PK,5)="CTRL N`CTRL P````CTRL L`CTRL D`CTRL E`CTRL T`CTRL Z`CTRL /`PF1`PF2`PF3`CTRL B"
 S ^(6)="```````````````CTRL F`CTRL R`CTRL K`CTRL X`CTRL W`PF4`CTRL U`CTRL A`CTRL H`CTRL \`CTRL ]`PF3`PF4" G END
VT100P I ^%PK("OS")="DTM" S ^%PK(1E-1,PK,2)="145`148`6`8`10`141`140`143`144`133`134`147`138`139`146",^(3)="```````````````150`137`142`136`23`135`149`26`4`5`1`138`139" G VT100PH
 S ^%PK(1E-1,PK,2)="27,79,116`27,79,119`6`8`10`27,79,112`27,79,110`27,79,114`27,79,115`27,79,80`27,79,81`27,79,118`27,79,108`27,79,109`27,79,117"
 S ^(3)="```````````````27,79,121`27,79,77`27,79,113`27,79,83`23`27,79,82`27,79,120`26`4`5`1`27,79,108`27,79,109"
VT100PH S ^(5)="Keypad 4`Keypad 7`CTRL F`Backspace`Linefeed`Keypad 0`Keypad .`Keypad 2`Keypad 3`PF1`PF2`Keypad 6`Keypad ,`Keypad -`Keypad 5"
 S ^(6)="```````````````Keypad 9`Keypad ENTER`Keypad 1`PF4`CTRL W`PF3`Keypad 8`CTRL Z`CTRL D`CTRL E`CTRL A`Keypad ,`Keypad -" G END
 
DEC S ^%PK(1E-1,PK,1)="W *27,""(B"",*27,"")0"",*27,""*0"""
 S ^%PK(1E-1,PK,7)="W *27,*91,""?3h""\W *27,*91,""?3l""" Q
 
DTMPC S ^%PK(1E-1,PK,1)="U 0:(PLEN=24:FLEN=24)",^(2)="150`142`164`132`157`130`155`134`163`128`153`131`133`158`148"
 S ^(3)="```````````````129`136`161`137`23`135`140`151`152`5`1`135`160"
 S ^%PK(1E-1,PK,5)="PG DN`PG UP`CTRL HOME`F5`SHIFT F5`F3`SHIFT F3`F7`SHIFT TAB`F1`SHIFT F1`F4`F6`SHIFT F6`END",^(6)="```````````````F2`F9`SHIFT F9`F10`CTRL W`F8`HOME`INS`DEL`CTRL E`CTRL A`F8`SHIFT F8" G END
 
IBMPC S ^%PK(1E-1,PK,1)=""
 S ^(2)="27,81`27,73`27,119`27,63`27,88`27,61`27,86`27,65`15`27,59`27,84`27,62`27,64`27,89`27,79",^(3)="```````````````27,60`27,67`27,92`27,68`23`27,66`27,71`27,82`27,83`5`1`27,66`27,91"
IBMFK S ^%PK(1E-1,PK,5)="PG DN`PG UP`SHIFT HOME`F5`SHIFT F5`F3`SHIFT F3`F7`SHIFT TAB`F1`SHIFT F1`F4`F6`SHIFT F6`END",^(6)="```````````````F2`F9`SHIFT F9`F10`CTRL W`F8`HOME`INS`DEL`CTRL E`CTRL A`F8`SHIFT F8" G END
IBMPCMON S ^%PK(1E-1,PK,1)=""
 S ^(2)="27,81`27,73`27,119`27,63`27,88`27,61`27,86`27,65`15`27,59`27,84`27,62`27,64`27,89`27,79",^(3)="```````````````27,60`27,67`27,92`27,68`23`27,66`27,71`27,82`27,83`5`1`27,66`27,91"
 S ^(5)="PG DN`PG UP`CTL HOME`F5`SHIFT F5`F3`SHIFT F3`F7`SHIFT TAB`F1`SHIFT F1`F4`F6`SHIFT F6`END",^(6)="```````````````F2`F9`SHIFT F9`F10`CTRL W`F8`HOME`INS`DEL`CTRL E`CTRL A`F8`SHIFT F8" G END
MSMPC 
 G MSMPC^%PKDEV6
AMPEX 
FREEDOM 
WY60AT 
 D @PK^%PKDEV6 G END
UND W !,!,$$^%QZCHW("Device Parameters Not defined for this CRT type."),!,!,$$^%QZCHW("Will try to use default values - Please Wait") D INIT H 2 Q
 
END I "DSM^MSM"[^%PK("OS") F n=2,3 S x=^%PK(1E-1,PK,n) D DSM S ^%PK(1E-1,PK,n)=x
 Q
DSM N i,y,z
 F i=1:1 S y=$P(x,"`",i,999) Q:y=""  S y=$P(y,"`",1),z=$P(y,",",3,4) I z]"" B  S:$P(y,",",2)=91 @("z=$C("_z_")+20") S:$P(y,",",2)'=91 z=z-$S($P(y,",",3)>111:112,1:48) S:y]"" $P(x,"`",i)=$S(z]"":"27,"_z,1:y)
 Q

