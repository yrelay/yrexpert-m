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

;%SRSAIS2^INT^1^59547,73891^0
SRSAIS2 ;
 
 
 
 
 
 
 
 
 
 
 N GLA
 D ^%VZEATT
 S ADR=$$ADR,GLA=$$ADRD
 
 S GLO=$$CONCAT^%QZCHAD(GLA,1)
 S GLOC=$$CONCAT^%QZCHAD(GLA,2)
 S GLOU=$$CONCAT^%QZCHAD(GLA,3)
 S GLOUC=$$CONCAT^%QZCHAD(GLA,4)
 S GLOV=$$CONCAT^%QZCHAD(GLA,5)
 S GLON=$$CONCAT^%QZCHAD(GLA,6)
 I $D(@GLA) G INIV
 
 S @GLO=$$^%QZCHW("Definition generale de la saisie")
 S @GLO@("H")=12,@GLO@("V")=3,@GLO@("FL")="RLD"
 S @GLO@("STO.DER")=0,@GLO@("EXEC.UCONT")="B"
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=0
 S @GLO@("NBC")=4,@GLO@("L")=30
 S @GLO@("CHAMPS",1)="NOM.SAISIE",@GLO@("CHAMPS",2)="TITRE"
 S @GLO@("CHAMPS",3)="NUMERO.COLONNE",@GLO@("CHAMPS",4)="NUMERO.LIGNE"
 S @GLO@("PLL")=14
 S @GLO@("POP1")="",@GLO@("POP2")=""
 
 S @GLO@("CLE",1)=1,@GLO@("POSCLE",1)=1,@GLO@("RECUP",1)=""
 F I=1,2 S @GLO@("LARG",I)=30
 F I=3,4 S @GLO@("LARG",I)=2
 F I=1:1:4 S @GLO@("SUIV",I)=I+1,@GLO@("PREC",I)=I-1
 S @GLO@("SUIV",4)=1,@GLO@("PREC",1)=4
 
 S @GLOC=$$^%QZCHW("Definition des champs")
 S @GLOC@("H")=10,@GLOC@("V")=11,@GLOC@("FL")="RLD"
 S @GLOC@("STO.DER")=1,@GLOC@("EXEC.UCONT")="B"
 S @GLOC@("BOU.AJOUT")=1,@GLOC@("BOU.ERREUR")=1
 S @GLOC@("NBC")=8,@GLOC@("L")=30
 S @GLOC@("CHAMPS",1)="NUMERO",@GLOC@("CHAMPS",2)="LIBELLE"
 S @GLOC@("CHAMPS",3)="MODIFIABLE (O/N)",@GLOC@("CHAMPS",4)="OBLIGATOIRE (O/N)"
 S @GLOC@("CHAMPS",5)="VALEUR.DEFAUT",@GLOC@("CHAMPS",6)="LARGEUR"
 S @GLOC@("CHAMPS",7)="CLE.NUMERO",@GLOC@("CHAMPS",8)="RECUPERATION (O/N)"
 S @GLOC@("PLL")=18
 S @GLOC@("POP1")="",@GLOC@("POP2")=""
 
 S @GLOC@("CLE",1)=1,@GLOC@("POSCLE",1)=1,@GLOC@("RECUP",1)=""
 F I=2,5 S @GLOC@("LARG",I)=30
 F I=1,6,7 S @GLOC@("LARG",I)=2
 F I=3,4,8 S @GLOC@("LARG",I)=1
 F I=1:1:8 S @GLOC@("SUIV",I)=I+1,@GLOC@("PREC",I)=I-1
 S @GLOC@("SUIV",8)=1,@GLOC@("PREC",1)=8
 
 S @GLOU=$$^%QZCHW("Controles globaux")
 S @GLOU@("H")=16,@GLOU@("V")=14,@GLOU@("FL")="RLD"
 S @GLOU@("STO.DER")=1,@GLOU@("EXEC.UCONT")="B"
 S @GLOU@("BOU.AJOUT")=0,@GLOU@("BOU.ERREUR")=1
 S @GLOU@("NBC")=5,@GLOU@("L")=1
 S @GLOU@("CHAMPS",1)="Boucle sur ajout (O/N)"
 S @GLOU@("CHAMPS",2)="Boucle sur erreur (O/N)"
 S @GLOU@("CHAMPS",3)="Exec. controles (C/G/B)"
 S @GLOU@("CHAMPS",4)="Stock. sur dernier champ (O/N)"
 S @GLOU@("CHAMPS",5)="Ajout seulement (O/N)"
 S @GLOU@("PLL")=30
 S @GLOU@("POP1")="",@GLOU@("POP2")=""
 F I=1:1:5 S @GLOU@("LARG",I)=1
 F I=1:1:5 S @GLOU@("SUIV",I)=I+1,@GLOU@("PREC",I)=I-1
 S @GLOU@("SUIV",5)=1,@GLOU@("PREC",1)=5
 
 S @GLOUC=$$^%QZCHW("Controles")
 S @GLOUC@("H")=12,@GLOUC@("V")=18,@GLOUC@("FL")="RLHD"
 S @GLOUC@("STO.DER")=1,@GLOUC@("EXEC.UCONT")="B"
 S @GLOUC@("BOU.AJOUT")=0,@GLOUC@("BOU.ERREUR")=1
 S @GLOUC@("NBC")=2,@GLOUC@("L")=50
 S @GLOUC@("CHAMPS",1)="NATURE",@GLOUC@("CHAMPS",2)="FORMAT"
 S @GLOUC@("PLL")=6
 S @GLOUC@("POP1")="",@GLOUC@("POP2")=""
 S @GLOUC@("LARG",1)=6,@GLOUC@("LARG",2)=50
 F I=1:1:2 S @GLOUC@("SUIV",I)=I+1,@GLOUC@("PREC",I)=I-1
 S @GLOUC@("SUIV",2)=1,@GLOUC@("PREC",1)=2
 
 S @GLOV=$$^%QZCHW("Valeurs legales")
 S @GLOV@("H")=3,@GLOV@("V")=3,@GLOV@("FL")="RLD"
 S @GLOV@("STO.DER")=1,@GLOV@("EXEC.UCONT")="B"
 S @GLOV@("BOU.AJOUT")=1,@GLOV@("BOU.ERREUR")=1
 S @GLOV@("NBC")=16,@GLOV@("L")=55
 S @GLOV@("CHAMPS",1)="NUMERO DE FICHE"
 F I=2:3:14 S @GLOV@("CHAMPS",I)="Operateur",@GLOV@("CHAMPS",I+1)="Valeur(s)",@GLOV@("CHAMPS",I+2)="ET / OU"
 S @GLOV@("PLL")=15
 S @GLOV@("POP1")="",@GLOV@("POP2")=""
 
 S @GLOV@("CLE",1)=1,@GLOV@("POSCLE",1)=1,@GLOV@("RECUP",1)=""
 F I=1,4:3:16 S @GLOV@("LARG",I)=2
 F I=2:3:14 S @GLOV@("LARG",I)=3
 F I=3:3:15 S @GLOV@("LARG",I)=55
 F I=1:1:16 S @GLOV@("SUIV",I)=I+1,@GLOV@("PREC",I)=I-1
 S @GLOV@("SUIV",16)=1,@GLOV@("PREC",1)=16
 
 S @GLON=$$^%QZCHW("Note d'aide")
 S @GLON@("H")=8,@GLON@("V")=3,@GLON@("FL")="RLHD"
 S @GLON@("STO.DER")=1,@GLON@("EXEC.UCONT")="B"
 S @GLON@("BOU.AJOUT")=0,@GLON@("BOU.ERREUR")=1
 S @GLON@("NBC")=18,@GLON@("L")=60
 F I=1:1:18 S @GLON@("CHAMPS",I)=I
 S @GLON@("PLL")=2
 S @GLON@("POP1")="",@GLON@("POP2")=""
 F I=1:1:18 S @GLON@("LARG",I)=60
 F I=1:1:18 S @GLON@("SUIV",I)=I+1,@GLON@("PREC",I)=I-1
 S @GLON@("SUIV",18)=1,@GLON@("PREC",1)=18
 
