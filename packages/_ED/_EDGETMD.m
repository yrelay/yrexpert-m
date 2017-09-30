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

;%EDGETMD^INT^1^59547,73869^0
EDGETMOD ;
 
 
 
 
 
 
 N GLO
DEB D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("MODELE DE TEXTE"))
LEC S DX=0,DY=5 D CLEBAS^%VVIDEO
 S DX=0,DY=10 X XY W $$^%QZCHW("Modele : ") S DX=$X D ^%VLEC S Y1=$$GETLBLAN^%VTLBLAN(Y1)
 Q:(Y1="")!CTRLA  G:"*?"'[$E(Y1,$L(Y1)) GO
 
 D INIT^%QUCHOIP("^[QUI]EDMOD","",1,0,5,79,17),AFF^%QUCHOIP
 S Y1=$$UN^%QUCHOIP D END^%QUCHOIP Q:Y1=""
GO I $D(^[QUI]EDMOD(Y1)) D POCLEPA^%VVIDEO W Y1,$$^%QZCHW(" existe deja, il s'agit d'une modification") D SIGNAL^%EDDGEST(Y1),SAISIE(Y1) G DEB
 S DX=0,DY=23 X XY
 I '($$MES^%VZEOUI("Modele inexistant, voulez-vous le creer ? ","N")) G DEB
 D POCLEPA^%VVIDEO W Y1,$$^%QZCHW(" est un nouveau modele")
 D CREER^%EDDGEST(Y1)
 D SAISIE(Y1)
 G DEB
 
SAISIE(Y1) 
 N ROUTREAF,MEN,AD
 S ROUTREAF="REAFBIS^%EDGETMD"
 
 D LEX^%AN7
 F I="%COEFFICIENT.AGRANDISSEMENT","%X","%Y","%TAILLE","%ORIENTATION","%EPAISSEUR","%POLICE","%FORMAT" D ADD^%AN7(I)
 S MOD=Y1
 D REAFF
 
MEN 
 K MEN S MEN(1)=$$^%QZCHW(" description document ")_"^DES"
 S MEN(2)=$$^%QZCHW(" individus symboliques ")_"^VAR"
LMEN D POCLEPA^%VVIDEO,^%VQUIKMN(0,79,23,"MEN",.AD,.CTRL)
 G:AD'="" @AD
 I CTRL="R" D REAFF G LMEN
 I CTRL="J" D IMPR G LMEN
 I (CTRL="A")!(CTRL="F") D LEX^%AN7 G FIN
 D ^%VSQUEAK G LMEN
DES 
 N LISTE,%PROVEN S PLIG=1,%PROVEN="EDMOD"
 D ZLISTE4^%QULIMO(0,7,79,16,"^[QUI]EDMOD(MOD,""LIGNE"")",.PLIG,"AJ^%EDMODAN","SU^%EDMODAN","^%EDHLP2","^[QUI]EDMOD(MOD)")
 D VARCOMP G LMEN
IMPR 
 N I,R
IO D POCLEPA^%VVIDEO
 W $$^%QZCHW("Impression papier du modele de texte (O/N) ? [O] : ")
 R *R:^TOZE($I,"ATTENTE") D POCLEPA^%VVIDEO S:R=-1 R=1 F I=1,6,13,78,79 G:I=R @I
 D ^%VSQUEAK G IO
1 Q
6 Q
13 G 79
78 Q
79 D POCLEPA^%VVIDEO W $$^%QZCHW("Un instant ...") D ^%EDIMPRI(MOD)
 D POCLEPA^%VVIDEO W $$^%QZCHW("Termine ... [RETURN]")
 R *R:^TOZE($I,"ATTENTE") D POCLEPA^%VVIDEO Q
VAR 
 S PLIG=1 D ^%QULIMO(1,1,79,6,"^[QUI]EDMOD(MOD,""VAR"")",.PLIG,"AJVAR^%EDSYMAN","SUVAR^%EDSYMAN")
 G LMEN
 
FIN 
 K MEN
 D MAJ^%EDDGEST(MOD,1,1,1)
 Q
 
VARCOMP 
 N I,J,K,TYP,NOM,IND,LI,GLO S GLO="^[QUI]EDMOD"
 S TYP=-1 F I=1:1 S TYP=$N(^DOC($J,TYP)) Q:TYP=-1  S NOM=-1 F J=1:1 S NOM=$N(^DOC($J,TYP,NOM)) Q:NOM=-1  S @GLO@(MOD,TYP,NOM)="",IND=-1 F K=1:1 S IND=$N(^DOC($J,TYP,NOM,IND)) Q:IND=-1  S @GLO@(MOD,TYP,NOM,IND)=""
ETIQ 
 K @GLO@(MOD,"ETI"),@GLO@(MOD,"ADR") S LI=""
ETIQ1 S LI=$O(@GLO@(MOD,"LIGNE",LI)) G:LI="" FVAR
 S LC=@GLO@(MOD,"LIGNE",LI) G ETIQ1:($E(LC,1)=":")!($E(LC,1)'="$")
 G:LC'["$ETIQUETTE(" ETIQ2
 S ETIQ=$P(LC,"$ETIQUETTE(",2)
 S ETIQ=$$GETLBLAN^%VTLBLAN($P(ETIQ,")",1,$L(ETIQ,")")-1)),ETIQ=$E(ETIQ,2,$L(ETIQ)-1)
 S @GLO@(MOD,"ETI",ETIQ)=LI
 G ETIQ1
ETIQ2 G:LC'["$ADRESSE(" ETIQ1
 S ETIQ=$P(LC,"$ADRESSE(",2)
 S ETIQ=$$GETLBLAN^%VTLBLAN($P(ETIQ,")",1,$L(ETIQ,")")-1)),ETIQ=$E(ETIQ,2,$L(ETIQ)-1)
 S @GLO@(MOD,"ADR",ETIQ)=LI
 G ETIQ1
FVAR K ^DOC($J),@GLO@(MOD,"ATT") Q
REAFF S BLD=1,CAG=1
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Modele de texte ")_MOD,0) K BLD,CAG
 S DXG=0,DYH=1,LV=6,LH=80 D CARS^%VVIDEO S DX=54,DY=1 D BLD^%VVIDEO X XY W $$^%QZCHW(" individus symboliques ") D NORM^%VVIDEO
 D REAFF^%QULIMO3(1,1,"^[QUI]EDMOD(MOD,""VAR"")",1,1,79,6)
 S DXG=0,DYH=7,LV=16,LH=80 D CARS^%VVIDEO S DX=54,DY=7 D BLD^%VVIDEO X XY W $$^%QZCHW(" description document ") D NORM^%VVIDEO
 D REAFF^%QULIMO3(1,1,"^[QUI]EDMOD(MOD,""LIGNE"")",0,7,79,16)
 Q
REAFBIS 
 D REAFF,A18^%QULIMO4,REAFF^%AN7 Q

