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

;TOTRAIT2^INT^1^59547,74876^0
TOTRAIT ;;05:14 PM  23 May 1989
 
 
 
 
 
 
 
COMMUN 
 
 
 G:'($D(^[QUI]NAMES(2,2))) EXPLICI
 S L=$$ZSUBST^%QZCHSUB(^[QUI]NAMES(2,2),"EXPLICIT","EXPLICI")
 S ^[QUI]NAMES(2,2)=$$ZSUBST^%QZCHSUB(L,"EXPLICIT","EXPLICI")
 
EXPLICI 
 
 
 
 S LEX=""
PLEXIB1 S LEX=$O(^[QUI]PLEXI(LEX))
 G:LEX="" EXPL2
 G:'($D(^[QUI]PLEXI(LEX,"EXPLICITE"))) PLEXIB1
 D ADR^%QCAGLC("^["_QUI_"]PLEXI("""_LEX_""",""EXPLICITE""","^["_QUI_"]PLEXI("""_LEX_""",""EXPLICI""")
 K ^[QUI]PLEXI(LEX,"EXPLICITE")
 G PLEXIB1
 
EXPL2 
 S L1=""
EXPL21 S L1=$O(^[QUI]PLEXP(L1))
 G:L1="" IMPLICI
 S L2=""
EXPL22 S L2=$O(^[QUI]PLEXP(L1,L2))
 G:L2="" EXPL21
 G:'($D(^[QUI]PLEXP(L1,L2,"EXPLICITE"))) EXPL22
 S ^[QUI]PLEXP(L1,L2,"EXPLICI")=^[QUI]PLEXP(L1,L2,"EXPLICITE")
 K ^[QUI]PLEXP(L1,L2,"EXPLICITE")
 G EXPL22
 
IMPLICI 
 
 
 
 G:'($D(^[QUI]NAMEFUL("IMPLICITE"))) IMPLI1
 S ^[QUI]NAMEFUL("IMPLICI")=^[QUI]NAMEFUL("IMPLICITE")
 K ^[QUI]NAMEFUL("IMPLICITE")
 
IMPLI1 
 G:'($D(^[QUI]ZEXG("IMPLICITE"))) IMPLI2
 D ADR^%QCAGLC("^["""_QUI_"""]ZEXG(""IMPLICITE""","^["""_QUI_"""]ZEXG(""IMPLICI""")
 K ^[QUI]ZEXG("IMPLICITE")
 
IMPLI2 
 S LEX=""
IMPLI21 S LEX=$O(^[QUI]PLEXI(LEX))
 G:LEX="" IMPLI3
 S LEX2=""
IMPLI22 S LEX2=$O(^[QUI]PLEXI(LEX,LEX2))
 G:LEX2="" IMPLI21
 G:'($D(^[QUI]PLEXI(LEX,LEX2,"IMPLICITE"))) IMPLI22
 D ADR^%QCAGLC("^["_QUI_"]PLEXI("""_LEX_""","""_LEX2_""",""IMPLICITE""","^["_QUI_"]PLEXI("""_LEX_""","""_LEX2_""",""IMPLICI""")
 K ^[QUI]PLEXI(LEX,LEX2,"IMPLICITE")
 G IMPLI22
 
IMPLI3 
 S LEX=""
IMPLI31 S LEX=$O(^[QUI]PLEXP(LEX))
 G:LEX="" IMPLI4
 S LEX2=""
IMPLI32 S LEX2=$O(^[QUI]PLEXP(LEX,LEX2))
 G:LEX2="" IMPLI31
 G:'($D(^[QUI]PLEXP(LEX,LEX2,"IMPLICITE"))) IMPLI32
 D ADR^%QCAGLC("^["_QUI_"]PLEXP("""_LEX_""","""_LEX2_""",""IMPLICITE""","^["_QUI_"]PLEXP("""_LEX_""","""_LEX2_""",""IMPLICI""")
 K ^[QUI]PLEXP(LEX,LEX2,"IMPLICITE")
 G IMPLI32
 
 
IMPLI4 F %L="PARINDEF","REPFICH","RMBONUS","RMCONDIT","RMCOUPE","RMICREG","RMICRO","RMIREPFI","RMORCIM","RMPARMIC","RMREGMIC","RMREPFIC","RMSINON" S %LIB="^["_QUI_"]"_%L D IMPNIV1
 
