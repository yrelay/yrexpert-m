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

;%QULELVW^INT^1^59754,78167^0
%QULELVW ;;03:03 PM  15 Dec 1992; ; 11 May 93  9:50 AM
 
 
 
 
 
 
OPTIONS 
 N %AA,%BB,UU
 S UU=$$CONCAS^%QZCHAD(UCO,"AUTRE")
 S %AA=1
 I $D(@UCO@("CUT")) S @TABOPT@(%AA)=$$^%QZCHW("Couper"),@TABOPT@(%AA,"C")="CUT",@TABOPT@(%AA,"COM")=$S($D(@UCO@("CUT","COM")):@UCO@("CUT","COM"),1:$$^%QZCHW("Delier le sous-arbre debutant sur l'objet courant")),@TABOPT@(%AA,"CTR")="P",%AA=%AA+1
 I $D(@UCO@("PASTE")) S @TABOPT@(%AA)=$$^%QZCHW("Coller"),@TABOPT@(%AA,"C")="PASTE",@TABOPT@(%AA,"COM")=$S($D(@UCO@("PASTE","COM")):@UCO@("PASTE","COM"),1:$$^%QZCHW("Coller un arbre pris par Couper")),@TABOPT@(%AA,"CTR")="D",%AA=%AA+1
 G:'($D(@UCO@("GOTO"))) OP2
 S @TABOPT@(%AA)=$S($D(@UCO@("GOTO","TXT")):@UCO@("GOTO","TXT"),1:$$^%QZCHW("Aller"))
 S @TABOPT@(%AA,"C")="GOTO"
 S @TABOPT@(%AA,"COM")=$S($D(@UCO@("GOTO","COM")):@UCO@("GOTO","COM"),1:$$^%QZCHW("Se deplacer sur un element du graphe"))
 S %AA=%AA+1
OP2 
 F %BB=1:1 Q:'($D(@UU@(%BB)))  S @TABOPT@(%AA)=@UU@(%BB,"TXT"),@TABOPT@(%AA,"COM")=@UU@(%BB,"COM"),@TABOPT@(%AA,"C")="AUTRE."_%BB,@TABOPT@(%AA,"PROC")=@UU@(%BB) S:$D(@UU@(%BB,"CTR")) @TABOPT@(%AA,"CTR")=@UU@(%BB,"CTR") S %AA=%AA+1
 I '(NOFIN) S @TABOPT@(%AA)=$$^%QZCHW("Fin"),@TABOPT@(%AA,"C")="FIN",@TABOPT@(%AA,"CTR")="A"
 
 S %C=1,%R=22,TE="TA="_PKP F OR=1:1 Q:'($D(@TABOPT@(OR)))  S OPT=@TABOPT@(OR) S:((%C+$L(OPT))+2)>80 %C=1,%R=%R+1 S @(TE),BDP(OR)=TA_" "_OPT_" ",%C=(%C+$L(OPT))+2
 
 S %C=1,%R=21,@(TE)
 F OR=1:1 Q:'($D(@TABOPT@(OR)))  S OPT=$S($D(@TABOPT@(OR,"COM")):$E(@TABOPT@(OR,"COM"),1,80),1:""),COM(OR)=TA_$J("",((PK("C")-$L(OPT))+1)\2)_OPT_$J("",(PK("C")-$L(OPT))\2)
 Q
 
 
INFOPLUS(TEMP,AFF) 
 N Y,TTR,X,BDP,COM
 N CC,LC,%CC,%DD,%EE
 N TW,TF,TC,TD,TT
 N BDP,COM,%AA,%BB,TB,YMOD
 
 N G,RO,TIT,COLAF,LIGAF,CDEB,LDEB,LARA,LART,AFFL,EXEFULL,AFFD,IDFC
 
 N GY,GYINV,EXT,TABOPT,TPAR,UCO,PILBUF
 D GETADR^%QULELV
 S %AA="" F %BB=0:0 S %AA=$O(@TEMP@("VAR",%AA)) Q:%AA=""  S @(%AA_"=@TEMP@(""VAR"",%AA)")
 F %AA=1:1 Q:'($D(@TEMP@("BDP",%AA)))  S BDP(%AA)=@TEMP@("BDP",%AA),COM(%AA)=@TEMP@("COM",%AA)
 
 D CHGPK^%PKUTIL
 D INITRE^%QULELVZ
 D VARGPK^%QULELVZ
 
 I $D(@TEMP@("X")) S X=@TEMP@("X") D AFFX
 F %AA="CDEB","LDEB","CC","LC" I $D(@%AA) S @TEMP@("VAR",%AA)=@%AA
 D RETMOD^%PKUTIL
 Q
 
AFFX N TU,TU1,TU2,PERE,INFO
 S INFO=""
 S %CC=TR,%C=AFFD+1 F %R=19,20 S @("TA="_PKP),%CC=%CC_TA_$J("",AFFL)
 F %AA=1:3 Q:$P(AFF,$C(0),%AA)=""  S %R=$P(AFF,$C(0),%AA)+18,%C=$P(AFF,$C(0),%AA+1)+AFFD,%BB=$E($P(AFF,$C(0),%AA+2),1,(AFFL+3)-%C),TU(%R,%C)=%BB
 S %R="" F TU1=0:0 S %R=$O(TU(%R)) Q:%R=""  S %C="" F TU2=0:0 S %C=$O(TU(%R,%C)) Q:%C=""  S @("TA="_PKP),%CC=%CC_TA_TU(%R,%C)
 S INFO=INFO_%CC_TRO
AFF0 W INFO
 Q
 ;

