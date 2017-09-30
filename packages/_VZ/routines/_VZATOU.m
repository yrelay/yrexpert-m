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
;! Nomprog     : %VZATOU                                                      !
;! Module      : VIDEO                                                        !
;! But         : Gestion de la valeur d'une touche                            !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;! MORE : S A=$$MORE(.T,.F,.CTR,.ESC,20,0) récupère la valeur le touche       !
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

%VZATOU ;
VVZATOU(TOUCHE,FLECHE,ATTENTE,ECHO) 
 
 
 N X2,X3,ZB,I,X
 I ATTENTE="" S ATTENTE=^TOZE($I,"ATTENTE")
 S (TOUCHE,FLECHE)="",(X2,X3)=0
 I '(ECHO) D ECHOFF^%VVIDEO
 I ECHO U 0
 
 ;HL2 R *TOUCHE:ATTENTE
 ;;HL S TOUCHE=$$^%VTOUC()
 R *TOUCHE:ATTENTE  S TOUCHE=$$^%VCONVT(TOUCHE)
 
 ;HL2 G:$$CODFLEC^%INCCLAV(TOUCHE,.FLECHE) FIN
 I ($A($ZB)=27)&($$CODFLEC^%INCCLAV(TOUCHE,.FLECHE)) G FIN
 S X=TOUCHE
 D TOUCHE^%INCCLAV(TOUCHE,.TOUCHE)
 G:(TOUCHE=0)&MODTM ESCMOD
 G:TOUCHE'=27 FIN
 
 S TOUCHE=0
 I MODTM S FLECHE=$$ESCAPE^%INCCLAV(X) G FIN
ICI R *X2
 G:X2'=91 AUTRES
 ;;; lecture rapide des fleches
 R *X3
 G:(X3<65)!(X3>68) FONCT
 S FLECHE=$S(X3=65:"H",X3=66:"B",X3=67:"D",X3=68:"G")
 G FIN
FONCT 
 S FLECHE="*"_$C(X2)_$C(X3)
 I (X3<48)!(X3>57) G FIN0
BCFON R *X3
 S X3=$C(X3),FLECHE=FLECHE_X3
 I X3'="~" G BCFON
 G FIN0
AUTRES ;;; decodage des autres touches
 S FLECHE="*"_$C(X2)
 R *X3
 S FLECHE=FLECHE_$C(X3)
 S FLECHE=$$ESCAPE^%INCCLAV(FLECHE)
 G FIN
 ;;FINONDTM
 ;;DTM   
ESCMOD R *X3
 G FIN
 
FIN0 S FLECHE=$$ESCAPE^%INCCLAV(FLECHE)
FIN 
 I '(ECHO) D ECHON^%VVIDEO
 Q
 
 
 
 
 
 
 
 
 
 
 
 
 
MORE(T,F,CTR,ESC,ATTENTE,ECHO) 
 N F1,F2,F3,F5,F5
 S (T,F,CTR,ESC)=""
 D VVZATOU(.T,.F,ATTENTE,ECHO)
 I T=-1 S T="" Q 0
 I (T<127)&(T'<32) Q 1
 I F'="" S T="" G MORE0
 S F1=$S(T=13:"RETURN",T=0:"NUL",T=127:"DEL",1:"")
 I F1'="" S T="",F=F1 Q 1
 
 I (T>0)&(T<27) S CTR=$C(T+64),T="" Q 1
 S ESC=F
 Q 1
MORE0 
 I (F'["*")&(F'["[") Q 1
 
 I $E(F,1)="*" G MORE1
 Q 1
MORE1 S F2=$E(F,2)
 I F2="O" G MORE2
 I F2="[" G MORE3
 Q 1
 
MORE2 S F2=$E(F,3)
 I $L(F)'=3 S ESC=F,F="" Q 1
 S F1=$S(F2="P":"PF1",F2="Q":"PF2",F2="R":"PF3",F2="S":"PF4",1:"")
 I F1'="" S F=F1 Q 1
 
 
 S F1=$S(F2="l":"'",F2="m":"-",F2="n":".",F2="M":"ENTER",1:"")
 I F1'="" S F=F1 Q 1
 S F1=$S(F2="p":"0",F2="q":"1",F2="r":"2",F2="s":"3",F2="t":"4",F2="u":"5",F2="v":"6",F2="w":"7",F2="x":"8",F2="y":"9",1:"")
 I F1'="" S F=F1 Q 1
 
 S ESC=F,F=""
 Q 1
 
MORE3 S F3=$E(F,3)
 S F4=$E(F,4)
 I F4="~" G MORE4
 S F5=$E(F,5)
 I F5="~" G MORE5
 S ESC=F,F=""
 Q 1
 
MORE4 S F1=$S(F3=1:"FIND",F3=2:"INSERT_HERE",F3=3:"REMOVE",F3=4:"SELECT",F3=5:"PREVIOUS_SCREEN",F3=6:"NEXT_SCREEN",1:"")
 I F1'="" S F=F1 Q 1
 S ESC=F,F=""
 Q 1
 
MORE5 S F2=F3_F4
 S F1=$S(F2=17:"F6",F2=18:"F7",F2=19:"F8",F2=20:"F9",F2=21:"F10",F2=23:"F11",F2=24:"F12",F2=25:"F13",F2=26:"F14",1:"")
 I F1'="" S F=F1 Q 1
 S F1=$S(F2=28:"HELP",F2=29:"DO",F2=31:"F17",F2=32:"F18",F2=33:"F19",F2=34:"F20",1:"")
 I F1'="" S F=F1 Q 1
 S ESC=F,F=""
 Q 1
 
ZFLECHE 
 D VVZATOU(.X1,.%F,"",0)
 S %F=$S("HBGD"[%F:%F,1:"")
 Q
 
ZFLECHET(T) 
 D VVZATOU(.X1,.%F,T,0)
 S %F=$S("HBGD"[%F:%F,1:"")
 Q
GZFLECHE 
 D VVZATOU(.X1,.%F,5E-2,0)
 S %F=$S("HBGD"[%F:%F,1:"")
 Q
TEST2 S A=$$MORE(.T,.F,.CTR,.ESC,20,0)
 W !,"A ",A," T --> ",T," F --> ",F," CTR--> ",CTR," ESC--> ",ESC
 I F="RETURN" Q
 G TEST2
TEST 
 D ECHOFF^%VVIDEO
L 
 R *A:0
 
 I A<32 W A_" "
 I A'<32 W $C(A)_" "
 I A'=13 G L
 D ECHON^%VVIDEO
 Q
TEST1 
L1 
 D VVZATOU(.T,.F,"",0)
 I F'="" W !,"T ",T," F  ",F G L1
 I (T'>32)!(T>126) W !," T ",T," F  ",F
 I (T>32)&(T'>126) W !," $C(T) ",$C(T)," F  ",F
 I T'=13 G L1
 Q

