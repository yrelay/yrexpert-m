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

;%SRDESTI^INT^1^59547,73891^0
SRDESTI ;
 
 
 
 
 
 
 
 
 
 
 
 N GLO
 D ^%VZEATT
 S ADR=$$ADRS
 S GLO=$$ADR
 
 S GLOI=$$CONCAT^%QZCHAD(GLO,1)
 S GLOIL=$$CONCAT^%QZCHAD(GLO,2)
 S GLOL=$$CONCAT^%QZCHAD(GLO,3)
 S GLOA=$$CONCAT^%QZCHAD(GLO,4)
 I $D(@GLO) G INIT
 
 
 
 S @GLOI=$$^%QZCHW("Definition d'un individu symbolique")
 S @GLOI@("H")=1,@GLOI@("V")=10,@GLOI@("FL")="RLD"
 S @GLOI@("STO.DER")=1,@GLOI@("EXEC.UCONT")="G"
 S @GLOI@("BOU.AJOUT")=1,@GLOI@("BOU.ERREUR")=1
 S @GLOI@("NBC")=5,@GLOI@("L")=55
 S @GLOI@("CHAMPS",1)="Individu"
 S @GLOI@("CHAMPS",2)="Repertoire",@GLOI@("CHAMPS",3)="Nom de l'individu"
 S @GLOI@("CHAMPS",4)="Numero d'ordre",@GLOI@("CHAMPS",5)="Existence (O/N)"
 S @GLOI@("PLL")=17
 
 S @GLOI@("CLE",1)=1,@GLOI@("POSCLE",1)=1
 F I=1:1:3,5 S @GLOI@("OBLIGAT",I)="S OK=(VAL'="""")"
 S @GLOI@("OBLIGAT",4)=""
 F I=2,3 S @GLOI@("RECUP",I)=""
 S @GLOI@("LARG",1)=2
 F I=2:1:4 S @GLOI@("LARG",I)=55
 S @GLOI@("LARG",5)=1
 F I=1:1:5 S @GLOI@("SUIV",I)=I+1,@GLOI@("PREC",I)=I-1,@GLOI@("VALEG",I,0)="S OK=1"
 S @GLOI@("SUIV",5)=1,@GLOI@("PREC",1)=5
 S @GLOI@("POP1")="",@GLOI@("POP2")=""
 
 S @GLOIL=$$^%QZCHW("Definition d'un individu lien symbolique")
 S @GLOIL@("H")=1,@GLOIL@("V")=10,@GLOIL@("FL")="RLD"
 S @GLOIL@("STO.DER")=1,@GLOIL@("EXEC.UCONT")="G"
 S @GLOIL@("BOU.AJOUT")=1,@GLOIL@("BOU.ERREUR")=1
 S @GLOIL@("NBC")=5,@GLOIL@("L")=55
 S @GLOIL@("CHAMPS",1)="Individu lien",@GLOIL@("CHAMPS",2)="Nom du lien"
 S @GLOIL@("CHAMPS",3)="Indiv source",@GLOIL@("CHAMPS",4)="Indiv destination"
 S @GLOIL@("CHAMPS",5)="Existence (O/N)"
 S @GLOIL@("PLL")=17
 
 S @GLOIL@("CLE",1)=1,@GLOIL@("POSCLE",1)=1
 F I=1:1:5 S @GLOIL@("OBLIGAT",I)="S OK=(VAL'="""")",@GLOIL@("VALEG",I,0)="S OK=1"
 S @GLOIL@("RECUP",2)=""
 S @GLOIL@("LARG",1)=2
 F I=2:1:4 S @GLOIL@("LARG",I)=55
 S @GLOIL@("LARG",5)=1
 F I=1:1:5 S @GLOIL@("SUIV",I)=I+1,@GLOIL@("PREC",I)=I-1
 S @GLOIL@("SUIV",5)=1,@GLOIL@("PREC",1)=5
 S @GLOIL@("POP1")="",@GLOIL@("POP2")=""
 
 
 S @GLOA=$$^%QZCHW("Attributs a stocker")
 S @GLOA@("H")=1,@GLOA@("V")=10,@GLOA@("FL")="RLD"
 S @GLOA@("STO.DER")=1,@GLOA@("EXEC.UCONT")="G"
 S @GLOA@("BOU.AJOUT")=1,@GLOA@("BOU.ERREUR")=1
 S @GLOA@("NBC")=6,@GLOA@("L")=55
 S @GLOA@("CHAMPS",1)="Numero"
 S @GLOA@("CHAMPS",2)="Individu symbolique",@GLOA@("CHAMPS",3)="Attribut"
 S @GLOA@("CHAMPS",4)="Valeur",@GLOA@("CHAMPS",5)="Numero d'ordre"
 S @GLOA@("CHAMPS",6)="Particularites"
 S @GLOA@("PLL")=19
 
 S @GLOA@("CLE",1)=1,@GLOA@("POSCLE",1)=1
 F I=1:1:4 S @GLOA@("OBLIGAT",I)="S OK=(VAL'="""")"
 S @GLOA@("OBLIGAT",5)="",@GLOA@("OBLIGAT",6)=""
 S @GLOA@("RECUP",2)=""
 S @GLOA@("LARG",1)=2
 F I=2:1:6 S @GLOA@("LARG",I)=55
 F I=1:1:6 S @GLOA@("SUIV",I)=I+1,@GLOA@("PREC",I)=I-1,@GLOA@("VALEG",I,0)="S OK=1"
 S @GLOA@("SUIV",6)=1,@GLOA@("PREC",1)=6
 S @GLOA@("POP1")="",@GLOA@("POP2")=""
 
 
 S @GLOL=$$^%QZCHW("Liens a stocker")
 S @GLOL@("H")=1,@GLOL@("V")=10,@GLOL@("FL")="RLD"
 S @GLOL@("STO.DER")=1,@GLOL@("EXEC.UCONT")="G"
 S @GLOL@("BOU.AJOUT")=1,@GLOL@("BOU.ERREUR")=1
 S @GLOL@("NBC")=5,@GLOL@("L")=55
 S @GLOL@("CHAMPS",1)="Numero",@GLOL@("CHAMPS",2)="Nom du lien"
 S @GLOL@("CHAMPS",3)="Indiv source",@GLOL@("CHAMPS",4)="Indiv destination"
 S @GLOL@("CHAMPS",5)="Existence (O/N)"
 S @GLOL@("PLL")=17
 
 S @GLOL@("CLE",1)=1,@GLOL@("POSCLE",1)=1
 F I=1:1:5 S @GLOL@("OBLIGAT",I)="S OK=(VAL'="""")",@GLOL@("VALEG",I,0)="S OK=1"
 S @GLOL@("LARG",1)=2
 F I=2:1:4 S @GLOL@("LARG",I)=55
 S @GLOL@("LARG",5)=1
 F I=1:1:5 S @GLOL@("SUIV",I)=I+1,@GLOL@("PREC",I)=I-1
 S @GLOL@("SUIV",5)=1,@GLOL@("PREC",1)=5
 S @GLOL@("POP1")="",@GLOL@("POP2")=""
 
INIT 
 S VAL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(VAL)
 
 S VALI=$$CONCAT^%QZCHAD(VAL,1)
 
 S VALIL=$$CONCAT^%QZCHAD(VAL,2)
 
 S VALL=$$CONCAT^%QZCHAD(VAL,3)
 
 S VALA=$$CONCAT^%QZCHAD(VAL,4)
 D INIV
 
 D POCLEPA^%VVIDEO
 S INIT=1
 Q
 
INIV 
 F I=1:1:4 S @VALI@(I)=""
 S @VALI@(5)="N"
 F I=1:1:4 S @VALIL@(I)=""
 S @VALIL@(5)="N"
 F I=1:1:4 S @VALL@(I)=""
 S @VALL@(5)="N"
 F I=1:1:6 S @VALA@(I)=""
 Q
 
 
ADR() 
 Q "^[QUI]RQSDON(""SR"",""FENSTO"")"
 
ADRS() 
 Q "^[QUI]RQSGLO(""SR"",""STOCK"")"

