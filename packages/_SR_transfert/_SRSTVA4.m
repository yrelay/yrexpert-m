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

;%SRSTVA4^INT^1^59547,73891^0
SRSTVA4 ;
 
 
 
 
 
 S P=""
 S ADRCOMP2=$$CONCAS^%QZCHAD(ADRCOMP,"ATTRI,V")
 S ADRCOMP4=$$CONCAS^%QZCHAD(ADRCOMP,"ATTRI,C")
 F N=0:1 S P=$O(@ADR@("ATTRIBUTS",P)) Q:P=""  D VERA S OKTOT=OKTOT&OK I OK=1 D SUP^%SRSTVAL
 G:'(OKTOT) AFF
 S ADRCOMP5=$E(ADRCOMP2,1,$L(ADRCOMP4)-1)_","
 S @ADRCOMP2="S I="""" F %I=0:0 S I=$O("_ADRCOMP5_"I)) Q:I=""""  S OK=1 X "_ADRCOMP5_"I) S OKTOT=OKTOT&OK"
 S ADRCOMP5=$E(ADRCOMP4,1,$L(ADRCOMP4)-1)_","
 S @ADRCOMP4="S I="""" F %I=0:0 S I=$O("_ADRCOMP5_"I)) Q:I=""""  X "_ADRCOMP5_"I)"
 S ADRCOMP5=$E(ADRGEN,1,$L(ADRGEN)-1)_","
 S @ADRGEN="S I="""" F %I=0:0 S I=$O("_ADRCOMP5_"I)) Q:I=""""  X "_ADRCOMP5_"I) S OKTOT=OKTOT&OK"
 
AFF G AFF^%SRSTVA3
 
 
 
VERA 
 D INS^%SRSTVAL("====== "_$$^%QZCHW("ATTRIBUT NO")_" "_P,1)
 I (P+0)'=P D INS^%SRSTVAL("  "_$$^%QZCHW("numero non numerique"),0)
 S CONT=@ADR@("ATTRIBUTS",P)
 
 S I=$P(CONT,$C(0),2)
 I '($$INDIVIDU^%SRANAL(I,.COMP,.INDI,.INDLIEN,.MES)) D INS^%SRSTVAL("  "_$$^%QZCHW("indiv symbolique")_" : "_MES,0) G ATR
 I INDI'="",$$INDSYM("  "_$$^%QZCHW("individu symbolique"),INDI)=0 G ATR
 I INDLI'="",$$INDLSYM("  "_$$^%QZCHW("individu lien symbolique"),INDLI)=0 G ATR
ATR 
 S A=$P(CONT,$C(0),3)
 I '($$EXPRESS^%SRANAL(A,.COMP2,.CHAMP2,.MES)) D INS^%SRSTVAL("  "_$$^%QZCHW("attribut")_" : "_MES,0) G VAL
 I $D(CHAMP2) D CHAMP^%SRSTVAL("  "_$$^%QZCHW("attribut"),"CHAMP2")
VAL 
 S V=$P(CONT,$C(0),4)
 I '($$EXPRESS^%SRANAL(V,.COMP3,.CHAMP3,.MES)) D INS^%SRSTVAL("  "_$$^%QZCHW("valeur")_" : "_MES,0) G ORD
 I $D(CHAMP3) D CHAMP^%SRSTVAL("  "_$$^%QZCHW("valeur"),"CHAMP3")
ORD 
 S O=$P(CONT,$C(0),5)
 I O="" S COMP4="" G PART
 I '($$EXPRESS^%SRANAL(O,.COMP4,.CHAMP4,.MES)) D INS^%SRSTVAL("  "_$$^%QZCHW("numero d'ordre")_" : "_MES,0) Q
 I $D(CHAMP4) D CHAMP^%SRSTVAL("  "_$$^%QZCHW("no d'ordre"),"CHAMP4")
PART 
 S PA=$P(CONT,$C(0),6)
 I PA="" K PART G COMPAT
 I '($$PART^%SRANAL(PA,.PART,.MES)) D INS^%SRSTVAL("  "_$$^%QZCHW("particularites")_" : "_MES,0) Q
 
COMPAT Q:'(OK)
 G:INDI'="" COMPAT^%SRSTVA5
 
