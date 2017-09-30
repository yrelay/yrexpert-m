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

;%LNKETU3^INT^1^59547,73870^0
LNKETU ;
 
 
 
 
 
 
RREF(IC) 
 
 N GL S GL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"REPERTOIRES") K @(GL)
 S RESUL(IC)=$$GETLBLAN^%VTLBLAN(RESUL(IC)),REFUSE=0
RREF0 I RESUL(IC)="" D ^%VZEAVT("champ obligatoire") S REFUSE=1 Q
 I RESUL(IC)="?" D REPA^%QSGEST9(GL),CHIND(GL) K @(GL) Q:REFUSE  D REAF(IND) G RREF0
 I $$REPM^%QSGEST9(RESUL(IC))'=2 D ^%VZEAVT("repertoire inconnu") S REFUSE=1 Q
 Q
IND(IC) 
 
 K PATOUCH(IC+2)
 I RESUL(IC)="" Q
 S PATOUCH(IC+2)=1
 N IND,REPI
 S IND=$$GETLBLAN^%VTLBLAN(RESUL(IC))
 I RESUL(IC-1)="" D ^%VZEAVT($$^%QZCHW("repertoire indefini")) G INDER
IND1 S REPI=$$NOMINT^%QSF(RESUL(IC-1))
 I REPI="" D ^%VZEAVT($$^%QZCHW("repertoire inconnu")) G INDER
 G:IND="?" IND2
 I '($$IR^%QSGE5($$NOMINT^%QSF(RESUL(IC-1)),IND)) D ^%VZEAVT($$^%QZCHW("Individu inconnu")) G INDER
 S RESUL(IC)=IND
 Q
IND2 D CHIND($$LISTIND^%QSGEST6($$NOMINT^%QSF(RESUL(IC-1))))
 I RESUL(IC)="" K PATOUCH(IC+2) Q
 D REAF(IND)
 Q
INDER S REFUSE=1
 Q
LIEN(IC) 
 I RESUL(IC)="" D ^%VZEAVT("champ obligatoire") S REFUSE=1 Q
 I RESUL(IC-2)="" D ^%VZEAVT("repertoire indefini") S REFUSE=1 Q
 I RESUL(IC)="?" G CHL
 I $$TYPE^%QSGEST9($$NOMINT^%QSF(RESUL(IC-2)),RESUL(IC))<4 D ^%VZEAVT("lien non involutif") S REFUSE=1 Q
 I $$QUAL^%QSGEL2($$NOMINT^%QSF(RESUL(IC-2)),RESUL(IC))=0 D ^%VZEAVT("lien non qualifie") S REFUSE=1 Q
 Q
CHL 
 N GLO,LSTL,CP
 S GLO="LSTL"
 D LIENNOM^%QSGES23($$NOMINT^%QSF(RESUL(IC-2)),GLO)
 S CP="" F I=0:0 S CP=$O(@GLO@(CP)) Q:CP=""  I $$TYPE^%QSGEST9($$NOMINT^%QSF(RESUL(IC-2)),CP)<4 K @GLO@(CP)
 D CHIND(GLO) K @(GLO)
 I IND="" S REFUSE=1 Q
 D REAF(IND)
 Q
SF(IC) 
 Q:RESUL(IC)=""
 N GLO,IND
 S GLO=$S(DTM:"^[QUI]EXPLICI",1:"^[QUI]EXPLICIT")
 I RESUL(IC)="?" D CHIND(GLO),REAF(IND) Q
 I '($D(@GLO@(RESUL(IC)))) D ^%VZEAVT("poche inconnue") S REFUSE=1 Q
 Q
ECH1(IC) 
 N GLO,IND
 S GLO=$$ADR^%QMLILA
 I RESUL(IC)="" Q
 I RESUL(IC)="?" D POCLEPA^%VVIDEO,BLD^%VVIDEO W $$^%QZCHW("liste d'attributs a donner au configurateur") G HELP
 I '($D(@GLO@(RESUL(IC)))) D ^%VZEAVT($$^%QZCHW("liste inconnue")) S REFUSE=1
 Q
