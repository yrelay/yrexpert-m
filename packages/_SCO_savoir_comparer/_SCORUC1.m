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

;%SCORUC1^INT^1^59547,73888^0
SCORUC1 ;
 
 
 
 
 
DOM(IC) 
 I RESUL(IC)="" D ^%VZEAVT($$^%QZCHW("Ce champ doit etre rempli")) S REFUSE=1 Q
 I RESUL(IC)="?",(%AJM'="M")&(%AJM'="C") D CDOM(1,12) Q
 I (%AJM'="M")&(%AJM'="C") Q
 I RESUL(IC)="?" D CHOIX(IC) Q
 I %AJM="C",'($D(^[QUI]SCOMPREG(RESUL(IC),"NON.EGALITE"))) D ^%VZEAVT($$^%QZCHW("Aucune fiche n'a ete defini pour ce domaine")) G HELP
 Q
 
ATT(IC) 
 I RESUL(IC)="" D ^%VZEAVT($$^%QZCHW("Ce champ doit etre rempli")) S REFUSE=1 Q
 I %AJM="D" D CHBKPT^%LXUC5,FULL^%LXUC4 Q
 I RESUL(IC-1)="" D ^%VZEAVT($$^%QZCHW("Veuillez definir le champ precedent")) S REFUSE=1,RESUL(IC)=CHAMP Q
 I %AJM="A" D CHBKPT^%LXUC5,FULL^%LXUC4 Q
 I RESUL(IC)="?" D CHOIX(IC) Q
 D CHBKPT^%LXUC5,FULL^%LXUC4 Q:REFUSE
 I %AJM="C",'($D(^[QUI]SCOMPREG(RESUL(IC-1),"NON.EGALITE",RESUL(IC)))) D ^%VZEAVT($$^%QZCHW("Aucune fiche n'a ete defini pour cet attribut")) G HELP
 Q
 
IND 
 I RESUL(IC)="" S TAB(IC)=1 D ^%VAFFICH
 I (%AJM'="M")&(%AJM'="C") Q
 F I=1:1:IC-1 I RESUL(I)="" S REFUSE=1
 I REFUSE D ^%VZEAVT($$^%QZCHW("Veuillez definir tous les champs precedents")) Q
 I RESUL(IC)="?" D CHOIX(IC) Q
 I %AJM="C",'($D(^[QUI]SCOMPREG(RESUL(IC-2),"NON.EGALITE",RESUL(IC-1),RESUL(IC)))) D ^%VZEAVT($$^%QZCHW("Aucune fiche n'a ete defini pour cet indice")) G HELP
 Q
 
VAL(IC) 
 I RESUL(IC)="=" S RESUL(IC+1)="=",PATOUCH(IC+1)=1 Q
 S PATOUCH(IC+1)=""
 I RESUL(IC)="" S TAB(IC)="*" D ^%VAFFICH S REFUSE=0
 I RESUL(IC)="*" S RESUL(IC+1)="*"
 I RESUL(IC)["@" D ^%VZEAVT($$^%QZCHW("Une valeur ne peut contenir ""@"" ")) S REFUSE=1 Q
 I ($E(RESUL(IC))="""")!($E(RESUL(1),$L(RESUL(1)))="""") D ^%VZEAVT($$^%QZCHW("Une valeur ne peut commencer ou finir par """)) S REFUSE=1 Q
 I (%AJM'="M")&(%AJM'="C") Q
 F I=1:1:IC-1 I RESUL(I)="" S REFUSE=1
 I REFUSE D ^%VZEAVT($$^%QZCHW("Veuillez definir tous les champs precedents")) Q
 I RESUL(IC)="?" D CHOIX(IC) Q
 I %AJM="C",'($D(^[QUI]SCOMPREG(RESUL(IC-3),"NON.EGALITE",RESUL(IC-2),RESUL(IC-1),RESUL(IC)))) D ^%VZEAVT($$^%QZCHW("Aucune fiche n'a ete defini pour cette valeur")) G HELP
 Q
 
VAL2(IC) 
 I RESUL(IC)="" S TAB(IC)="*" D ^%VAFFICH S REFUSE=0
 I RESUL(IC)["@" D ^%VZEAVT($$^%QZCHW("Une valeur ne peut contenir ""@"" ")) S REFUSE=1 Q
 I ($E(RESUL(IC))="""")!($E(RESUL(1),$L(RESUL(1)))="""") D ^%VZEAVT($$^%QZCHW("Une valeur ne peut commencer ou finir par """)) S REFUSE=1 Q
 I (%AJM'="M")&(%AJM'="C") Q
 F I=1:1:IC-1 I RESUL(I)="" S REFUSE=1
 I REFUSE D ^%VZEAVT($$^%QZCHW("Veuillez definir tous les champs precedents")) Q
 I RESUL(IC)="?" D CHOIX(IC) Q
 I %AJM="C",'($D(^[QUI]SCOMPREG(RESUL(IC-4),"NON.EGALITE",RESUL(IC-3),RESUL(IC-2),RESUL(IC-1),RESUL(IC)))) D ^%VZEAVT($$^%QZCHW("Aucune fiche n'a ete defini pour cette valeur")) G HELP
 Q
 