INIV 
 S VAL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(VAL)
 
 S VALS=$$CONCAT^%QZCHAD(VAL,1)
 
 S VALC=$$CONCAT^%QZCHAD(VAL,2)
 
 S VALU=$$CONCAT^%QZCHAD(VAL,3)
 
 S VALUC=$$CONCAT^%QZCHAD(VAL,4)
 
 S VALV=$$CONCAT^%QZCHAD(VAL,5)
 
 S VALN=$$CONCAT^%QZCHAD(VAL,6)
 D INIT
 
 D POCLEPA^%VVIDEO
 S INIT=1
 Q
 
INIT 
 F I=1:1:4 S @VALS@(I)=""
 S @VALU@(1)="O",@VALU@(2)="O",@VALU@(3)="B",@VALU@(4)="O",@VALU@(5)="N"
 D INIC
 Q
INIC 
 F I=1,2,5,6,7 S @VALC@(I)=""
 S @VALC@(3)="O"
 F I=4,8 S @VALC@(I)="N"
 S @VALUC@(1)="X",@VALUC@(2)=""
 F I=1:1:16 S @VALV@(I)=""
 F I=1:1:18 S @VALN@(I)=""
 Q
 
 
ADR() 
 Q "^[QUI]RQSGLO(""SR"",""DEF"")"
 
ADRD() 
 Q "^[QUI]RQSDON(""SR"",""FEN"")"

