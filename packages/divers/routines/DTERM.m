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

;DTERM^INT^1^59547,74866^0
ZSEND(M,T) 
 W *
TEST S P="????"
AGAIN D CLEPAG^%VVIDEO
 W !,"Systeme d'envoi de messages parasites ... a ",P
 W !,!
 W !,"0/ Selectionner la personne"
 W !,"1/ Envoyer un message"
 W !,"2/ Effacer son ecran"
 W !,"3/ Bold"
 W !,"4/ Underline"
 W !,"5/ Blink"
 W !,"6/ Reverse"
 W !,"7/ Normal"
 W !,"8/ simule l'implosion du terminal"
L1 D POCLEPA^%VVIDEO W ">" R *BID F I=1,18,48,49,50,51,52,53,54,55,56 G:I=BID @I
 D ^%VSQUEAK G L1
51 D ^%DTERM($C(27)_"[1m",T) G L1
52 D ^%DTERM($C(27)_"[4m",T) G L1
53 D ^%DTERM($C(27)_"[5m",T) G L1
54 D ^%DTERM($C(27)_"[7m",T) G L1
55 D ^%DTERM($C(27)_"[0m",T) G L1
56 D ^%DTERM($C(27)_"[?5h",T) H 1 D ^%DTERM($C(27)_"[?5l",T) G L1
1 Q
18 G AGAIN
48 D POCLEPA^%VVIDEO W "Qui donc ? : " S DX=$X,DY=$Y D ^%VLEC G:(CTRLA=1)!(Y1="") E
 I $E(Y1,$L(Y1))=":" S T=Y1 G AGAIN
 I '($D(^ZSEND1(Y1))) D POCLEPA^%VVIDEO,^%VSQUEAK W "Je ne connais pas ..." H 3 G 48
 S P=Y1,T=^ZSEND1(Y1) G AGAIN
E D POCLEPA^%VVIDEO G L1
49 D POCLEPA^%VVIDEO W "Message : " S DX=$X,DY=$Y D ^%VLEC G:(CTRLA=1)!(Y1="") E
 D ^%DTERM(Y1,T) G L1
50 D ^%DTERM($C(27)_$C(91)_$C(50)_$C(74),T) G L1
TOUS D POCLEPA^%VVIDEO Q:'($$CONFIRM^%VZEOUI($$^%QZCHW("Voulez vous vraiment faire cela")_" ? "))
 D POCLEPA^%VVIDEO W "message : " R GSM
 S CH=$P($T(PORTES),";;",2) F I=1:1 S P=$P(CH,",",I) Q:P=""  D ^%DTERM(GSM,P)
 D POCLEPA^%VVIDEO Q
PORTES ;;TXA0:,TXA1:,TXA2:,TXA4:,TXB0:,TXB1:,TXB4:,TXB6:,TXB3:

