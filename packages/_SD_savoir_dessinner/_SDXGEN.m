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

;%SDXGEN^INT^1^59547,73890^0
SDXGEN ;
 
 
 
 
 N %C,%R,PK,X,Y,ADR,CTR,GLO,I,MODE,VAL
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Definition de l'environnement graphique general"),0)
 D INIT
 
 I $D(@ADR) S MODE=1 D ^%PKAFFI(1,0,1,GLO,VAL,.ERR) G MEN
 
 S MODE=0
DEF 
 D ^%PKSAISI(MODE,0,1,0,1,GLO,VAL,.ERR)
 
MEN S %R=22
 K Y
 S Y="23\CLH\2\\\Modifier,Defaut"
 D ^%PKPOP
 I (CTR="A")!(CTR="F") G FIN
 I CTR'="" G MEN
 
 I X=1 S MODE=1 G DEF
 
 K @(ADR)
 D INIV
 S MODE=0 G DEF
 
FIN K @(VAL)
 Q
 
INIT 
 S ADR=$$ADR,GLO=$$ADRF
 I $D(@GLO) G INIV
 S @GLO=""
 S @GLO@("H")=20,@GLO@("V")=5,@GLO@("FL")="LD"
 S @GLO@("STO.DER")=0,@GLO@("EXEC.UCONT")="C"
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 S @GLO@("NBC")=12,@GLO@("L")=11
 S @GLO@("CHAMPS",1)="Abscisse du zero absolu",@GLO@("CHAMPS",2)="Ordonnee du zero absolu"
 S @GLO@("CHAMPS",3)="Hauteur de l'ecran",@GLO@("CHAMPS",4)="Largeur de l'ecran"
 S @GLO@("CHAMPS",5)="Unite (1 cm a l'ecran =)",@GLO@("CHAMPS",6)="Orientation"
 S @GLO@("CHAMPS",7)="Taille des caracteres",@GLO@("CHAMPS",8)="Epaisseur des traits"
 S @GLO@("CHAMPS",9)="Type des traits",@GLO@("CHAMPS",10)="Points"
 S @GLO@("CHAMPS",11)=$$^%QZCHW("Acces a la syntaxe (O/N)")
 S @GLO@("CHAMPS",12)=$$^%QZCHW("Pas du quadrillage ( >= 20 )")
 S @GLO@("PLL")=28
 S @GLO@("POP1")="",@GLO@("POP2")=""
 F I=1:1:5 S @GLO@("LARG",I)=4
 S @GLO@("LARG",6)=11
 F I=7,8,12 S @GLO@("LARG",I)=3
 S @GLO@("LARG",9)=11,@GLO@("LARG",10)=9,@GLO@("LARG",11)=1
 F I=1:1:12 S @GLO@("SUIV",I)=I+1,@GLO@("PREC",I)=I-1
 S @GLO@("SUIV",12)=1,@GLO@("PREC",1)=12
 F I=1:1:4 S @GLO@("FORMAT",I)="S OK=$$ENTP^%QZNBN(VAL)"
 F I=5,7,8 S @GLO@("FORMAT",I)="S OK=$$POS^%QZNBN(VAL)"
 S @GLO@("FORMAT",6)="S OK=(VAL=""VERTICALE"")!(VAL=""HORIZONTALE"")"
 S @GLO@("FORMAT",9)="S OK=(VAL=""NORMAL"")!(VAL=""POINTILLE"")!(VAL=""TRAITS COURTS"")!(VAL=""TRAITS LONGS"")!(VAL=""MIXTE"")"
 S @GLO@("FORMAT",10)="S OK=(VAL=""VISIBLE"")!(VAL=""INVISIBLE"")"
 S @GLO@("FORMAT",11)="S OK=(VAL=""O"")!(VAL=""N"")"
 S @GLO@("FORMAT",12)="S OK=($$ENTP^%QZNBN(VAL))&(VAL'<20)"
 F I=1:1:12 S @GLO@("OBLIGAT",I)="S OK=(VAL'="""")",@GLO@("VALEG",I,0)="S OK=2"
 
INIV 
 S VAL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(VAL)
 S @VAL@(1)=0,@VAL@(2)=0,@VAL@(3)=780,@VAL@(4)=1024,@VAL@(5)=1
 S @VAL@(6)="HORIZONTALE",@VAL@(7)=1,@VAL@(8)=1,@VAL@(9)="NORMAL"
 S @VAL@(10)="VISIBLE",@VAL@(11)="O",@VAL@(12)=20
 S @VAL=$P(ADR,")",1)
 Q
 
 
ADR() 
 Q "^[QUI]RQSGLO(""SD"",""ENV"",""GEN"")"
 
ADRF() 
 Q "^SAVMASQ(""SD"",""ENV"",""GEN"")"
 
EXIST() 
 I '($D(@$$ADR)) Q 0
 Q 1

