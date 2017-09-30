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

;%SDOCNT^INT^1^59547,73889^0
SDOCNT(OBJ,VERS,AFFI) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N %C,%R,PK,X,Y,ADR,ADRC,GLO,I,MODE,SAUV,VAL
 D INIT,INIV
 I AFFI=0 G MODI
 
 I $D(@ADR) D ^%PKAFFI(1,0,1,GLO,VAL,.ERR)
 G FIN
 
MODI 
 I $D(@ADR) S MODE=1,SAUV=@ADR G DEF
 
 S MODE=0,SAUV=""
DEF 
 D ^%PKSAISI(MODE,0,1,0,1,GLO,VAL,.ERR)
 
 
 I '($D(@ADR)) G FIN
 
 I MODE=0 G STO
 
 I @ADR=SAUV G FIN
STO 
 S @ADRC@("ECH")=$P(@ADR,$C(0),1)
 
 S @ADRC@("ANG")=$P(@ADR,$C(0),2)
 
 S @ADRC@("X")=$P(@ADR,$C(0),3)
 S @ADRC@("Y")=$P(@ADR,$C(0),4)
 S @ADRC@("SYNT")=$P(@ADR,$C(0),5)
 S @ADRC@("PAS")=$P(@ADR,$C(0),6)
 
FIN K @(VAL)
 Q
 
INIT 
 S ADRC=$$DEF^%SDOCMS(OBJ,VERS),ADR=$$CONCAS^%QZCHAD(ADRC,"CAR")
 S GLO=$$ADRF
 I $D(@GLO) Q
 S @GLO=" "_$$^%QZCHW("contexte")_" "
 S @GLO@("H")=20,@GLO@("V")=5,@GLO@("FL")="LD"
 S @GLO@("STO.DER")=0,@GLO@("EXEC.UCONT")="C"
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 S @GLO@("NBC")=6,@GLO@("L")=6,@GLO@("PLL")=28
 S @GLO@("CHAMPS",1)=$$^%QZCHW("Echelle")
 S @GLO@("CHAMPS",2)=$$^%QZCHW("Angle de rotation")
 S @GLO@("CHAMPS",3)=$$^%QZCHW("Abscisse point d'origine")
 S @GLO@("CHAMPS",4)=$$^%QZCHW("Ordonnee point d'origine")
 S @GLO@("CHAMPS",5)=$$^%QZCHW("Acces a la syntaxe (O/N)")
 S @GLO@("CHAMPS",6)=$$^%QZCHW("Pas du quadrillage ( >= 20 )")
 S @GLO@("POP1")="",@GLO@("POP2")=""
 F I=1:1:6 S @GLO@("LARG",I)=6
 F I=1:1:6 S @GLO@("SUIV",I)=I+1,@GLO@("PREC",I)=I-1
 S @GLO@("SUIV",6)=1,@GLO@("PREC",1)=6
 S @GLO@("FORMAT",1)="S OK=$$POS^%QZNBN(VAL)"
 S @GLO@("FORMAT",2)="S OK=$$ANG^%QZNBN(VAL)"
 F I=3,4 S @GLO@("FORMAT",I)="S OK=$$ENT^%QZNBN(VAL)"
 S @GLO@("FORMAT",5)="S OK=(VAL=""O"")!(VAL=""N"")"
 S @GLO@("FORMAT",6)="S OK=($$ENTP^%QZNBN(VAL))&(VAL'<20)"
 F I=1:1:6 S @GLO@("OBLIGAT",I)="S OK=(VAL'="""")",@GLO@("VALEG",I,0)="S OK=2"
 Q
 
INIV 
 S VAL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(VAL)
 S @VAL=$P(ADR,")",1)
 S @VAL@(1)=1,@VAL@(2)=0,@VAL@(3)=0,@VAL@(4)=0,@VAL@(5)="O",@VAL@(6)=20
 Q
 
ADRF() 
 Q "^SAVMASQ(""SD"",""OBJ"",""CAR"")"
 
 
IMPR(OBJ,VERS,LIGNE) 
 N ADR,ADRC,GLO,I,J,LA,LARG,LIB
 D INIT
 S LA=0
 F I=1:1:6 S LIB(I)=@GLO@("CHAMPS",I),LARG(I)=$L(LIB(I)) I LARG(I)>LA S LA=LARG(I)
 S J=$ZP(@LIGNE@("z"))+1
 
 F I=J,J+1 S @LIGNE@(I)=" "
 S @LIGNE@(I+1)=$J("",30)_$$^%QZCHW("CONTEXTE")
 S @LIGNE@(I+2)=$J("",30)_"--------"
 S @LIGNE@(I+3)=" "
 
 F J=1:1:6 S @LIGNE@((I+3)+J)=$J("",10)_LIB(J)_$J("",(LA+6)-LARG(J))
 
 
 S LIB(1)=$$ECH(OBJ,VERS),LIB(2)=$$ANG(OBJ,VERS)
 
 S LIB(3)=$$COOR(OBJ,VERS,"X"),LIB(4)=$$COOR(OBJ,VERS,"Y")
 
 S LIB(5)=$$SYNT(OBJ,VERS),LIB(6)=$$PAS(OBJ,VERS)
 F J=1:1:6 S @LIGNE@((I+5)+J)=@LIGNE@((I+5)+J)_LIB(J)
 S @LIGNE@(I+12)=""
 Q
 
 
ECH(O,V) 
 N GLO,E
 S GLO=$$DEF^%SDOCMS(O,V)
 I '($D(@GLO@("CAR"))) S E=$$ECHELLE^%SDXUTIL Q E
 S E=@GLO@("ECH")
 Q E
 
ANG(O,V) 
 N GLO,A
 S GLO=$$DEF^%SDOCMS(O,V)
 I '($D(@GLO@("CAR"))) Q 0
 S A=@GLO@("ANG")
 Q A
 
COOR(O,V,TYP) 
 N GLO,CO
 S GLO=$$DEF^%SDOCMS(O,V)
 I '($D(@GLO@("CAR"))) S CO=$$COOR^%SDXUTIL(TYP) Q CO
 S CO=@GLO@(TYP)
 Q CO
 
SYNT(O,V) 
 N GLO,SYNT
 S GLO=$$DEF^%SDOCMS(O,V)
 I '($D(@GLO@("CAR"))) S SYNT=$$SYNT^%SDXUTIL Q SYNT
 S SYNT=@GLO@("SYNT")
 Q SYNT="O"
 
PAS(O,V) 
 N GLO,PAS
 S GLO=$$DEF^%SDOCMS(O,V)
 I '($D(@GLO@("CAR"))) S PAS=$$PAS^%SDXUTIL Q PAS
 S PAS=@GLO@("PAS")
 Q PAS
 
CREOBJ(O,V,X,Y,A,E,P,S) 
 
 N STO
 S STO=$$DEF^%SDOCMS(O,V)
 S @STO@("ECH")=E
 S @STO@("ANG")=A
 S @STO@("X")=X
 S @STO@("Y")=Y
 S @STO@("SYNT")=S
 S @STO@("PAS")=P
 S @STO@("CAR")=E_$C(0)_A_$C(0)_X_$C(0)_Y_$C(0)_S_$C(0)_P
 Q

