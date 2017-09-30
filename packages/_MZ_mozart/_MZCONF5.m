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

;%MZCONF5^INT^1^59547,73871^0
MZCONF5 ;
 
 
 
 N ADR,CTR,FEN,LCOUR,MENU,TEMP,GLO,LIB1,LIB2,LIB3
 N WHOIS2,QUI1,QUI2,WHOIS1,CLE1,CLE2,CLE3,RET,CLEF1,CLEF2,CLEF3
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S MENU=$$CONCAS^%QZCHAD(TEMP,"MENU")
 S WHOIS1=WHOIS
 S @MENU="23^10^79"
 S @MENU@(1)=$$^%QZCHW("Standards")_"^STAND"
 S @MENU@(1,"COM")=$$^%QZCHW("Copie de configurations standards")
 S @MENU@(2)=$$^%QZCHW("Specifiques")_"^SPEC"
 S @MENU@(2,"COM")=$$^%QZCHW("Copie de configurations specifiques")
ACTU D CLEPAG^%VVIDEO,^%VZCD(0,39,0,4,1,0,$$^%QZCHW("TRANSFERT DE CONFIGURATIONS"))
 S WHOIS2=$$WHOIS2(WHOIS,.QUI1,.QUI2)
 I WHOIS2="" K @(TEMP) Q
 D POCLEPA^%VVIDEO
ACTU2 D CLEPAG^%VVIDEO,^%VZCD(0,39,0,4,1,0,$$^%QZCHW("TRANSFERT DE CONFIGURATIONS"))
 D ^%VQUIKMN(0,80,22,MENU,.ADR,.CTR)
 G:(CTR="A")!(CTR="F") END G:ADR'="" @ADR
 D ^%VSQUEAK
 G ACTU2
 
SPEC 
 S LIB1="SPECIFIQUE",RET="SPEC2"
 S CLE1=WHOIS,CLEF1=WHOIS2
SPEC2 S CLE2=$$CHOIXREP
 G:CLE2="" ACTU2
 S LIB2=CLE2
 G GRIL
 
 G ACTU2
STAND 
 S LIB1="STANDARD",LIB2=""
 S CLE1="TRAZOM",CLE2="STAND",RET="ACTU2",CLEF1=CLE1
 
GRIL 
 G:'($$CHOIXGRI(CLE1,CLE2,.GLO,.CLE3,.LIB3)) @RET
 S LGLO2="^["""_QUI2_"""]"_GLO_"(""GRILLE"","""_CLEF1_""","""_CLE2_""","_CLE3
 I $D(@(LGLO2_")")) D ^%VSQUEAK G:$$MES^%VZEOUI($$^%QZCHW("Cette configuration existe deja sur")_" "_WHOIS2_". "_$$^%QZCHW("Continuons-nous ?"),"N")'=1 GRIL
 I (QUI1=QUI2)&(CLE1=CLEF1) D ^%VZEAVT("transfert impossible") G GRIL
 I (QUI1'=QUI2)!(CLE1'=CLEF1) K @(LGLO2_")")
 S LGLO1="^["""_QUI1_"""]"_GLO_"(""GRILLE"","""_CLE1_""","""_CLE2_""","_CLE3
 D POCLEPA^%VVIDEO
 W $E(WHOIS1_" "_LIB1_" "_LIB2_" "_LIB3_" -> "_WHOIS2_" "_LIB1_" "_LIB2_" "_LIB3,1,78)
 D ADR^%QCAGLC(LGLO1,LGLO2)
 H 2
 D POCLEPA^%VVIDEO
 G GRIL
END 
 K @(TEMP)
 Q
 
 
CHOIXREP() 
 N LBASE,RP
 S LBASE=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"REP") K @(LBASE)
 S @LBASE=0,RP="" F I=0:0 S RP=$O(^TABIDENT(WHOIS,"MOZART",RP)) Q:RP=""  S @LBASE@(RP)="",@LBASE=@LBASE+1
 I @LBASE=0 D ^%VZEAVT("Il n'y a aucun repertoire connecte a MOZART pour l'utilisateur "_WHOIS),^%VZEAVT("seule la configuration standard est disponible.") Q
 D INIT^%QUCHOIP(LBASE,1,"",20,5,40,15),AFF^%QUCHOIP S RP=$$UN^%QUCHOIP
 D END^%QUCHOIP
 K @(LBASE)
 Q RP
 
 
CHOIXGRI(CLE1,CLE2,GLOBAL,CLE3,LIB3) 
 N LGRIL,RP,L1,L2,L3
 S LGRIL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GRIL") K @(LGRIL)
 S L1=$$^%QZCHW("grille")_" "_$$^%QZCHW("OPERATION")
 S L2=$$^%QZCHW("grille")_" "_$$^%QZCHW("ACTION")
 S L3=$$^%QZCHW("grille")_" "_$$^%QZCHW("de garde")
 I $D(^[QUI1]MOZPARA("GRILLE",CLE1,CLE2,1)) S @LGRIL@(L3)=""
 I $D(^[QUI1]MOZ("GRILLE",CLE1,CLE2,1)) S @LGRIL@(L1)=""
 I $D(^[QUI1]MOZ("GRILLE",CLE1,CLE2,2)) S @LGRIL@(L2)=""
 I '($D(@LGRIL)) D ^%VZEAVT("Aucune configuration n'est definie...") Q 0
 D INIT^%QUCHOIP(LGRIL,1,"",20,5,40,15),AFF^%QUCHOIP S RP=$$UN^%QUCHOIP
 D END^%QUCHOIP
 K @(LGRIL)
 Q:RP="" 0
 I RP=L1 S GLOBAL="MOZ",CLE3=1,LIB3=$$^%QZCHW("OPERATION") Q 1
 I RP=L2 S GLOBAL="MOZ",CLE3=2,LIB3=$$^%QZCHW("ACTION") Q 1
 S GLOBAL="MOZPARA",CLE3=1,LIB3=$$^%QZCHW("GARDE")
 Q 1
 
 
WHOIS2(WHOIS1,QUI1,QUI2) 
 N CTR,WHOIS2
WHOIS1 D LIRE1^%VREAD(WHOIS_" "_$$^%QZCHW("est le service origine. Service destination ?")_" : ","",0,23,.CTR,.WHOIS2)
 I CTR="A" Q ""
 I WHOIS2="" Q ""
 S QUI1=$$TABIDI^%INCOIN(WHOIS1,"MACHINE")
 S QUI2=$$TABIDI^%INCOIN(WHOIS2,"MACHINE")
 I QUI2="" D ^%VZEAVT(WHOIS2_" "_$$^%QZCHW("n'existe pas")) G WHOIS1
 Q WHOIS2

