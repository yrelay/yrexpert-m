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

;%SDEDES1^INT^1^59547,73888^0
SDEDES1 ;
 
 
 
 
 
 
ARC 
 I $D(@GLO) Q
 S @GLO=" "_$$^%QZCHW("Definition d'un arc de cercle")_" "
 S @GLO@("H")=3,@GLO@("V")=3,@GLO@("FL")="LD"
 S @GLO@("STO.DER")=0,@GLO@("EXEC.UCONT")="C"
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 S @GLO@("NBC")=16,@GLO@("L")=45
 S @GLO@("CHAMPS",1)="Numero",@GLO@("CHAMPS",2)="Epaisseur",@GLO@("CHAMPS",3)="Trait"
 S @GLO@("CHAMPS",4)="Abscisse point central",@GLO@("CHAMPS",5)="Ordonnee point central"
 S @GLO@("CHAMPS",6)="Abscisse point de depart",@GLO@("CHAMPS",7)="Ordonnee point de depart"
 S @GLO@("CHAMPS",8)="Abscisse point d'arrivee",@GLO@("CHAMPS",9)="Ordonnee point d'arrivee"
 S @GLO@("CHAMPS",10)="Rayon"
 S @GLO@("CHAMPS",11)="Angle de depart",@GLO@("CHAMPS",12)="Angle de fin"
 S @GLO@("CHAMPS",13)="Nom du point central"
 S @GLO@("CHAMPS",14)="Nom du point de depart"
 S @GLO@("CHAMPS",15)="Nom du point d'arrivee"
 S @GLO@("CHAMPS",16)="Condition"
 S @GLO@("PLL")=24
 
 S @GLO@("UCONT")="D ARC^%SDEDES4"
 
 S @GLO@("CLE",1)=1,@GLO@("POSCLE",1)=1
 S @GLO@("POP1")="",@GLO@("POP2")=""
 S @GLO@("LARG",1)=4,@GLO@("LARG",2)=4,@GLO@("LARG",3)=11
 F I=4:1:12 S @GLO@("LARG",I)=45
 F I=13:1:16 S @GLO@("LARG",I)=20
 F I=1:1:16 S @GLO@("SUIV",I)=I+1,@GLO@("PREC",I)=I-1
 S @GLO@("SUIV",16)=1,@GLO@("PREC",1)=16
 S @GLO@("FORMAT",1)="S OK=$$ENTP^%QZNBN(VAL)"
 S @GLO@("FORMAT",2)="S OK=$$POS^%QZNBN(VAL)"
 S @GLO@("FORMAT",3)="S OK=(VAL="""""""_$$^%QZCHW("POINTILLE")_""""""")!(VAL="""""""_$$^%QZCHW("NORMAL")_""""""")"
 F I=4:1:16 S @GLO@("FORMAT",I)="S OK=1"
 F I=1:1:16 S @GLO@("VALEG",I,0)="S OK=2",@GLO@("OBLIGAT",I)="S OK=1"
 Q
 
 
CERCLE 
 I $D(@GLO) Q
 S @GLO=" "_$$^%QZCHW("Definition d'un cercle")_" "
 S @GLO@("H")=1,@GLO@("V")=5,@GLO@("FL")="LD"
 S @GLO@("STO.DER")=0,@GLO@("EXEC.UCONT")="C"
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 S @GLO@("NBC")=11,@GLO@("L")=45
 S @GLO@("CHAMPS",1)="Numero",@GLO@("CHAMPS",2)="Epaisseur",@GLO@("CHAMPS",3)="Trait"
 S @GLO@("CHAMPS",4)="Abscisse point central",@GLO@("CHAMPS",5)="Ordonnee point central"
 S @GLO@("CHAMPS",6)="Abscisse point circonference",@GLO@("CHAMPS",7)="Ordonnee point circonference"
 S @GLO@("CHAMPS",8)="Rayon"
 S @GLO@("CHAMPS",9)="Nom du point central",@GLO@("CHAMPS",10)="Nom du point circonference"
 S @GLO@("CHAMPS",11)="Condition"
 S @GLO@("PLL")=28
 
 S @GLO@("UCONT")="D CERCLE^%SDEDES4"
 
 S @GLO@("CLE",1)=1,@GLO@("POSCLE",1)=1
 S @GLO@("POP1")="",@GLO@("POP2")=""
 S @GLO@("LARG",1)=4,@GLO@("LARG",2)=4,@GLO@("LARG",3)=11
 F I=4:1:8 S @GLO@("LARG",I)=45
 F I=9,10,11 S @GLO@("LARG",I)=20
 F I=1:1:11 S @GLO@("SUIV",I)=I+1,@GLO@("PREC",I)=I-1
 S @GLO@("SUIV",11)=1,@GLO@("PREC",1)=11
 S @GLO@("FORMAT",1)="S OK=$$ENTP^%QZNBN(VAL)"
 S @GLO@("FORMAT",2)="S OK=$$POS^%QZNBN(VAL)"
 S @GLO@("FORMAT",3)="S OK=(VAL="""""""_$$^%QZCHW("POINTILLE")_""""""")!(VAL="""""""_$$^%QZCHW("NORMAL")_""""""")"
 F I=4:1:11 S @GLO@("FORMAT",I)="S OK=1"
 F I=1:1:11 S @GLO@("VALEG",I,0)="S OK=2",@GLO@("OBLIGAT",I)="S OK=1"
 Q
 
 
TEXTE 
 I $D(@GLO) Q
 S @GLO=" "_$$^%QZCHW("Definition d'un texte")_" "
 S @GLO@("H")=2,@GLO@("V")=5,@GLO@("FL")="LD"
 S @GLO@("STO.DER")=0,@GLO@("EXEC.UCONT")="C"
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 S @GLO@("NBC")=8,@GLO@("L")=45
 S @GLO@("CHAMPS",1)="Numero",@GLO@("CHAMPS",2)="Taille"
 S @GLO@("CHAMPS",3)="Abscisse point d'affichage",@GLO@("CHAMPS",4)="Ordonnee point d'affichage"
 S @GLO@("CHAMPS",5)="Texte",@GLO@("CHAMPS",6)="Angle d'affichage"
 S @GLO@("CHAMPS",7)="Nom du point d'affichage"
 S @GLO@("CHAMPS",8)="Condition"
 S @GLO@("PLL")=26
 
 S @GLO@("UCONT")="D TEXTE^%SDEDES5"
 
 S @GLO@("CLE",1)=1,@GLO@("POSCLE",1)=1
 S @GLO@("POP1")="",@GLO@("POP2")=""
 S @GLO@("LARG",1)=4,@GLO@("LARG",2)=3,@GLO@("LARG",7)=20,@GLO@("LARG",8)=20
 F I=3:1:6 S @GLO@("LARG",I)=45
 F I=1:1:8 S @GLO@("SUIV",I)=I+1,@GLO@("PREC",I)=I-1
 S @GLO@("SUIV",8)=1,@GLO@("PREC",1)=8
 S @GLO@("FORMAT",1)="S OK=$$ENTP^%QZNBN(VAL)"
 S @GLO@("FORMAT",2)="S OK=$$POS^%QZNBN(VAL)"
 F I=3:1:8 S @GLO@("FORMAT",I)="S OK=1"
 F I=1:1:8 S @GLO@("VALEG",I,0)="S OK=2",@GLO@("OBLIGAT",I)="S OK=1"
 S @GLO@("OBLIGAT",5)="S OK=(VAL'="""")"
 Q

