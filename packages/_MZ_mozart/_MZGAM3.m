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

;%MZGAM3^INT^1^59547,73871^0
MZGAM3 ;
 
 
 
 
 
 
 
 
 
 
 
MODIF 
 N LATT
 S LATT=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LISTE.ATTRIBUTS") K @(LATT)
 D SAV^%MZGAM
 S PATOUCH(1)=1,%AJM="M",OR(1)=RESUL(1) D ^%VMODISC
 I ABENDSCR D RES^%MZGAM G DIAL2^%MZGAM
 D MAJ^%MZGAM2(UTIL,REP,$$GI^%MZQS,RESUL(1),0) G:REFGAM DIAL2^%MZGAM
 D GARDE^%MZGAM,LATT(LATT)
 F I=2:1:18 I RESUL(I)="" D PS^%QSGESTI($$GI^%MZQS,RESUL(1),@LATT@(I,0),AFRESU(I),@LATT@(I,1))
 G DIAL2^%MZGAM
 
 
SUPP D POCLEPA^%VVIDEO I $$CONFIRM^%VZEOUI($$^%QZCHW("confirmez-vous la suppression")_" ?")'=1 D POCLEPA^%VVIDEO G DIAL2^%MZGAM
 
 
 D ^%VZEATT,SX^%QSGESTK($$GI^%MZQS,RESUL(1)) K ^[QUI]MOZGARDE(RESUL(1))
 
 F I=1:1:18 S RESUL(I)=""
 D POCLEPA^%VVIDEO,^%VAFIGRI,^%VAFISCR
 G DIAL2^%MZGAM
 
DUPL 
 D CLEPAG^%VVIDEO,BLD^%VVIDEO,^%VZCDB($$^%QZCHW("duplication de gamme"),0)
 S DX=5,DY=5 X XY W $$^%QZCHW("gamme a dupliquer")," : ",RESUL(1)
 S DX=5,DY=8 X XY W $$^%QZCHW("donnez le nom de la nouvelle gamme")," : " D NORM^%VVIDEO S DX=$X X XY D ^%VLEC S GAM2=Y1
 I GAM2="" D REAFF^%MZGAM G DIAL2^%MZGAM
 I $A(GAM2)<32 D REAFF^%MZGAM G DIAL2^%MZGAM
 I $D(^[QUI]MOZGARDE(GAM2)) D ^%VZEAVT($$^%QZCHW("gamme deja existante")) G DUPL
 I $$NOM^%QSGE9($$GI^%MZQS,GAM2) D ^%VZEAVT($$^%QZCHW("duplication impossible : le nom de la gamme est mal forme")),^%VZEAVT($$^%QZCHW("verifiez le nombre de virgule dans le nom de la gamme")) G DUPL
 S RANG=$$RANG^%QSGES17($$GI^%MZQS)
 I RANG=0 D ^%VZEAVT($$^%QZCHW("le repertoire")_" "_$$GE^%MZQS_" "_$$^%QZCHW("n'existe pas, VEUILLEZ REVOIR LES CONNECTIONS MOZART")) G FIN
 I RANG'=$L(RESUL(1),",") D ^%VZEAVT($$^%QZCHW("duplication impossible : Verifiez le nombre de virgule dans le nom de la gamme")) G DUPL
 I RANG>1 S RPERE=$$RPERE^%QSGES17($$GI^%MZQS) I RPERE="" D ^%VZEAVT($$^%QZCHW("impossible de trouver le repertoire pere de")_" "_$$GE^%MZQS) G DUPL
 I RANG'>1 G DUPL2
 S PERE=$$NOMPERE^%QSGES10($$GI^%MZQS,GAM2)
 I '($$IR^%QSGE5(RPERE,PERE)) D ^%VZEAVT($$^%QZCHW("impossible de trouver le pere de la gamme")_" -> "_PERE_" "_$$^%QZCHW("inconnu")) G:$$CONFIRM^%VZEOUI($$^%QZCHW("voulez-vous creer le pere de la gamme")_" ?") CREP D POCLEPA^%VVIDEO G DUPL
