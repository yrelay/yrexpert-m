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

;%SCOETU3^INT^1^59547,73888^0
SCOETU3 ;
 
 
 
 
 
 
CHLIST 
 I RESUL(IC-1)="" D ^%VZEAVT("repertoire inconnu") S REFUSE=1 Q
 N ADR,Y1,FEN,NL,LETU,ETU
 S ETU="L0"
 S FEN=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"FEN") K @(FEN)
 S LETU=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LETU") K @(LETU)
 
 D ^%VZEATT
 D ^%QSGES13(ETU,"BASE",$$NOMINT^%QSF(RESUL(IC-1)),1,LETU)
 S NL=$$NOM^%QSGES11("TMP")
 D COPY^%QSGES11(NL,ETU,.CARD,LETU)
 D CREER^%QSGES11(ETU,NL,"TMP",CARD,"SELSCX","","")
 S ADRL=$$ADRLIS^%QSGEST7(NL)
 D CLEPAG^%VVIDEO
 D INIT,INIT^%QUAPAGM(FEN)
RES3 D REAFI
 S RESUL(IC)=$$UN^%QUAPAGM I RESUL(IC)="" S REFUSE=1
 D DEL^%QSGES11(NL)
 G END
 
INIT 
 S @FEN@("X")=0,@FEN@("Y")=3,@FEN@("L")=80,@FEN@("H")=19
 S @FEN@("B")="L0",@FEN@("A")=ADRL,@FEN@("ATT")=1,@FEN@("AFF")="REAFI^%SCOCDF2"
 S @FEN@("LR")=13
 
 S @FEN@("C",1,"T")=$$^%QZCHW("Card."),@FEN@("C",1,"L")=6,@FEN@("C",1,"C")="CARD"
 S @FEN@("C",2,"T")=$$^%QZCHW("Repertoire"),@FEN@("C",2,"L")=15,@FEN@("C",2,"C")="OBJET"
 S @FEN@("C",3,"T")=$$^%QZCHW("Source"),@FEN@("C",3,"L")=12,@FEN@("C",3,"C")="SOURCE"
 S @FEN@("C",4,"L")=16,@FEN@("C",4,"C")="AUTRE"
 S @FEN@("C",5,"T")=$$^%QZCHW("Creation"),@FEN@("C",5,"L")=8,@FEN@("C",5,"C")="DATE.CREATION"
 S @FEN@("ECRAN")="CADR^%QS0DP",@FEN@("PADLINE")="POCLEPA^%VVIDEO"
 Q
 
END D END^%QUAPAGM K @(FEN)
 D AFI
 Q
REAFI 
 D CLEPAG^%VVIDEO,^%VZCDB(RESUL(1),1),AFFICH^%QUAPAGM
 Q
AFI 
 D CLEPAG^%VVIDEO,^%VAFIGRI,^%VAFISCR Q
 
RREF(IC) 
 
 N GL S GL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"REPERTOIRES") K @(GL)
 S RESUL(IC)=$$GETLBLAN^%VTLBLAN(RESUL(IC)),REFUSE=0
RREF0 I RESUL(IC)="" D ^%VZEAVT("champ obligatoire") S REFUSE=1 Q
 I RESUL(IC)="?" D REPA^%QSGEST9(GL),CHIND(GL) K @(GL) Q:REFUSE  D REAF(IND) G RREF0
 I $$REPM^%QSGEST9(RESUL(IC))'=2 D ^%VZEAVT("repertoire inconnu") S REFUSE=1 Q
 Q
IREF(IC) 
 
 I RESUL(IC)="" D ^%VZEAVT("champ obligatoire") S REFUSE=1 Q
 N IND,REPI
 S IND=$$GETLBLAN^%VTLBLAN(RESUL(IC)),REFUSE=0
 G:IND="" INDER
 I RESUL(IC-1)="" D ^%VZEAVT($$^%QZCHW("Le repertoire doit etre defini...")) G INDER
IND1 S REPI=$$NOMINT^%QSF(RESUL(IC-1))
 I REPI="" D ^%VZEAVT($$^%QZCHW("Nom interne du repertoire inconnu...")) G INDER
 G:IND="?" IND2
 I '($$IR^%QSGE5($$NOMINT^%QSF(RESUL(IC-1)),IND)) D ^%VZEAVT($$^%QZCHW("Individu inexistant")) G INDER
 S RESUL(IC)=IND
 Q
IND2 D CHIND($$LISTIND^%QSGEST6($$NOMINT^%QSF(RESUL(IC-1))))
 G:IND="" INDER
 D REAF(IND)
 Q
INDER S REFUSE=1
 Q
CHIND(GLO) 
 D INIT^%QUCHOIP(GLO,"",1,50,2,27,10),AFF^%QUCHOIP
 S IND=$$UN^%QUCHOIP
 D END^%QUCHOIP,CLFEN^%VVIDEO(50,2,10,27)
 Q
RCIB(IC) 
 
 D RREF(IC)
 Q
LCIB(IC) 
 
LCIB0 N IND,REPI
 I RESUL(IC)="" D ^%VZEAVT("champ obligatoire") S REFUSE=1 Q
 S IND=$$GETLBLAN^%VTLBLAN(RESUL(IC)),REFUSE=0
 I RESUL(IC)="?" G LCIB1
 I ('($$IR^%QSGE5($$NOMINT^%QSF(RESUL(IC-1)),RESUL(IC))))&($$^%QSCALVA("L0",RESUL(IC),"BASE")'=$$NOMINT^%QSF(RESUL(IC-1))) S REFUSE=1 D ^%VZEAVT("erreur : liste ou individu") Q
 Q
LCIB1 D POCLEPA^%VVIDEO S DX=20 X XY S REP=$$^%VZECH2("affichage des"_" : ","listes","individu") D POCLEPA^%VVIDEO
 I REP=1 S REFUSE=1 Q
 I REP="listes" D ^%SCOETU3 Q
 G IND1
DOM(IC) 
 
DOM0 I RESUL(IC)="" D ^%VZEAVT("champ obligatoire") S REFUSE=1 Q
 I RESUL(IC)="?" D CHIND("^[QUI]SCOMDOM") Q:REFUSE  D REAF(IND) G DOM0
 I '($D(^[QUI]SCOMDOM(RESUL(IC)))) D ^%VZEAVT("domaine inconnu") S REFUSE=1
 Q
ACC(IC) 
 
 Q:RESUL(IC)=""
 N ACC
 S ACC=$$GETLBLAN^%VTLBLAN(RESUL(IC)),REFUSE=0
 G:ACC="" ACCER
 Q:ACC=0
 I '($$NUM^%QZNBN(RESUL(IC))) D ^%VZEAVT($$^%QZCHW("valeur comprise entre zero et 1")) G ACCER
 I ACC>1 D ^%VZEAVT($$^%QZCHW("valeur comprise entre zero et 1")) G ACCER
 S RESUL(IC)=ACC
 Q
ACCER S REFUSE=1
 Q
REAF(VAL) 
 S TAB(IC)=VAL D ^%VAFFICH S RESUL(IC)=VAL Q

