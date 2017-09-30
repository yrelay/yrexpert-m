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

;%PSSAOP^INT^1^59547,73874^0
%PSSAOP ;;07:40 PM  5 Dec 1991;
 
 
 N %T,X,TEMP,ZZ,AFFICH,GLOB,MENUH,ADRES,ENS,L,CALA
 S AFFICH=0,CALA=0
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"DRV") K @(TEMP)
 S TABAFF=$$CONCAS^%QZCHAD(TEMP,"TB")
 S MENUH=$$CONCAS^%QZCHAD(TEMP,"MN")
 S ENS=$$CONCAS^%QZCHAD(TEMP,"SL")
 S @MENUH="22^10^79"
 S @MENUH@(1)=$$^%QZCHW("creer")_"^CREER",@MENUH@(1,"COM")=$$^%QZCHW("creer un nouvel operateur")
 S @MENUH@(2)=$$^%QZCHW("modifier")_"^MODIF",@MENUH@(2,"COM")=$$^%QZCHW("modifier un operateur")
 S @MENUH@(3)=$$^%QZCHW("supprimer")_"^SUPP",@MENUH@(3,"COM")=$$^%QZCHW("supprimer un operateur ")
 
 D CLEPAG^%VVIDEO,TETE,CALA,AFF
ACTH S DX=0,DY=21 D CLEBAS^%VVIDEO,^%VQUIKMN(1,80,23,MENUH,.ADRES,.CONTR)
 I (CONTR="F")!(CONTR="A") G FIN
 I CONTR="R" D:'(CALA) CALA D:'(AFF) AFF G ACTH
 G:ADRES'="" @ADRES G ACTH
 
CREER D CLEPAG^%VVIDEO S AFF=0
 S DX=10,DY=6 X XY W $$^%QZCHW("Domaine")_"  :" S DX=30 X XY R DO G:DO="" ACTH
 S DX=10,DY=10 X XY W $$^%QZCHW("Operateur")_"  :" S DX=30 X XY R OP G:OP="" ACTH
 D ^%PSSAOP1(DO,OP)
 G ACTH
 
MODIF D:'(CALA) CALA D:'(AFF) AFF
 S X=$$UN^%QUCHOI4(ZZ) G:X="" ACTH
 D GET(X,.DO,.OP)
 D ^%PSSAOP1(DO,OP)
 D KILLAFF,CLEPAG^%VVIDEO,TETE,CALA,AFF
 G ACTH
SUPP 
 D:'(CALA) CALA D:'(AFF) AFF
 K @(ENS)
 D ^%QUCHOYP(ENS) G:'($D(@ENS)) ACTH
 D POCLEPA^%VVIDEO
 I $$CONFIRM^%VZEOUI($$^%QZCHW("Suppression de ces operateurs")_" ? ")'=1 K @(ENS) G ACTH
 S L=""
 F %T=1:1 S L=$O(@ENS@(L)) Q:L=""  D GET(L,.DO,.OP),SUP(DO,OP)
 D KILLAFF,CLEPAG^%VVIDEO,TETE,CALA,AFF
 G ACTH
 
FIN 
 K @(MENUH)
 I AFFICH=0 Q
 D KILLAFF
 Q
 
SUP(DO,OP) 
 K ^[QUI]RQSGLO("GPS","DOM",DO,OP),^[QUI]RQSDON("GPS","DOM",DO,OP) Q
 
GET(L,D,O) 
 S D=$P(L," "),O=$P($E(L,31,99999)," ") Q
 
KILLAFF D END^%QUCHOI4(ZZ) K ^[QUI]QX($J,ZZ) S CALA=0 Q
 
TETE D ^%VZCD(0,39,0,2,1,0,$$^%QZCHW("OPERATEURS")) Q
CALA D ^%VZEATT
 S ZZ=$ZP(^[QUI]QX($J,""))+1
 D CONSTAB(ZZ)
 S X=$$INI^%QUCHOI4(1,"",0,4,79,17,"    DOMAINE                OPERATEUR",ZZ,0)
 D OFF^%VZEATT
 S CALA=1,AFF=0
 Q
AFF D CLEPAG^%VVIDEO,TETE,AFF^%QUCHOI4(ZZ) S AFF=1 Q
 
CONSTAB(P) 
 N K,J,GLOB,DO,OP
 S GLOB="^[QUI]RQSGLO(""GPS"",""DOM"")"
 K ^[QUI]QX($J,P)
 S ^[QUI]QX($J,P,"LC",1)=30,^[QUI]QX($J,P,"LC",2)=30
 S J=1,DO="" F K=0:0 S DO=$O(@GLOB@(DO)) Q:DO=""  S OP="" F J=J:1 S OP=$O(@GLOB@(DO,OP)) Q:OP=""  S ^[QUI]QX($J,P,"T",J,1)=$E(DO,1,30),^[QUI]QX($J,P,"T",J,2)=$E(OP,1,30)
 Q
 
 
 
 
CHOIXDD(DO) 
 N ZZ,X,K,J,GLOB
 D CLEPAG^%VVIDEO
 S ZZ=$ZP(^[QUI]QX($J,""))+1
 S GLOB="^[QUI]RQSGLO(""GPS"",""DOM"")"
 K ^[QUI]QX($J,ZZ)
 S ^[QUI]QX($J,ZZ,"LC",1)=30,^[QUI]QX($J,ZZ,"LC",2)=30
 S OP="" F J=1:1 S OP=$O(@GLOB@(DO,OP)) Q:OP=""  S ^[QUI]QX($J,ZZ,"T",J,1)=$E(DO,1,30),^[QUI]QX($J,ZZ,"T",J,2)=$E(OP,1,30)
 S X=$$INI^%QUCHOI4(1,"",0,4,79,17,"    DOMAINE                OPERATEUR",ZZ,0)
 D AFF^%QUCHOI4(ZZ)
 S X=$$UN^%QUCHOI4(ZZ)
 D END^%QUCHOI4(ZZ) K ^[QUI]QX($J,ZZ)
 Q $S(X="":"",1:$P($E(X,31,999)," "))
 
EXIOPEDD(DO,OP) 
 N GLOB
 S GLOB="^[QUI]RQSGLO(""GPS"",""DOM"")"
 Q $D(@GLOB@(DO,OP))

