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

;TONRIND^INT^1^59547,74873^0
TONRIND(NUFA,BATCH,BASE,ARC,LISTE) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N RI,IND,N,NU,FILLE
 S RI=$$RI^TORQXIN,FILLE=0
 S NU=NUFA F N=1:1 S NU=$O(^[QUI]TREEWORK(NU)) Q:NU="z"  Q:NU=""  Q:NU'[NUFA  D INSER(NU,BATCH,BASE,ARC,LISTE)
 I FILLE=1 Q
 
 D INSER(NUFA,BATCH,BASE,ARC,LISTE)
 Q
 
INSER(NU,BATCH,BASE,ARC,LISTE) 
 
 N GLO,I,COMP,TW,ADR
 S GLO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GLO") K @(GLO)
 D ^TOCPETUD(NU,GLO)
 S TW=$O(@GLO@(2,""))
 
 D:TW'="" INS1
 K @(GLO)
 Q
INS1 S ADR=$$CONCAS^%QZCHAD("^[QUI]TREEWORK",NU_","_TW)
 N IND,ARTICLE,GAMME,NOMENC
 S FILLE=1
 S IND=$P(@ADR,"^",10)
 S ARTICLE=$P(@ADR,"^",1)
 S GAMME=$S($D(^[QUI]PHAS(NU)):1,1:0)
 S NOMENC=$S($O(@ADR@(""))'="":1,1:0)
 D STO(RI,NU,IND,ARTICLE,BASE,BATCH,TW,GAMME,LISTE,NOMENC)
 Q
 
STO(RI,NU,IND,ARTICLE,BASE,BATCH,TW,GAMME,LISTE,NOMENC) 
 N NOM,NOMLIEN,RRG,RRN,NOMLIEN
 S NOM=NU
 S:TW'=0 NOM=NU_"/"_$TR(TW,",",".")
 D PA^%QSGESTI(RI,NOM,"LISTE",LISTE,1)
 D PA^%QSGESTI(RI,NOM,"NUMERO.ETUDE",NU,1)
 D PA^%QSGESTI(RI,NOM,"NOM",NOM,1)
 D PA^%QSGESTI(RI,NOM,"GAMME",GAMME,1)
 D PA^%QSGESTI(RI,NOM,"NOMENCLATURE",NOMENC,1)
 I IND'="" D PA^%QSGESTI(RI,NOM,"INDIVIDU.RECEPTEUR",IND,1),PA^%QSGESTI(BASE,IND,"ETUDE.TOTEM",NOM,1)
 D:ARTICLE'="" PA^%QSGESTI(RI,NOM,"ARTICLE",ARTICLE,1)
 D PA^%QSGESTI(RI,NOM,"REPERTOIRE.RECEPTEUR",$$NOMLOG^%QSF(BASE),1)
 D PA^%QSGESTI(RI,NOM,"LANCEMENT.ETUDE",$S(BATCH=0:"INTERACTIF",1:"BATCH"),1)
 D PA^%QSGESTI(RI,NOM,"COMPOSANTS.ETUDE",TW,1)
 D PA^%QSGESTI(RI,NOM,"RESPECT.NOMENCLATURE.EXISTANTE","NON",1)
 I '(NOMENC) S RRN="" G SUITE
 D RRN(BASE,.RRN,.NOMLIEN) G:RRN="" SUITE
 D PA^%QSGESTI(RI,NOM,"REPERTOIRE.RECEPTEUR.NOMENCLATURE",RRN,1)
 D PA^%QSGESTI(RI,NOM,"NOMENCLATURE.LIEN",NOMLIEN,1)
SUITE I '(GAMME) Q
 D RRG(BASE,NOMENC,RRN,.RRG) Q:RRG=""
 D PA^%QSGESTI(RI,NOM,"REPERTOIRE.RECEPTEUR.GAMME",RRG,1)
 D PA^%QSGESTI(RI,NOM,"REPERTOIRE.RECEPTEUR.OPERATION",$$ROP($$NOMINT^%QSF(RRG)),1)
 Q
 
ROP(REP) 
 
 
 
 N LIENS,R
 Q:REP="" ""
 D LIENT^%QSGE9(REP,"LIENS")
 I $$^%QCAZG("LIENS(2)")'=1 Q ""
 S R=$O(LIENS(2,"")) I R="" Q R
 Q $$NOMLOG^%QSF($$REPD^%QSGEL2(REP,R))
 
RRN(BASE,RRN,NOML) 
 
 
 
 N REPF,REPFI,REPP,REPPI,I,J,RNG,CPT,LIENS
 S CPT=1,NOML="",REPFI=BASE,REPF=$$NOMLOG^%QSF(BASE),RRN=""
 S RNG=$$RANG^%QSGES17(REPFI) I RNG<1 Q
LOOPR K LIENS D LIENT^%QSGE9(REPFI,"LIENS")
 I $$^%QCAZG("LIENS(4)")="" G PERE
 S NOML=$O(LIENS(4,"")),RRN=$$NOMLOG^%QSF(REPFI)
 Q
PERE 
 
 
 S CPT=CPT+1 I CPT>2 Q
 
 D PEREFILS^%QSGEL2(REPFI,.REPPI,.LIEN)
 I REPPI="" Q
 S REPFI=REPPI G LOOPR
 
RRG(BASE,NOMENC,RRN,RRG) 
 
 
 
 
 N LIENS,LIEN2
 S NOML="",RRG=""
 I NOMENC=0 G RRG2
 I RRN="" G RRG2
 
 I RRN'=$$NOMLOG^%QSF(BASE) S RRG=$$NOMLOG^%QSF(BASE) Q
 K LIENS D LIENT^%QSGE9($$NOMINT^%QSF(RRN),"LIENS")
 I '($D(LIENS(2))) Q
LOOP1 S NOML=$O(LIENS(2,NOML)) Q:NOML=""
 S RRG=$$NOMLOG^%QSF($$REPD^%QSGEL2($$NOMINT^%QSF(RRN),NOML))
 I RRG="" G LOOP1
 K LIEN2 D LIENT^%QSGE9($$NOMINT^%QSF(RRG),"LIEN2")
 I '($D(LIENS(2))) S RRG="" G LOOP1
 Q
RRG2 
 S RRG=$$NOMLOG^%QSF(BASE)
 Q:RRG=""
LOOPG K LIENS D LIENT^%QSGE9(BASE,"LIENS")
 I '($D(LIENS(2))) S RRG="" Q
 Q
 ;

