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

;%QSXSTO^INT^1^59547,73884^0
QSXSTO ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
IN(BASE,ADRS,ADRD,VISU) 
 N I,IND,CARDS,CARDD
 S IND=$O(@ADRS@("")),CARDD=0,DX=0,DY=23
 F CARDS=0:1 Q:IND=""  D IN1 S IND=$O(@ADRS@(IND))
 S @ADRD@(ADRS,"NOMBRE.ORPHELINS")=CARDD
 S @ADRD@(ADRS,"NOMBRE.TOTAL")=CARDS
 Q
IN1 I VISU S DX=0,DY=23 X XY W $J("",20) S DX=0,DY=23 X XY W IND_"  "
 S IND1=IND
 I $$IR^%QSGEST5(BASE,IND)=1 W:VISU 1 Q
 S @ADRD@(ADRS,"IND",IND)="",CARDD=CARDD+1 W:VISU 0
 Q
LISTE(RESUL,VISU) 
 N I,LLISTE,STO,LISTE,J
 D ^%QCAGLTX("STOL^%QSXSTO","LLISTE")
 S STO=$O(LLISTE(""))
 F I=0:0 Q:STO=""  D LISTE1 S STO=$O(LLISTE(STO))
 Q
LISTE1 D IN("L0",STO,RESUL,VISU) Q
 
 
REQ(RESUL,VISU) 
 N I,LLISTE,STO,LISTE,J
 D ^%QCAGLTX("STOR^%QSXSTO","LLISTE")
 S STO=$O(LLISTE(""))
 F I=0:0 Q:STO=""  D IN("RQS",STO,RESUL,VISU) S STO=$O(LLISTE(STO))
 Q
 
ACT(STO,VISU) 
 K @(STO)
 D LISTE($$CONCAS^%QZCHAD(STO,"LISTE"),VISU)
 D REQ($$CONCAS^%QZCHAD(STO,"REQUETE"),VISU)
 Q
 
DEL(RESUL,OK,VISU) 
 N I,J,LOC,IND
 S LOC=$O(@RESUL@(""))
 F I=0:0 Q:LOC=""  D DEL1 S LOC=$O(@RESUL@(LOC))
 Q
DEL1 S IND=$O(@RESUL@(LOC,"IND",""))
 F J=0:0 Q:IND=""  D DEL2 S IND=$O(@RESUL@(LOC,"IND",IND))
 Q
DEL2 K:OK @LOC@(IND) I VISU D POCLEPA^%VVIDEO W LOC,$J(IND,30)
 I $$IR^%QSGEST5("L0",IND)!$$IR^%QSGEST5("RQS",IND) D ^%VSQUEAK
 Q
DEL3 D DEL("^%QSXSTO(""LISTE"")",0,1)
 D DEL("^%QSXSTO(""REQUETE"")",0,1)
 Q
 
TOTAL(STO,OK,VISU) D ACT(STO,VISU)
 D DEL($$CONCAS^%QZCHAD(STO,"LISTE"),OK,VISU)
 D DEL($$CONCAS^%QZCHAD(STO,"REQUETE"),OK,VISU)
 D TR(VISU)
 Q
 
TEST(STO) 
 D TOTAL(STO,1,1) Q
 
JTEST X ^CIAT D TOTAL("^%QSXSTO(QUI)",1,0)
 Q
JTESTB X ^BTL D TOTAL("^%QSXSTO(QUI)",1,0)
 K ^%QSXSTO
 Q
 
STOL ;;|"^[QUI]PART"||
 ;;|"^[QUI]RQS2"||
 ;;|"^[QUI]ZLIGCALC"||
 ;;|"^[QUI]ZLIGCOMP"||
 ;;|"^[QUI]ZLIGDUPL"||
 ;;|"^[QUI]ZLIGTOID"||
 ;;|"^[QUI]ZLIGTRAI"||
 ;;|"^[QUI]ZLIGVALE"||
 ;;|"^[QUI]ZLIGCNI"||
 ;;|"^[QUI]ZLIGCNP"||
 ;;|"^[QUI]ZLIGPIPR"||
 ;;
TRI ;;|"^[QUI]ZLIGTRIE"||
 ;;
 
STOR ;;|"^[QUI]RQS1"||
 ;;
 
 
 
 
 
TR(VISU) 
 N TEMP,MARQUE,LISTES,LISTE,I,TRIEE,STO,STO1
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S MARQUE=$$CONCAS^%QZCHAD(TEMP,"MARQUE")
 S STO=$$CONCAS^%QZCHAD(TEMP,"STO")
 S LISTES=$$LISTIND^%QSGEST6("L0")
 S LISTE=$O(@LISTES@(""))
 F I=0:0 Q:LISTE=""  D TR1 S LISTE=$O(@LISTES@(LISTE))
 D ^%QCAGLTX("TRI^%QSXSTO",STO)
 S STO1=$O(@STO@(""))
 F I=0:0 Q:STO1=""  D TR2 S STO1=$O(@STO@(STO1))
 K @(TEMP)
 Q
TR1 S TRIEE=$$^%QSCALVA("L0",LISTE,"TRIEE")
 I TRIEE="" D PSV^%QSGESTI("L0",LISTE,"TRIABLE") I VISU W !,LISTE," n'a pas de liste triee " Q
 I '($D(@TRIEE)) D PSV^%QSGESTI("L0",LISTE,"TRIABLE"),PSV^%QSGESTI("L0",LISTE,"TRIEE") I VISU=1 W !,LISTE," n'a plus de liste triee " Q
 S @MARQUE@(TRIEE)=""
 I VISU W !,LISTE," marque ",TRIEE
 Q
TR2 N J,LISTE,ADR
 S LISTE=$O(@STO1@(""))
 F J=0:0 Q:LISTE=""  D TR3 S LISTE=$O(@STO1@(LISTE))
 Q
TR3 S ADR=$$CONCAS^%QZCHAD(STO1,LISTE)
 I VISU W !,ADR
 I $D(@MARQUE@(ADR))'=0,VISU W "marque" Q
 K @(ADR) I VISU W "non marque"
 Q

