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

;%MZGAM^INT^1^59547,73871^0
MOZGAM ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
DEB D CLEPAG^%VVIDEO
 N MODE,CMS,ABENDSCR,SCR,RESUL,AFRESU,DEJALU,PATOUCH,REP,UTIL,I,%U,%AJM,CPT,MN1,RETOUR,ANCREP,TEMPO,ASTOCK
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMPO)
 I '($D(^[QUI]MOZPARA("GRILLE","TRAZOM"))) D ^%MZGAM4
 S CMS=0,ABENDSCR=0,SCR="MOZGAMME",RETOUR="FIN"
AJ 
 D ^%VAFIGRI,^%VZEATT
 K RESUL,PATOUCH
 S RESUL(19)=" "_$$GE^%MZQS_" ",(NREP,REP,ANCREP)=$$GE^%MZQS
 D SEARCH(NREP),INIT^%MZGAM2(UTIL,REP,$$GI^%MZQS,"",1),UCONT^%MZGAM2
 F I=1:1:18 S RESUL(I)=""
 F I=19:1:36 S PATOUCH(I)=1
 S %AJM="A",MN1=$$CONCAS^%QZCHAD(TEMPO,"MENU1")
 D AFF,MENU1^%MZGAM3(MN1)
 D ^%VMODISC
 I ABENDSCR S RESUL(1)="" G DIAL1
 D MAJ^%MZGAM2(UTIL,REP,$$GI^%MZQS,RESUL(1),1)
 D:'(REFGAM) GARDE
DIAL1 S %AJM="A",DX=0,DY=22 D CLEBAS^%VVIDEO,^%VQUIKMN(0,80,22,MN1,.AD,.CONTR)
 I (CONTR="A")!(CONTR="F") G @RETOUR
 I CONTR="R" D REAFF G DIAL1
 I AD'="" G @AD
 G DIAL1
 
CMS 
 N MODE,CMS,ABENDSCR,SCR,RESUL,AFRESU,DEJALU,PATOUCH,REP,UTIL,I,%U,%AJM,CPT,RETOUR,MN2,ANCREP,TEMPO,DEJAF,ASTOCK
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMPO)
 S DEJAF=0
 I '($D(^[QUI]MOZPARA("GRILLE","TRAZOM"))) D ^%MZGAM4
 S RETOUR="DIAL2",SCR="MOZGAMME",%AJM="C"
CMS1 D CLEPAG^%VVIDEO,BLD^%VVIDEO,^%VZCDB("GAMMES DISPONIBLES",0) S DX=16,DY=3 X XY D REV^%VVIDEO W " Repertoire MOZART associe : " D NORM^%VVIDEO,BLD^%VVIDEO W " "_$$GE^%MZQS S DX=0,DY=0 X XY D NORM^%VVIDEO
 I '(DEJAF) S TEMP=$$LISTIND^%QSGEST6($$GI^%MZQS) D INIT^%QUCHOIP(TEMP,"",1,16,6,50,16) S DEJAF=1
 D AFF^%QUCHOIP S GAM=$$UN^%QUCHOIP G:GAM="" FIN
 S CMS=0,ABENDSCR=0,ANCREP=$$GE^%MZQS D ^%VAFIGRI,^%VZEATT
 D CH
 F I=19:1:36 S PATOUCH(I)=1
 S %AJM="C",MN2=$$CONCAS^%QZCHAD(TEMPO,"MENU2")
 D AFF,MENU2^%MZGAM3(MN2) S:RESUL(19)="" RESUL(19)=" "_$$GE^%MZQS_" "
 I '($D(^[QUI]MOZGARDE(GAM))) D GARDE
DIAL2 S %AJM="C" D ^%VQUIKMN(0,80,22,MN2,.AD,.CONTR)
 I (CONTR="A")!(CONTR="F") K RESUL,PATOUCH G CMS1
 I CONTR="R" D REAFF G DIAL2
 I AD'="" G @AD
 G DIAL2
 
PLUS 
 S GAM=$O(@TEMP@(GAM)) I GAM="" S GAM=RESUL(1) D ^%VZEAVT("Recherche epuisee...") G @RETOUR
 D EFF S RESUL(1)=GAM,%AJM="C"
 D CH,AFF G DIAL2
 
