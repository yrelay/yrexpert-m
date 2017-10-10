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

;TKDEV5^INT^1^59547,74869^0
TKDEV5 ;
 
 
EDIT S %C=8,%R=4 W @(TKP),TK("CS"),TK("HI"),$$^%QZCHW("Press the appropriate key to implement each of the following functions"),!,?3,$$^%QZCHW("and then enter a short description of each key for the HELP screen.  You "),!
 W ?3,$$^%QZCHW("may skip particular functions by just pressing RETURN, and you can move")
 W !,?3,$$^%QZCHW("up or down with the cursor up and cursor down keys.  The W, F, or N after"),!,?3,$$^%QZCHW("the function indicates whether it is used by TKWRITER, TKFORM or TKNOTE."),!
 W TK("LO"),!,?3,$$^%QZCHW("Function"),?33,$$^%QZCHW("Key Output"),?59,$$^%QZCHW("Description")
 S NE=28,NF=13,TP=11,EC=31,(ST(0),ST(1),SD(0),SD(1))="",II=0,DOTS="............................." S:$D(^TK(1E-1,TK,2)) ST(0)=^(2) S:$D(^(3)) ST(1)=^(3) S:$D(^(5)) SD(0)=^(5) S:$D(^(6)) SD(1)=^(6)
E0 X ^TK("ECHO-OFF") F N0=1:NF:NE D EN
 S ^TK(1E-1,TK,2)=ST(0),^(3)=ST(1),^(5)=SD(0),^(6)=SD(1) X ^TK("ECHO-ON")
END K ST,SD,TP,EC,II,NF,A,DOTS,ESC,NE,^TKWP(95,TK),^TKNOTE("DEV",TK),^TKDISP(95,TK) X ^TK("TERM-OFF"),^TK("WRAP-ON") Q
 
E1 S C="" F I=1:1:$L(ZF) S C=C_","_$A(ZF,I)
 S C=$E(C,2,99),J=$P($T(DATA+II),";",2),$P(ST(J>15),"`",J)=C W C,$J("",(60-$L(C))-%C)
E2 S %C=60,LNG=20,X=$P(SD(J>15),"`",J) X ^TKREAD,^TK("ECHO-OFF") S $P(SD(J>15),"`",J)=X,%C=EC+3 Q
 
EN S %C=2,%R=TP,NN=$S(((N0+NF)-1)>NE:NE,1:(N0+NF)-1) W @(TKP),TK("CS")
 F I=N0:1:NN S %C=2,%R=(((I-1)#NF)+1)+TP,A=$T(DATA+I),J=$P(A,";",2),A=$P(A,";",4)_" ("_$P(A,";",3)_")" W @(TKP),TK("LO"),$$^%QZCHW(A),$E(DOTS,1,EC-$L($$^%QZCHW(A)))," ",TK("HI"),$P(ST(J>15),"`",J) S %C=60 W @(TKP),$P(SD(J>15),"`",J)
 S %C=EC+3 F II=N0:1:NN S %R=(((II-1)#NF)+1)+TP W @(TKP) R E X TK("T"),$S(ZF=TK("UK"):"S II=II-2",ZF=TK("DK"):"S II=II",ZF=$C(13):"S II=II",1:"D E1") I (II+1)<N0 S:II<0 II=0 I N0>NF S %R=TP,%C=1 W @(TKP),TK("CS") S N0=(N0-NF)-NF Q
 Q
 
DATA 
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
 ;
