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

;%SRSTVA5^INT^1^59547,73891^0
SRSTVA5 ;
 
 
 
 
 
 
COMPAT G:$D(CHAMP2) COMPAI
 G:'($D(SAVIND(INDI))) COMPAI
 S @("AT="_COMP2)
 S RI=$$NOMINT^%QSF(SAVIND(INDI,"R"))
 I '($$CONTAT^%SRSTOCK(RI,AT,.MER)) D INSWAR^%SRSTVAL(MER)
 S @ADRGEN@(NOGEN)="I '$$CONTAT^%SRSTOCK("""_RI_""","""_AT_""",.MESS) D ADDER^%SRSTOCK(MESS) S OK=0",NOGEN=NOGEN+1
 I '($D(PART)) S:COMP4="" COMP4=1 S @ADRCOMP4@(P)=@ADRCOMP4@(P)_"D PA^%QSGESTI("""_RI_""","""_SAVIND(INDI)_""","""_AT_""","_COMP3_","_COMP4_")" Q
 G:$D(PART("A")) AJ1
 G:$D(PART("C")) CUM1
 S:COMP4="" COMP4=1
 S @ADRCOMP4@(P)="S OK=$$^%QMDASAI("_COMP3_",.VAL) D:OK PA^%QSGESTI("""_RI_""","""_SAVIND(INDI)_""","""_AT_""",VAL,"_COMP4_")"
 Q
AJ1 
 I COMP4="" S @ADRCOMP4@(P)="D:'$$AIR^%QSGE5("""_RI_""","""_SAVIND(INDI)_""","""_AT_""") PA^%QSGESTI("""_RI_""","""_SAVIND(INDI)_""","""_AT_""","_COMP3_",1)" Q
 S @ADRCOMP4@(P)="D:'$$OAIR^%QSGE5("""_RI_""","""_SAVIND(INDI)_""","""_AT_""","_COMP4_") PA^%QSGESTI("""_RI_""","""_SAVIND(INDI)_""","""_AT_""","_COMP3_","_COMP4_")"
 Q
CUM1 I COMP4="" S @ADRCOMP4@(P)="S VAL=$$^%QSCALVA("""_RI_""","""_SAVIND(INDI)_""","""_AT_""") D PA^%QSGESTI("""_RI_""","""_SAVIND(INDI)_""","""_AT_""",VAL+("_COMP3_"),1)" Q
 S @ADRCOMP4@(P)="S VAL=$$^%QSCALIN("""_RI_""","""_SAVIND(INDI)_""","""_AT_""","_COMP4_") D PA^%QSGESTI("""_RI_""","""_SAVIND(INDI)_""","""_AT_""",VAL+("_COMP3_"),"_COMP4_")"
 Q
 
COMPAI S @ADRCOMP2@(P)="I $D(%INDI("_INDI_")) S OK=$$CONTAT(%INDI("_INDI_",""RI""),"_COMP2_",.MER) D:'OK ADDER(MER)"
 I '($D(PART)) S:COMP4="" COMP4=1 S @ADRCOMP4@(P)="I $D(%INDI("_INDI_")) D PA^%QSGESTI(%INDI("_INDI_",""RI""),%INDI("_INDI_"),"_COMP2_","_COMP3_","_COMP4_")" Q
 G:$D(PART("A")) AJ2
 G:$D(PART("C")) CUM2
 
 S:COMP4="" COMP4=1
 S @ADRCOMP4@(P)="I $D(%INDI("_INDI_")) S OK=$$^%QMDASAI("_COMP3_",.VAL) D:OK PA^%QSGESTI(%INDI("_INDI_",""RI""),%INDI("_INDI_"),"_COMP2_",VAL,"_COMP4_")"
 Q
AJ2 
 I COMP4="" S @ADRCOMP4@(P)="I $D(%INDI("_INDI_")) D:'$$AIR^%QSGE5(%INDI("_INDI_",""RI""),%INDI("_INDI_"),"_COMP2_") PA^%QSGESTI(%INDI("_INDI_",""RI""),%INDI("_INDI_"),"_COMP2_","_COMP3_",1)" Q
 S @ADRCOMP4@(P)="I $D(%INDI("_INDI_")) D:'$$OAIR^%QSGE5(%INDI("_INDI_",""RI""),%INDI("_INDI_"),"_COMP2_","_COMP4_") PA^%QSGESTI(%INDI("_INDI_",""RI""),%INDI("_INDI_"),"_COMP2_","_COMP3_","_COMP4_")"
 Q
CUM2 I COMP4="" S @ADRCOMP4@(P)="S VAL=$$^%QSCALVA(%INDI("_INDI_",""RI""),%INDI("_INDI_"),"_COMP2_") D PA^%QSGESTI(%INDI("_INDI_",""RI""),%INDI("_INDI_"),"_COMP2_",VAL+("_COMP3_"),1)" Q
 S @ADRCOMP4@(P)="S VAL=$$^%QSCALIN(%INDI("_INDI_",""RI""),%INDI("_INDI_"),"_COMP2_","_COMP4_") D PA^%QSGESTI(%INDI("_INDI_",""RI""),%INDI("_INDI_"),"_COMP2_",VAL+("_COMP3_"),"_COMP4_")"
 Q
 ;

