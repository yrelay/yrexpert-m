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

;%SCOACT2^INT^1^59547,73887^0
SCOACT2 ;
 
 
 
 
AFFRES(NL,MODE,DEJAF) 
 Q:NL=""
 I MODE=1 G AFF1
 I DEJAF D USE^%QUAPAGM("CIBLE"),AFFICH^%QUAPAGM,TITFEN Q
 S FEN0=$$CONCAS^%QZCHAD(TEMP,"CIBLE") K @(FEN0)
 I $D(@FEN0) D CLOSE
 D INIT(FEN0),OPEN^%QUAPAGM(FEN0,"CIBLE")
AFF1 D USE^%QUAPAGM("CIBLE")
 I '(DEJAF) D AFFICH^%QUAPAGM,TITFEN
 G:MODE=0 END
 D GO^%QUAPAGM
 G END
 
INIT(FEN) 
 S @FEN@("X")=1,@FEN@("Y")=14,@FEN@("L")=78,@FEN@("H")=8
 S @FEN@("B")=$$^%QSCALVA("L0",NL,"BASE"),@FEN@("A")=$$ADRLIS^%QSGEST7(NL)
 S @FEN@("ATT")=1,@FEN@("AFF")="REAFI^%SCOACT2"
 S @FEN@("LR")=30
 S @FEN@("C",1,"T")=$$^%QZCHW("taux d'accord"),@FEN@("C",1,"L")=20,@FEN@("C",1,"C")="TAUX.ACCORD",@FEN@("C",1,"FCT")="$$STAT^%SCOACT2"
 Q
 
END 
 Q
TITFEN 
 S DX=2,DY=14 D REV^%VVIDEO X XY W " "_$$^%QZCHW("liste des individus cibles") D NORM^%VVIDEO
 Q
 
CLOSE D CLOSE^%QUAPAGM("CIBLE")
 K @(FEN0)
 Q
REAFI 
 D ENTETE^%SCOACT
 Q
STAT(VT1,V,C) 
 N VAL
 I '($$IR^%QSGEST5($$NOMINT^%QSF(REPCIB),V)) Q "?????"
 S VAL=$$^%QSCALIN($$NOMINT^%QSF(REPCIB),V,C,1)+0
 I VAL<ACCAD Q "*****"
 Q VAL
 
 
 
 
RES 
 S MN2=$$CONCAS^%QZCHAD(TEMP,"MENU2")
 D MENU2(MN2)
RES2 D EFFBAS^%SCOACT,^%VQUIKMN(1,79,23,MN2,.AD,.CONTR)
 I (CONTR="A")!(CONTR="F") K @(MN2),AD G ACT^%SCOACT
 G:AD="" RES2
 G @AD
 
COMP I '(DEJAF2) D INIT^%SCOACT3 S DEJAF2=1
 D SUC^%SCOACT3,TITSUC^%SCOACT3
 G RES2
NCOMP I '(DEJAF2) D INIT^%SCOACT3 S DEJAF2=1
 D ECH^%SCOACT3,TITECH^%SCOACT3
 G RES2
HIS 
 N PAS,GL,HIS,TOT,REG,GG,ABC,LISTE
 S GL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"HISTO") K @(GL)
HIS0 
 D EFFBAS^%SCOACT S DX=4,DY=23 X XY S GG=$$^%VZECH2("histogramme des comparables"_" : ","succes.et.echecs","succes.un.par.un") D POCLEPA^%VVIDEO
 I GG=1 G RES2
 I GG="succes.un.par.un" G ECLAT
REGROU 
 S PAS=1E-1,TOT="UNITE.DE.COMPTE",REG="TAUX.ACCORD",HIS="ESSAI",NUM=1,ABC=0,LISTE=LL
 G AFFHIS
ECLAT 
 S PAS=1E-1,TOT="TAUX.ACCORD",REG="NOM",HIS="ESSAI",NUM=0,ABC=1,LISTE=NOML
AFFHIS 
 S GG=$$HSIM^%HXIHITR(GL,HIS,1,LISTE,TOT,REG,NUM,ABC,1,PAS,1,GG,.REP)
 K @(GL)
 D CLEPAG^%VVIDEO,ENTETE^%SCOACT
 I '(DEJAF2) D INIT^%SCOACT3 S DEJAF2=1
 D REAFF^%SCOACT3
 G RES2
 
CPT 
 S GL="^[QUI]RQSGLO(""SCX"",ETU)"
 I '($D(@GL)) D ^%VZEAVT($$^%QZCHW("Cette etude n'a jamais ete activee")) G ACT^%SCOACT
 D AFFERR^%QULIMZ(GL,$$^%QZCHW("Resultats de l'etude")),ENTETE^%SCOACT
 I '(DEJAF2) D INIT^%SCOACT3 S DEJAF2=1
 D REAFF^%SCOACT3
 G RES2
MENU(MN) 
 S @MN="22^5^79"
 S @MN@(1)=$$^%QZCHW("Etude")_"^"_"ETU",@MN@(1,"COM")=$$^%QZCHW("Modification des parametres de l'etude")
 S @MN@(2)=$$^%QZCHW("comparer")_"^"_"CMP",@MN@(2,"COM")=$$^%QZCHW("lancement de l'etude")
 S @MN@(3)=$$^%QZCHW("resultats")_"^"_"RES",@MN@(3,"COM")=$$^%QZCHW("resultats de la derniere activation")
 S @MN@(4)=$$^%QZCHW("reference")_"^"_"REF",@MN@(4,"COM")=$$^%QZCHW("acces aux attributs de l'individu de reference")
 S @MN@(5)=$$^%QZCHW("individus")_"^"_"IND",@MN@(5,"COM")=$$^%QZCHW("acces aux individus cibles")
 S @MN@(6)=$$^%QZCHW("domaine")_"^"_"DOM",@MN@(6,"COM")=$$^%QZCHW("acces au domaine")
 S @MN@(7)=$$^%QZCHW("regles")_"^"_"REGLE",@MN@(7,"COM")=$$^%QZCHW("acces aux regles du domaine")
 Q
MENU2(MN2) 
 S @MN2="22^5^79"
 S @MN2@(1)=$$^%QZCHW("comparables")_"^"_"COMP",@MN2@(1,"COM")=$$^%QZCHW("individus comparables")
 S @MN2@(2)=$$^%QZCHW("non.comparables")_"^"_"NCOMP",@MN2@(2,"COM")=$$^%QZCHW("individus non comparables")
 S @MN2@(3)=$$^%QZCHW("histogramme")_"^"_"HIS",@MN2@(3,"COM")=$$^%QZCHW("resulat sous forme d'histogramme")
 S @MN2@(4)=$$^%QZCHW("compte.rendu")_"^"_"CPT",@MN2@(4,"COM")=$$^%QZCHW("compte rendu de l'etude")
 Q

