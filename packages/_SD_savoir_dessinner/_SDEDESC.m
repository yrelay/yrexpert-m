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

;%SDEDESC^INT^1^59547,73889^0
SDEDESC(MOD,TYPE,CHVAL,ANCNOM,GLOSTO,PRES,NOM,TEXT) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N %C,%R,ABANDON,ERR,ERRMES,PK,X,Y,GLO,GLS,GVAL,TEMP,ROUTREAF
 
 S ROUTREAF="REAFF^%SDEDESC"
 
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S GLS=$$CONCAS^%QZCHAD(TEMP,"GLOSTO")
 S GVAL=$$CONCAS^%QZCHAD(TEMP,"VAL")
 S @GVAL=$P(GLS,")",1)
 
 S GLO=$$ADRF
 
 S @GVAL@(1)=$P(CHVAL,$C(0),1)
 S @GLS@(@GVAL@(1))=CHVAL
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Mode aide"),0)
 G @$E(TYPE,1,5)
POINT 
 D INIP
 G DEF
DROIT 
 D INID
 G DEF
CERCL 
 D CERCLE^%SDEDES1
 G DEF
ARC 
 D ARC^%SDEDES1
 G DEF
RECTA 
 D RECTAN^%SDEDES2
 G DEF
ELLIP 
 D ELLIPS^%SDEDES2(1)
 G DEF
DEMIE 
 D ELLIPS^%SDEDES2(2)
 G DEF
FLECH 
 D FLECHE^%SDEDES3
 G DEF
TEXTE 
 D TEXTE^%SDEDES1
 G DEF
RACCO 
 D RACCORD^%SDEDES3
 G DEF
 
DEF 
 S ERRMES=1
 D ABCLE^%PKSAIS2(1,0,1,1,1,GLO,GVAL,0,.ERR,.ABANDON)
 
 I ABANDON S OK=0 G FIN
 S OK=1
FIN 
 K @(TEMP)
 Q OK
 
REAFF 
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Mode aide"),0)
 K RESUL,PATOUCH,AFRESU,DEJALU,REFUSE,STOPUC,CMS,ABENDSCR
 S %R=%RI
 D PARAM^%PKPOP(.Y)
 Q
 
 