COMPAL G:$D(CHAMP2) COMPALI
 G:'($D(SAVLIND(INDLI))) COMPALI
 S @("AT="_COMP2)
 S RI=$$NOMINT^%QSF(SAVLIND(INDLI,"R"))
 I '($$CONTAT^%SRSTOCK(RI,AT,.MER)) D INSWAR^%SRSTVAL(MER)
 S @ADRGEN@(NOGEN)="I '$$CONTAT^%SRSTOCK("""_RI_""","""_AT_""",.MESS) D ADDER^%SRSTOCK(MESS) S OK=0",NOGEN=NOGEN+1
 I '($D(PART)) S:COMP4="" COMP4=1 S @ADRCOMP4@(P)="D PA^%QSGESTI("""_RI_""","""_SAVLIND(INDLI)_""","""_AT_""","_COMP3_","_COMP4_")" Q
 G:$D(PART("A")) AJ1
 G:$D(PART("C")) CUM1
 
 S:COMP4="" COMP4=1
 S @ADRCOMP4@(P)="S OK=$$^%QMDASAI("_COMP3_",.VAL) D:OK PA^%QSGESTI("""_RI_""","""_SAVLIND(INDLI)_""","""_AT_""",VAL,"_COMP4_")"
 Q
AJ1 
 I COMP4="" S @ADRCOMP4@(P)="D:'$$AIR^%QSGE5("""_RI_""","""_SAVLIND(INDLI)_""","""_AT_""") D PA^%QSGESTI("""_RI_""","""_SAVLIND(INDLI)_""","""_AT_""","_COMP3_",1)" Q
 S @ADRCOMP4@(P)="D:'$$OAIR^%QSGE5("""_RI_""","""_SAVLIND(INDLI)_""","""_AT_""","_COMP4_") D PA^%QSGESTI("""_RI_""","""_SAVLIND(INDLI)_""","""_AT_""","_COMP3_","_COMP4_")"
 Q
CUM1 
 I COMP4="" S @ADRCOMP4@(P)="S VAL=$$^%QSCALVA("""_RI_""","""_SAVLIND(INDLI)_""","""_AT_""") D PA^%QSGESTI("""_RI_""","""_SAVLIND(INDLI)_""","""_AT_""",VAL+("_COMP3_"),1)" Q
 S @ADRCOMP4@(P)="S VAL=$$^%QSCALIN("""_RI_""","""_SAVLIND(INDLI)_""","""_AT_""","_COMP4_") D PA^%QSGESTI("""_RI_""","""_SAVLIND(INDLI)_""","""_AT_""",VAL+("_COMP3_"),"_COMP4_")"
 Q
 
COMPALI S @ADRCOMP2@(P)="I $D(%INDLI("_INDLI_")) S OK=$$CONTAT(%INDLI("_INDLI_",""RI""),"_COMP2_",.MER) D:'OK ADDER(MER)"
 I '($D(PART)) S:COMP4="" COMP4=1 S @ADRCOMP4@(P)="I $D(%INDLI("_INDLI_")) D PA^%QSGESTI(%INDLI("_INDLI_",""RI""),%INDLI("_INDLI_"),"_COMP2_","_COMP3_","_COMP4_")" Q
 G:$D(PART("A")) AJ2
 G:$D(PART("C")) CUM2
 
 S:COMP4="" COMP4=1
 S @ADRCOMP4@(P)="I $D(%INDLI("_INDLI_")) S OK=$$^%QMDASAI("_COMP3_",.VAL) D:OK PA^%QSGESTI(%INDLI("_INDLI_",""RI""),%INDLI("_INDLI_"),"_COMP2_",VAL,"_COMP4_")"
 Q
AJ2 
 I COMP4="" S @ADRCOMP4@(P)="I $D(%INDLI("_INDLI_")) D:'$$AIR^%QSGEST5(%INDLI("_INDLI_",""RI""),%INDLI("_INDLI_"),"_COMP2_") PA^%QSGESTI(%INDLI("_INDLI_",""RI""),%INDLI("_INDLI_"),"_COMP2_","_COMP3_",1)" Q
 S @ADRCOMP4@(P)="I $D(%INDLI("_INDLI_")) D:'$$OAIR^%QSGEST5(%INDLI("_INDLI_",""RI""),%INDLI("_INDLI_"),"_COMP2_","_COMP4_") PA^%QSGESTI(%INDLI("_INDLI_",""RI""),%INDLI("_INDLI_"),"_COMP2_","_COMP3_","_COMP4_")"
 Q
CUM2 
 I COMP4="" S @ADRCOMP4@(P)="I $D(%INDLI("_INDLI_")) S VAL=$$^%QSCALVA(%INDLI("_INDLI_",""RI""),%INDLI("_INDLI_"),"_COMP2_") D PA^%QSGESTI(%INDLI("_INDLI_",""RI""),%INDLI("_INDLI_"),VAL+("_COMP2_"),"_COMP3_",1)" Q
 S @ADRCOMP4@(P)="I $D(%INDLI("_INDLI_")) S VAL=$$^%QSCALIN(%INDLI("_INDLI_",""RI""),%INDLI("_INDLI_"),"_COMP2_","_COMP4_") D PA^%QSGESTI(%INDLI("_INDLI_",""RI""),%INDLI("_INDLI_"),VAL+("_COMP2_"),"_COMP3_","_COMP4_")"
 Q
 
INDSYM(M,NUM) 
 I '($D(@ADR@("INDIVIDUS",NUM))) D INS^%SRSTVAL(M_" "_$$^%QZCHW("n'est pas defini"),0) Q 0
 Q 1
 
INDLSYM(M,NUM) 
 I '($D(@ADR@("INDLIENS",NUM))) D INS^%SRSTVAL(M_" "_$$^%QZCHW("n'est pas defini"),0) Q 0
 Q 1

