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

;%SDEGEST^INT^1^59547,73889^0
SDEGEST ;
 
 
 
 
 
 
 
 
GEN(EL,PRES) 
 S @GLOBJ@("EL",EL,"PRES")=PRES
 Q
 
POINT(EL,X,Y,NOM) 
 S @GLOBJ@("EL",EL,"PRES")="3^"_X_"^"_Y_"^"_NOM
 Q
 
DROITE(EL,XD,YD,XA,YA,TYPL) 
 S @GLOBJ@("EL",EL,"PRES")="5^"_XD_"^"_YD_"^"_XA_"^"_YA_"^"_TYPL
 Q
 
CERCLE(EL,XC,YC,XA,YA,TYPL) 
 S @GLOBJ@("EL",EL,"PRES")="7^"_XC_"^"_YC_"^"_XA_"^"_YA_"^"_TYPL
 Q
 
ARC(EL,XD,YD,XA,YA,XC,YC,TYPL) 
 S @GLOBJ@("EL",EL,"PRES")="6^"_XD_"^"_YD_"^"_XA_"^"_YA_"^"_XC_"^"_YC_"^"_TYPL
 Q
 
ELLIPS(EL,XD,YD,XA,YA,XE,YE,TYPL) 
 S @GLOBJ@("EL",EL,"PRES")="2^"_XD_"^"_YD_"^"_XA_"^"_YA_"^"_XE_"^"_YE_"^"_TYPL
 Q
 
DEMEL(EL,XD,YD,XA,YA,XE,YE,TYPL) 
 S @GLOBJ@("EL",EL,"PRES")="1^"_XD_"^"_YD_"^"_XA_"^"_YA_"^"_XE_"^"_YE_"^"_TYPL
 Q
 
TEXTE(EL,XD,YD,LIB,INCL,TAILLE) 
 S @GLOBJ@("EL",EL,"PRES")="4^"_XD_"^"_YD_"^"_TAILLE_"^"_INCL_"^"_LIB
 Q
 
RECT(EL,XD,YD,XA,YA,TYPL,PLEIN) 
 S @GLOBJ@("EL",EL,"PRES")="8^"_XD_"^"_YD_"^"_XA_"^"_YA_"^"_PLEIN_"^"_TYPL
 Q
 
FLECHE(EL,XD,YD,XA,YA,TYPL) 
 S @GLOBJ@("EL",EL,"PRES")="9^"_XD_"^"_YD_"^"_XA_"^"_YA_"^"_TYPL
 Q
RACCO(EL,XD,YD,XA,YA,EL1,EL2,TYPL) 
 S @GLOBJ@("EL",EL,"PRES")="10^"_EL1_"^"_XD_"^"_YD_"^"_EL2_"^"_XA_"^"_YA_"^"_TYPL
 Q
 
 
 
 
 
 
 
 
 
 
 
 
 
PRES(EL,COOR) 
 I '($D(@GLOBJ@("EL",EL,"PRES"))) Q
 N CH,TYP
 S CH=@GLOBJ@("EL",EL,"PRES")
 I CH="" Q
 S TYP=$P(CH,"^",1)
 G @TYP
 
1 
 S @COOR@(1,"X")=$P(CH,"^",2),@COOR@(1,"Y")=$P(CH,"^",3)
 S @COOR@(2,"X")=$P(CH,"^",4),@COOR@(2,"Y")=$P(CH,"^",5)
 S @COOR@(3,"X")=$P(CH,"^",6),@COOR@(3,"Y")=$P(CH,"^",7)
 Q
2 
 G 1
3 
 S @COOR@(1,"X")=$P(CH,"^",2),@COOR@(1,"Y")=$P(CH,"^",3)
 S @COOR@("LIB")=$P(CH,"^",4)
 Q
4 
 S @COOR@(1,"X")=$P(CH,"^",2),@COOR@(1,"Y")=$P(CH,"^",3)
 S @COOR@("LIB")=$P(CH,"^",6)
 S @COOR@("INCL")=$P(CH,"^",5)
 Q
5 
 S @COOR@(1,"X")=$P(CH,"^",2),@COOR@(1,"Y")=$P(CH,"^",3)
 S @COOR@(2,"X")=$P(CH,"^",4),@COOR@(2,"Y")=$P(CH,"^",5)
 Q
6 
 G 1
7 
 G 5
8 
 D 5
 S @COOR@("LIB")=$P(CH,"^",6)
9 
 G 5
10 
 S @COOR@(1,"DROITE")=$P(CH,"^",2),@COOR@(2,"DROITE")=$P(CH,"^",5)
 S @COOR@(1,"X")=$P(CH,"^",3),@COOR@(1,"Y")=$P(CH,"^",4)
 S @COOR@(2,"X")=$P(CH,"^",6),@COOR@(2,"Y")=$P(CH,"^",7)
 Q
 
 
 
 
 
 
 
PRES2(EL) 
 I '($D(@GLOBJ@("EL",EL,"PRES"))) Q ""
 N CH
 S CH=@GLOBJ@("EL",EL,"PRES")
 Q CH
 
 
 
 
TYPELEM(OBJ,VERS,EL) 
 N TYP
 S TYP=$P(^[QUI]SDTEXT(OBJ,VERS,EL),";",2)
 S TYP=$E(TYP,2,$L(TYP)-1)
 Q TYP
 
 
 
 
NOELPT(OBJ,VERS,PT) 
 N EL
 I '($D(^[QUI]SDOBJ(OBJ,VERS,"PT",PT,"NOEL"))) Q ""
 Q ^[QUI]SDOBJ(OBJ,VERS,"PT",PT,"NOEL")
 
 
 
 
NOPTEL(OBJ,VERS,EL) 
 N PT,I
 I '($D(^[QUI]SDOBJ(OBJ,VERS,"PAEI",EL))) Q ""
 S PT="" F I=0:0 S PT=$O(^[QUI]SDOBJ(OBJ,VERS,"PAEI",EL,PT)) Q:PT=""  I ^[QUI]SDOBJ(OBJ,VERS,"PT",PT,"NOEL")=EL Q
 Q PT
 
 
 
 
ORIENT(OBJ,VERS,EL) 
 Q $$ZSUBST^%QZCHSUB($$GETLBLAN^%VTLBLAN($P(^[QUI]SDTEXT(OBJ,VERS,EL),";",5)),"""","")
 
 
 
 
TYPFL(OBJ,VERS,EL) 
 Q $$ZSUBST^%QZCHSUB($$GETLBLAN^%VTLBLAN($P(^[QUI]SDTEXT(OBJ,VERS,EL),";",6)),"""","")
 
 
 
 
TYPL(OBJ,VERS,EL) 
 Q $$ZSUBST^%QZCHSUB($$GETLBLAN^%VTLBLAN($P(^[QUI]SDTEXT(OBJ,VERS,EL),";",4)),"""","")