MOINS 
 S GAM=$ZP(@TEMP@(GAM)) I GAM="" S GAM=RESUL(1) D ^%VZEAVT("Recherche epuisee...") G @RETOUR
 D EFF S RESUL(1)=GAM,%AJM="C"
 D CH,AFF G DIAL2
 
MODIF 
 G MODIF^%MZGAM3
 
SUPP 
 G SUPP^%MZGAM3
 
DUPL 
 G DUPL^%MZGAM3
 
GAM 
 G:RESUL(1)="" MENU
 I '($D(^[QUI]MOZ("GRILLE","TRAZOM"))) D INIT^%MZGAM4
 S MODE=%AJM D ^%MZ,REAFF S %AJM=MODE G MENU
 
REP 
 
 D ^%MZCHREP
 
 I ANCREP=$$GE^%MZQS D REAFF G:%AJM="A" DIAL1 G DIAL2
 S DEJAF=0
 G:%AJM="A" AJ
 D END^%QUCHOIP
 G CMS1
 
ATT 
 G:RESUL(1)="" MENU
 D ^%MZATTKN(RESUL(1)),CH,REAFF G MENU
 
VISA 
 G:RESUL(1)="" MENU
 D ^%MZVISA(RESUL(1)),REAFF G MENU
 
EDIT 
 G:RESUL(1)="" MENU
 D EDIT^%MZEDIGA(RESUL(1)),REAFF G MENU
MENU G DIAL1:%AJM="A",DIAL2
 
AJCMS D EFF S RETOUR="RETOURAJ" F I=1:1:18 S RESUL(I)=""
 G AJ
 
FINAJ 
 K @(MN1) G @RETOUR
RETOURAJ 
 S RESUL(1)=GAM D CH,REAFF
 G DIAL2
 
FCMS 
 K @(MN2)
 
FIN K REFUSE,VID,TAB
 D FUCONT^%MZGAM2 D:%AJM'="A" END^%QUCHOIP
 K @(TEMPO)
 K ^GCURGRIL($I) Q
 
REAFF 
 D ^%VAFIGRI,^%VAFISCR Q
 
SEARCH(NREP) 
 I $D(^[QUI]MOZPARA("GRILLE",WHOIS,NREP,1)) S UTIL=WHOIS,REP=NREP Q
 I $D(^[QUI]MOZPARA("GRILLE","TRAZOM",NREP,1)) S UTIL="TRAZOM",REP=NREP Q
 S UTIL="TRAZOM",REP="STAND" Q
 
AFF 
 D POCLEPA^%VVIDEO,NORM^%VVIDEO,^%VAFISCR Q
 
EFF 
 N LG F I=1:1:18 S LG=$L(RESUL(I)),ICC=I,TAB(ICC)=$J(" ",LG) D ^%VAFFICH
 Q
 
SAV 
 F I=1:1:18 S AFRESU(I)=RESUL(I)
 Q
 
RES 
 F I=1:1:18 S RESUL(I)=AFRESU(I)
 Q
 
GARDE 
 Q:RESUL(1)=""
 N RS S RS="" F I=1:1:18 S RS=RS_$C(26)_"^"
 S ^[QUI]MOZGARDE(RESUL(1))=RS_" "_$$GE^%MZQS_" ^"
 Q
CH 
 S RESUL(1)=GAM
 I '($D(^[QUI]MOZGARDE(RESUL(1)))) S RESUL(19)=" "_$$GE^%MZQS_" " G CH0
 S RESUL(19)=$P(^[QUI]MOZGARDE(RESUL(1)),"^",19)
CH0 S:RESUL(19)="" RESUL(19)=" "_$$GE^%MZQS_" "
 
 
 S NREP=$$GETLBLAN^%VTLBLAN(RESUL(19))
 D SEARCH(NREP)
 D SELECT^%MZGAM2(NREP)
 I NREP=REP G CH1
 S NREP=$$GE^%MZQS
CH1 D INIT^%MZGAM2(UTIL,REP,$$GI^%MZQS,GAM,0),UCONT^%MZGAM2
 Q

