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

;%TLBAETD^INT^1^59547,74028^0
TLBAETD ;
 
CHOIX(ETUDE,CONTR) 
 N %T,X,ZZ,AFFICH,GLOB,MENUH,ADRES,ENS,L
 S AFFICH=0,GLOB=$$ADRESSE
 S MENUH=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"MENUH")
 
CHOIX2 
 K @(MENUH)
 S @MENUH="22^10^79"
 S @MENUH@(1)=$$^%QZCHW("creer")_"^CREER",@MENUH@(1,"COM")=$$^%QZCHW("lancer une nouvelle etude pour la mise au point du savoir-faire")
 S @MENUH@(2)=$$^%QZCHW("reprendre")_"^REPR",@MENUH@(2,"COM")=$$^%QZCHW("reprendre une etude deja commencee")
 S @MENUH@(3)=$$^%QZCHW("supprimer")_"^SUPP",@MENUH@(3,"COM")=$$^%QZCHW("supprimer des etudes obsoletes  ")
 S @MENUH@(4)=$$^%QZCHW("verbes")_"^VERBES",@MENUH@(4,"COM")=$$^%QZCHW("acces a la documentation sur les verbes de DKBMS")
ACTH S DX=0,DY=21 D CLEBAS^%VVIDEO,^%VQUIKMN(1,80,23,MENUH,.ADRES,.CONTR)
 I (CONTR="F")!(CONTR="A") S CONTR=1 G FIN
 I CONTR="R" D:'(AFFICH) INIT D:AFFICH AFF^%QUCHOI4(ZZ) S AFFICH=1 G ACTH
 G:ADRES'="" @ADRES G ACTH
 
VERBES 
 D ^%TLHELPN
 D CLEPAG^%VVIDEO
 G ACTH
CREER 
 S ETUDE=$$GEN^%QCAPOP("TTL"),CONTR=2
 G FIN
REPR 
 I AFFICH=0 D INIT S AFFICH=1
 S X=$$UN^%QUCHOI4(ZZ) G:X="" ACTH
 S ETUDE=$P(X," ",1),CONTR=3
 G FIN
SUPP 
 I AFFICH=0 D INIT S AFFICH=1
 S ENS=$$CONCAS^%QZCHAD(MENUH,"SUPPR") K @(ENS)
 D ^%QUCHOYP(ENS) G:'($D(@ENS)) ACTH
 
 D POCLEPA^%VVIDEO
 I $$CONFIRM^%VZEOUI($$^%QZCHW("Suppression de ces etudes MAP")_" ? ")'=1 K @(ENS) G ACTH
 S L=""
 F %T=1:1 S L=$O(@ENS@(L)) Q:L=""  S ETUDE=$P(L," ",1) D SU2
 D INIT
 G CHOIX2
 
SU2 
 F X=1:1 Q:'($D(@GLOB@(ETUDE,X,"NOM.PLAN")))  D DECUT^%TLBAPL(@GLOB@(ETUDE,X,"NOM.PLAN")),TUEPL^%TLBAPL(@GLOB@(ETUDE,X,"NOM.SORTIE"))
 K @GLOB@(ETUDE)
 Q
 
FIN 
 K @(MENUH)
 I AFFICH=0 Q
 S CONTR=CONTR+3
 D CLEPAG^%VVIDEO,END^%QUCHOI4(ZZ)
 K ^[QUI]QX($J)
 Q
 
ADRESSE() 
 Q "^[QUI]RQSGLO(""TLBA"",""ETUDE"")"
 
 
INIT 
 N %T
 D CLEPAG^%VVIDEO,^%VZCD(0,39,0,2,1,0,"ETUDES DU SAVOIR-FAIRE")
 D ^%VZEATT S ZZ=1
 S %T=4,%T(1)=13,%T(2)=16,%T(3)=13,%T(4)=34
 D CONSTAB(ZZ,"%T")
 S X=$$INI^%QUCHOI4(1,"",0,4,80,18,$J("",3)_$$^%QZCHW("ETUDE")_$J("",8)_$$^%QZCHW("DATE")_$J("",12)_$$^%QZCHW("LISTE")_$J("",8)_$$^%QZCHW("TRAITEMENT"),ZZ,0)
 D AFF^%QUCHOI4(ZZ),POCLEPA^%VVIDEO
 Q
 
CONSTAB(P,DIM) 
 
 
 
 N ATT,GLOB,I,K,ETUDE,J
 K ^[QUI]QX($J),^QX($J)
 F I=1:1:@DIM S ^[QUI]QX($J,P,"LC",I)=@DIM@(I)
 S GLOB=$$ADRESSE
 S J=1,ETUDE="" F I=1:1 S ETUDE=$O(@GLOB@(ETUDE)) Q:ETUDE=""  D INSG
 Q
INSG 
 S ^[QUI]QX($J,P,"T",J,1)=$E(ETUDE,1,@DIM@(1))
 F K=2:1:@DIM S ATT=$P($P($T(LIB),";;",2),"/",K-1),^[QUI]QX($J,P,"T",J,K)=$S($D(@GLOB@(ETUDE,ATT)):@GLOB@(ETUDE,ATT),1:"")
 S J=J+1 Q
LIB ;;DATE/LISTE/TRAITEMENT

