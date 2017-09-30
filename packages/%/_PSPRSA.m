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

;%PSPRSA^INT^1^59547,73874^0
%PSPRSA ;
 
 
 
 
 
 N %T,X,TEMP,ZZ,AFFICH,GLOB,MENUH,ADRES,ENS,L,CALA,LLISTE,LISTE,LRES
 N TABAFF,CH,LT,LS,CORRESP
 S AFFICH=0,CALA=0
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"DRV") K @(TEMP)
 S TABAFF=$$CONCAS^%QZCHAD(TEMP,"TB")
 S LLISTE=$$CONCAS^%QZCHAD(TEMP,"LI")
 S MENUH=$$CONCAS^%QZCHAD(TEMP,"MN")
 S ENS=$$CONCAS^%QZCHAD(TEMP,"SL")
 S CORRESP=$$CONCAS^%QZCHAD(TEMP,"CORR")
 S ZZ=$ZP(^[QUI]QX($J))+1
 S @MENUH="22^10^79"
 S @MENUH@(1)=$$^%QZCHW("creer")_"^CREER",@MENUH@(1,"COM")=$$^%QZCHW("creer un predicat")
 S @MENUH@(2)=$$^%QZCHW("modifier")_"^MODIF",@MENUH@(2,"COM")=$$^%QZCHW("modifier un predicat")
 S @MENUH@(3)=$$^%QZCHW("supprimer")_"^SUPP",@MENUH@(3,"COM")=$$^%QZCHW("supprimer un predicat ")
 S @MENUH@(4)=$$^%QZCHW("analyser")_"^ANA",@MENUH@(4,"COM")=$$^%QZCHW("reanalyse de predicats ")
 S @MENUH@(5)=$$^%QZCHW("activer")_"^ACTIV",@MENUH@(5,"COM")=$$^%QZCHW("activation d'un predicat sur une liste (pseudo-requete) ")
 S @MENUH@(6)=$$^%QZCHW("coefficients")_"^COEFF",@MENUH@(6,"COM")=$$^%QZCHW("saisie des coefficients de reussite d'un predicat")
 S @MENUH@(7)=$$^%QZCHW("duplication")_"^DUPLIC",@MENUH@(6,"COM")=$$^%QZCHW("duplication d'un predicat")
 
 D CLEPAG^%VVIDEO,TETE,CALA,AFF
ACTH S DX=0,DY=21 D CLEBAS^%VVIDEO,^%VQUIKMN(1,80,23,MENUH,.ADRES,.CONTR)
 I (CONTR="F")!(CONTR="A") G FIN
 I CONTR="R" D:'(CALA) CALA D:'(AFF) AFF G ACTH
 G:ADRES'="" @ADRES G ACTH
 
CREER N RES,CTR
 D CLEPAG^%VVIDEO S AFF=0,CTR=""
 D LIRE2^%VREAD($$^%QZCHW("Predicat")_"  :   ","",2,75,13,12,"","",.CTR,.PR) I ((CTR="F")!(CTR="A"))!(PR="") D CLEPAG^%VVIDEO,TETE,AFF G ACTH
 D ^%PSPRSA1(PR,3,14)
 S RES=$$COMPIL^%PSPRGES(PR,0)
 D KILLAFF,CLEPAG^%VVIDEO,TETE,CALA,AFF S AFF=0
 G ACTH
 
MODIF N RES
 D:'(CALA) CALA D:'(AFF) AFF
 S X=$$UN^%QUCHOI4(ZZ) G:X="" ACTH
 D GET(X,.PR),^%PSPRSA1(PR,3,14)
 S RES=$$COMPIL^%PSPRGES(PR,0)
 D CLEPAG^%VVIDEO,TETE,AFF
 G ACTH
 
SUPP D:'(CALA) CALA D:'(AFF) AFF
 K @(ENS) D ^%QUCHOYP(ENS) G:'($D(@ENS)) ACTH
 D POCLEPA^%VVIDEO
 I $$CONFIRM^%VZEOUI($$^%QZCHW("Suppression de ces predicats")_" ? ")'=1 K @(ENS) G ACTH
 S L=""
 F %T=1:1 S L=$O(@ENS@(L)) Q:L=""  D GET(L,.PR),SUPP^%PSPRGES(PR)
 D KILLAFF,CLEPAG^%VVIDEO,TETE,CALA,AFF S AFF=0
 G ACTH
 
ACTIV N CTR
 S CTR=""
 D:'(CALA) CALA D:'(AFF) AFF
 S X=$$UN^%QUCHOI4(ZZ) G:X="" ACTH D GET(X,.PR)
LCTLST D POCLEPA^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW("Liste")_"  :  ","",2,75,23,22,"","",.CTR,.LISTE) I ((CTR="F")!(CTR="A"))!(LISTE="") D CLEPAG^%VVIDEO,TETE,AFF G ACTH
 G:LISTE="?" LCTLST2
 G:$$REP^%QSGEST5($$NOMINT^%QSF(LISTE)) ACTI2
 G:'($$EX^%QS0(LISTE)) LCTLST
 G ACTI2
LCTLST2 K @(LLISTE)
 S FEN=LLISTE D PFEN^%QS0DP,AFFICH^%QUAPAGM
 S LISTE=$$UN^%QUAPAGM
 I LISTE="" D CLEPAG^%VVIDEO,TETE,AFF G ACTH
ACTI2 S LRES=$$REQUETE^%PSPREV(PR,LISTE)
 D ^%VZEAVT("Le resultat est dans "_LRES_"  ("_$$^%QSCALIN("L0",LRES,"CARD",1)_")")
 D CLEPAG^%VVIDEO,TETE,AFF
 G ACTH
 
