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

;%SRSTVA2^INT^1^59547,73891^0
SRSTVA2 ;
 
 
 
 
INIT 
 N GL
 S LMAX=0,CPT=0,CPTW=0,OKTOT=1
 
 
 S ADR=$$CONCAT^%QZCHAD($$ADRS^%SRDESTI,""""_SA_"""")
 
 S ADRCOMP=$$ADRC^%SRSTVAL(SA)
 
 S GLOC=$$ADR^%SRCOMP(SA)
 S GL=$$ADRERWA^%SRSTVAL(SA) K @(GL)
 
 S ERR=$$CONCAS^%QZCHAD(GL,"ERR")
 
 S WAR=$$CONCAS^%QZCHAD(GL,"WAR")
 
 K @(ADRCOMP)
 D ATT^%PKUTIL(25,6,$$^%QZCHW("validation en cours")_" ...","HRL")
 
 S ADRGEN=$$CONCAS^%QZCHAD(ADRCOMP,"GEN"),NOGEN=1
 Q
 
 
 
IL S ADRCOMP2=$$CONCAS^%QZCHAD(ADRCOMP,"INDL,V")
 S ADRCOMP3=$E(ADRCOMP2,1,$L(ADRCOMP2)-1)_","
 S ADRCOMP4=$$CONCAS^%QZCHAD(ADRCOMP,"INDL,C")
 S ADRCOMP5=$E(ADRCOMP4,1,$L(ADRCOMP4)-1)_","
 S P=""
 F N=0:1 S P=$O(@ADR@("INDLIENS",P)) Q:P=""  D VERIL S OKTOT=OKTOT&OK I OK=1 D SUP^%SRSTVAL
 G:'(OKTOT) SUIT
 S @ADRCOMP2="S I="""" F %I=0:0 S I=$O("_ADRCOMP3_"I)) Q:I=""""  S OK=1 X "_ADRCOMP3_"I) S OKTOT=OKTOT&OK"
 S @ADRCOMP4="S I="""" F %I=0:0 S I=$O("_ADRCOMP5_"I)) Q:I=""""  X "_ADRCOMP5_"I)"
 
SUIT 
 G ^%SRSTVA3
 
 
 
VERIL 
 D INS^%SRSTVAL("====== "_$$^%QZCHW("INDIVIDU LIEN NO")_" "_P,1)
 I (P+0)'=P D INS^%SRSTVAL("  "_$$^%QZCHW("numero non numerique"),0)
 S CONT=@ADR@("INDLIENS",P)
 S VERI=$P(CONT,$C(0),5)
 I "ON"'[VERI D INS^%SRSTVAL("  "_$$^%QZCHW("existence = O/N"),0)
 
 S IS=$P(CONT,$C(0),3)
 I '($$INDIV^%SRANAL(IS,.COMP1,.I1,.MES)) D INS^%SRSTVAL("  "_$$^%QZCHW("indiv source")_" : "_MES,0) G DEST
 I $$INDSYM^%SRSTVA4("  "_$$^%QZCHW("Indiv source"),I1)=0 G DEST
 
DEST S ID=$P(CONT,$C(0),4)
 I '($$INDIV^%SRANAL(ID,.COMP2,.I2,.MES)) D INS^%SRSTVAL("  "_$$^%QZCHW("indiv destination")_" : "_MES,0) G NOMLIE
 I $$INDSYM^%SRSTVA4(" "_$$^%QZCHW("Indiv destination")_" : ",I2)=0 G NOMLIE
 
NOMLIE S L=$P(CONT,$C(0),2)
 I '($$EXPRESS^%SRANAL(L,.COMP,.CHAMP,.MES)) D INS^%SRSTVAL("  "_$$^%QZCHW("lien")_" : "_MES,0) Q
 I $D(CHAMP) D CHAMP^%SRSTVAL("  "_$$^%QZCHW("Lien"),"CHAMP")
 Q:'(OK)
 G:$D(CHAMP) COMPLI
 G:('($D(SAVIND(I1))))!('($D(SAVIND(I2)))) COMPLI
 S @("L="_COMP)
 
 S R1=SAVIND(I1,"R"),R2=SAVIND(I2,"R"),OKW=1
 I $$EXLIEN^%QSGEL2($$NOMINT^%QSF(R1),$$NOMINT^%QSF(R2),L)=0 D INSWAR^%SRSTVAL("  "_$$^%QZCHW("Le lien")_" "_L_" "_$$^%QZCHW("ne relie pas les repertoires")_" "_R1_" et "_R2) S OKW=0
 S @ADRGEN@(NOGEN)="S OK=$$EXLIEN^%QSGEL2($$NOMINT^%QSF("""_R1_"""),$$NOMINT^%QSF("""_R2_"""),"""_L_""") D:'OK ADDER^%SRSTOCK("""_"  "_$$^%QZCHW("Le lien")_" "_L_" "_$$^%QZCHW("ne relie pas les repertoires")_" "_R1_" et "_R2_""")",NOGEN=NOGEN+1
 S COMPIL="S INDLI=$$NOML^%QSGES20(%INDI("_I1_"),%INDI("_I2_"),"""_L_""",%INDI("_I2_")) S %INDLI("_P_")=INDLI,%INDLI("_P_",""RI"")=$$ONE^%QSGEL3(""LIEN""),%INDLI("_P_",""R"")=""LIEN"""
 S:VERI="O" COMPIL=COMPIL_" I '$$IR^%QSGE5(%INDLI("_P_",""RI""),%INDLI("_P_")) S OK=0 D ADDER("""_$$^%QZCHW("Individu lien")_" "_P_" "_$$^%QZCHW("inexistant")_""")"
 G:'(OKW) AFFLI
 S L=$$NOML^%QSGES20(SAVIND(I1),SAVIND(I2),L,SAVIND(I2))
 S SAVLIND(P)=L,SAVLIND(P,"R")="LIEN"
 G AFFLI
COMPLI 
 S COMPIL="S:'$D(%INDI("_I1_"))!'$D(%INDI("_I2_")) OK=0 I OK X "_ADRCOMP3_P_",1) I OK X "_ADRCOMP3_P_",2)"
 S @ADRCOMP2@(P,1)="I $$EXLIEN^%QSGEL2(%INDI("_I1_",""RI""),%INDI("_I2_",""RI""),"_COMP_")=0 S OK=0 D ADDER("""_$$^%QZCHW("Le lien")_" ""_"_COMP_"_"" "_$$^%QZCHW("ne relie pas les repertoires")_" ""_%INDI("_I1_",""R"")_"" "_$$^%QZCHW("et")_" """
 S @ADRCOMP2@(P,1)=@ADRCOMP2@(P,1)_"_%INDI("_I2_",""R""))"
 S @ADRCOMP2@(P,2)="S INDLI=$$NOML^%QSGES20(%INDI("_I1_"),%INDI("_I2_"),"_COMP_",%INDI("_I2_")) S %INDLI("_P_")=INDLI,%INDLI("_P_",""RI"")=$$ONE^%QSGEL3(""LIEN""),%INDLI("_P_",""R"")=""LIEN"""
 S:VERI="O" COMPIL=COMPIL_" I OK I '$$IR^%QSGE5(%INDLI("_P_",""RI""),%INDLI("_P_")) S OK=0 D ADDER("""_$$^%QZCHW("Individu lien")_" "_P_" "_$$^%QZCHW("inexistant")_""")"
 
AFFLI S @ADRCOMP2@(P)=COMPIL
 S @ADRCOMP4@(P)="D:'$$EXILIEN^%QSGES21(%INDI("_I1_"),"_COMP_",%INDI("_I2_")) ADDS^%QSGEST3(%INDI("_I1_",""RI""),%INDI("_I1_"),"_COMP_",%INDI("_I2_",""RI""),%INDI("_I2_")),ADDIND(%INDLI("_P_",""RI""),%INDLI("_P_"))"
 Q

