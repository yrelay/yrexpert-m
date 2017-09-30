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

;%EDFDIAL^INT^1^59547,73869^0
%EDFDIAL(FORMAT) 
 
 
 
 
 N C,%FONC,I,OK,ORIENT,%PORT,POSIT,%TERM,ROUTREAF,MENU1
 S ORIENT=$$^%QCAZG("^[QUI]EDFORMAT(FORMAT,""ORIENTATION"")"),POSIT=1
 I ORIENT="" S (ORIENT,^[QUI]EDFORMAT(FORMAT,"ORIENTATION"))="VERTICALE"
 D SIGNAL^%EDFGEST(FORMAT)
 D LEX^%AN7
 F I="%X","%Y","%COEFFICIENT.AGRANDISSEMENT","%TAILLE","%ORIENTATION","%EPAISSEUR","%POLICE" D ADD^%AN7(I)
 S ROUTREAF="REAFBIS^%EDFDIAL"
 D REAFF
 S MENU1(1)=$$^%QZCHW("DESCRIPTION DU FORMAT")_"^70"
 S MENU1(2)=$$^%QZCHW("ORIENTATION")_"^79"
DIAL2 D POCLEPA^%VVIDEO,^%VQUIKMN(0,78,23,"MENU1",.AD,.CONTR)
 I (CONTR="A")!(CONTR="F") Q
 I CONTR="R" D REAFF G DIAL2
 I CONTR="J" G 10
 I AD'="" G @AD
L00 G DIAL2
1 G 6
 Q:C=79  G DIAL2
6 Q
10 D POCLEPA^%VVIDEO
 S IMP=$$MES^%VZEOUI($$^%QZCHW("Impression de la description du format ? "),"O")
 G:'(IMP) L00
IMP D POCLEPA^%VVIDEO W $$^%QZCHW("Impression en cours ... un instant")
 D ^%EDFIMPR(FORMAT)
 D ^%VZEAVT($$^%QZCHW("Termine ... ")) G L00
70 N %PROVEN S %PROVEN="EDFORMAT"
 D ZLISTE4^%QULIMO(0,3,79,20,"^[QUI]EDFORMAT(FORMAT,""LIGNES"")",.POSIT,"ADD^%EDFDIAL","SUP^%EDFDIAL","^%EDHLP1","^[QUI]EDFORMAT(FORMAT)"),VARCOMP S ^[QUI]EDFORMAT(FORMAT,"ORIENTATION")=ORIENT G L00
79 D POCLEPA^%VVIDEO W $$^%QZCHW("Orientation (H)orizontal,(V)ertical ?")
L1 D ECHOFF^%VVIDEO R *C D ECHON^%VVIDEO F I=1,6,13,72,86 G:I=C @("O"_I)
 D ^%VSQUEAK G L1
O1 G L00
O6 G L00
O13 G L00
O72 S ORIENT="HORIZONTALE" D ORE G L00
O86 S ORIENT="VERTICALE" D ORE G L00
REAFF D CLEPAG^%VVIDEO,CAD,REAFF^%QULIMO3(1,1,"^[QUI]EDFORMAT(FORMAT,""LIGNES"")",0,3,80,20),ORE
 S DX=52,DY=3 X XY D BLD^%VVIDEO W " description du format " D NORM^%VVIDEO
 Q
CAD S DXG=0,DXD=39,DYH=0,DYB=2,GRAPH=0,MSG=FORMAT D 4^%VZCD
 S DXG=40,DYH=0,LH=40,LV=3,BLD=1 D CARS^%VVIDEO
 S DXG=0,DYH=3,LH=80,LV=20,BLD=1 D CARS^%VVIDEO
 Q
