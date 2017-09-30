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

;%QCAGLSE^INT^1^59547,73875^0
QCAGLSE(GS,SP,GD,V,%G) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 D SEL(GS,SP,GD,V,0,.%G)
 Q
SEL(GS,SP,GD,V,SEL,%G) 
INT N %A,%B,%C,%S,%NO,I,NOM
 K @(GD)
 I ($D(@SP@("NOM"))#10)=1 S NOM=@SP@("NOM")
 E  S NOM=$$^%QZCHW("Individu")
INT1 S %G=0,%S=1 W:V !,$$^%QZCHW("tout(es) les")_" "_NOM_"s ? : "
 I '(SEL) W:V $S(@SP@("ALL")=1:"Y",1:"N")
 I SEL R ALL I (ALL'=0)&(ALL'=1) W " ???" G INT1
 I SEL S @SP@("ALL")=ALL
 W:V !
 I @SP@("ALL") S %A="",%B=0 D MULT
 I '(SEL) D INT2
 I SEL D INT3
 D EXIT
 Q
INT2 S %A=$O(@SP@("L",""))
 F I=0:0 Q:%A=""  W:V !,NOM," : " D GLO(@SP@("L",%A)) S %A=$O(@SP@("L",%A))
 Q
INT3 F I=1:1 W:V !,NOM," : " R %A Q:%A=""  S @SP@("L",I)=%A D GLO(@SP@("L",I))
 Q
EXIT W:V !,%G," ",NOM," ",$E("s",%G'=1),!
 Q
 
 Q
 
GLO(%A) 
 W:V&('(SEL)) %A
 S %S=1 I %A?1"'".E S %S=0,%A=$E(%A,2,99)
 I %A?.E1"*" S %A=$E(%A,1,$L(%A)-1),%B=%A D SING,MULT Q
 I %A["-" D RANGE Q
 D SING I %NO W:V " ???"
 Q
 
SING S %NO=0 I %A'="",$D(@GS@(%A)) S %B=%A
 E  S %NO=1 Q
S I %S,'($D(@GD@(%B))) S @GD@(%B)="",%G=%G+1 Q
 I '(%S),$D(@GD@(%B)) K @GD@(%B) S %G=%G-1
 Q
MULT I %B="" S %B=0
MULT1 S %B=$O(@GS@(%B)) Q:(%B="")!($E(%B,1,$L(%A))'=%A)
 D S G MULT1
 
RANGE S %B=$P(%A,"-",1),%C=$P(%A,"-",2) I %B]%C W:V " ???" Q
 I %B="" S %B=0
 E  I $D(@GS@(%B)) D S
R2 S %B=$O(@GS@(%B)) I %B'="",%B']%C D S G R2
 Q
 
TEST S GS="^UTILITY(""GLO"")"
 S GD="^UTILITY($J#256)"
 S SP="SP1"
 S @SP@("ALL")=0
 S @SP@("L",1)="MOZ"
 S @SP@("L",2)="'MOZ52"
 D QCAGLSE(GS,SP,GD,1,.%G)
 Q
TEST1 S GS="^UTILITY(""GLO"")"
 S GD="^UTILITY($J#256)"
 S SP="SP1"
 D SEL(GS,SP,GD,1,1,.%G)
 Q

