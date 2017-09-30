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

;%SRTRIMP^INT^1^59547,73891^0
SRTRIMP(SA,GR) 
 
 
 
 
 
 N ADROK,ADRNOK,CLE,ERR,GLC,GLS,I,IMPR,IND,LARG,LC,LIGN,NC,NUM,REP,VAL
 S IMPR=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"IMPR") K @(IMPR)
 
 D MSG^%VZEATT($$^%QZCHW("Preparation de l'impression"))
 
 
 S ADROK=$$ADROK^%SRBATCH(SA)
 
 S ADRNOK=$$ADRNOK^%SRBATCH(SA)
 
 S GLC=$$ADR^%SRCOMP(SA)
 S NC=@GLC@("NBC")
 S LC=0
 D TITRE
 S LC=0
 
 S GLS=$$CONCAT^%QZCHAD(ADRNOK,GR_",""G""")
 I '($D(@GLS)) G NOK
 D INSE($J("",15)_$$^%QZCHW("Erreurs sur le modele"))
 S ERR=""
GEN S ERR=$O(@GLS@(ERR))
 I ERR="" D INSE(" ") G NOK
 D INSE(@GLS@(ERR))
 G GEN
NOK 
 S ERR=$$CONCAT^%QZCHAD(ADRNOK,GR_",""E""")
 I '($D(@ERR)) G OK
 D INSE($J("",15)_$$^%QZCHW("Enregistrements non transferes et leurs erreurs"))
 S GLS=$$ADR^%SRACTIV(SA),GLS=$E(GLS,1,$L(GLS)-1)
 S CLE=""
ERE S CLE=$O(@ERR@(CLE))
 I CLE="" G OK
 D LIGN(CLE),INSE(" ")
 D ERR(CLE)
 D INSE(" ")
 G ERE
 
OK 
 I '($D(@ADROK@(GR))) G IMP
 I LC'=0 D INSE(" "),INSE($TR($J("",79)," ","*")),INSE(" ")
 D INSE($J("",15)_$$^%QZCHW("Enregistrements transferes et individus crees"))
 
 S GLS=$$CONCAT^%QZCHAD(ADROK,GR_",""E""")
 I '($D(@GLS)) G IND
 S CLE=""
VAL S CLE=$O(@GLS@(CLE))
 I CLE="" G IND
 D LIGO(CLE)
 G VAL
IND 
 S GLS=$$CONCAT^%QZCHAD(ADROK,GR_",""I""")
 I '($D(@GLS)) G IMP
 D INSE(" "),INSE($J("",10)_"* "_$$^%QZCHW("Liste des individus crees")_" *"),INSE(" ")
 S REP=""
 F I=0:0 S REP=$O(@GLS@(REP)) Q:REP=""  S IND="" F I=0:0 S IND=$O(@GLS@(REP,IND)) Q:IND=""  S R=$E($$NOMLOG^%QSF(REP),1,25),I=$E(IND,1,50) D INSE("  "_R_$J("",25-$L(R))_" "_I_$J("",50-$L(I)))
 
IMP 
 D IMPT^%VPRINT($$CONCAS^%QZCHAD(IMPR,"LIGNE"),$$CONCAS^%QZCHAD(IMPR,"TITRE"))
 K @(IMPR)
 Q
 
ERR(CLE) 
 S NUM=""
BCN S NUM=$O(@ERR@(CLE,NUM))
 I NUM="" Q
 D INSE("  "_@ERR@(CLE,NUM))
 G BCN
 
INSE(M) 
 S LC=LC+1
 S @IMPR@("LIGNE",LC)=$E(M,1,79)
 Q
 
LIGN(CLE) 
 S LIGN=""
 D INSE(" ")
 S VAL=GLS_","_CLE_")"
 I '($D(@VAL)) D INSE(CLE) Q
 S VAL=@VAL
 F I=1:1:NC D INS(I,$P(VAL,$C(0),I))
 I LIGN'="" D INSE(LIGN)
 Q
 
LIGO(CLE) 
 S LIGN=""
 D INSE(" ")
 S VAL=@GLS@(CLE)
 F I=1:1:NC D INS(I,$P(VAL,$C(0),I))
 I LIGN'="" D INSE(LIGN)
 Q
 
INS(CH,LIB) 
 S LIB=$E(LIB,1,LARG(CH)),LIB=LIB_$J("",LARG(CH)-$L(LIB))
 
 I ($L(LIGN)+$L(LIB))>80 D INSE(LIGN) S LIGN=""
 S LIGN=LIGN_LIB_" "
 Q
 
TITRE 
 N DAT
 S DAT=$S($D(@ADROK@(GR)):@ADROK@(GR),1:@ADRNOK@(GR))
 D INST($$^%QZCHW("Resultats du transfert du")_" "_DAT)
 D INST("  "_$$^%QZCHW("pour le masque")_" "_SA)
 S (LIGN,NUM)=""
 F I=0:0 S NUM=$O(@GLC@("CHAMPS",NUM)) Q:NUM=""  D TIT
 I LIGN'="" D INST(LIGN)
 Q
TIT 
 
 S VAL=@GLC@("CHAMPS",NUM)
 
 I $D(@GLC@("CLE",NUM)) S VAL=VAL_" ("_@GLC@("CLE",NUM)_")"
 
 S LARG(NUM)=@GLC@("LARG",NUM)
 S VAL=$E(VAL,1,LARG(NUM)),VAL=VAL_$J("",LARG(NUM)-$L(VAL))
 
 I ($L(LIGN)+$L(VAL))>80 D INST(LIGN) S LIGN=""
 S LIGN=LIGN_VAL_" "
 Q
INST(M) 
 S LC=LC+1
 S @IMPR@("TITRE",LC)=M
 Q

