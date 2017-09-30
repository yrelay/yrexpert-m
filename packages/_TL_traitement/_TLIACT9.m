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

;%TLIACT9^INT^1^59547,74029^0
%TLIACT9 ;
 
 
FTRT 
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S @TEMPO@(1)="M",@TEMPO@(2)="N",@TEMPO@(3)="O",@TEMPO@(4)="T"
 S @TEMPO@(5)="R",@TEMPO@(6)="S",@TEMPO@(7)="E",@TEMPO@(8)="POS"
 S @TEMPO@(9)="BA",@TEMPO@(10)="MESSA",@TEMPO@(11)="OBJ"
 D EMPV^%ANGEPIL(TEMPO) K @(TEMPO)
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Activation d'un traitement"))
 D SAUVECR^%TLUTIL,SAUVVAL^%TLUTIL
 S MESSA="",TRBOUC=0
 S POS=1,TRT=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POS)
 I (TRT="")!(POS=0) S:MODAF'=0 MESSA=$$^%QZCHW("  Impossible evaluer nom du traitement") G MAJT
 I '($$EXISTE^%TLINTER(TRT)) S:MODAF'=0 MESSA=$$^%QZCHW("  Impossible trouver traitement") G MAJT
 I '($$OKANA^%TLGEST(TRT)) S:MODAF'=0 MESSA=TRT_$$^%QZCHW(": traitement non analyse") G MAJT
 S REP=$$RED(ACTI,2)
 I REP=0 S OBJ=CXT("@","OBJET"),BA=CXT("@","BASE") G TLTRT2
 S REP=$$RED($$RED(REP,1),"TEXTE")
 I REP="" S OBJ=CXT("@","OBJET"),BA=CXT("@","BASE") G TLTRT2
 I '($D(CXT(REP,"BASE"))) S:MODAF'=0 MESSA=$$^%QZCHW("   Le repertoire de l'individu symbolique n'est pas defini") G MAJT
 I '($D(CXT(REP,"OBJET"))) S:MODAF'=0 MESSA=$$^%QZCHW("   L'individu symbolique n'est pas defini") G MAJT
 S OBJ=CXT(REP,"OBJET"),BA=CXT(REP,"BASE"),CARD=1
TLTRT2 S LISTE=$$GEN^%QCAPOP("TRT")
 D ^%QSGES11(BA,LISTE,"GDX",0,"","")
 S REP=BA
 D STOCK^%QSGES11(LISTE,OBJ)
 S ADRRET="RETOUR^%TLIACT9",TRLIS=0,SELECIN=0
 G SUIT^%TLIACTI
RETOUR S L=SORT
 D DEL^%QSGES11(LISTE)
MAJT D RESTVAL^%TLUTIL,RESTECR^%TLUTIL
 D:MESSA'="" ADD^%TLIFEN("LOG",MESSA)
 D DEPV^%ANGEPIL
 G REBOUCA^%TLIACT1
 
 
DELIER 
 N REP1,NOM1,REP2,NOM2,REPI1,REPI2,LIEN,POS
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Destruction lien relationnel"))
 S NOM1=$$RED(ACTI,1)
 I NOM1=0 S REPI1=CXT("@","BASE"),NOM1=CXT("@","OBJET") G INDIV2
 S NOM1=$$RED(NOM1,"TEXTE"),REPI1=$$^%QCAZG("CXT(NOM1,""BASE"")"),NOM1=$$^%QCAZG("CXT(NOM1,""OBJET"")")
 I (REPI1="")!(NOM1="") D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  1er individu mal defini")) S ECHEC=1 Q
INDIV2 I REPI1=$$LIENI^%QSGEL3 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Interdit delier individu LIEN")) S ECHEC=1 Q
 S REP1=$$NOMLOG^%QSF(REPI1)
 S LIEN=$$SUBST^%ANARBR2($$RED(ACTI,2),.CXT,"ATT^%TLIACT3",.POS)
 I (LIEN="")!(POS=0) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible determiner nom du lien")) S ECHEC=1 Q
 I '($D(^[QUI]RQSLIEN(REPI1,LIEN))) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Lien "_LIEN_" ne part pas du repertoire "_REP1)) S ECHEC=1 Q
 S NOM2=$$RED($$RED(ACTI,3),"TEXTE")
 S REPI2=$$^%QCAZG("CXT(NOM2,""BASE"")"),NOM2=$$^%QCAZG("CXT(NOM2,""OBJET"")")
 I (REPI2="")!(NOM2="") D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  2nd individu mal defini")) S ECHEC=1 Q
 I REPI2=$$LIENI^%QSGEL3 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Interdit delier individu LIEN")) S ECHEC=1 Q
 S REP2=$$NOMLOG^%QSF(REPI2),LIENB=^[QUI]RQSLIEN(REPI1,LIEN)
 I $P(LIENB,"^",2)'=REPI2 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Ce lien ne lie pas les 2 repertoires decrits")) S ECHEC=1 Q
 S LIENB=$P(LIENB,"^")
 I ((LIENB'=3)&(LIENB'=4))&(LIENB'=5) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Lien ni relationnel, ni involutif")) S ECHEC=1 Q
 D:MODEX=2 STLIEN^%TLBAATT(REPI1,NOM1,LIEN,REPI2,NOM2,"SUPPRESSION")
 D:MODEX'=1 SUPS^%QSGEST3(REPI1,NOM1,LIEN,REPI2,NOM2)
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Fin destruction lien relationnel"))
 Q
 
ALLER 
 N GOAD,IL,TET,NO,POS
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Saut a une adresse"))
 S POS=1,GOAD=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POS)
 I (GOAD="")!(POS=0) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Adresse impossible a determiner")) Q
 S IL=""
BOUC S IL=$O(@GLOSTO@(IL))
 I IL="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Adresse inconnue")) Q
 S TET=@GLOSTO@(IL,"TETE"),NO=$$RED(TET,1)
 G:NO'=0 BOUC
 S NO=$$RED(TET,2)
 G:$$RED(NO,"TEXTE")'="$ADRESSE" BOUC
 S NO=$$RED($$RED(NO,1),"TEXTE")
 G:NO'=GOAD BOUC
 S L=IL
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Fin de saut a une adresse"))
 Q
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

