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

;%SDEDES2^INT^1^59547,73888^0
SDEDES2 ;
 
 
 
 
 
 
RECTAN 
 I $D(@GLO) Q
 S @GLO=" "_$$^%QZCHW("Definition d'un rectangle")_" "
 S @GLO@("H")=3,@GLO@("V")=4,@GLO@("FL")="LD"
 S @GLO@("STO.DER")=0,@GLO@("EXEC.UCONT")="C"
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 S @GLO@("NBC")=12,@GLO@("L")=45
 S @GLO@("CHAMPS",1)="Numero",@GLO@("CHAMPS",2)="Epaisseur",@GLO@("CHAMPS",3)="Trait"
 S @GLO@("CHAMPS",4)="Abscisse point de depart",@GLO@("CHAMPS",5)="Ordonnee point de depart"
 S @GLO@("CHAMPS",6)="Abscisse point oppose",@GLO@("CHAMPS",7)="Ordonnee point oppose"
 S @GLO@("CHAMPS",8)="Hauteur",@GLO@("CHAMPS",9)="Largeur",@GLO@("CHAMPS",10)="Plein (""O""/""N"")"
 S @GLO@("CHAMPS",11)="Nom du point de depart",@GLO@("CHAMPS",12)="Nom du point oppose"
 S @GLO@("PLL")=24
 
 S @GLO@("UCONT")="D RECTAN^%SDEDES4"
 
 S @GLO@("CLE",1)=1,@GLO@("POSCLE",1)=1
 S @GLO@("POP1")="",@GLO@("POP2")=""
 S @GLO@("LARG",1)=4,@GLO@("LARG",2)=4,@GLO@("LARG",3)=11,@GLO@("LARG",10)=3
 F I=4:1:9 S @GLO@("LARG",I)=45
 F I=11,12 S @GLO@("LARG",I)=20
 F I=1:1:12 S @GLO@("SUIV",I)=I+1,@GLO@("PREC",I)=I-1
 S @GLO@("SUIV",12)=1,@GLO@("PREC",1)=12
 S @GLO@("FORMAT",1)="S OK=$$ENTP^%QZNBN(VAL)"
 S @GLO@("FORMAT",2)="S OK=$$POS^%QZNBN(VAL)"
 S @GLO@("FORMAT",3)="S OK=(VAL="""""""_$$^%QZCHW("POINTILLE")_""""""")!(VAL="""""""_$$^%QZCHW("NORMAL")_""""""")"
 S @GLO@("FORMAT",10)="S OK=(VAL=""""""O"""""")!(VAL=""""""N"""""")"
 F I=4:1:9,11,12 S @GLO@("FORMAT",I)="S OK=1"
 F I=1:1:12 S @GLO@("OBLIGAT",I)="S OK=1",@GLO@("VALEG",I,0)="S OK=2"
 Q
 
 
ELLIPS(TYPE) 
 I $D(@GLO) Q
 I TYPE=1 S @GLO=" "_$$^%QZCHW("Definition d'une ellipse")_" "
 I TYPE=2 S @GLO=" "_$$^%QZCHW("Definition d'une demie-ellipse")_" "
 S @GLO@("H")=5,@GLO@("V")=3,@GLO@("FL")="LD"
 S @GLO@("STO.DER")=0,@GLO@("EXEC.UCONT")="C"
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 S @GLO@("NBC")=15,@GLO@("L")=45
 S @GLO@("CHAMPS",1)="Numero",@GLO@("CHAMPS",2)="Epaisseur",@GLO@("CHAMPS",3)="Trait"
 S @GLO@("CHAMPS",4)="Abscisse point depart",@GLO@("CHAMPS",5)="Ordonnee point depart"
 S @GLO@("CHAMPS",6)="Abscisse point arrivee",@GLO@("CHAMPS",7)="Ordonnee point arrivee"
 S @GLO@("CHAMPS",8)="Abscisse point axe",@GLO@("CHAMPS",9)="Ordonnee point axe"
 S @GLO@("CHAMPS",10)="Petit rayon",@GLO@("CHAMPS",11)="Grand rayon"
 S @GLO@("CHAMPS",12)="Angle",@GLO@("CHAMPS",13)="Nom du point depart"
 S @GLO@("CHAMPS",14)="Nom du point d'arrivee",@GLO@("CHAMPS",15)="Nom du point axe"
 S @GLO@("PLL")=22
 
 S @GLO@("UCONT")=$S(TYPE=1:"D ELLIPSE^%SDEDES4",1:"D DEMIEL^%SDEDES4")
 
 S @GLO@("CLE",1)=1,@GLO@("POSCLE",1)=1
 S @GLO@("POP1")="",@GLO@("POP2")=""
 S @GLO@("LARG",1)=4,@GLO@("LARG",2)=4,@GLO@("LARG",3)=11
 F I=4:1:12 S @GLO@("LARG",I)=45
 F I=13:1:15 S @GLO@("LARG",I)=20
 F I=1:1:15 S @GLO@("SUIV",I)=I+1,@GLO@("PREC",I)=I-1
 S @GLO@("SUIV",15)=1,@GLO@("PREC",1)=15
 S @GLO@("FORMAT",1)="S OK=$$ENTP^%QZNBN(VAL)"
 S @GLO@("FORMAT",2)="S OK=$$POS^%QZNBN(VAL)"
 S @GLO@("FORMAT",3)="S OK=(VAL="""""""_$$^%QZCHW("POINTILLE")_""""""")!(VAL="""""""_$$^%QZCHW("NORMAL")_""""""")"
 F I=4:1:15 S @GLO@("FORMAT",I)="S OK=1"
 F I=1:1:15 S @GLO@("OBLIGAT",I)="S OK=1",@GLO@("VALEG",I,0)="S OK=2"
 Q

