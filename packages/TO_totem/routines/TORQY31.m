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

;TORQY31^INT^1^59547,74875^0
TORQY31 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N COMPP,COMPF,REPP,REPLI,INDLIEN,LISTCP,COMPQS,EXIGAM,TMP,NIV,NIV1,NIV2,TETE,CPR,PREDEFINI,LISATT,LISTE2,LATT,COMPNEW,NOMTREE,%TAD,TETE
 S TMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TMP)
 I RRN=BASI S REPP=BASI,COMPP=%CUK G SUITE
 S COMPP=$$NOMPERE^%QSGES10(BASI,%CUK) I COMPP="" D ^%VZEAVT("Impossible de transferer la nomenclature") Q
 S REPP=$$RPERE^%QSGES17(BASI) I REPP="" D ^%VZEAVT("Impossible de transferer la nomenclature") Q
SUITE 
 D DELNOM(REPP,COMPP,LIENOM)
 S LISTCP=$$CONCAS^%QZCHAD(TMP,"COMPOSANT.TOTEM")
 S COMPQS=$$CONCAS^%QZCHAD(TMP,"COMPOSANT.BKBMS")
 S NOMTREE="^["""_QUI_"""]TREEWORK("""_NU_""",0",%TAD="TRT^TORQY31",NIV1=0,@LISTCP@(0)=COMPP,@LISTCP@(0,"QTE")=$$^%QSCALVA(BASI,%CUK,"QUANTITE"),TETE=COMPP
 D ^%QCAGTW
 
 Q
TRT 
 I %T'[NOMTREE S STOP=1 Q
 S LISATT="" K LISTE2
 S TW=$P(%T,NOMTREE_",",2),TW=$P(TW,")")
 Q:TW=""
 S COMPF=$P(@%T,"^",1),NIV=$L(TW,",")
 
 S QTE=$P(@%T,"^",3)
 I NIV>NIV1 S @LISTCP@(NIV1)=COMPP,@LISTCP@(NIV)=COMPF,NIV1=NIV G TRT0
 I NIV<NIV1 K @LISTCP@(NIV1),NIV2 S NIV1=NIV,@LISTCP@(NIV)=COMPF G TRT0
 S @LISTCP@(NIV)=COMPF,NIV1=NIV K NIV2
TRT0 
 S TW="0,"_TW,CPR=0
 I $D(^[QUI]TVPAR(NU,TW,"IDENTIFIANT.DKBMS")) S PEDEFINI=1,(INDCOMP,COMPNEW)=^[QUI]TVPAR(NU,TW,"IDENTIFIANT.DKBMS"),CPR=1,NIV2=NIV G COMP2
 I $D(^[QUI]SCOMPREG(COMPF)) G COMPAR
 
 S PREDEFINI=0 D MAJCONT
 I $D(^[QUI]TORQYC(COMPF)) S LISATT=$P(^[QUI]TORQYC(COMPF),"^",3)
TRT1 I RESPECT="NON" D DELNOM(REPP,COMPNEW,LIENOM)
 
 D PA^%QSGESTI(REPP,COMPNEW,"NOM",COMPNEW,1)
 
 I $$OVAIR^%QSGEST5(REPP,$$PERE(@LISTCP@(NIV-1)),LIENOM,COMPNEW,COMPNEW) G TRT11
 D MSG^%VZEATT("Liaison entre "_$$PERE(@LISTCP@(NIV-1))_" et "_COMPNEW)
 D ADDS^%QSGEST3(REPP,$$PERE(@LISTCP@(NIV-1)),LIENOM,REPP,COMPNEW)
TRT11 
 S EXIGAM=0
 
 
 
 I $D(^[QUI]PHAS(NU,TW)) S EXIGAM=1
 I LISATT'="" D LISTE^TORQY4(LISATT,.LISTE2) S LISTE2=LISATT
 I $D(LISTE2) D ^TORQY5(NU,TW,.LISTE2,REPP,COMPNEW,EXIGAM,$$NOMINT^%QSF(RRG),FILS,NIV,TETE,CPR)
 I '($D(LISTE2)) D ^TORQY5(NU,TW,.LISTE,REPP,COMPNEW,EXIGAM,$$NOMINT^%QSF(RRG),FILS,NIV,TETE,CPR)
 
 S REPLI=$$LIENI^%QSGEL3,INDLIEN=$$NOML1^%QSGES20($$PERE(@LISTCP@(NIV-1)),COMPNEW,LIENOM,COMPNEW)
 
 
 S @LISTCP@(NIV,"QTE")=QTE
 
 S QTE=QTE/@LISTCP@(NIV-1,"QTE")
 D PA^%QSGESTI(REPLI,INDLIEN,"QUANTITE",QTE,1)
 D PSV^%QSGESTI(REPP,COMPNEW,"QUANTITE")
TRT2 S COMPP=COMPF
 Q
 
DELNOM(BA,IND,L) 
 N LLIEN,RELAT,I,J
 D LISTE^%QSCALVA(BA,IND,L,"LLIEN")
 S J="" F I=1:1 S J=$O(LLIEN(J)) Q:J=""  D MSG^%VZEATT("Rupture entre "_IND_" et "_LLIEN(J)),SUPS^%QSGEST3(BA,IND,L,BA,LLIEN(J))
 Q
 
POP(LIB) 
 
 N GLO S GLO="^[QUI]CPTEUR(""TRANSFERT.NOMENCLATURE"")"
 I '($D(@GLO@(LIB))) S @GLO@(LIB)=1 Q LIB_"."_1
POP1 S @GLO@(LIB)=@GLO@(LIB)+1
 
 I $$IR^%QSGEST5(REPP,LIB_"."_@GLO@(LIB)) G POP1
 Q LIB_"."_@GLO@(LIB)
 
COMPAR 
 
 D MSG^%VZEATT("Activation du savoir-comparer")
 S INDCOMP="",PREDEFINI=0
 D ^TORQYSC($$NOMLOG^%QSF(REPP),COMPF,COMPF,.INDCOMP,.PREDEFINI)
COMP2 
 I INDCOMP="" D MAJCONT G TRT1
 S COMPNEW=INDCOMP,@COMPQS@(COMPF)=INDCOMP,NIV2=NIV,CPR=1
 I $D(^[QUI]TORQYC(COMPF)) S LISATT=$P(^[QUI]TORQYC(COMPF),"^",3)
 G TRT1
 
MAJCONT 
 
 S COMPNEW=$$POP(COMPF),@COMPQS@(COMPF)=COMPNEW
 Q:'(PREDEFINI)
 
 D MSG^%VZEATT($$^%QZCHW("mise a jour de la liste predefinie"))
 D PA^%QSGESTI(REPP,COMPNEW,$$^%QZCHW("PRIME.RECONNAISSANCE"),1,1)
 N LIST S LIST=$P(^[QUI]TORQYC(COMPF),"^",1)
 D STOCK^%QSGES11(LIST,COMPNEW)
 
 
 
 S LISATT=$P(^[QUI]TORQYC(COMPF),"^",3)
 Q
 
PERE(CP) 
 
 I $D(@COMPQS@(CP)) Q @COMPQS@(CP)
 Q CP
POPNUL 
 
 K ^[QUI]CPTEUR("TRANSFERT.NOMENCLATURE") Q
 
QTE(N) 
 
 Q:N=0 1
 N QT,Q1 S QT=@LISTCP@(N,"QTE")
 F I=N-1:-1:0 S Q1=$S((@LISTCP@(I,"QTE")+0)=0:1,1:@LISTCP@(I,"QTE")),QT=QT/Q1
 Q QT

