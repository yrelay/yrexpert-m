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

;TORQYS^INT^1^59547,74875^0
TORQYS ;
 
 
 
 
 
 
 
 
 
 
 
 
TESTS(NU,TEST,MES) 
 N N,I,IND,ORDRE,NU2,TWREF,REP,REPF,ARTI,TEMP
 I $$AIR^%QSGEST5(RI,ETUDE,"MESSAGE.TRANSFERT.TODKBMS") D PS^%QSGESTI(RI,ETUDE,"MESSAGE.TRANSFERT.TODKBMS",$$^%QSCALVA(RI,ETUDE,"MESSAGE.TRANSFERT.TODKBMS"),1)
 S MES=""
 
 S NU2=$$^%QSCALVA(RI,NU,"NUMERO.ETUDE")
 I NU2="" S MES=$$^%QZCHW("Transfert impossible de l'etude : l'attribut NUMERO.ETUDE n'existe pas"),TEST=0 Q
 S TWREF=$$^%QSCALVA(RI,NU,"COMPOSANTS.ETUDE")
 I TWREF="" S MES=$$^%QZCHW("Transfert impossible de l'etude : l'attribut COMPOSANTS.ETUDE n'existe pas"),TEST=0 Q
 I '($D(@("^[QUI]TREEWORK(NU2,"_TWREF_")"))) S MES=$$^%QZCHW("Transfert impossible de l'etude"),TEST=0 Q
 S ARTI=$P(@("^[QUI]TREEWORK(NU2,"_TWREF_")"),"^",2)
 I '($D(^[QUI]ANTETUDE(ARTI,NU2,TWREF))) S MES=$$^%QZCHW("Transfert impossible de l'etude"),TEST=0 Q
 N GLOBA D MV^%QSCALVA(RI,NU,"INDIVIDU.RECEPTEUR",.GLOBA)
 I GLOBA=0 S MES=$$^%QZCHW("Transfert impossible : pas d'individu recepteur"),TEST=0 Q
 
 Q:$$^%QSCALVA(RI,NU,"STATUS")="RAS"
 
 N GLOB D MV^%QSCALVA(RI,NU,"REPERTOIRE.RECEPTEUR",.GLOB)
 I GLOB=0 S MES=$$^%QZCHW("Transfert impossible : pas de repertoire recepteur"),TEST=0 Q
 
 N GLOB1 D MV^%QSCALVA(RI,NU,"REPERTOIRE.RECEPTEUR.GAMME",.GLOB1)
 I (GLOB1=0)&($$^%QSCALVA(RI,NU,"GAMME")=1) S MES=$$^%QZCHW("Transfert impossible : pas de repertoire recepteur gamme"),TEST=0 Q
 
 N GLOB2 D MV^%QSCALVA(RI,NU,"REPERTOIRE.RECEPTEUR.OPERATION",.GLOB2)
 
 N GLOB4 D MV^%QSCALVA(RI,NU,"REPERTOIRE.RECEPTEUR.NOMENCLATURE",.GLOB4)
 I (GLOB4=0)&($$^%QSCALVA(RI,NU,"NOMENCLATURE")=1) S MES=$$^%QZCHW("Transfert impossible : pas de repertoire recepteur nomenclature"),TEST=0 Q
 
 N GLOB5 D MV^%QSCALVA(RI,NU,"NOMENCLATURE.LIEN",.GLOB5)
 S ORDRE="" F I=1:1 S ORDRE=$O(GLOBA(ORDRE)) Q:'(TEST)  Q:ORDRE=""  D GLOTEST
 Q
GLOTEST 
 D TESTIND^TORQYS1(NU,ORDRE,.TEST)
 Q:'(TEST)
 D INDPRIS^TORQYS1(NU,ORDRE,.TEST)
 Q:'(TEST)
 D STATUT^TORQYS1(NU,.TEST)
 Q
 
 
 
 
TESTIND(NU,ORDRE,TEST) 
 S IND=GLOBA(ORDRE),REP=$S($D(GLOB(ORDRE)):GLOB(ORDRE),1:"")
 
 I REP="" S MES=$$^%QZCHW("L'individu ")_IND_$$^%QZCHW(" de numero d'ordre ")_ORDRE_$$^%QZCHW(" n'a pas de repertoire associe. Impossible a transferer !"),TEST=0 Q
 S REPF=$S($D(GLOB2(ORDRE)):GLOB2(ORDRE),1:"")
 I REPF="" S REPF=$$REPFIL^TORQY5($$NOMINT^%QSF(REP)) D:REPF'="" PA^%QSGESTI(RI,NU,"REPERTOIRE.RECEPTEUR.OPERATION",REPF,ORDRE)
 D TFILS I MES'="" S TEST=0 Q
 
 
 I $$^%QSCALVA(RI,NU,"GAMME")=1,REPF="" S TEST=0,MES=$$^%QZCHW("La gamme ne sera pas transferee:pas de repertoire pour stocker les operations") Q
 
 I '($$IR^%QSGEST5($$NOMINT^%QSF(REP),IND)) S DX=0,DY=23 X XY S TEST=0,MES=$$^%QZCHW("L'individu ")_IND_$$^%QZCHW(" n'existe pas Transfert impossible")
 Q
 
 
INDPRIS(NU,ORDRE,TEST) 
 S IND=GLOBA(ORDRE)
 I $D(@PRIS@(IND)) S TEST=0,MES=$$^%QZCHW("L'individu ")_IND_$$^%QZCHW(" est deja affecte de l'etude "_$O(@PRIS@(IND,""))) Q
 S @PRIS@(IND,NU)="" Q
 
 
TFILS N LPF,RINT,RFINT
 S RINT=$$NOMINT^%QSF(REP),RFINT=$$NOMINT^%QSF(REPF)
 D LIEN^%QSGEST9($$NOMINT^%QSF(REP),"FILS")
 S LPF=$$LIEN1^%QSGEL2(RINT,RFINT,2)
 I '($D(FILS(LPF))) S TEST=0,MES=$$^%QZCHW("Le repertoire ")_REPF_$$^%QZCHW(" n'est pas fils de ")_REP_$$^%QZCHW(". Etude impossible a transferer") Q
 I FILS(LPF)'=2 S TEST=0,MES=$$^%QZCHW("Le repertoire ")_REPF_$$^%QZCHW(" n'est pas fils de ")_REP_$$^%QZCHW(". Etude impossible a transferer")
 Q