COEFF D:'(CALA) CALA D:'(AFF) AFF
 S X=$$UN^%QUCHOI4(ZZ) G:X="" ACTH
 D GET(X,.PR),SAIS^%PSPRSAC(PR)
 D CLEPAG^%VVIDEO,TETE,AFF
 G ACTH
 
 
DUPLIC N RES,PRDD,CTR,PRDS
 S CTR=""
 D:'(CALA) CALA D:'(AFF) AFF
LCTPRDS 
 D POCLEPA^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW("predicat a dupliquer")_"  :  ","",2,75,23,22,"","",.CTR,.PRDS) I ((CTR="F")!(CTR="A"))!(PRDS="") D CLEPAG^%VVIDEO,TETE,AFF G ACTH
 I PRDS="?" S X=$$UN^%QUCHOI4(ZZ) G:X="" LCTPRDS D GET(X,.PRDS)
 G:'($$EXIPRED^%PSPRGES(PRDS)) LCTPRDS
LCTPRDD 
 D POCLEPA^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW("Nom de la recopie")_"  :  ","",2,75,23,22,"","",.CTR,.PRDD) I ((CTR="F")!(CTR="A"))!(PRDD="") D CLEPAG^%VVIDEO,TETE,AFF G ACTH
 D DUPLIC^%PSPRSA2(PRDS,PRDD)
 S RES=$$ANAONE^%PSPRSA1(PRDD),RES=RES&$$COMPIL^%PSPRGES(PRDD,0) O 0 U 0 W !,PRDD," : ",$S(RES:"OK",1:"Probleme"),!
 D CLEPAG^%VVIDEO,TETE,CALA,AFF
 G ACTH
 
 
FIN K @(MENUH)
 I AFFICH=0 Q
 D KILLAFF
 Q
 
 
ANA N RES
 S LS=$$^%QZCHW("Selectionner"),LT=$$^%QZCHW("Tous")
 D POCLEPA^%VVIDEO
 S CH=$$^%VZECH2("",LS,LT)
 G:(CH'=LS)&(CH'=LT) ACTH G:CH=LS ANASEL
 
 D CLEPAG^%VVIDEO
 S PR="" F %I=0:0 S PR=$O(^[QUI]RQSGLO("PRED",PR)) Q:PR=""  S RES=$$ANAONE^%PSPRSA1(PR),RES=RES&$$COMPIL^%PSPRGES(PR,1) O 0 U 0 W !,PR," : ",$S(RES:"OK",1:"Probleme"),!
 S DX=0,DY=23 U 0 X XY W $$^%QZCHW("[RETURN]") R RET
 D CLEPAG^%VVIDEO,TETE,AFF
 G ACTH
 
ANASEL D:'(CALA) CALA D:'(AFF) AFF
 K @(ENS) D ^%QUCHOYP(ENS) G:'($D(@ENS)) ACTH
 D CLEPAG^%VVIDEO
 S L=""
 F %T=1:1 S L=$O(@ENS@(L)) Q:L=""  D GET(L,.PR) S RES=$$ANAONE^%PSPRSA1(PR),RES=RES&$$COMPIL^%PSPRGES(PR,1) O 0 U 0 W !,PR," : ",$S(RES:"OK",1:"Probleme"),!
 S DX=0,DY=23 U 0 X XY W $$^%QZCHW("[RETURN]") R RET
 D CLEPAG^%VVIDEO,TETE,AFF
 G ACTH
 
GET(L,PR) 
 S PR=@CORRESP@($P(L," ")) Q
 
KILLAFF D END^%QUCHOI4(ZZ) K ^[QUI]QX($J,ZZ) S CALA=0 Q
 
TETE D ^%VZCD(0,39,0,2,1,0,$$^%QZCHW("PREDICATS")) Q
CALA D ^%VZEATT
 S ZZ=$ZP(^[QUI]QX($J))+1
 D CONSTAB(ZZ)
 S X=$$INI^%QUCHOI4(1,"",0,4,79,17,"    PREDICAT                ",ZZ,0)
 D OFF^%VZEATT
 S CALA=1,AFF=0
 Q
AFF D AFF^%QUCHOI4(ZZ) S AFF=1 Q
 
CONSTAB(P) 
 N K,J,GLOB,PR
 S GLOB="^[QUI]RQSGLO(""PRED"")"
 K ^[QUI]QX($J,P)
 S ^[QUI]QX($J,P,"LC",1)=30,^[QUI]QX($J,P,"LC",2)=30,^[QUI]QX($J,P,"LC",3)=4
 S PR="" F J=1:1 S PR=$O(@GLOB@(PR)) Q:PR=""  S ^[QUI]QX($J,P,"T",J,1)=$E(PR,1,30),@CORRESP@($E(PR,1,29))=PR I $D(@GLOB@(PR,1))#10 S ^[QUI]QX($J,P,"T",J,2)=$E(@GLOB@(PR,1),1,30) I $D(@GLOB@(PR,2))#10 S ^[QUI]QX($J,P,"T",J,3)="..."
 Q
 
 
CHOIX() 
 N %T,X,TEMP,ZZ,AFFICH,GLOB,MENUH,ADRES,ENS,L,CALA,TABAFF,CORRESP
 S AFFICH=0,CALA=0
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"DRV") K @(TEMP)
 S TABAFF=$$CONCAS^%QZCHAD(TEMP,"TB")
 S MENUH=$$CONCAS^%QZCHAD(TEMP,"MN")
 S ENS=$$CONCAS^%QZCHAD(TEMP,"SL")
 S CORRESP=$$CONCAS^%QZCHAD(TEMP,"CORR")
 D CLEPAG^%VVIDEO,TETE
 D CALA,AFF
 S X=$$UN^%QUCHOI4(ZZ) Q:X="" ""
 D GET(X,.PR)
 D KILLAFF
 Q PR

