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

;%TLBACH3^INT^1^59547,74028^0
%TLBACH3 ;
EXEDIR() 
 N GLO,OLDP,TABC,I,NIV
 S GLO=$$CONCAS^%QZCHAD(GLOETD,"EXECUTION.DIRIGEE"),OLDP=0
 S NIV=$O(@GLO@(NIVEAU-1))
 I NIV="" S GLO=$$CONCAS^%QZCHAD(GLO,NIVEAU) G EXNORM
 S I=NIV I NIV=NIVEAU S OLDP=@GLO@(NIVEAU,"POSITION") G BCTUEX
 S @GLO@(NIVEAU,"ANCIEN.MODEX")=@GLO@(NIV,"ANCIEN.MODEX")
 S @GLO@(NIVEAU,"ANCIEN.EXEC")=@GLO@(NIV,"ANCIEN.EXEC") K @GLO@(NIV)
BCTUEX 
 S I=$O(@GLO@(I)) I I="" S GLO=$$CONCAS^%QZCHAD(GLO,NIVEAU) G BCLEXD
 K @GLO@(I) G BCTUEX
EXNORM 
 S @GLO@("ANCIEN.MODEX")=MODEX,@GLO@("ANCIEN.EXEC")=EXEC
BCLEXD 
 K TABC
 S TABC(1)="EXECUTER.UNE.REGLE",TABC(2)="SIMULER.UNE.REGLE"
 S TABC(3)="FORCER.UNE.ACTION"
 D EFFBAS^%TLBACH2
 S CHOIX=$$^%VZECHO("TABC")
 I (CHOIX=1)!(CHOIX=6) G FEXD
 I CHOIX=18 D REAF^%TLBAIF(0) G BCLEXD
 I (CHOIX'["REGLE")&(CHOIX'["ACTION") D ^%VSQUEAK G BCLEXD
CHOREG 
 D EFFBAS^%TLBACH2 W $$^%QZCHW("choisissez une regle")
 S OLDP=$$CHOIX^%TLBAGF2("TRT",1,OLDP)
 I OLDP="" S OLDP=0 G BCLEXD
 D EFFBAS^%TLBACH2
 S @GLO@("POSITION")=OLDP
 S @("NUMRG=$$CHREG"_ROUTPL_"("_OLDP_")")
 I NUMRG=0 D ^%VZEAVT("ligne non significative, choisissez une autre representation de la regle") G CHOREG
 I EXEC'=4 I @("$$REUSSI"_ROUTPL_"("_NUMRG_")")  I '($$MES^%VZEOUI($$^%QZCHW("cette regle a deja reussi, voulez-vous l'executer quand meme")_" ? ","N")) G CHOREG
 S @GLO@("NUMRG")=NUMRG,EXEC=2,MODEX=@GLO@("ANCIEN.MODEX")
 I CHOIX["ACTION" S EXEC=3 D ADD^%TLIFEN("LOG",$$^%QZCHW("forcage action"))
 I CHOIX["SIMULER" S MODEX=1 D ADD^%TLIFEN("LOG",$$^%QZCHW("simulation d'une regle"))
 I CHOIX["EXECUTER" D ADD^%TLIFEN("LOG",$$^%QZCHW("execution d'une regle"))
 S @GLO@("MODEX")=MODEX,@GLO@("EXEC")=EXEC
 S @GLOETD@("HEURE.DEBUT")=$H
 Q 1
FEXD 
 S MODEX=@GLO@("ANCIEN.MODEX"),EXEC=@GLO@("ANCIEN.EXEC")
 K @(GLO) D REAF^%TLBAIF(2)
 I EXEC'=4 S @("NUMRG=$$REGCOU"_ROUTPL) D POINTER^%TLBAGF1("TRT",L)
 Q 0
 
LISTE 
 N OLDP,I
 S OLDP=0
CHOBJ 
 D EFFBAS^%TLBACH2 W $$^%QZCHW("choisissez un individu")
 S OLDP=$$CHOIX^%TLBAGF2("LIS",1,OLDP)
 I OLDP="" D REAF^%TLBAGF1("LIS",0) Q
 S I=NIVEAU
RECNIV I '($D(@GLOETD@(I,"INDIVIDUS",OLDP))) S I=I-1 G RECNIV
 S OBJ=@GLOETD@(I,"INDIVIDUS",OLDP),BA=CXT("@","BASE")
 D CLEPAG^%VVIDEO,80^%VVIDEO
 D MODE^%QSATTRI(OBJ,BA,0,2,80,20,0)
 D REAF^%TLBAIF(0)
 G CHOBJ
 
CONTXT 
 N BA,OBJ,TITRE,TABC,MNCXT
 S MNCXT=$$TEMP^%SGUTIL
 D MKMNCXT
BCLACC 
 D MNCXT
 
 
 
 
 
 
 I CHOIX["DONNEES" D VISU G BCLACC
 I CHOIX["INDIVIDUS.SYMBOLIQUES" D ^%TLUTCT G BCLACC
 I CHOIX["INDIVIDUS.DE.DKBMS" D ^%QSMOVIS G BCLACC
 I (CHOIX=1)!(CHOIX=6) G FACC
 I CHOIX=18 D REAF^%TLBAIF(0) G BCLACC
 I ((CHOIX'["COURANT")&(CHOIX'["LISTE"))&(CHOIX'["LOCALES") D ^%VSQUEAK G BCLACC
 I CHOIX["COURANT" S BA=CXT("@","BASE"),OBJ=CXT("@","OBJET"),TITRE="Individu courant"
 I CHOIX["LISTE" S BA="L0",OBJ=LISTE,TITRE="Attributs de la liste"
 I CHOIX["LOCALES" S BA=CXT("%","BASE"),OBJ=CXT("%","OBJET"),TITRE="Variables locales"
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW(TITRE),0)
 D MODE^%QSATTRI(OBJ,BA,0,2,80,20,0)
 G BCLACC
FACC 
 K @(MNCXT)
 D REAF^%TLBAIF(0)
 Q
VISU 
 N X,ZZ,CHOIX
 K TABC
 S TABC(1)="ATTRIBUTS",TABC(2)="INDIVIDUS",TABC(3)="LIENS"
BCLDON 
 D EFFBAS^%TLBACH2
 S CHOIX=$$^%VZECHO("TABC")
 I (CHOIX=1)!(CHOIX=6) Q
 I CHOIX=18 D REAF^%TLBAIF(0) G BCLDON
 I ((CHOIX'="ATTRIBUTS")&(CHOIX'="INDIVIDUS"))&(CHOIX'="LIENS") D ^%VSQUEAK G BCLDON
 S ZZ=1 D CONSTAB(ZZ,$E(CHOIX,1,$L(CHOIX)-1),.TITRE)
 S X=$$INI^%QUCHOI4(1,"",0,6,80,16,TITRE,ZZ,0)
 D CLEPAG^%VVIDEO,^%VZCD0(CHOIX_" PRODUITS")
 D AFF^%QUCHOI4(ZZ) S X=$$UN^%QUCHOI4(ZZ)
 D END^%QUCHOI4(ZZ)
 K ^[QUI]QX($J)
 G BCLDON
 
CONSTAB(P,TYPE,TITRE) 
 
 
 
 
 
 N ATT,K,NIV,J,CONT,INFOS,NBINFO,TYPMAJ,LON,REP
 D ^%VZEATT
 K ^[QUI]QX($J),^QX($J)
 S INFOS=$P($T(@$E(TYPE,1,6)),";;",2),NBINFO=$L(INFOS,"/")
 S TITRE=$J("",3),J=1
INITAB 
 I J>NBINFO G FININI
 S ATT=$P($P(INFOS,"/",J),",",1),LON=$P($P(INFOS,"/",J),",",2)
 S ^[QUI]QX($J,P,"LC",J)=LON
 S TITRE=$P($T(@("T"_$E(TYPE,1,5))),";;",2)
 S J=J+1 G INITAB
FININI 
 S NIV="",J=0
PARGLO 
 S NIV=$O(@GLOETD@("ATTRIBUT",NIV)) I NIV="" Q
 I @GLOETD@("ATTRIBUT",NIV,"TYPE")'[TYPE G PARGLO
 S K=1,J=J+1
INS 
 I K>NBINFO G PARGLO
 S ATT=$P($P(INFOS,"/",K),",",1),LON=$P($P(INFOS,"/",K),",",2)
 S CONT=@GLOETD@("ATTRIBUT",NIV,ATT)
 I ATT'="VALEUR" G IN2
 
 S REP=@GLOETD@("ATTRIBUT",NIV,$P($P(INFOS,"/",K+1),",",1)),ATT=@GLOETD@("ATTRIBUT",NIV,$P($P(INFOS,"/",K-1),",",1))
 S CONT=$$AFFI^%QMDAUC(REP,ATT,CONT)
 S ATT="VALEUR"
IN2 S ^[QUI]QX($J,P,"T",J,K)=$E($S(ATT["REPERTOIRE":$$NOMLOG^%QSF(CONT),ATT="TYPE":$P(CONT,".",1),1:CONT),1,LON-1)
 S K=K+1 G INS
 
ATTRIB ;;ATTRIBUT,15/VALEUR,12/REPERTOIRE,10/INDIVIDU,10/INDICE,5/TYPE,6/TRAITEMENT,15/PAS,4
TATTRI ;;   ATTRIBUT      VALEUR     REPERTOIRE INDIVIDU INDICE TYPE  TRAITEMENT    PAS
 
INDIVI ;;INDIVIDU,30/REPERTOIRE,16/TYPE,6/TRAITEMENT,20/PAS,4
TINDIV ;;        INDIVIDU                REPERTOIRE      TYPE     TRAITEMENT    PAS
 
LIEN ;;REPERTOIRE.SOURCE,10/INDIVIDU.SOURCE,10/LIEN,10/REPERTOIRE.DESTINATION,10/INDIVIDU.DESTINATION,10/TYPE,6/TRAITEMENT,15/PAS,4
TLIEN ;; REP.SOURCE INDIV.SOUR  LIEN   REP.DESTI INDIV.DEST TYPE  TRAITEMENT    PAS
 
MKMNCXT S MN=$$TEMP^%SGUTIL
 S @MN="21^10^79"
 S @MN@(1)=$$^%QZCHW("Individu courant")_"^INDIVIDU.COURANT"
 S @MN@(1,"COM")=$$^%QZCHW("Acces aux attributs de l'individu courant")
 S @MN@(2)=$$^%QZCHW("Attributs liste")_"^ATTRIBUTS.LISTE"
 S @MN@(2,"COM")=$$^%QZCHW("Attributs de la liste courante")
 S @MN@(3)=$$^%QZCHW("Variables locales")_"^VARIABLES.LOCALES"
 S @MN@(3,"COM")=$$^%QZCHW("Valeurs actuelles des attributs temporaires")
 S @MN@(4)=$$^%QZCHW("Donnees produites")_"^DONNEES.PRODUITES"
 S @MN@(4,"COM")=$$^%QZCHW("Donnees creees durant l'activation")
 S @MN@(5)=$$^%QZCHW("Individus symboliques")_"^INDIVIDUS.SYMBOLIQUES"
 S @MN@(5,"COM")=$$^%QZCHW("Individus symboliques du contexte actuel")
 S @MN@(6)=$$^%QZCHW("Individus de DKBMS")_"^INDIVIDUS.DE.DKBMS"
 S @MN@(6,"COM")=$$^%QZCHW("Visualisation arborescente de la base")
 Q
MNCXT D POCLEPA^%VVIDEO
 D ^%VQUIKMN(0,80,22,MN,.ADRES,.CONTR)
 I ADRES="" S CHOIX=$S(CONTR="A":1,CONTR="F":6,CONTR="R":18,1:6) Q
 S CHOIX=ADRES
 Q

