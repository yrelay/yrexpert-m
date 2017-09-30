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

;%SRSTVA3^INT^1^59547,73891^0
SRSTVA3 ;
 
 
 
 
 
 S ADRCOMP2=$$CONCAS^%QZCHAD(ADRCOMP,"LIENS,V")
 S ADRCOMP3=$E(ADRCOMP2,1,$L(ADRCOMP2)-1)_","
 S ADRCOMP4=$$CONCAS^%QZCHAD(ADRCOMP,"LIENS,C")
 S ADRCOMP5=$E(ADRCOMP4,1,$L(ADRCOMP4)-1)_","
 S P=""
 F N=0:1 S P=$O(@ADR@("LIENS",P)) Q:P=""  D VERL S OKTOT=OKTOT&OK I OK=1 D SUP^%SRSTVAL
 G:'(OKTOT) ATT
 S @ADRCOMP2="S I="""" F %I=0:0 S I=$O("_ADRCOMP3_"I)) Q:I=""""  S OK=1 X "_ADRCOMP3_"I) S OKTOT=OKTOT&OK"
 S @ADRCOMP4="S I="""" F %I=0:0 S I=$O("_ADRCOMP5_"I)) Q:I=""""  X "_ADRCOMP5_"I)"
 
ATT 
 G ^%SRSTVA4
 
AFF 
 G:'(INTERACT) FAFF
 S DX=0,DY=3 D CLEBAS^%VVIDEO
 G:'($D(@ERR)) AFF2
 I LMAX=0 S LMAX=20
 S %R=4 D PARAM^%PKPOP("30\CWHRL\1\\\  erreurs trouvees ")
 S I=$$UN^%PKCHOIX(ERR,(40-(LMAX/2))\1,8,12)
 S DX=0,DY=3 D CLEBAS^%VVIDEO
AFF2 
 I '($D(@WAR)) G FAFF
 S %R=4 D PARAM^%PKPOP("30\CWHRL\1\\\  W A R N I N G  ")
 S A=$$UN^%PKCHOIX(WAR,(40-(LMAX/2))\1,8,12)
 K @(WAR)
FAFF I $D(@ERR) K @(ADRCOMP) Q:INTERACT  Q 0
 Q:INTERACT
 Q 1
 
 
 
VERL 
 D INS^%SRSTVAL("====== "_$$^%QZCHW("LIEN NO")_" "_P,1)
 I (P+0)'=P D INS^%SRSTVAL("  "_$$^%QZCHW("numero non numerique"),0)
 S CONT=@ADR@("LIENS",P)
 S VERI=$P(CONT,$C(0),5)
 I "ON"'[VERI D INS^%SRSTVAL("  "_$$^%QZCHW("existence = O/N"),0)
 
 S L=$P(CONT,$C(0),2)
 I '($$EXPRESS^%SRANAL(L,.COMP,.CHAMP,.MES)) D INS^%SRSTVAL("  "_$$^%QZCHW("lien")_" : "_MES,0) G INDS
 I $D(CHAMP) D CHAMP^%SRSTVAL("  "_$$^%QZCHW("lien"),"CHAMP")
INDS 
 S IS=$P(CONT,$C(0),3)
 I '($$INDIV^%SRANAL(IS,.COMP2,.I1,.MES)) D INS^%SRSTVAL("  "_$$^%QZCHW("indiv source")_" : "_MES,0) G INDD
 I $$INDSYM^%SRSTVA4("  "_$$^%QZCHW("indiv source"),I1)=0 S OK=0
INDD 
 S ID=$P(CONT,$C(0),4)
 I '($$INDIV^%SRANAL(ID,.COMP3,.I2,.MES)) D INS^%SRSTVAL("  "_$$^%QZCHW("indiv destination")_" : "_MES,0) Q
 I $$INDSYM^%SRSTVA4("  "_$$^%QZCHW("indiv destination"),I2)=0 Q
 G:$D(CHAMP) COMPLI
 G:('($D(SAVIND(I1))))!('($D(SAVIND(I2)))) COMPLI
 S @("L="_COMP)
 
 S R1=SAVIND(I1,"R"),R2=SAVIND(I2,"R")
 I $$TYPE^%QSGEST9($$NOMINT^%QSF(R1),L)<3 D INSWAR^%SRSTVAL($$^%QZCHW("Le lien")_" "_L_" "_$$^%QZCHW("n'est ni relationnel, ni involutif"))
 I $$EXLIEN^%QSGEL2($$NOMINT^%QSF(R1),$$NOMINT^%QSF(R2),L)=0 D INSWAR^%SRSTVAL($$^%QZCHW("Le lien")_" "_L_" "_$$^%QZCHW("ne relie pas les repertoires")_" "_R1_" et "_R2)
 S @ADRGEN@(NOGEN)="I $$TYPE^%QSGEST9($$NOMINT^%QSF("""_R1_"""),"""_L_""")<3 D ADDER^%SRSTOCK("""_$$^%QZCHW("Le lien")_" "_L_" "_$$^%QZCHW("n'est ni relationnel, ni involutif")_""") S OK=0",NOGEN=NOGEN+1
 S @ADRGEN@(NOGEN)="I $$EXLIEN^%QSGEL2($$NOMINT^%QSF("""_R1_"""),$$NOMINT^%QSF("""_R2_"""),"""_L_""")=0 D ADDER^%SRSTOCK("""_$$^%QZCHW("Le lien")_" "_L_" "_$$^%QZCHW("ne relie pas les repertoires")_" "_R1_" et "_R2_""") S OK=0",NOGEN=NOGEN+1
 S COMPIL=$S(VERI="O":"S OK=$$EXILIEN^%QSGES21(%INDI("_I1_"),"_COMP_",%INDI("_I2_"))",1:"")
 G AFFLI
 
COMPLI 
 S COMPIL="S:'$D(%INDI("_I1_"))!'$D(%INDI("_I2_")) OK=0 I OK X "_ADRCOMP3_P_",1) I OK X "_ADRCOMP3_P_",2)"
 S @ADRCOMP2@(P,1)="I $$TYPE^%QSGEST9(%INDI("_I1_",""RI""),"_COMP_")<3 S OK=0 D ADDER("""_$$^%QZCHW("Le lien")_" ""_"_COMP_"_"" "_$$^%QZCHW("n'est ni relationnel, ni involutif")_""")"
 S @ADRCOMP2@(P,2)="I $$EXLIEN^%QSGEL2(%INDI("_I1_",""RI""),%INDI("_I2_",""RI""),"_COMP_")=0 S OK=0 D ADDER("""_$$^%QZCHW("Le lien")_" ""_"_COMP_"_"" "_$$^%QZCHW("ne relie pas les repertoires")_" ""_%INDI("_I1_",""R"")_"" "_$$^%QZCHW("et")_" """
 S @ADRCOMP2@(P,2)=@ADRCOMP2@(P,2)_"_%INDI("_I2_",""R""))"
 S:VERI="O" COMPIL=COMPIL_" I OK S OK=$$EXILIEN^%QSGES21(%INDI("_I1_"),"_COMP_",%INDI("_I2_"))"
 
AFFLI S @ADRCOMP2@(P)=COMPIL
 S @ADRCOMP4@(P)="D ADDS^%QSGEST3(%INDI("_I1_",""RI""),%INDI("_I1_"),"_COMP_",%INDI("_I2_",""RI""),%INDI("_I2_"))"
 Q

