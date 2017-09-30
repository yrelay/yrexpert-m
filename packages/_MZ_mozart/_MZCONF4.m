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

;%MZCONF4^INT^1^59547,73871^0
MOZCONF4 ;
 
 
 
 
 
STAND 
 D CLEPAG^%VVIDEO
 N RP,UTIL S UTIL="TRAZOM",RP="STANDARD"
 I '($D(^[QUI]MOZ("EDITION","TRAZOM"))) D ENTETE^%MZGAM4
 G DEB
SPEC 
 N LBASE,RP,UTIL
SPEC1 D CLEPAG^%VVIDEO,BLD^%VVIDEO,^%VZCDB("LISTE DES REPERTOIRES CONNECTES A  < MOZART >",0),NORM^%VVIDEO
 S LBASE=$$TEMP^%QZCHAD($P($ZPOS,"^",2),1) K @(LBASE)
 S @LBASE=0,RP="" F I=0:0 S RP=$O(^TABIDENT(WHOIS,"MOZART",RP)) Q:RP=""  S @LBASE@(RP)="",@LBASE=@LBASE+1
 I @LBASE=0 D ^%VZEAVT("Il n'y a aucun repertoire connecte a MOZART pour l'utilisateur "_WHOIS),^%VZEAVT("seule la configuration standard est disponible.") Q
 D INIT^%QUCHOIP(LBASE,1,"",20,5,40,15),AFF^%QUCHOIP S RP=$$UN^%QUCHOIP
 Q:RP=""
 D END^%QUCHOIP K @(LBASE)
 S UTIL=WHOIS
 
DEB N RESUL,IC,ICC,m,NOMTAB
 D CLEPAG^%VVIDEO
 D ENTETE
 S CMS=0,ABENDSCR=0,NOMTAB=""
 S SCR="MOZEDIT" D ^%VAFIGRI
 S CPT=1
 I '($D(^[QUI]MOZ("EDITION",UTIL,RP))) D INIT(1) G AFF
 S %U=1
BOUC 
 I '($D(^[QUI]MOZ("EDITION",UTIL,RP,CPT))) D INIT(%U) G AFF
 G:CPT>3 AFF
 S INTER=^[QUI]MOZ("EDITION",UTIL,RP,CPT),RESUL(%U)=$P(INTER,"^",1),RESUL(%U+1)=$P(INTER,"^",2),RESUL(%U+2)=$S($P(INTER,"^",3)'="":$P(INTER,"^",3),1:1)
 S CPT=CPT+1,%U=%U+3
 G BOUC
 
AFF D ^%VAFISCR,^%VMODISC
 G FIN:ABENDSCR
 S OK=$$VERIF I '(OK) S ABENDSCR=0,CMS=0 G AFF
 K ^[QUI]MOZ("EDITION",UTIL,RP)
 S CPT=0
 F %U=1:3:^%SCRE(SCR) S CPT=CPT+1 Q:CPT>3  I (RESUL(%U)'="")&(RESUL(%U+1)'="") S ^[QUI]MOZ("EDITION",UTIL,RP,CPT)=RESUL(%U)_"^"_RESUL(%U+1)_"^"_$S(RESUL(%U+2)'="":RESUL(%U+2),1:1)
 G SPEC1:RP'="STAND"
FIN Q
 
INIT(D) 
 F %U=D:1:^%SCRE(SCR) S RESUL(%U)=""
 Q
SUP 
SUP2 
 D CLEPAG^%VVIDEO,BLD^%VVIDEO,^%VZCDB("SUPPRESSION DE CONFIGURATION",0)
 N GLO,RP,UTIL S UTIL=WHOIS
 S RP="" F %U=0:0 S RP=$O(^[QUI]MOZ("EDITION",UTIL,RP)) Q:RP=""  S:$D(^[QUI]MOZ("EDITION",UTIL,RP)) GLO(RP)=""
 K GLO("STAND")
 D INIT^%QUCHOIP("GLO",1,"",20,5,40,12),AFF^%QUCHOIP S RP=$$UN^%QUCHOIP
 Q:RP=""
 D END^%QUCHOIP
 S DX=0,DY=23 X XY I $$CONFIRM^%VZEOUI($$^%QZCHW("Suppression de")_" "_RP_" ?") K ^[QUI]MOZ("EDITION",UTIL,RP)
 G SUP2
 
ATTR 
 Q:RESUL(IC)=""
 I RESUL(IC)="NUMERO.OPERATION" D ^%VZEAVT("Cet attribut est interdit ...") S REFUSE=1 Q
 D FULL^%LXUC4
 Q
INDICE 
 D INDICE^%MZCONF3(5)
 Q
 
AFFI D ^%VAFFICH S REFUSE=0
 Q
LIB 
 Q
 S TAB(ICC)=$$MAJ^%VMINUSC($E(RESUL(IC),1))_$$MIN^%VMINUSC($E(RESUL(IC),2,999)) D ^%VAFFICH S REFUSE=0
 Q
 Q
ENTETE S:RP="STANDARD" RP="STAND"
 D BLD^%VVIDEO,^%VZCDB("ENTETE D'IMPRESSION  -----> "_$S(RP="STAND":"PAR DEFAUT",1:RP),0)
 D BLD^%VVIDEO,^%VZCDB($S(UTIL="TRAZOM":"PAR DEFAUT",1:UTIL),20)
 Q
VERIF() 
 N TROU S TROU=0
 S CPT=0,%U=1
LOOP 
 S CPT=CPT+1
 Q:CPT>3 1
 I (RESUL(%U)="")&(RESUL(%U+1)="") S TROU=1 G LOOP1
 I TROU D ^%VZEAVT("Il ne peut y avoir de ligne vide entre 2 lignes definies...") Q 0
 I RESUL(%U)="" D ^%VZEAVT("le libelle de la ligne "_CPT_" n'est pas defini") Q 0
 I RESUL(%U+1)="" D ^%VZEAVT("l'attribut de la ligne "_CPT_" n'est pas defini") Q 0
 I RESUL(%U+2)="" D ^%VZEAVT("l'indice de la ligne "_CPT_" n'est pas defini") Q 0
LOOP1 S %U=%U+3
 G LOOP

