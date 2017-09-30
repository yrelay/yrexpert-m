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

;LKBRP3^INT^1^59547,74867^0
BRPFORM ;
 
 
 
 
 
 
 D CLEPAG^%VVIDEO
 S GLO2="^[QUI]TEMPO3(""BARPHONE"")",ENR="",TYP="",NUM=0,FIRST=1,NBR=0
 S FORM="^[QUI]TEMPO4(""BARPHONE"")" K @(FORM)
 S TYP="" F I=0:0 S TYP=$O(@GLO2@(TYP)) Q:TYP=""  S GLO=$$CONCAS^%QZCHAD(GLO2,TYP),FIRST=1,NUM=0 D LOOP
 Q
LOOP S ENR=$O(@GLO@(ENR)) G:ENR="" FIN
 S VAL=@GLO@(ENR),REF=VAL
 D @TYP
 G LOOP
 
FIN Q
 
BOARD 
 D EXTRAC("B_UNITS ")
 D EXTRAC("B_ATTR ")
 Q
NET 
 D EXTRAC("NET ")
 D EXTRAC("N_PROP ")
 D EXTRAC("N_PIN ")
 D EXTRAC("N_VIA ")
 Q
GEOM 
 D EXTRAC("GEOM ")
 D EXTRAC("G_PIN ")
 D EXTRAC("G_ATTR ")
 Q
COMP 
 D EXTRAC("COMP ")
 D EXTRAC("C_PROP ")
 D EXTRAC("C_PIN ")
 Q
HOLE 
 D EXTRAC("HOLE ")
 D EXTRAC("PAD ")
 Q
TYP(TYP) 
 S TYPS=TYP
 I VAL["B_UNITS " S TYP="BOARD" D EXTRAC("B_UNITS ") Q
 I VAL["NET " S TYP="NET" D EXTRAC("NET ") Q
 I VAL["GEOM " S TYP="GEOM" D EXTRAC("GEOM ") Q
 I VAL["COMP " S TYP="COMP" D EXTRAC("COMP ") Q
 I VAL["HOLE " S TYP="HOLE" D EXTRAC("HOLE ") Q
 Q
EXTRAC(CH) 
 N LG
 S LG=$L(VAL,CH)
 I LG=1 Q
 
 S FIRST=0
 F I=2:1:LG S SSCH=$P(VAL,CH,I),NUM=$$POP(NUM),@FORM@(TYP,NUM)=CH_SSCH,NBR=NBR+1
 S VAL=SSCH
 S DX=35,DY=10 X XY W $J(NBR,5)
 I VAL["B_ATTR " S @FORM@(TYP,NUM)=CH_$P(VAL,"B_ATTR ") Q
 I VAL["N_PROP " S @FORM@(TYP,NUM)=CH_$P(VAL,"N_PROP ") Q
 I VAL["N_PIN " S @FORM@(TYP,NUM)=CH_$P(VAL,"N_PIN ") Q
 I VAL["N_VIA " S @FORM@(TYP,NUM)=CH_$P(VAL,"N_VIA ") Q
 I VAL["G_PIN " S @FORM@(TYP,NUM)=CH_$P(VAL,"G_PIN ") Q
 I VAL["G_ATTR " S @FORM@(TYP,NUM)=CH_$P(VAL,"G_ATTR ") Q
 I VAL["C_PROP " S @FORM@(TYP,NUM)=CH_$P(VAL,"C_PROP ") Q
 I VAL["C_PIN " S @FORM@(TYP,NUM)=CH_$P(VAL,"C_PIN ") Q
 I VAL["B_UNITS " S @FORM@(TYP,NUM)=CH_$P(VAL,"B_UNITS ") Q
 I VAL["NET " S @FORM@(TYP,NUM)=CH_$P(VAL,"NET ") Q
 I VAL["GEOM " S @FORM@(TYP,NUM)=CH_$P(VAL,"GEOM ") Q
 I VAL["COMP " S @FORM@(TYP,NUM)=CH_$P(VAL,"COMP ") Q
 I VAL["HOLE " S @FORM@(TYP,NUM)=CH_$P(VAL,"HOLE ") Q
 Q
 
POP(N) 
 S N=N+1 Q N