ECH2(IC) 
 N GLO,IND
 I RESUL(IC)="*" Q
 S GLO=$$ADR^%QMLILA
 I RESUL(IC)="?" D POCLEPA^%VVIDEO,BLD^%VVIDEO W $$^%QZCHW("liste d'attributs a recuperer du configurateur")_" : "_$$^%QZCHW("liste")_" "_$$^%QZCHW("ou")_" * " G HELP
 I '($D(@GLO@(RESUL(IC)))) D ^%VZEAVT($$^%QZCHW("liste inconnue")) S REFUSE=1
 Q
HELP D NORM^%VVIDEO,CHIND(GLO),POCLEPA^%VVIDEO
 I IND="" S REFUSE=1 Q
 D REAF(IND)
 Q
CHIND(GLO) 
 D INIT^%QUCHOIP(GLO,"",1,50,12,27,10),AFF^%QUCHOIP
 S IND=$$UN^%QUCHOIP
 D END^%QUCHOIP,CLFEN^%VVIDEO(50,12,10,27)
 Q
LIST(IC) 
LIST0 I RESUL(IC-3)="" D ^%VZEAVT($$^%QZCHW("repertoire indefini")) S REFUSE=1 Q
 K PATOUCH(IC-2)
 I RESUL(IC)="" Q
 S PATOUCH(IC-2)=1
 I RESUL(IC)="?" G HELPL
 I '($$IR^%QSGE5("L0",RESUL(IC))) D ^%VZEAVT($$^%QZCHW("liste inconnue")) S REFUSE=1 Q
 I '($$VAIR^%QSGE5("L0",RESUL(IC),"BASE",$$NOMINT^%QSF(RESUL(IC-3)))) D ^%VZEAVT($$^%QZCHW("incompatibilite entre repertoire et liste")) S REFUSE=1
 Q
HELPL 
 N TEMP,GLO,NL,ETU,COL,CARD,FEN
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"HELP") K @(TEMP)
 S GLO=$$CONCAS^%QZCHAD(TEMP,"GLO")
 S FEN=$$CONCAS^%QZCHAD(TEMP,"FEN")
 S ETU="L0"
 
 D ^%VZEATT
 D ^%QSGES13(ETU,"BASE",$$NOMINT^%QSF(RESUL(IC-3)),1,GLO),POCLEPA^%VVIDEO
 S @FEN@("X")=0,@FEN@("Y")=0,@FEN@("L")=80,@FEN@("H")=22
 S @FEN@("B")="L0",@FEN@("A")=GLO,@FEN@("ATT")=1,@FEN@("AFF")="REAFI^%LNKETU3"
 S @FEN@("LR")=13
 S @FEN@("C",1,"T")=$$^%QZCHW("Card."),@FEN@("C",1,"L")=6,@FEN@("C",1,"C")="CARD"
 S @FEN@("C",2,"T")=$$^%QZCHW("Repertoire"),@FEN@("C",2,"L")=15,@FEN@("C",2,"C")="OBJET"
 S @FEN@("C",3,"T")=$$^%QZCHW("Source"),@FEN@("C",3,"L")=12,@FEN@("C",3,"C")="SOURCE"
 S @FEN@("C",4,"L")=16,@FEN@("C",4,"C")="AUTRE"
 S @FEN@("C",5,"T")=$$^%QZCHW("Creation"),@FEN@("C",5,"L")=8,@FEN@("C",5,"C")="DATE.CREATION"
 S @FEN@("ECRAN")="",@FEN@("PADLINE")="POCLEPA^%VVIDEO"
 D INIT^%QUAPAGM(FEN)
 D REAFI
 S IND=$$UN^%QUAPAGM
 D END^%QUAPAGM
 K @(TEMP)
 D ^%VAFIGRI,^%VAFISCR
 D REAF(IND)
 G LIST0
REAF(VAL) 
 S TAB(IC)=$J(" ",$L(RESUL(IC))) D ^%VAFFICH
 S TAB(IC)=VAL D ^%VAFFICH S RESUL(IC)=VAL Q
 
REAFI D CLEPAG^%VVIDEO,AFFICH^%QUAPAGM Q

