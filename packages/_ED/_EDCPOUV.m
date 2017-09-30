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

;%EDCPOUV^INT^1^59547,73869^0
%EDCPOUV(LIEN,ATT,ETI2,VAR,ORD) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N LISTE2,NO,BA,OBJ,ARRET,IPV,JPV,OPV,TABLP,ADTABLP,ATDAT
 S ARRET=0
 N TEMPO2 S TEMPO2=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 I '($D(@TEMPO2)) S @TEMPO2=1,TEMPO2=$$CONCAS^%QZCHAD(TEMPO2,"1") G APLI
 S @TEMPO2=@TEMPO2+1,TEMPO2=$$CONCAS^%QZCHAD(TEMPO2,@TEMPO2)
 
APLI D INIT^%ANGEPIL
 K TABLP S ADTABLP="TABLP"
 
 S @ADTABLP@(1)="BASE",@ADTABLP@(2)="OBJET",@ADTABLP@(3)="MODL",@ADTABLP@(4)="NO",@ADTABLP@(5)="TEMPO2",@ADTABLP@(6)="ETI2",@ADTABLP@(7)="VAL2",@ADTABLP@(8)="MOD",@ADTABLP@(9)="ORD"
 I LIEN="" S BA=BASE,OBJ=OBJET G SUIT
 I $E(LIEN)="%" S OBJ=$$^%QCAZG("CXT(LIEN,""OBJET"")"),BA=$$^%QCAZG("CXT(LIEN,""BASE"")") G SUIT
 S BA=$$REPD^%QSGEL2(BASE,LIEN),OBJ=$$NOMPROX^%QSCALVU(LIEN,BASE,OBJET,ATT)
SUIT Q:(BA="")!(OBJ="")
 S ATDAT=$$TYPE^%QSGESPE(ATT_"/"_$$NOMLOG^%QSF(BA))="DATE"
 S NO="" F JPV=0:0 S NO=$$NXTRIAO^%QSTRUC8(BA,OBJ,ATT,NO) Q:NO=""  S VAL2=$$VALEUR^%QSTRUC8(BA,OBJ,ATT,NO),@TEMPO2@(NO,$S(ATDAT:$$AFFI^%QMDAUC(BA,ATT,VAL2),1:VAL2))=""
 
 I '($D(^[QUI]EDMOD(MOD,"ETI",ETI2))) D ^%VSQUEAK,MSG^%VZEATT("Aucune etiquette "_ETI2_" n'a ete definie dans le modele") Q
 D POP
 S NO=""
BOUCL 
 S ARRET=0,NO=$O(@TEMPO2@(NO))
 G:NO="" FIN
 S ^V($J,"%",ORD,1)=NO,VAL2=""
 F OPV=0:0 S ARRET=0,VAL2=$O(@TEMPO2@(NO,VAL2)) Q:VAL2=""  S ^V($J,"%",VAR,1)=VAL2,LIGNE=^[QUI]EDMOD(MOD,"ETI",ETI2) D EXET
 G BOUCL
FIN 
 D EPIL^%ANGEPIL
 K @(TEMPO2) S TEMPO2=$$TEMP^%QZCHAD($P($ZPOS,"^",2),""),@TEMPO2=@TEMPO2-1
 I @TEMPO2=0 K @(TEMPO2)
 D RPOP
 K ^V($J,MODL,BASE,OBJET,ETI2)
 Q
EXET S LIGNE=$O(^[QUI]EDMOD(MOD,"COMP",LIGNE))
 Q:ARRET
 Q:LIGNE=""
 Q:^[QUI]EDMOD(MOD,"COMP",LIGNE)=""
 D EMPV^%ANGEPIL(ADTABLP)
 X ^[QUI]EDMOD(MOD,"COMP",LIGNE)
 D DEPV^%ANGEPIL
 G EXET
 
POP S ADRM(MODL)=ADRM(MODL)+1,ADRM(MODL,ADRM(MODL))=LIGNE Q
 
RPOP S LIGNE=ADRM(MODL,ADRM(MODL))
 K ADRM(MODL,ADRM(MODL))
 S ADRM(MODL)=ADRM(MODL)-1 Q

