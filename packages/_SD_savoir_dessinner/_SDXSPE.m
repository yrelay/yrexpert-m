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

;%SDXSPE^INT^1^59547,73890^0
SDXSPE ;
 
 
 
 
 N %C,%R,PK,X,Y,ADR,CTR,GLO,I,INIT,MODE,NUM,VAL
 S INIT=0
DEB D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Definition de l'environnement graphique specifique"),0)
 K Y
 S Y="30\BLH\2\\\Ajouter,Lister"
ACT D ^%PKPOP
 I (CTR="A")!(CTR="F") G FIN
 I CTR'="" G ACT
 D INIT
 
 I X=1 S MODE=0 G DEF
 
 S I=$$CHOIX I I="" G DEB
 D ^%PKAFFI(1,0,1,GLO,VAL,.ERR) G MEN
DEF 
 D ^%PKSAISI(MODE,0,1,0,1,GLO,VAL,.ERR)
 
 S NUM=@VAL@(1)
 
MEN D POCLEPA^%VVIDEO
 K Y
 S Y="10\CLH\5\\\Ajouter,Modifier,Supprimer,Dupliquer,Lister"
ACT2 S %R=22
 D ^%PKPOP
 I (CTR="A")!(CTR="F") G FIN
 I CTR'="" G ACT2
 
 I X=1 S MODE=0 G DEF
 
 I X=2 S MODE=1 G DEF
 
 I X=4 S MODE=2 G DEF
 
 I X=5 S I=$$CHOIX D ^%PKAFFI(1,0,1,GLO,VAL,.ERR) G MEN
 
 I $$POCLE^%PKOUNO($$^%QZCHW("Suppression de la definition de cet environnement specifique")_" ? ","N")'=1 G MEN
 K @ADR@(NUM)
 D INIV,^%PKAFFI(0,0,1,GLO,VAL,.ERR)
 G MEN
 
FIN I INIT=1 K @(VAL)
 Q
 
CHOIX() 
 S I=$$UN^%PKCHOIX(ADR,1,3,17) I I="" G FC
 S MODE=1,NUM=I
 S @VAL@(1)=$P(@ADR@(I),$C(0),1)
FC Q I
 
INIT 
 S ADR=$$ADR,GLO=$$ADRF
 S INIT=1
 I $D(@GLO) G INIV
 S @GLO=""
 S @GLO@("H")=20,@GLO@("V")=5,@GLO@("FL")="LD"
 S @GLO@("STO.DER")=0,@GLO@("EXEC.UCONT")="C"
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 S @GLO@("NBC")=13,@GLO@("L")=11
 S @GLO@("CHAMPS",1)="Numero de porte du terminal"
 S @GLO@("CHAMPS",2)="Abscisse du zero absolu",@GLO@("CHAMPS",3)="Ordonnee du zero absolu"
 S @GLO@("CHAMPS",4)="Hauteur de l'ecran",@GLO@("CHAMPS",5)="Largeur de l'ecran"
 S @GLO@("CHAMPS",6)="Unite (1 cm a l'ecran =)",@GLO@("CHAMPS",7)="Orientation"
 S @GLO@("CHAMPS",8)="Taille des caracteres",@GLO@("CHAMPS",9)="Epaisseur des traits"
 S @GLO@("CHAMPS",10)="Type des traits",@GLO@("CHAMPS",11)="Points"
 S @GLO@("CHAMPS",12)=$$^%QZCHW("Acces a la syntaxe (O/N)")
 S @GLO@("CHAMPS",13)=$$^%QZCHW("Pas du quadrillage ( >= 20 )")
 S @GLO@("PLL")=28
 
 S @GLO@("CLE",1)=1,@GLO@("POSCLE",1)=1
 S @GLO@("POP1")="",@GLO@("POP2")=""
 F I=2:1:6 S @GLO@("LARG",I)=4
 S @GLO@("LARG",7)=11,@GLO@("LARG",1)=6
 F I=8,9,13 S @GLO@("LARG",I)=3
 S @GLO@("LARG",10)=11,@GLO@("LARG",11)=9,@GLO@("LARG",12)=1
 F I=1:1:13 S @GLO@("SUIV",I)=I+1,@GLO@("PREC",I)=I-1
 S @GLO@("SUIV",13)=1,@GLO@("PREC",1)=13
 S @GLO@("FORMAT",1)="S OK=1"
 F I=2:1:5 S @GLO@("FORMAT",I)="S OK=$$ENTP^%QZNBN(VAL)"
 F I=6,8,9 S @GLO@("FORMAT",I)="S OK=$$POS^%QZNBN(VAL)"
 S @GLO@("FORMAT",7)="S OK=(VAL=""VERTICALE"")!(VAL=""HORIZONTALE"")"
 S @GLO@("FORMAT",10)="S OK=(VAL=""NORMAL"")!(VAL=""POINTILLE"")!(VAL=""TRAITS COURTS"")!(VAL=""TRAITS LONGS"")!(VAL=""MIXTE"")"
 S @GLO@("FORMAT",11)="S OK=(VAL=""VISIBLE"")!(VAL=""INVISIBLE"")"
 S @GLO@("FORMAT",12)="S OK=(VAL=""O"")!(VAL=""N"")"
 S @GLO@("FORMAT",13)="S OK=($$ENTP^%QZNBN(VAL))&(VAL'<20)"
 F I=1:1:13 S @GLO@("OBLIGAT",I)="S OK=(VAL'="""")",@GLO@("VALEG",I,0)="S OK=2"
 
INIV 
 S VAL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(VAL)
 S @VAL=$P(ADR,")",1)
 S @VAL@(1)=$I,@VAL@(2)=0,@VAL@(3)=0,@VAL@(4)=780,@VAL@(5)=1024,@VAL@(6)=1
 S @VAL@(7)="HORIZONTALE",@VAL@(8)=1,@VAL@(9)=1,@VAL@(10)="NORMAL"
 S @VAL@(11)="VISIBLE",@VAL@(12)="O",@VAL@(13)=20
 Q
 
 
ADR() 
 Q "^[QUI]RQSGLO(""SD"",""ENV"",""SPE"")"
 
ADRF() 
 Q "^SAVMASQ(""SD"",""ENV"",""SPE"")"

