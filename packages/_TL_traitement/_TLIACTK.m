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

;%TLIACTK^INT^1^59547,74029^0
%TLIACTK ;
 
COPGAM 
 N AI,GI,A1,A2,G1,G2,LIEN,REP1,WHOIS1,WHOIS2,BASE1,IND1,IND2,QUI1,QUI2,OR2,KILL,MSG
 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Copie d'une gamme"))
 I '($$OKR^%INCOIN("MOZSF")) S MSG=$$^%QZCHW("Action non autorisee") G ERR
 S AI=$$NOMINT^%QSF("ARTICLE")
 I AI="" S MSG=$$^%QZCHW("Nom repert. ARTICLEs inconnu") G ERR
 S GI=$$^%QCAZG("^TABIDENT(WHOIS,""MOZART"",""GAMME"",""GE"")")
 I GI="" S MSG=$$^%QZCHW("Nom repert. GAMMEs inconnu") G ERR
 S GI=$$NOMINT^%QSF(GI)
 S LIEN=$$LIEN1^%QSGEL2(AI,GI,2)
 I LIEN="" S MSG=$$^%QZCHW("Pas de lien ARTICLE-GAMME") G ERR
 S POS=1,A1=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POS)
 I (A1="")!(POS=0) S MSG=$$^%QZCHW("Imposs. evaluer 1er ARTICLE") G ERR
 I '($$IR^%QSGEST5(AI,A1)) S MSG=$$^%QZCHW("1er ARTICLE inexistant") G ERR
 S A2=$$SUBST^%ANARBR2($$RED(ACTI,3),.CXT,"ATT^%TLIACT3",.POS)
 I (A2="")!(POS=0) S MSG=$$^%QZCHW("Imposs. evaluer 2nd ARTICLE") G ERR
 I '($$IR^%QSGEST5(AI,A2)) S MSG=$$^%QZCHW("2eme ARTICLE inexistant") G ERR
 S G1=$$RED(ACTI,2)
 G:G1=0 PREMG
 S G1=$$SUBST^%ANARBR2(G1,.CXT,"ATT^%TLIACT3",.POS)
 I (G1="")!(POS=0) S MSG=$$^%QZCHW("Imposs. evaluer 1ere GAMME") G ERR
 I '($$IR^%QSGEST5(GI,A1_","_G1)) S MSG=$$^%QZCHW("1ere GAMME inexistante") G ERR
 G GAM2
 
PREMG 
 S G1=$$^%QSCALVA(AI,A1,LIEN)
 I G1="" S MSG=$$^%QZCHW("Pas de GAMME pour 1er ARTICLE") G ERR
 
GAM2 S G2=$$RED(ACTI,4)
 I G2=0 S G2=G1 G ORDGAM
 S G2=$$SUBST^%ANARBR2(G2,.CXT,"ATT^%TLIACT3",.POS)
 I (G2="")!(POS=0) S MSG=$$^%QZCHW("Imposs. evaluer 2nde GAMME") G ERR
 I $L(G2,",")'=1 S MSG=$$^%QZCHW("Nom 2eme GAMME incorrect") G ERR
 
ORDGAM S OR2=$$RED(ACTI,5)
 I OR2=0 S OR2=G2 G RECOP
 S OR2=$$SUBST^%ANARBR2(OR2,.CXT,"ATT^%TLIACT3",.POS)
 I (OR2="")!(POS=0) S MSG=$$^%QZCHW("Imposs. evaluer no ordre") G ERR
 
RECOP I $$IR^%QSGEST5(GI,A2_","_G2) S MSG=$$^%QZCHW("GAMME ")_A2_","_G2_$$^%QZCHW(" existante") G ERR
 S (WHOIS1,WHOIS2)=WHOIS,(QUI1,QUI2)=QUI,BASE1=GI,IND1=A1_","_G1
 S IND2=A2_","_G2,REP1="GAMME"
 S KILL=0
 I '($$DIACONT^%QMCPT) S MSG=$$^%QZCHW("Copie non effectuee") G ERR
 D:MODEX=2 STIND^%TLBAATT(BASE1,IND2,1,"","AJOUT")
 D:MODEX'=1 ^%QMCP9(WHOIS1,QUI1,BASE1,IND1,WHOIS2,QUI2,IND2,OR2)
 D CLEPAG^%VVIDEO,REAFF^%TLUTIL
 D:MODAF ADD^%TLIFEN("LOG","  "_IND2_" "_$$^%QZCHW("creee"))
 Q
 
ERR 
 D:MODAF ADD^%TLIFEN("LOG","  "_MSG)
 S ECHEC=1 Q
 