INIP 
 I $D(@GLO) Q
 S @GLO=" "_$$^%QZCHW("Definition d'un point")_" "
 S @GLO@("H")=10,@GLO@("V")=5,@GLO@("FL")="LD"
 S @GLO@("STO.DER")=0,@GLO@("EXEC.UCONT")="C"
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 S @GLO@("NBC")=7,@GLO@("L")=45
 S @GLO@("CHAMPS",1)="Numero",@GLO@("CHAMPS",2)="Epaisseur"
 S @GLO@("CHAMPS",3)="Libelle",@GLO@("CHAMPS",4)="Abscisse"
 S @GLO@("CHAMPS",5)="Ordonnee",@GLO@("CHAMPS",6)="Nom"
 S @GLO@("CHAMPS",7)="Condition"
 S @GLO@("PLL")=9
 
 S @GLO@("UCONT")="D POINT^%SDEDES5"
 
 S @GLO@("CLE",1)=1,@GLO@("POSCLE",1)=1
 S @GLO@("POP1")="",@GLO@("POP2")=""
 S @GLO@("LARG",1)=4,@GLO@("LARG",2)=4,@GLO@("LARG",3)=11,@GLO@("LARG",6)=20,@GLO@("LARG",7)=20
 F I=4,5 S @GLO@("LARG",I)=45
 F I=1:1:7 S @GLO@("SUIV",I)=I+1,@GLO@("PREC",I)=I-1
 S @GLO@("SUIV",7)=1,@GLO@("PREC",1)=7
 S @GLO@("FORMAT",1)="S OK=$$ENTP^%QZNBN(VAL)"
 S @GLO@("FORMAT",2)="S OK=$$POS^%QZNBN(VAL)"
 S @GLO@("FORMAT",3)="S OK=(VAL="""""""_$$^%QZCHW("VISIBLE")_""""""")!(VAL="""""""_$$^%QZCHW("INVISIBLE")_""""""")"
 F I=4,5,6,7 S @GLO@("FORMAT",I)="S OK=1"
 F I=1:1:7 S @GLO@("VALEG",I,0)="S OK=2",@GLO@("OBLIGAT",I)="S OK=1"
 S @GLO@("OBLIGAT",6)="S OK=(VAL'="""")"
 Q
 
INID 
 I $D(@GLO) Q
 S @GLO=" "_$$^%QZCHW("Definition d'une droite")_" "
 S @GLO@("H")=3,@GLO@("V")=5,@GLO@("FL")="LD"
 S @GLO@("STO.DER")=0,@GLO@("EXEC.UCONT")="C"
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 S @GLO@("NBC")=12,@GLO@("L")=45
 S @GLO@("CHAMPS",1)="Numero",@GLO@("CHAMPS",2)="Epaisseur",@GLO@("CHAMPS",3)="Trait"
 S @GLO@("CHAMPS",4)="Abscisse point de depart",@GLO@("CHAMPS",5)="Ordonnee point de depart"
 S @GLO@("CHAMPS",6)="Abscisse point d'arrivee",@GLO@("CHAMPS",7)="Ordonnee point d'arrivee"
 S @GLO@("CHAMPS",8)="Longueur",@GLO@("CHAMPS",9)="Angle"
 S @GLO@("CHAMPS",10)="Nom du point de depart",@GLO@("CHAMPS",11)="Nom du point d'arrivee"
 S @GLO@("CHAMPS",12)="Condition"
 S @GLO@("PLL")=24
 
 S @GLO@("UCONT")="D DROITE^%SDEDES5"
 
 S @GLO@("CLE",1)=1,@GLO@("POSCLE",1)=1
 S @GLO@("POP1")="",@GLO@("POP2")=""
 S @GLO@("LARG",1)=4,@GLO@("LARG",2)=4,@GLO@("LARG",3)=11
 F I=4:1:9,12 S @GLO@("LARG",I)=45
 F I=10,11 S @GLO@("LARG",I)=20
 F I=1:1:12 S @GLO@("SUIV",I)=I+1,@GLO@("PREC",I)=I-1
 S @GLO@("SUIV",12)=1,@GLO@("PREC",1)=12
 S @GLO@("FORMAT",1)="S OK=$$ENTP^%QZNBN(VAL)"
 S @GLO@("FORMAT",2)="S OK=$$POS^%QZNBN(VAL)"
 S @GLO@("FORMAT",3)="S OK=(VAL="""""""_$$^%QZCHW("POINTILLE")_""""""")!(VAL="""""""_$$^%QZCHW("NORMAL")_""""""")"
 F I=4:1:12 S @GLO@("FORMAT",I)="S OK=1"
 F I=1:1:12 S @GLO@("VALEG",I,0)="S OK=2",@GLO@("OBLIGAT",I)="S OK=1"
 Q
 
ADRF() 
 Q "^SAVMASQ(""SD"",""ELEM"","""_TYPE_""")"
 
INITMASQ 
 N TYPE
 F TYPE="POINT","DROITE","ARC","CERCLE","TEXTE","ELLIPSE","DEMIE-ELLIPSE","RACCORDEMENT","FLECHE" K @($$ADRF)
 Q
 
TEST N X,Y,TPRE,TCXT,VVYB,VVYH
 K ^TPRE,^TCXT D CLEPAG^%VVIDEO,INITCONT^%SDODEF("^TCXT")
 W "type " R TYPE Q:TYPE=""
 
 
 W !,?20 R X1 Q:X1=""  W ?30 R Y1 Q:Y1=""
 S ^TPRE(1,"X")=X1,^TPRE(1,"Y")=Y1
 W ! G @$E(TYPE,1,2)
DR W !,?20 R X2 Q:X2=""  W ?30 R Y2 Q:Y2=""
 S ^TPRE(2,"X")=X2,^TPRE(2,"Y")=Y2
 
EXE D ISESS^%SDEANTI("ES1","ES2",.GLOTYP,.TEMPREF,.GLOBJ,.GLCOMP,.GLTEXT,.TEMPO)
 S UCONT="",ROUTREAF="",DH=77
 W $$^%SDESAIS(0,TYPE,"^TPRE","^TCXT","PTAFF","",1)
 D ESESS^%SDEANTI(GLOTYP,TEMPREF)
 G TEST+1
PO G EXE
TE G EXE
RA G EXE
CE G DR
RE G DR
FL G DR
AR W !,?20 R X2 Q:X2=""  W ?30 R Y2 Q:Y2=""
 S ^TPRE(2,"X")=X2,^TPRE(2,"Y")=Y2
 W !,?20 R X3 Q:X3=""  W ?30 R Y3 Q:Y3=""
 S ^TPRE(3,"X")=X3,^TPRE(3,"Y")=Y3
 G EXE
EL G AR
DE G AR

