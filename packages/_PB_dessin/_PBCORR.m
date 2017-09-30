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

;%PBCORR^INT^1^59547,73873^0
PBCORR ;
 
 
 
 
 I ('($D(WHOIS)))!('($D(QUI))) D ^%VSQUEAK S DX=0,DY=23 X XY W "veuillez definir un utilisateur" Q
DEB D CLEPAG^%VVIDEO,^%VZCDB("CONSULTATION/MODIFICATION DU CONTENU D'UN DESSIN",0)
 S DX=0,DY=2 X XY W "nom du dessin : " R OB
 I OB="?" S OB=$$CHOIX("^[QUI]GRAPHE2"),DX=16,DY=2 X XY W OB
 I OB="" Q
 S DX=0,DY=4 X XY W "nom de la version : " R VER
 I VER="?" S VER=$$CHOIX("^[QUI]GRAPHE2(OB)"),DX=20,DY=4 X XY W VER
 I VER="" G DEB
 I '($D(^[QUI]GRAPHE2(OB,VER))) D ^%VZEAVT("DESSIN INCONNU") G DEB
 
 
 S MODE=""
AFFINI D INIT^%QUCHOIP("^[QUI]GRAPHE2(OB,VER)","",1,0,6,20,14)
REAFF D AFF^%QUCHOIP
AFF S A=$$UN^%QUCHOIP
 I A="" G MEN
 S P=^[QUI]GRAPHE2(OB,VER,A)
 S TYP=$P(^[QUI]GRAPHE2(OB,VER,A),"^",1)
 D BLD^%VVIDEO,UDL^%VVIDEO S DX=25,DY=6 X XY W "numero : ",A D NORM^%VVIDEO
 G @TYP
1 
 S DX=40,DY=6 X XY W "type : ","DEMIE-ELLIPSE"
 S DX=40,DY=8 X XY W "coordonnees : ",$P(P,"^",2)," , ",$P(P,"^",3)
 S DX=40,DY=10 X XY W "petit rayon : ",$P(P,"^",4)
 S DX=40,DY=12 X XY W "grand rayon : ",$P(P,"^",5)
 S DX=40,DY=14 X XY W "inclinaison : ",$P(P,"^",6)
 S DX=40,DY=16 X XY W "type de ligne : ",$P(P,"^",7)
 G EFF
2 
 S DX=40,DY=6 X XY W "type : ","ELLIPSE"
 S DX=40,DY=8 X XY W "coordonnees : ",$P(P,"^",2)," , ",$P(P,"^",3)
 S DX=40,DY=10 X XY W "petit rayon : ",$P(P,"^",4)
 S DX=40,DY=12 X XY W "grand rayon : ",$P(P,"^",5)
 S DX=40,DY=14 X XY W "inclinaison : ",$P(P,"^",6)
 S DX=40,DY=16 X XY W "type de ligne : ",$P(P,"^",7)
 G EFF
3 
 S DX=40,DY=6 X XY W "type : ","POINT"
 S DX=40,DY=8 X XY W "coordonnees : ",$P(P,"^",2)," , ",$P(P,"^",3)
 S DX=40,DY=10 X XY W "libelle : ",$P(P,"^",6)
 G EFF
4 
 S DX=40,DY=6 X XY W "type : ","TEXTE"
 S DX=40,DY=8 X XY W "coordonnees : ",$P(P,"^",2)," , ",$P(P,"^",3)
 S DX=40,DY=10 X XY W "libelle : ",$P(P,"^",4)
 G EFF
5 
 S DX=40,DY=6 X XY W "type : ","DROITE"
 S DX=40,DY=8 X XY W "point de depart : ",$P(P,"^",2)," , ",$P(P,"^",3)
 S DX=40,DY=10 X XY W "point d'arrivee : ",$P(P,"^",4)," , ",$P(P,"^",5)
 S DX=40,DY=12 X XY W "type de ligne : ",$P(P,"^",6)
 S DX=40,DY=14 X XY W "point de depart : ",$P(P,"^",7)
 S DX=40,DY=16 X XY W "point d'arrivee : ",$P(P,"^",8)
 S DX=40,DY=18 X XY W "syntaxe : ",$P(P,"^",9)
 G EFF
6 
 S DX=40,DY=6 X XY W "type : ","ARC"
 S DX=40,DY=8 X XY W "coordonnees : ",$P(P,"^",2)," , ",$P(P,"^",3)
 S DX=40,DY=10 X XY W "rayon : ",$P(P,"^",4)
 S DX=40,DY=12 X XY W "inclinaison : ",$P(P,"^",6)
 G EFF
7 
 S DX=40,DY=6 X XY W "type : ","CERCLE"
 S DX=40,DY=8 X XY W "coordonnees : ",$P(P,"^",2)," , ",$P(P,"^",3)
 S DX=40,DY=10 X XY W "rayon : ",$P(P,"^",4)
 S DX=40,DY=12 X XY W "inclinaison : ",$P(P,"^",6)
 G EFF
8 
 S DX=40,DY=6 X XY W "type : ","IMAGE"
 S DX=40,DY=8 X XY W "nom du dessin : ",$P(P,"^",2)
 S DX=40,DY=10 X XY W "version du dessin : ",$P(P,"^",3)
 S DX=40,DY=12 X XY W "coordonnees : ",$P(P,"^",4)," , ",$P(P,"^",5)
 S DX=40,DY=14 X XY W "rotation : ",$P(P,"^",6)
 S DX=40,DY=16 X XY W "agrandissement : ",$P(P,"^",7)
 G EFF
 
EFF 
 D POCLEPA^%VVIDEO W "return ...." D ECHOFF^%VVIDEO R *R D ECHON^%VVIDEO
 I MODE'="S" G EFF2
 D POCLEPA^%VVIDEO I $$CONFIRM^%VZEOUI("SUPPRESION") D KILL
EFF2 D POCLEPA^%VVIDEO,CLFEN^%VVIDEO(25,6,15,49)
 I MODE="S" D END^%QUCHOIP G AFFINI
 G AFF
 
KILL 
 D POCLEPA^%VVIDEO W "SUPRESSION"
 S NUM=A F I=1:1 S NUM=$O(^[QUI]GRAPHE2(OB,VER,NUM)) Q:NUM=""  S ^[QUI]GRAPHE2(OB,VER,NUM-1)=^[QUI]GRAPHE2(OB,VER,NUM)
 S NUM=$ZP(^[QUI]GRAPHE2(OB,VER,"")) K ^[QUI]GRAPHE2(OB,VER,NUM)
 S ^[QUI]GRAPHE2(OB,VER)=^[QUI]GRAPHE2(OB,VER)-1
 Q
CHOIX(GLO) 
 N A
 D INIT^%QUCHOIP(GLO,"",1,55,6,23,14)
 D AFF^%QUCHOIP
 S A=$$UN^%QUCHOIP
 S DX=50,DY=6 D CLEBAS^%VVIDEO,NORM^%VVIDEO,END^%QUCHOIP
 Q A
 
MEN D POCLEPA^%VVIDEO S DX=35 X XY S CHOIX=$$^%VZECH2("","suppresion","fin")
 I CHOIX="suppresion" S MODE="S" G AFF
 I CHOIX="fin" D END^%QUCHOIP G DEB
 G MEN

