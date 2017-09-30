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

;%SRSTVAL^INT^1^59547,73891^0
SRSTVAL ;
 
 
 
 
 
 N SA,INTERACT
CHS 
 S INTERACT=1
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Choisissez une definition de transfert"),0)
 S SA=$$UN^%PKCHOIX($$ADRS^%SRDESTI,30,3,17)
 Q:SA=""
 D DEB
 G CHS
 
ACT(SA,INTERACT) 
 
DEB N ADR,ADRCOMP,CONT,CPT,ERR,GLOC,I,L,OK,N,P,R,MES,X,Y,PK,WAR,CPTW
 N COMP,CHAMP,CHAMP2,COMP1,COMP2,ADRCOMP2,ADRCOMP3,COMPIL,COMP3,CHAMP3
 N SAVIND,I1,I2,VERI,ADRCOMP4,ADRGEN,NOGEN,COMP4,CHAMP4,ADRCOMP5,OKTOT
 G:'(INTERACT) DEB2
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Validation du transfert")_" "_SA,0)
 K Y
 S Y(1)=$$^%QZCHW("ATTENTION, vous allez supprimer la compilation existante")_" : "
 S Y(2)=$J("",6)_"   "_$$^%QZCHW("assurez-vous qu'aucun transfert n'est en cours.")
 S Y="10\CWDHRLY\1\\\"
 S %R=6 D PARAM^%PKPOP(.Y) K Y
 I $$POCLE^%PKOUNO(" confirmation ","N")'=1 Q
DEB2 S DX=0,DY=3 D CLEBAS^%VVIDEO
 D INIT^%SRSTVA2
 
 
 S ADRCOMP2=$$CONCAS^%QZCHAD(ADRCOMP,"IND,V")
 S ADRCOMP3=$E(ADRCOMP2,1,$L(ADRCOMP2)-1)_","
 S ADRCOMP4=$$CONCAS^%QZCHAD(ADRCOMP,"IND,C")
 S ADRCOMP5=$E(ADRCOMP4,1,$L(ADRCOMP4)-1)_","
 S P=""
 F N=0:1 S P=$O(@ADR@("INDIVIDUS",P)) Q:P=""  D VERI S OKTOT=OKTOT&OK I OK=1 D SUP
 G:'(OKTOT) IL
 S @ADRCOMP2="S I="""" F %I=0:0 S I=$O("_ADRCOMP3_"I)) Q:I=""""  S OK=1 X "_ADRCOMP3_"I) S OKTOT=OKTOT&OK"
 S @ADRCOMP4="S I="""" F %I=0:0 S I=$O("_ADRCOMP5_"I)) Q:I=""""  X "_ADRCOMP5_"I)"
 
IL 
 G IL^%SRSTVA2
 
 
 
INS(M,O) 
 S CPT=CPT+1
 S @ERR@($J(CPT,2)_". "_$E(M,1,71))="",LMAX=$S($L(M)<72:$L(M),1:72)
 S OK=O
 Q
 
INSWAR(M) 
 S CPTW=CPTW+1
 S @WAR@($J(CPTW,2)_". "_$E(M,1,71))="",LMAX=$S($L(M)<72:$L(M),1:72)
 Q
 
SUP 
 N M
 S M=$ZP(@ERR@("")) Q:M=""
 K @ERR@(M)
 S CPT=CPT-1
 Q
 
VERI 
 D INS("====== "_$$^%QZCHW("INDIVIDU NO")_" "_P,1)
 I (P+0)'=P D INS("  "_$$^%QZCHW("numero non numerique"),0)
 S CONT=@ADR@("INDIVIDUS",P)
 S VERI=$P(CONT,$C(0),5)
 I "NO"'[VERI D INS("  "_$$^%QZCHW("existence = O/N"),0)
 
 S R=$P(CONT,$C(0),2)
 I '($$EXPRESS^%SRANAL(R,.COMP,.CHAMP,.MES)) D INS("  "_$$^%QZCHW("repertoire")_" : "_MES,0) G INDNOM
 I $D(CHAMP) D CHAMP("  "_$$^%QZCHW("repertoire")_" "_R,"CHAMP") G INDNOM
 S @("R="_COMP),OKW=1
 I $$REPM^%QSGEST9(R)'=2 D INSWAR("  "_R_" "_$$^%QZCHW("n'est pas un repertoire du modele installe")) S OKW=0
 
