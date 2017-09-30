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

;LKBRP2^INT^1^59547,74867^0
BRPFORM ;
 
 
 
 
 
 
 D CLEPAG^%VVIDEO
 S GLO="^[QUI]TEMPO(""BPH"")",ENR="",TYP="",NUM=0,FIRST=1,NBR=0
 S FORM="^[QUI]TEMPO3(""BARPHONE"")" K @(FORM)
 F I="BOARD","NET","GEOM","COMP","HOLE" S TAB(I)=0
 D MSG^%VZEATT("partie 1")
LOOP S ENR=$O(@GLO@(ENR)) G:ENR="" FIN
 S VAL=@GLO@(ENR)
 D TYP(.TYP)
 D @TYP
 G LOOP
 
FIN 
 Q
 
BOARD 
 D EXTRAC("B_UNITS ")
 D EXTRAC("B_ATTR ")
 D TYP(.TYP)
 I TYP="BOARD" Q
 G @TYP
NET 
 D EXTRAC("NET ")
 D EXTRAC("N_PROP ")
 D EXTRAC("N_PIN ")
 D EXTRAC("N_VIA ")
 D TYP(.TYP)
 I TYP="NET" Q
 G @TYP
GEOM 
 D EXTRAC("GEOM ")
 D EXTRAC("G_PIN ")
 D EXTRAC("G_ATTR ")
 D TYP(.TYP)
 I TYP="GEOM" Q
 G @TYP
COMP 
 D EXTRAC("COMP ")
 D EXTRAC("C_PROP ")
 D EXTRAC("C_PIN ")
 D TYP(.TYP)
 I TYP="COMP" Q
 G @TYP
HOLE 
 D EXTRAC("HOLE ")
 D EXTRAC("PAD ")
 D TYP(.TYP)
 I TYP="HOLE" Q
 G @TYP
TYP(TYP) 
 S TYPS=TYP
 I VAL["B_UNITS " S TYP="BOARD" Q  D EXTRAC("B_UNITS ") Q
 I VAL["NET " S TYP="NET" Q  D EXTRAC("NET ") Q
 I VAL["GEOM " S TYP="GEOM" Q  D EXTRAC("GEOM ") Q
 I VAL["COMP " S TYP="COMP" Q  D EXTRAC("COMP ") Q
 I VAL["HOLE " S TYP="HOLE" Q  D EXTRAC("HOLE ") Q
 Q
EXTRAC(CH) 
EXT N LG
 S LG=$L(VAL,CH)
 I LG=1 Q
 I '(FIRST) S:TYPS="" TYPS=TYP S SSCH=$P(VAL,CH,1),@FORM@(TYPS,NUM)=@FORM@(TYPS,NUM)_SSCH,NBR=NBR+1,TYPS=TYP
 S FIRST=0
 F I=2:1:LG S SSCH=$P(VAL,CH,I),NUM=$$POP(TYP),@FORM@(TYP,NUM)=CH_SSCH,NBR=NBR+1
 S VAL=SSCH
 S DX=35,DY=12 X XY W $J(NBR,5)
 I VAL["B_ATTR " D CUT("B_ATTR") Q
 I VAL["N_PROP " D CUT("N_PROP ") Q
 I VAL["N_PIN " D CUT("N_PIN ") Q
 I VAL["N_VIA " D CUT("N_VIA ") Q
 I VAL["G_PIN " D CUT("G_PIN ") Q
 I VAL["G_ATTR " D CUT("G_ATTR ") Q
 I VAL["C_PROP " D CUT("C_PROP ") Q
 I VAL["C_PIN " D CUT("C_PIN ") Q
 I VAL["B_UNITS " D CUT("B_UNITS ") Q
 I VAL["NET " D CUT("NET ") S TYP="NET" Q
 I VAL["GEOM " D CUT("GEOM ") S TYP="GEOM" Q
 I VAL["COMP " D CUT("COMP ") S TYP="COMP" Q
 I VAL["HOLE " D CUT("HOLE ") S TYP="HOLE" Q
 S VAL=""
 Q
 
CUT(LIB) 
 S @FORM@(TYP,NUM)=CH_$P(VAL,LIB),VAL=LIB_$P(VAL,LIB,2,99)
 Q
POP(T) 
 S TAB(T)=TAB(T)+1 Q TAB(T)