DUPL2 S OR=$P(GAM2,",",$L(GAM2,","))
 S DX=20,DY=8 X XY G DUPL:'($$MES^%VZEOUI($$^%QZCHW("confirmation")_" : ","O"))
 D ^%VZEATT
 D ^%QMCP9(WHOIS,QUI,$$GI^%MZQS,RESUL(1),WHOIS,QUI,GAM2,OR),POCLEPA^%VVIDEO
 S ^[QUI]MOZGARDE(GAM2)=^[QUI]MOZGARDE(GAM)
 S (GAM,RESUL(1))=GAM2 D CH^%MZGAM,REAFF^%MZGAM
 K OR,RANG
 G DIAL2^%MZGAM
 
CREP 
 I PERE="" D ^%VZEAVT($$^%QZCHW("creation impossible : le nom du pere n'est pas defini")) G DUPL
 D ^%VZEATT,PA^%QSGESTI(RPERE,PERE,"NOM",PERE,1),POCLEPA^%VVIDEO
 G DUPL2
 
LATT(LATT) 
 S GLO="^[QUI]MOZPARA(""GRILLE"",UTIL,REP,1)"
 F CPT=2:1:18 S @LATT@(CPT,0)=$P(@GLO@(CPT),"^",1),@LATT@(CPT,1)=$P(@GLO@(CPT),"^",2)
 Q
FIN Q
 
 
10 
 Q:RESUL(IC)=""
 N VALA,OK,ATT,REPI
 S VALA=RESUL(IC)
 S ATT=$P(@GLO@(IC),"^",1),REPI=$S(SCR="MOZGAMME":$$GI^%MZQS,1:$$OI^%MZQS)
 I ATT="" Q
 S OK=$$^%QSPRVAL(REPI,ATT,.VALA,20,8,40,10)
 I OK=0 S TAB(IC)=$J(" ",10) D ^%VAFFICH S REFUSE=0 Q
 I OK=2 D ^%VZEAVT("valeur refusee"_". ? "_"pour aide") S REFUSE=1 Q
 S RESUL(IC)=VALA
 I OK=1 D ^%VAFIGRI,^%VAFISCR
 Q
 
 
 
MENU2(MN) 
 S @MN@(1)=$$^%QZCHW("+")_"^PLUS",@MN@(1,"EQU")="="
 S @MN@(2)=$$^%QZCHW("-")_"^MOINS"
 S @MN@(3)=$$^%QZCHW("Modifier")_"^MODIF"
 S @MN@(4)=$$^%QZCHW("Ajouter")_"^AJCMS"
 S @MN@(5)=$$^%QZCHW("supprimer")_"^SUPP"
 S @MN@(6)=$$^%QZCHW("Dupliquer")_"^DUPL"
 S @MN@(7)=$$^%QZCHW("Gamme")_"^GAM"
 S @MN@(8)=$$^%QZCHW("repertoires associes")_"^REP"
 S @MN@(9)=$$^%QZCHW("Attributs")_"^ATT"
 S @MN@(10)=$$^%QZCHW("Visas")_"^VISA"
 S @MN@(11)=$$^%QZCHW("impression")_"^"_"EDIT"
 S @MN@(12)=$$^%QZCHW("Fin")_"^FCMS"
 Q
MENU1(MN) 
 S @MN@(1)=$$^%QZCHW("Ajouter")_"^AJ"
 S @MN@(2)=$$^%QZCHW("Gamme")_"^GAM"
 S @MN@(3)=$$^%QZCHW("repertoires associes")_"^REP"
 S @MN@(4)=$$^%QZCHW("Attributs")_"^ATT"
 S @MN@(5)=$$^%QZCHW("Visas")_"^VISA"
 S @MN@(6)=$$^%QZCHW("impression")_"^"_"EDIT"
 S @MN@(7)=$$^%QZCHW("Fin")_"^FINAJ"
 Q

