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

;TORQY61^INT^1^59547,74875^0
TORQY61(LISTE,DIA,TEST) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
TESTIND(NU,ORDRE,DIA,TEST) 
 N NOMENC,GAM,RRG,RRN,NOML
 S IND=GLOBA(ORDRE),REP=$S($D(GLOB(ORDRE)):GLOB(ORDRE),1:"")
 
 I '($$EXIST(REP)) Q
 
 I REP="" D:DIA=1 ^%VZEAVT($$^%QZCHW("L'individu ")_IND_$$^%QZCHW(" de numero d'ordre ")_ORDRE_$$^%QZCHW(" n'a pas de repertoire associe. Etude ")_NU_$$^%QZCHW(" impossible a transferer !")) S TEST=0 Q
 
 I '($$IR^%QSGEST5($$NOMINT^%QSF(REP),IND)) S DX=0,DY=23 X XY S:DIA=0 TEST=0 Q:DIA=0  D ^%VZEAVT($$^%QZCHW("L'individu ")_IND_$$^%QZCHW(" n'existe pas. Etude ")_NU_$$^%QZCHW(" impossible a transferer")) S TEST=0
 
 S NOMENC=$$^%QSCALVA(RI,NU,"NOMENCLATURE")+0
 S GAM=$$^%QSCALVA(RI,NU,"GAMME")+0
 I '(NOMENC) G TESTIN2
 S RRN=$S($D(GLOB4(ORDRE)):GLOB4(ORDRE),1:"")
 I NOMENC,RRN="" S TEST=0 Q:DIA=0  D ^%VZEAVT(NU_": "_$$^%QZCHW("veuillez definir le repertoire recepteur pour la nomenclature")) Q
 I '($$EXIST(RRN)) Q
 
 S NOML=$S($D(GLOB5(ORDRE)):GLOB5(ORDRE),1:"")
 I NOML="" S TEST=0 Q:DIA=0  D ^%VZEAVT(NU_": "_$$^%QZCHW("veuillez definir le nom du lien pour la nomenclature")) Q
 I $$TYPE^%QSGEST9(RRN,NOML)<4 S:DIA=0 TEST=0 Q:DIA=0  D ^%VZEAVT(NU_": "_$$^%QZCHW("impossible de ramener la nomenclature: lien inconnu")) Q
 
 
 I (RRN'=REP)&($$LIENPF^%QSGEL2($$NOMINT^%QSF(RRN),$$NOMINT^%QSF(REP))="") S TEST=0 Q:DIA=0  D ^%VZEAVT(NU_": "_$$^%QZCHW("impossible de ramener la nomenclature sur")_" "_RRN) Q
 I '(GAM) Q
 
 S RRG=$S($D(GLOB1(ORDRE)):GLOB1(ORDRE),1:"")
 I '($$EXIST(RRG)) Q
 
 I RRN=REP,$$LIENPF^%QSGEL2($$NOMINT^%QSF(RRN),$$NOMINT^%QSF(RRG))="" S TEST=0 Q:DIA=0  D ^%VZEAVT(NU_": "_$$^%QZCHW("impossible de ramener la gamme sur")_" "_RRN) Q
 
 I $$LIENPF^%QSGEL2($$NOMINT^%QSF(RRN),$$NOMINT^%QSF(REP))'="",RRG'=REP S TEST=0 Q:DIA=0  D ^%VZEAVT(NU_": "_$$^%QZCHW("impossible de ramener la gamme sur")_" "_RRG) Q
 
TESTIN2 
 I NOMENC G TESTIN3
 I '(GAM) Q
 S RRG=$S($D(GLOB1(ORDRE)):GLOB1(ORDRE),1:"")
 I '($$EXIST(RRG)) Q
 I RRG'=REP S TEST=0 D:DIA ^%VZEAVT(NU_": "_$$^%QZCHW("impossible de ramener la gamme sur")_" "_RRG) Q
TESTIN3 
 I '(GAM) Q
 S REPF=$S($D(GLOB2(ORDRE)):GLOB2(ORDRE),1:"")
 I REPF="" S REPF=$$REPFIL^TORQY5($$NOMINT^%QSF(RRG)) D:REPF'="" PA^%QSGESTI(RI,NU,"REPERTOIRE.RECEPTEUR.OPERATION",REPF,ORDRE)
 
 I REPF'="" D TFILS Q:TEST=0
 
 
 I REPF="" S:DIA=0 TEST=0 Q:DIA=0  D ^%VZEAVT(NU_": "_$$^%QZCHW("il n'y a pas de repertoire pour stocker les operations")),OUINON
 I '($$EXIST(REPF)) Q
 Q
 
OUINON S CONT=$$MES^%VZEOUI($$^%QZCHW("Acceptez vous le transfert "),"O")
 G:(CONT'=1)&(CONT'=0) OUINON
 I CONT=0 K @LISTE@(NU)
 Q
 
TFILS N FILS S TEST=$$REPM^%QSGEST9(REPF)
 I TEST=0 D:DIA=1 ^%VZEAVT($$^%QZCHW("Le repertoire recepteur fils ")_REPF_$$^%QZCHW(" n'est pas un repertoire du Schema")_$$^%QZCHW(". Etude ")_NU_$$^%QZCHW(" impossible a transferer")) Q
 S TEST=1
 D LIEN^%QSGEL2($$NOMINT^%QSF(RRG),$$NOMINT^%QSF(REPF),"FILS")
 I FILS=0 S TEST=0 D:DIA=1 ^%VZEAVT($$^%QZCHW("Il n'y a pas de lien entre les repertoires ")_RRG_$$^%QZCHW(" et ")_REPF_$$^%QZCHW(". Etude ")_NU_$$^%QZCHW(" impossible a transferer")) Q
 N I,II,OK S II="",OK=0
 F I=0:0 S II=$O(FILS(II)) Q:II=""  I FILS(II)=2 S OK=1
 I '(OK) S TEST=0 D:DIA=1 ^%VZEAVT($$^%QZCHW("Le repertoire ")_REPF_$$^%QZCHW(" n'est pas un repertoire fils de ")_RRG_$$^%QZCHW(". Etude ")_NU_$$^%QZCHW(" impossible a transferer")) Q
 Q
 
 
INDPRIS(NU,ORDRE,DIA,TEST) 
 S IND=GLOBA(ORDRE)
 I $D(@PRIS@(IND)) S:DIA=0 TEST=0 Q:DIA=0  D ^%VZEAVT($$^%QZCHW("L'individu ")_IND_$$^%QZCHW(" est deja affecte d'une etude ")_$O(@PRIS@(IND,""))) S CH=$$CONFIRM^%VZEOUI($$^%QZCHW("Persistez-vous")_" ?") G:CH=1 SUIT S TEST=0 Q
SUIT S @PRIS@(IND,NU)="" Q
 
 
STATUT(NU,DIA,TEST) 
 Q:$$^%QSCALVA(RI,NU,"STATUS")'="PB"
 D:DIA=1 ^%VZEAVT($$^%QZCHW("Attention l'etude Totem ")_NU_$$^%QZCHW(" ne s'est pas deroulee correctement. Impossible a transferer")) S TEST=0 Q
 
EXIST(R) 
 I '($$REPM^%QSGEST9(R)) D:DIA=1 ^%VZEAVT($$^%QZCHW("Le repertoire ")_R_$$^%QZCHW(" n'appartient pas au schema de donnees. Etude ")_NU_$$^%QZCHW(" impossible a transferer !")) S TEST=0 Q 0
 Q 1