ORE S DX=44,DY=1 X XY D BLD^%VVIDEO W $$^%QZCHW("Orientation : ") S DX=$X,DY=$Y X XY D NORM^%VVIDEO W $J("",11) X XY W ORIENT S ^[QUI]EDFORMAT(FORMAT,"ORIENTATION")=ORIENT Q
ADD N CHAINE,POSIT,SX,SY,TETE,%COMPIL,%ETIQ,VVDX,VVDY,VVYB,VVYH,VVPA,VVTX
 N ATTD,APPD,APPEX
 S SX=DX,SY=DY,CHAINE=Y1,POSIT=1,%COMPIL="",%ETIQ="",(ATTD,APPD,APPEX)=0
 S TETE=$$VAL^%QULIMO("TETE") I TETE'="" D KILL^%ANA(TETE)
 D INIT^%AN7(SX,SY)
 S OK=$$GRAPH^%AN8(CHAINE,.POSIT) Q:'(OK)
 
 
 F %IC=1:1 Q:$$VAL^%QULIMO("ATTRIBUT."_%IC)=""  D DEL^%QULIMO("ATTRIBUT."_%IC)
 F %IC=1:1 Q:$$VAL^%QULIMO("APPEL."_%IC)=""  D DEL^%QULIMO("APPEL."_%IC)
 D AFF^%QULIMO("NBR.ATTRIBUTS",ATTD)
 D AFF^%QULIMO("NBR.APPELS",APPD)
 D AFF^%QULIMO("NBR.APPELS.CALCULES",APPEX)
 F %IC=1:1:ATTD D AFF^%QULIMO("ATTRIBUT."_%IC,ATTD(%IC))
 F %IC=1:1:APPD D AFF^%QULIMO("APPEL."_%IC,APPD(%IC))
 N CH,C,P S CH=CHAINE,P=POSIT D CAR^%AN8
ADDOK S DX=SX,DY=SY X XY S OK=1,^[QUI]EDFORMAT(FORMAT,"COMP",P1C)=%COMPIL
 Q
SUP S TETE=$$VAL^%QULIMO("TETE") I TETE'="" D KILL^%ANA(TETE)
 S OK=1 Q
VARCOMP 
 N I,J,K,TYP,NOM,IND,GLO,LC,ETIQ S GLO="^[QUI]EDFORMAT"
 S TYP=-1 F I=1:1 S TYP=$N(^DOC($J,TYP)) Q:TYP=-1  S NOM=-1 F J=1:1 S NOM=$N(^DOC($J,TYP,NOM)) Q:NOM=-1  S ^[QUI]EDFORMAT(FORMAT,TYP,NOM)="",IND=-1 F K=1:1 S IND=$N(^DOC($J,TYP,NOM,IND)) Q:IND=-1  S ^[QUI]EDFORMAT(FORMAT,TYP,NOM,IND)=""
ETIQ 
 K @GLO@(FORMAT,"ETI"),@GLO@(FORMAT,"ADR") S LI=""
ETIQ1 S LI=$O(@GLO@(FORMAT,"LIGNES",LI)) G:LI="" FIN
 S LC=@GLO@(FORMAT,"LIGNES",LI) G ETIQ1:($E(LC,1)=":")!($E(LC,1)'="$")
 I LC'["$ETIQUETTE(" G ETIQ2
 S ETIQ=$P(LC,"$ETIQUETTE(",2)
 S ETIQ=$$GETLBLAN^%VTLBLAN($P(ETIQ,")",1,$L(ETIQ,")")-1)),ETIQ=$E(ETIQ,2,$L(ETIQ)-1)
 S @GLO@(FORMAT,"ETI",ETIQ)=LI
 G ETIQ1
ETIQ2 G:LC'["$ADRESSE(" ETIQ1
 S ETIQ=$P(LC,"$ADRESSE(",2)
 S ETIQ=$$GETLBLAN^%VTLBLAN($P(ETIQ,")",1,$L(ETIQ,")")-1)),ETIQ=$E(ETIQ,2,$L(ETIQ)-1)
 S @GLO@(FORMAT,"ADR",ETIQ)=LI
 G ETIQ1
FIN K ^DOC($J) Q
REAFBIS 
 D REAFF,A18^%QULIMO4,REAFF^%AN7 Q