IMPLI5 F %L="RMBESACT","RMBESOIN","RMICPAR" S %LIB="^["_QUI_"]"_%L D IMPNIV4
 
IMPLI6 S %L="SENSFICH",%LIB="^["_QUI_"]"_%L D IMPNIV5
 
IMPLI7 S %L="IREPFICH",%LIB="^["_QUI_"]"_%L D IMPVAL2
 
 
 
 
IMPNIV1 S PAR=""
IMPNIV12 S PAR=$O(@%LIB@(PAR))
 Q:PAR=""
 G:'($D(@%LIB@(PAR,"IMPLICITE"))) IMPNIV12
 D ADR^%QCAGLC(%LIB_"("""_PAR_""",""IMPLICITE""",%LIB_"("""_PAR_""",""IMPLICI""")
 K @%LIB@(PAR,"IMPLICITE")
 G IMPNIV12
 
IMPNIV4 
 S L1=""
IMPNIV41 S L1=$O(@%LIB@(L1))
 Q:L1=""
 S L2=""
IMPNIV42 D:L2="IMPLICITE" IMPNIV4S
 S L2=$O(@%LIB@(L1,L2))
 G:L2="" IMPNIV41
 S L3=""
IMPNIV43 S L3=$O(@%LIB@(L1,L2,L3))
 G:L3="" IMPNIV42
 S L4=""
IMPNIV44 S L4=$O(@%LIB@(L1,L2,L3,L4))
 G:L4="" IMPNIV43
 G:'($D(@%LIB@(L1,L2,L3,L4,"IMPLICITE"))) IMPNIV44
 S LIB=%LIB_"("""_L1_""","""_L2_""","""_L3_""","""_L4_""",""IMPLICITE"""
 S LIB2=%LIB_"("""_L1_""","""_L2_""","""_L3_""","""_L4_""",""IMPLICI""" D ADR^%QCAGLC(LIB,LIB2)
 K @(LIB)
 G IMPNIV44
IMPNIV4S D ADR^%QCAGLC(%LIB_"("""_L1_""",""IMPLICITE""",%LIB_"("""_L1_""",""IMPLICI""")
 K @%LIB@(L1,"IMPLICITE")
 Q
 
IMPNIV5 
 S L1=""
IMPNIV51 S L1=$O(@%LIB@(L1))
 Q:L1=""
 S L2=""
IMPNIV52 S L2=$O(@%LIB@(L1,L2))
 G:L2="" IMPNIV51
 S L3=""
IMPNIV53 D:L3="IMPLICITE" IMPNIV5S
 S L3=$O(@%LIB@(L1,L2,L3))
 G:L3="" IMPNIV52
 S L4=""
IMPNIV54 S L4=$O(@%LIB@(L1,L2,L3,L4))
 G:L4="" IMPNIV53
 S L5=""
IMPNIV55 S L5=$O(@%LIB@(L1,L2,L3,L4,L5))
 G:L5="" IMPNIV55
 G:'($D(@%LIB@(L1,L2,L3,L4,L5,"IMPLICITE"))) IMPNIV55
 S LIB=%LIB_"("""_L1_""","""_L2_""","""_L3_""","""_L4_""","""_L5_""",""IMPLICITE""",LIB2=%LIB_"("""_L1_""","""_L2_""","""_L3_""","""_L4_""","""_L5_""",""IMPLICI""" D ADR^%QCAGLC(LIB,LIB2)
 K @(LIB)
 G IMPNIV55
IMPNIV5S D ADR^%QCAGLC(%LIB_"("""_L1_""","""_L2_""",""IMPLICITE""",%LIB_"("""_L1_""","""_L2_""",""IMPLICI""")
 K @%LIB@(L1,L2,"IMPLICITE")
 Q
 
 
 
 
IMPVAL2 S L1=""
IMPVA21 S L1=$O(@%LIB@(L1))
 Q:L1=""
 S L2=""
IMPVA22 S L2=$O(@%LIB@(L1,L2))
 G:L2="" IMPVA21
 I @%LIB@(L1,L2)["IMPLICITE" S @%LIB@(L1,L2)=$$ZSUBST^%QZCHSUB(@%LIB@(L1,L2),"IMPLICITE","IMPLICI")
 G IMPVA22

