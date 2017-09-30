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

;%QS0G^INT^1^59547,73879^0
QS0G() 
 
 
 
 
 N Y1
 D ^%QUAPAD("GRAPHIQUES")
 S Y1=$$UN^%QUAPAGM Q:Y1="" 1
 Q $$INT(Y1)
 
INT(LISTE) 
 N ADR,CTR,RESUL,DESSIN,MENU,GLOBAL
 D CLEPAG^%VVIDEO
 D SAIS(LISTE,.RESUL)
 Q:'($D(RESUL)) 2
 
 S MENU=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"MENU") K @(MENU)
 S @MENU@(1)=$$^%QZCHW("Camenbert")_"^67"
 S @MENU@(2)=$$^%QZCHW("Etoile")_"^69"
 S @MENU@(3)=$$^%QZCHW("Courbe")_"^79"
ACT D POCLEPA^%VVIDEO,^%VQUIKMN(5,80,23,MENU,.ADR,.CTR) G:(CTR="A")!(CTR="F") FIN
 I ADR'="" G @ADR
 D ^%VSQUEAK G ACT
72 S DESSIN="HISTO" G COM
67 S DESSIN="CAMEMBERT" G COM
69 S DESSIN="ETOILE" G COM
79 S DESSIN="COURBE" G COM
 
COM D GRAPH(DESSIN)
 G ACT
 
FIN K @(MENU),@(GLOBAL)
 Q 2
 
SAIS(LISTE,RESUL) 
 N CMS,SCR,NOMTAB,I,OK,PATOUCH,AFRESU,OR,DEJALU,ATTLIS,ATTTOT,NULIS,NORNI,BORNS,NET
 S CMS=0,SCR="HISTOGRAM",NOMTAB="",NET=1
ST D B2^%VACTISC(NET) I ABENDSCR G END
 S NET=0,OK=1 F I=1:1:^%SCRE(SCR) S OK=RESUL(I)'="" Q:'(OK)
 I '(OK) D ^%VZEAVT($$^%QZCHW("Veuillez saisir tous les champs ")),CLEPAG^%VVIDEO G ST
 S ATTTOT=RESUL(1),ATTLIS=RESUL(2),NULIS=$D(INTERV),BORNI=RESUL(4),BORNS=RESUL(5)
 S GLOBAL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"HISTO") K @(GLOBAL)
 D ^%QS0DEHI(GLOBAL)
 Q
END K RESUL Q
 
GRAPH(DESSIN) 
SUITE N I,%PORT,%TERM,%FONC,MEN2,ADR,CTR
 S MEN2=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"MQN2") K @(MEN2)
 S @MEN2@(1)=$$^%QZCHW("Ecran graphique")_"^X69"
 S @MEN2@(2)=$$^%QZCHW("Imprimante graphique")_"^X73"
ACTD D POCLEPA^%VVIDEO,^%VQUIKMN(5,80,23,MEN2,.ADR,.CTR) I (CTR="A")!(CTR="F") K @(MEN2) Q
 I ADR'="" G @ADR
 G ACTD
X69 S %PORT=^TABIDENT(WHOIS,"ECRGRA"),%TERM=^TABIDENT(WHOIS,"TYPECR")
 D CLEPAG^%VVIDEO,GO,^%PBPZALF,^%VZEAVT("")
 D ^%PBPZGRA,^%PBPZCLR,^%PBPZALF,CLEPAG^%VVIDEO,NORM^%VVIDEO,CAD G SUITE
X73 S %PORT=^TABIDENT(WHOIS,"TABTRA"),%TERM=^TABIDENT(WHOIS,"TYPTAB")
 D MSG^%VZEATT("Edition en cours ..."),GO,^%VZEAVT($$^%QZCHW("C'est fini")) G SUITE
 
GO 
 
 N %r
 N %9T,%9O,%DESSIN,%9X,%9Y,%9X1,%9Y1,%9X2,%9Y2,%HISTO
 S %r=$$^%EDPRLG
 S %DESSIN=1
 
 S %FONC="LANDSCAPE" D ^%PBPZ S (%9O,^V($J,"%","%ORIENTATION",1))="HORIZONTALE"
 S %FONC="INIT.DESSIN" D ^%PBPZ
 
 S %FONC="CADRE" D ^%PBPZ
 S %FONC=DESSIN D ^%PBPZ
 
 
 D ^%EDEPLG
 D USE^%QS0(LISTE) Q
 
CAD D ^%VZCD(0,39,0,4,1,0,"GRAPHIQUES") Q
PCAD D CARSP^%VVIDEO(10,10,3,60,1) Q

