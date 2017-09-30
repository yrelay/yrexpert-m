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

;%PSSADOM^INT^1^59547,73874^0
%PSSADOM ;;07:39 PM  9 Dec 1991;
 
 
 N %T,X,TEMP,ZZ,AFFICH,GLOB,MENUH,ADRES,ENS,L,CALA
 S AFFICH=0,CALA=0
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"DRV") K @(TEMP)
 S TABAFF=$$CONCAS^%QZCHAD(TEMP,"TB")
 S MENUH=$$CONCAS^%QZCHAD(TEMP,"MN")
 S ENS=$$CONCAS^%QZCHAD(TEMP,"SL")
 S ZZ=$ZP(^[QUI]QX($J,""))+1
 S @MENUH="22^10^79"
 S @MENUH@(1)=$$^%QZCHW("creer")_"^CREER",@MENUH@(1,"COM")=$$^%QZCHW("creer un nouveau domaine")
 S @MENUH@(2)=$$^%QZCHW("modifier")_"^MODIF",@MENUH@(2,"COM")=$$^%QZCHW("modifier un domaine")
 S @MENUH@(3)=$$^%QZCHW("supprimer")_"^SUPP",@MENUH@(3,"COM")=$$^%QZCHW("supprimer un domaine ")
 S @MENUH@(4)=$$^%QZCHW("predicats")_"^PRED",@MENUH@(4,"COM")=$$^%QZCHW("acces aux predicats ")
 
 D CLEPAG^%VVIDEO,TETE,CALA,AFF
ACTH S DX=0,DY=21 D CLEBAS^%VVIDEO,^%VQUIKMN(1,80,23,MENUH,.ADRES,.CONTR)
 I (CONTR="F")!(CONTR="A") G FIN
 I CONTR="R" D:'(CALA) CALA D:'(AFF) AFF G ACTH
 G:ADRES'="" @ADRES G ACTH
 
CREER K DO,AX
CREMOD S (AFF,CALA)=0 D AFFPAG
 S DY=6,DX=35 X XY R DO G:DO="" ACTH
GETAX S DY=10,DX=35 X XY R AX
 I AX="?" S AX=$$CHOIX^%PSPRSA D AFFPAG
 I AX'="",'($$EXIPRED^%PSPRGES(AX)) D ^%VZEAVT("Predicat inconnu"),AFFPAG G GETAX
 S ^[QUI]RQSGLO("GPS","DOM",DO)=AX
 D KILLAFF,CALA,AFF
 G ACTH
 
AFFPAG D CLEPAG^%VVIDEO
 S DX=5,DY=6 X XY W $$^%QZCHW("Domaine")_"  :" I $D(DO) S DX=35 X XY W DO
 S DX=5,DY=10 X XY W $$^%QZCHW("Axiome d'application")_"  :" I $D(AX) S DX=35 X XY W AX
 Q
 
MODIF D:'(CALA) CALA D:'(AFF) AFF
 S X=$$UN^%QUCHOI4(ZZ) G:X="" ACTH
 D GET(X,.DO)
 K AX D AFFPAG G GETAX
 
SUPP 
 D:'(CALA) CALA D:'(AFF) AFF
 K @(ENS)
 D ^%QUCHOYP(ENS) G:'($D(@ENS)) ACTH
 D POCLEPA^%VVIDEO
 I $$CONFIRM^%VZEOUI($$^%QZCHW("Suppression de ces domaines")_" ? ")'=1 K @(ENS) G ACTH
 S L=""
 F %T=1:1 S L=$O(@ENS@(L)) Q:L=""  D GET(L,.DO),SUP(DO)
 D KILLAFF,CLEPAG^%VVIDEO,TETE,CALA,AFF
 G ACTH
 
PRED D ^%PSPRSA
 D KILLAFF,CLEPAG^%VVIDEO,TETE,CALA,AFF
 G ACTH
FIN 
 K @(MENUH)
 I AFFICH=0 Q
 D KILLAFF
 Q
 
SUP(DO) 
 K ^[QUI]RQSGLO("GPS","DOM",DO),^[QUI]RQSDON("GPS","DOM",DO) Q
 
GET(L,D) 
 S D=$P(L," ") Q
 
KILLAFF D END^%QUCHOI4(ZZ) K ^[QUI]QX($J,ZZ) S CALA=0 Q
 
TETE D ^%VZCD(0,39,0,2,1,0,$$^%QZCHW("DOMAINES")) Q
CALA D ^%VZEATT,CONSTAB(ZZ)
 S X=$$INI^%QUCHOI4(1,"",0,4,79,17,"    DOMAINE                AXIOME",ZZ,0)
 D OFF^%VZEATT
 S CALA=1,AFF=0
 Q
AFF D CLEPAG^%VVIDEO,TETE,AFF^%QUCHOI4(ZZ) S AFF=1 Q
 
CONSTAB(P) 
 N ATT,K,J,GLOB
 S GLOB="^[QUI]RQSGLO(""GPS"",""DOM"")"
 K ^[QUI]QX($J,P)
 S ^[QUI]QX($J,P,"LC",1)=30,^[QUI]QX($J,P,"LC",2)=30
 S DO="" F J=1:1 S DO=$O(@GLOB@(DO)) Q:DO=""  S ^[QUI]QX($J,P,"T",J,1)=$E(DO,1,30),^[QUI]QX($J,P,"T",J,2)=$E(@GLOB@(DO),1,30)
 Q
 
 
 
CHOIX() 
 D CALA,AFF