HELP 
 D ^%VZEAVT($$^%QZCHW("Tapez ""?"" pour avoir la liste des valeurs existantes")) S REFUSE=1 Q
 
CHOIX(N) 
 N GLO,IND
 S GLO="^[QUI]SCOMPREG("
 I N=1 S GLO=$P(GLO,"(") G CHOIX2
 I N=2 S GLO=GLO_""""_RESUL(1)_""",""NON.EGALITE"")" G CHOIX2
 I N=3 S GLO=GLO_""""_RESUL(1)_""",""NON.EGALITE"","""_RESUL(2)_""")" G CHOIX2
 I N=4 S GLO=GLO_""""_RESUL(1)_""",""NON.EGALITE"","""_RESUL(2)_""","""_RESUL(3)_""")" G CHOIX2
 I N=5 S GLO=GLO_""""_RESUL(1)_""",""NON.EGALITE"","""_RESUL(2)_""","""_RESUL(3)_""","""_RESUL(4)_""")"
CHOIX2 D NORM^%VVIDEO,INIT^%QUCHOIP(GLO,"",1,0,11,80,9),AFF^%QUCHOIP
 S RESUL(N)=$$UN^%QUCHOIP D END^%QUCHOIP
 I RESUL(N)="" S REFUSE=1 G FCHOIX
 S TAB(ICC)=RESUL(N) D ^%VAFFICH S REFUSE=0
FCHOIX D CLFEN^%VVIDEO(0,11,9,80)
 Q
 
DESAC(IC) 
 Q:RESUL(IC)="="
 I RESUL(IC)="" S TAB(IC)="=" D ^%VAFFICH S REFUSE=0 Q
 I '($$NUM^%QZNBN(RESUL(IC))) D ^%VZEAVT("La valeur doit etre numerique") S REFUSE=1 Q
 I (RESUL(IC)<0)!(RESUL(IC)>1) D ^%VZEAVT($$^%QZCHW("Valeurs admises comprises entre zero et 1")) S REFUSE=1
 Q
 
LDOM(IC) 
 I %AJM="M" G LDOM2
 I RESUL(IC)="" D ^%VZEAVT($$^%QZCHW("Ce champ doit etre rempli")) S REFUSE=1 Q
 I $D(^[QUI]SCOMDOM(RESUL(IC))) D ^%VZEAVT($$^%QZCHW("Domaine deja existant")_" ...") S REFUSE=1 Q
 Q
LDOM2 
 I RESUL(IC)="?" D CDOM(1,8) Q
 I RESUL(IC)="" D ^%VZEAVT($$^%QZCHW("Ce champ doit etre rempli")) S REFUSE=1 Q
 I '($D(^[QUI]SCOMDOM(RESUL(IC)))) D ^%VZEAVT($$^%QZCHW("Domaine inconnu")_" ...") S REFUSE=1 Q
 Q
 
CDOM(XO,YO) 
 D INIT^%QUCHOIP("^[QUI]SCOMDOM","",1,XO,YO,79,9),AFF^%QUCHOIP
 S RESUL(IC)=$$UN^%QUCHOIP D END^%QUCHOIP
 I RESUL(IC)="" S REFUSE=1 G FCHOIX
 S TAB(ICC)=RESUL(IC) D ^%VAFFICH S REFUSE=0
 D CLFEN^%VVIDEO(0,YO,9,80)
 Q