INDNOM S I=$P(CONT,$C(0),3)
 I '($$EXPRESS^%SRANAL(I,.COMP2,.CHAMP2,.MES)) D INS("  "_$$^%QZCHW("individu")_" : "_MES,0) G ORDRE
 I $D(CHAMP2) D CHAMP("  "_$$^%QZCHW("individu")_" "_I,"CHAMP2") G ORDRE
 S @("I="_COMP2)
 I '($D(CHAMP)) S MES=$$NOMOK^%QSGEIND(R,I) I MES'="" D INSWAR("  "_MES) S OKW=0
ORDRE S ORD=$P(CONT,$C(0),4)
 I ORD="" S COMP4="""""" G INDCOMP
 I '($$EXPRESS^%SRANAL(ORD,.COMP4,.CHAMP4,.MES)) D INS("  "_$$^%QZCHW("numero d'ordre")_" : "_MES,0) G INDCOMP
 I $D(CHAMP4) D CHAMP("  "_$$^%QZCHW("no d'ordre")_" "_ORD,"CHAMP4")
 
INDCOMP Q:'(OK)
 S COMPIL="S OK=1,INDI="_COMP2_",%INDI("_P_")=INDI,REP="_COMP_",%INDI("_P_",""R"")=REP,REPI=$$NOMINT^%QSF(REP),%INDI("_P_",""RI"")=REPI X "_ADRCOMP3_P_",""R"") K:'OK %INDI("_P_")"
 S:'($D(CHAMP)) @ADRGEN@(NOGEN)="S OK=($$REPM^%QSGEST9("""_R_""")=2) D:OK=0 ADDER^%SRSTOCK("""_R_" "_$$^%QZCHW("n'est pas un repertoire du modele installe")_""")",NOGEN=NOGEN+1
 S:('($D(CHAMP)))&('($D(CHAMP2))) @ADRGEN@(NOGEN)="S MERR=$$NOMOK^%QSGEIND("""_R_""","""_I_""") I MERR'="""" S OK=0 D ADDER^%SRSTOCK(MERR)",NOGEN=NOGEN+1
 S @ADRCOMP2@(P,"R")=$S('($D(CHAMP)):"",1:"S OK=($$REPM^%QSGEST9(REP)=2) D:OK=0 ADDER(REP_"""_" "_$$^%QZCHW("n'est pas un repertoire du modele installe")_""") ")_"X:OK "_ADRCOMP3_P_",""I"")"
 S @ADRCOMP2@(P,"I")=$S(('($D(CHAMP)))&('($D(CHAMP2))):"",1:"S MERR=$$NOMOK^%QSGEIND(REP,INDI) I MERR'="""" S OK=0 D ADDER(MERR)")
 S:VERI="O" COMPIL=COMPIL_" I OK I '$$IR^%QSGE5(REPI,INDI) D ADDER("""_P_" : "_$$^%QZCHW("Individu inexistant")_""") S OK=0 K %INDI("_P_")"
 S @ADRCOMP2@(P)=COMPIL
 S @ADRCOMP4@(P)="S MER="""" S OK='$$CREPER^%QSGEIND(%INDI("_P_",""RI""),%INDI("_P_"),"_COMP4_",.MER) D:OK=1 ADDIND(%INDI("_P_",""RI""),%INDI("_P_")) I OK=0 D ADDER(MER) K %INDI("_P_")"
 S:(('($D(CHAMP2)))&('($D(CHAMP))))&OKW SAVIND(P)=I,SAVIND(P,"R")=R
 Q
 
CHAMP(M,GL) 
 N CH
 S CH=""
BCH S CH=$O(@GL@(CH)) Q:CH=""
 I '($D(@GLOC@("CHAMPS",CH))) D INS(M_" : "_CH_" "_$$^%QZCHW("ne correspond pas a un champ ds le masque"),0)
 G BCH
 
ADRERWA(SA) N A
 S A=$$CONCAT^%QZCHAD("^[QUI]RQSDON(""SR"",""STOVAL"")",""""_SA_"""")
 Q A
 
ADRC(SA) N A
 S A=$$CONCAT^%QZCHAD("^[QUI]RQSDON(""SR"",""STOCOMP"")",""""_SA_"""")
 Q A