CRACT 
 N NUM,ACT,GAM,GE,GI,OE,OI,LIEN,LIS,NOMO,VVAR,MSG,LLIS
 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Creation d'une action"))
 I '($$OKR^%INCOIN("MOZSF")) S MSG=$$^%QZCHW("Action non autorisee") G ERR
 S LLIS=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"OPER")
 K @(LLIS)
 
 S VVAR=$$RED($$RED(ACTI,1),"TEXTE")
 I VVAR="" S MSG=$$^%QZCHW("Imposs. trouver variable") G ERR
 
 S POS=1,NUM=$$SUBST^%ANARBR2($$RED(ACTI,2),.CXT,"ATT^%TLIACT3",.POS)
 I (NUM="")!(POS=0) S MSG=$$^%QZCHW("Imposs. evaluer numero") G ERR
 I '($$ENTP^%QZNBN(NUM)) S MSG=$$^%QZCHW("Entier positif attendu") G ERR
 
 S ACT=$$SUBST^%ANARBR2($$RED(ACTI,3),.CXT,"ATT^%TLIACT3",.POS)
 I (ACT="")!(POS=0) S MSG=$$^%QZCHW("Imposs. evaluer action") G ERR
 I $L(ACT,",")'=1 S MSG=$$^%QZCHW("Pas de "","" dans l'action") G ERR
 
 S GAM=$$RED(ACTI,4)
 G:GAM'=0 CRACT2
 
 S GE=$$NOMLOG^%QSF(CXT("@","BASE")),GAM=CXT("@","OBJET")
 G CRACT3
 
CRACT2 
 S GAM=$$SUBST^%ANARBR2(GAM,.CXT,"ATT^%TLIACT3",.POS)
 I (GAM="")!(POS=0) S MSG=$$^%QZCHW("Imposs. evaluer nom GAMME") G ERR
 
 S GE=$$RED(ACTI,5)
 S GE=$$SUBST^%ANARBR2(GE,.CXT,"ATT^%TLIACT3",.POS)
 I (GE="")!(POS=0) S MSG=$$^%QZCHW("Imposs. evaluer nom repertoire") G ERR
 
CRACT3 
 I '($D(^TABIDENT(WHOIS,"MOZART",GE,"GE"))) S MSG=$$^%QZCHW("Repert. non connecte a MOZART") G ERR
 S GI=$$NOMINT^%QSF(GE)
 I GI="" S MSG=$$^%QZCHW("Nom repert. GAMME inconnu") G ERR
 S OE=$$^%QCAZG("^TABIDENT(WHOIS,""MOZART"","""_GE_""",""OE"")")
 S OI=$$NOMINT^%QSF(OE)
 I OI="" S MSG=$$^%QZCHW("Nom repert. OPERATIONs inconnu") G ERR
 S LIEN=$$LIEN1^%QSGEL2(GI,OI,2)
 I LIEN="" S MSG=$$^%QZCHW("Lien inconnu entre GAMME et OPERATION") G ERR
 I '($$IR^%QSGEST5(GI,GAM)) S MSG=$$^%QZCHW("Gamme inexistante") G ERR
 
 S NOMO=""
BNOMO S NOMO=$$NXTRIAO^%QSTRUC8(GI,GAM,LIEN,NOMO)
 G:NOMO="" BNOMF
 S @LLIS@(NOMO)=""
 G BNOMO
BNOMF S NOMO=NUM_".999"
 S NOMO=$ZP(@LLIS@(NOMO))
 I NOM="" S NUM=NUM_".001" G GENOP
 I $P(NOMO,".")'=NUM S NUM=NUM_".001" G GENOP
 S NOMO=$P(NOMO,".",2),LNOMO=$L(NOMO),NOMO=NOMO+2
 S NOMO=$$ZSUBST^%QZCHSUB($J(NOMO,LNOMO)," ","0")
 S NUM=NUM_"."_NOMO
 
GENOP 
 S NOMO=GAM_","_ACT_"/"_NUM
 G:MODEX'=2 GEN1
 D STATT^%TLBAATT(OI,NOMO,"NOM",ACT_"/"_NUM,1,"AJOUT")
 D STATT^%TLBAATT(CXT("%","BASE"),CXT("%","OBJET"),VVAR,NOMO,1,"AJOUT")
 D STATT^%TLBAATT(OI,NOMO,"NUMERO.OPERATION",NUM\1,1,"AJOUT")
 D STATT^%TLBAATT(OI,NOMO,"ACTION",ACT,1,"AJOUT")
 D STIND^%TLBAATT(OI,NOMO,1,VVAR,"AJOUT")
 D STLIEN^%TLBAATT(GI,GAM,LIEN,OI,NOMO,"AJOUT")
GEN1 G:MODEX=1 GEN2
 D ADDO^%QSGEST3(GI,GAM,NUM,LIEN,OI,ACT_"/"_NUM)
 D PA^%QSGESTI(OI,NOMO,"NOM",ACT_"/"_NUM,1)
 D PA^%QSGESTI(OI,NOMO,"NUMERO.OPERATION",NUM\1,1)
 D PA^%QSGESTI(OI,NOMO,"ACTION",ACT,1)
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),VVAR,NOMO,1)
GEN2 S CXT(VVAR,"BASE")=OI,CXT(VVAR,"OBJET")=NOMO
 K @(LLIS)
 D:MODAF ADD^%TLIFEN("LOG","  "_NOMO_" "_$$^%QZCHW("creee"))
 Q
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

