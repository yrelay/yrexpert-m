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

;%EDCPOUR^INT^1^59547,73869^0
EDCPOUR(BAS,ATT,ETI) 
 
 
 
 
 
 
 
 
 
 
 N TEMPO,LISTE,NO,TYP,BA,OBJ,ARRET,IP,JP,SAVOB,SAVB,VALE,TABL,ADTABL
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 I '($D(@TEMPO)) S @TEMPO=1,TEMPO=$$CONCAS^%QZCHAD(TEMPO,"1") G APLI
 S @TEMPO=@TEMPO+1,TEMPO=$$CONCAS^%QZCHAD(TEMPO,@TEMPO)
APLI D INIT^%ANGEPIL
 K TABL S ADTABL="TABL"
 S @ADTABL@(1)="BASE",@ADTABL@(2)="OBJET",@ADTABL@(3)="MODL",@ADTABL@(4)="GLO1",@ADTABL@(5)="TEMPO",@ADTABL@(6)="ETI",@ADTABL@(7)="VALE",@ADTABL@(8)="MOD"
 I BAS="" S BA=BASE,OBJ=OBJET G SUIT
 I $E(BAS)="%" S BA=$$^%QCAZG("CXT(BAS,""BASE"")"),OBJ=$$^%QCAZG("CXT(BAS,""OBJET"")") G SUIT
 S BA=$$REPD^%QSGEL2(BASE,BAS),OBJ=$$NOMPROX^%QSCALVU(BAS,BASE,OBJET,ATT)
SUIT Q:(BA="")!(OBJ="")
 S LISTE=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LISTE") K @(LISTE)
 D MVG^%QSCALVA(BA,OBJ,ATT,LISTE,.TYP)
 S VALE=""
 F IP=0:0 S VALE=$O(@LISTE@(VALE)) Q:VALE=""  S @TEMPO@(VALE)=@LISTE@(VALE)
 K @(LISTE)
 S SAVB=BASE,SAVOB=OBJET,NO=$S(TYP=2:OBJ_",",1:"")
 
 S BASE=$$REPD^%QSGEL2(BA,ATT)
 D POP
 I BASE="" D ^%VSQUEAK,MSG^%VZEATT("Il n'y a pas de lien partant de "_$$NOMLOG^%QSF(BA)_" avec "_ATT) G FIN
 
 N %POUR S %POUR=1
 I '($D(^[QUI]EDMOD(MOD,"ETI",ETI))) D ^%VSQUEAK,MSG^%VZEATT("Il n'y a pas d'etiquette "_ETI_" definie dans le modele ") G FIN
 S VALE=""
BOUCL S ARRET=0,VALE=$O(@TEMPO@(VALE))
 G:VALE="" FIN
 S OBJET=NO_@TEMPO@(VALE),LIGNE=^[QUI]EDMOD(MOD,"ETI",ETI)
 D ^%EDC2(MODL,BASE,OBJET)
 D LIG
 K ^V($J,MODL,BASE,OBJET,ETI)
 G BOUCL
 
FIN D EPIL^%ANGEPIL
 K @(TEMPO) S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),""),@TEMPO=@TEMPO-1
 I @TEMPO=0 K @(TEMPO)
 S BASE=SAVB,OBJET=SAVOB D RPOP Q
 
LIG S LIGNE=$O(^[QUI]EDMOD(MOD,"COMP",LIGNE))
 Q:ARRET
 Q:LIGNE=""
 Q:^[QUI]EDMOD(MOD,"COMP",LIGNE)=""
 D EMPV^%ANGEPIL(ADTABL)
 X ^[QUI]EDMOD(MOD,"COMP",LIGNE)
 D DEPV^%ANGEPIL
 G LIG
 
POP S ADRM(MODL)=ADRM(MODL)+1,ADRM(MODL,ADRM(MODL))=LIGNE Q
 
RPOP S LIGNE=ADRM(MODL,ADRM(MODL))
 K ADRM(MODL,ADRM(MODL))
 S ADRM(MODL)=ADRM(MODL)-1 Q

