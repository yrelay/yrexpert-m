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

;TORQYS1^INT^1^59547,74875^0
TORQYS1 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
TESTIND(NU,ORDRE,TEST) 
 N NOMENC,GAM,RRG,RRN,NOML
 S IND=GLOBA(ORDRE),REP=$S($D(GLOB(ORDRE)):GLOB(ORDRE),1:"")
 
 I '($$EXIST(REP)) Q
 
 I REP="" S MES=$$^%QZCHW("Transfert impossible: pas de repertoire"),TEST=0 Q
 
 I '($$IR^%QSGEST5($$NOMINT^%QSF(REP),IND)) S MES=$$^%QZCHW("Transfert impossible: individu inconnu"),TEST=0 Q
 
 S NOMENC=$$^%QSCALVA(RI,NU,"NOMENCLATURE")
 S GAM=$$^%QSCALVA(RI,NU,"GAMME")
 I '(NOMENC) G TESTIN2
 S RRN=$S($D(GLOB4(ORDRE)):GLOB4(ORDRE),1:"")
 I NOMENC,RRN="" S TEST=0,MES=$$^%QZCHW("Transfert impossible: pas de repertoire nomenclature") Q
 I '($$EXIST(RRN)) Q
 
 S NOML=$S($D(GLOB5(ORDRE)):GLOB5(ORDRE),1:"")
 I NOML="" S TEST=0,MES=$$^%QZCHW("Transfert impossible: pas de lien involutif") Q
 I $$TYPE^%QSGEST9(RRN,NOML)<4 S TEST=0,MES=$$^%QZCHW("Transfert impossible: lien inconnu") Q
 
 
 I (RRN'=REP)&($$LIENPF^%QSGEL2($$NOMINT^%QSF(RRN),$$NOMINT^%QSF(REP))="") S TEST=0,MES=$$^%QZCHW("Transfert impossible: repertoire nomenc faux") Q
 I '(GAM) Q
 
 S RRG=$S($D(GLOB1(ORDRE)):GLOB1(ORDRE),1:"")
 I '($$EXIST(RRG)) Q
 
 I RRN=REP,$$LIENPF^%QSGEL2($$NOMINT^%QSF(RRN),$$NOMINT^%QSF(RRG))="" S TEST=0,MES=$$^%QZCHW("Transfert impossible: repertoire gamme faux") Q
 
 I $$LIENPF^%QSGEL2($$NOMINT^%QSF(RRN),$$NOMINT^%QSF(REP))'="",RRG'=REP S TEST=0,MES=$$^%QZCHW("Transfert impossible: repertoire gamme faux") Q
 
TESTIN2 
 I NOMENC G TESTIN3
 S RRG=$S($D(GLOB1(ORDRE)):GLOB1(ORDRE),1:"")
 I '($$EXIST(RRG)) Q
 I RRG'=REP S TEST=0,MES=$$^%QZCHW("Transfert impossible: repertoire gamme faux") Q
TESTIN3 
 I '(GAM) Q
 S REPF=$S($D(GLOB2(ORDRE)):GLOB2(ORDRE),1:"")
 I REPF="" S REPF=$$REPFIL^TORQY5($$NOMINT^%QSF(RRG)) D:REPF'="" PA^%QSGESTI(RI,NU,"REPERTOIRE.RECEPTEUR.OPERATION",REPF,ORDRE)
 
 I REPF'="" D TFILS Q:TEST=0
 
 
 I REPF="" S TEST=0,MES=$$^%QZCHW("Transfert impossible: pas de repertoire operations") Q
 I '($$EXIST(REPF)) Q
 Q
 
TFILS N FILS S TEST=$$REPM^%QSGEST9(REPF)
 I TEST=0 S MES=$$^%QZCHW("transfert impossible: repertoire inconnu") Q
 S TEST=1
 D LIEN^%QSGEL2($$NOMINT^%QSF(RRG),$$NOMINT^%QSF(REPF),"FILS")
 I FILS=0 S TEST=0,MES=$$^%QZCHW("Transfert impossible: liaison gamme fausse") Q
 N I,II,OK S II="",OK=0
 F I=0:0 S II=$O(FILS(II)) Q:II=""  I FILS(II)=2 S OK=1
 I '(OK) S TEST=0,MES=$$^%QZCHW("Transfert impossible: liaison gamme fausse") Q
 Q
 
 
INDPRIS(NU,ORDRE,TEST) 
 S IND=GLOBA(ORDRE)
 I $D(@PRIS@(IND)) S TEST=0,MES=$$^%QZCHW("Transfert impossible: doublon") Q
SUIT S @PRIS@(IND,NU)="" Q
 
 
STATUT(NU,TEST) 
 Q:$$^%QSCALVA(RI,NU,"STATUS")'="PB"
 S MES=$$^%QZCHW("Transfert impossible: pb sur etude"),TEST=0 Q
 
EXIST(R) 
 I '($$REPM^%QSGEST9(R)) S test=0,MES=$$^%QZCHW("Transfert impossible: repertoire inconnu") Q 0
 Q 1

