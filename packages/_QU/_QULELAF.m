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

;%QULELAF^INT^1^59547,73885^0
%QULELAF(ROUTINE) ;;04:17 PM  8 Oct 1992; ; 08 Oct 92  4:56 PM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N %T,X,TEMP,ZZ,AFFICH,GLOB,MENUH,ADRES,ENS,L,CALA
 S AFFICH=0,CALA=0
 S @("GLOB=$$ADRETU^"_ROUTINE_"()")
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"DRV") K @(TEMP)
 S TABAFF=$$CONCAS^%QZCHAD(TEMP,"TB")
 S MENUH=$$CONCAS^%QZCHAD(TEMP,"MN")
 S ENS=$$CONCAS^%QZCHAD(TEMP,"SL")
 D @("MAKETB^"_ROUTINE_"(TABAFF)") S ZZ=1
 S @MENUH="22^10^79"
 S @MENUH@(1)=$$^%QZCHW("definir")_"^DEF",@MENUH@(1,"COM")=$$^%QZCHW("creer une nouvelle etude")
 S @MENUH@(2)=$$^%QZCHW("lancer")_"^CREER",@MENUH@(2,"COM")=$$^%QZCHW("creer et lancer une nouvelle etude")
 S @MENUH@(3)=$$^%QZCHW("reprendre")_"^REPR",@MENUH@(3,"COM")=$$^%QZCHW("reprendre une etude definie ou deja commencee ")
 S @MENUH@(4)=$$^%QZCHW("supprimer")_"^SUPP",@MENUH@(4,"COM")=$$^%QZCHW("supprimer des etudes obsoletes  ")
 
 D CLEPAG^%VVIDEO,TETE
ACTH S DX=0,DY=21 D CLEBAS^%VVIDEO,^%VQUIKMN(1,80,23,MENUH,.ADRES,.CONTR)
 I (CONTR="F")!(CONTR="A") G FIN
 I CONTR="R" D:'(CALA) CALA D:'(AFF) AFF G ACTH
 G:ADRES'="" @ADRES G ACTH
 
DEF S @("NUMET=$$CREERET^"_ROUTINE_"(0)")
 D KILLAFF,CLEPAG^%VVIDEO,TETE S AFF=0
 G ACTH
CREER 
 S @("NUMET=$$CREERET^"_ROUTINE_"(0)")
 I NUMET="" D CLEPAG^%VVIDEO G ACTH
 D @("ACTIET^"_ROUTINE_"(NUMET)")
 D KILLAFF,CLEPAG^%VVIDEO,TETE S AFF=0
 G ACTH
 
REPR D:'(CALA) CALA
 D:'(AFF) AFF
 S X=$$UN^%QUCHOI4(ZZ) G:X="" ACTH
 S NUMET=$P(X," ",1),CONTR=3
 D @("LOADET^"_ROUTINE_"(NUMET)")
 D @("ACTIET^"_ROUTINE_"(NUMET)")
 D KILLAFF,CLEPAG^%VVIDEO,TETE S AFF=0
 G ACTH
 
SUPP D:'(CALA) CALA
 D:'(AFF) AFF
 K @(ENS)
 D ^%QUCHOYP(ENS) G:'($D(@ENS)) ACTH
 D POCLEPA^%VVIDEO
 I $$CONFIRM^%VZEOUI($$^%QZCHW("Suppression de ces etudes")_" ? ")'=1 K @(ENS) G ACTH
 S L=""
 F %T=1:1 S L=$O(@ENS@(L)) Q:L=""  S NUMET=$P(L," ",1) D @("SUPET^"_ROUTINE_"(NUMET)")
 D KILLAFF,CLEPAG^%VVIDEO,TETE S AFF=0
 G ACTH
 
 
FIN K @(MENUH)
 I AFFICH=0 Q
 D KILLAFF
 Q
 
KILLAFF D END^%QUCHOI4(ZZ) K ^[QUI]QX($J) S CALA=0 Q
 
TETE D ^%VZCD(0,39,0,2,1,0,@TABAFF@("ENTETE")) Q
CALA D ^%VZEATT,CONSTAB(ZZ)
 S X=$$INI^%QUCHOI4(1,"",0,4,79,17,@TABAFF@("TITRE"),ZZ,0)
 D OFF^%VZEATT
 S CALA=1,AFF=0
 Q
AFF D CLEPAG^%VVIDEO,TETE,AFF^%QUCHOI4(ZZ) S AFF=1 Q
 
CONSTAB(P) 
 N ATT,K,NUMET,J,NUMET,NBC
 S NBC=@TABAFF@("NBC")
 K ^[QUI]QX($J),^QX($J)
 F K=1:1:NBC S ^[QUI]QX($J,P,"LC",K)=@TABAFF@(K,"LARG")
 S NUMET="" F J=1:1 S NUMET=$O(@GLOB@(NUMET)) Q:NUMET=""  D INSG
 Q
INSG S ^[QUI]QX($J,P,"T",J,1)=$E(NUMET,1,@TABAFF@(1,"LARG"))
 F K=2:1:NBC S ATT=@TABAFF@(K,"ATT"),^[QUI]QX($J,P,"T",J,K)=$S($D(@GLOB@(NUMET,ATT)):@GLOB@(NUMET,ATT),1:"")
 Q
 
 
CHOIX(ROUTINE) N %T,X,TEMP,ZZ,AFFICH,GLOB,ENS,L,CALA,NUMET,TABAFF,AFF
 D CHGNORM^%PKUTIL
 S @("GLOB=$$ADRETU^"_ROUTINE_"()")
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"CHX") K @(TEMP)
 S TABAFF=$$CONCAS^%QZCHAD(TEMP,"TB")
 D @("MAKETB^"_ROUTINE_"(TABAFF)") S ZZ=1
 D CLEPAG^%VVIDEO,TETE
 D CALA,AFF
 S NUMET=$$UN^%QUCHOI4(ZZ) G:NUMET="" FCHOIX
 S NUMET=$P(NUMET," ",1)
FCHOIX D KILLAFF,CLEPAG^%VVIDEO,TETE S AFF=0
 D RETMOD^%PKUTIL
 Q NUMET
 ;
 ;

