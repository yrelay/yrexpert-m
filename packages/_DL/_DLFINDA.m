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

;%DLFINDA^INT^1^59547,73867^0
ABFINAR ;
 
 K ^TRGUI($J) I XDP["""" D ^%QZCHGUI(XDP,"^TRGUI($J)") S XDP=^TRGUI($J,"SUB")
 S %XI=2 K ^EXP($J),^EXPVU($J) S ^EXP($J,1)=XDP,EXC=-1
L S EXC=$N(^EXP($J,EXC)) G:EXC=-1 FL S EX=^EXP($J,EXC) G:EX'["(" FL S EX="("_EX_")"
 K EX2,T,TI,LOCA,PO,PF,AP S NU=0,IY=1
 S EX2=EX
 G:EX'["$ABAQUE" L2
 N P1,NP,C,%I,LL
 S LL=$L(EX,",")
 I (LL'=3)&(LL'=4) S ERREUR=1,MESERR="  "_$$^%QZCHW("Syntaxe incorrecte pour $ABAQUE")
 I LL=3 S (EX,EX2)=$E(EX,1,$L(EX)-3)_","""")))"
 S P1=$F(EX,"$ABAQUE("),NP=1
 F %I=P1:1 S C=$E(EX,%I) Q:C=""  S:C="(" NP=NP+1 S:C=")" NP=NP-1 Q:NP=0
 G:NP'=0 L2
 S EX=$E(EX,1,P1-2)_"T"_$E(EX,P1,%I-1)_"T"_$E(EX,%I+1,9999)
L2 F Z1=1:1 S CC=$E(EX,Z1) Q:CC=""  I (CC="(")!(CC=")") S LOCA(IY)=Z1,T(LOCA(IY))=CC,NU=$S(CC="(":NU+1,1:NU-1) S:CC="(" PO(Z1)=1,TI(NU,Z1)=1 S:CC=")" PF(Z1)=1 S IY=IY+1
 S EX=EX2
 S PO=$ZP(TI("")),PO=$O(TI(PO,"")),PF=$O(PF(PO)),EXR=$E(EX,PO+1,PF-1),^EXP($J,%XI)=$E(EX,2,PO-1)_"%"_%XI_$E(EX,PF+1,$L(EX)-1)
 S XDP="("_EXR_")"
 D ^%DLRECPO,@TOFOR
 Q:ERREUR
 S ^EXPVU($J,"%"_%XI)="("_EX_")"
 S %XI=%XI+1 G L
FL S EXT=^EXPVU($J,"%"_(%XI-1)) Q:'($D(^TRGUI($J)))
 S CC="" F %U=1:1 S CC=$O(^TRGUI($J,"SUB",CC)) Q:CC=""  S EXT=$$ZSUBST^%QZCHSUB(EXT,""""_CC_"""",^TRGUI($J,"SUB",CC))
 Q
EV(XDP,EXT,TOFOR) 
 G BEG
 G BEG

