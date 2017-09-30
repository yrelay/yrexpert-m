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

;%PBEDIT^INT^1^59547,73873^0
PBEDIT ;
 
 
 
 
 I ('($D(WHOIS)))!('($D(QUI))) D ^%VSQUEAK S DX=0,DY=23 X XY W "veuillez definir un utilisateur" Q
 N PORT
DEB D CLEPAG^%VVIDEO,^%VZCDB("EDITION DU CONTENU D'UN DESSIN",0)
 S DX=0,DY=2 X XY W "nom du dessin : " R OB
 I OB="?" S OB=$$CHOIX("^[QUI]GRAPHE2"),DX=16,DY=2 X XY W OB
 I OB="" Q
 S DX=0,DY=4 X XY W "nom de la version : " R VER
 I VER="?" S VER=$$CHOIX("^[QUI]GRAPHE2(OB)"),DX=20,DY=4 X XY W VER
 I VER="" G DEB
 I '($D(^[QUI]GRAPHE2(OB,VER))) D ^%VZEAVT("DESSIN INCONNU") G DEB
 S DX=25,DY=10 X XY S DEV=$$^%VZECH2("","ecran","imprimante") D CLEBAS^%VVIDEO
 I DEV=1 G DEB
 S PORT=$S(DEV="ecran":0,1:^TABIDENT(WHOIS,"PRINTER"))
 I PORT="" S PORT=0
 I (PORT#$I)'=0 O PORT G IMPR
 
ECR S EL=0,CPT=0,DX=0,DY=5 X XY
LOP1 S EL=$O(^[QUI]GRAPHE2(OB,VER,EL)) G:EL="" FLOP
 S P=^[QUI]GRAPHE2(OB,VER,EL),CPT=CPT+1
 I CPT=17 D ^%VZEAVT("") S CPT=1,DX=0,DY=5 X XY D CLEBAS^%VVIDEO
 U PORT W !,$J("",20),EL," --> ",P
 G LOP1
 
IMPR W !," dessin  : ",OB
 W !," version : ",VER
 W !
 S EL=0
LOP S EL=$O(^[QUI]GRAPHE2(OB,VER,EL)) G:EL="" FLOP
 S P=^[QUI]GRAPHE2(OB,VER,EL)
 U PORT W !,$J("",20),EL," --> ",P
 G LOP
FLOP 
 D ^%VZEAVT("IMPRESSION TERMINEE")
 I (PORT'=0)!(PORT'=$I) W # C PORT
 G DEB
 
CHOIX(GLO) 
 N A
 D INIT^%QUCHOIP(GLO,"",1,55,6,23,15)
 D AFF^%QUCHOIP
 S A=$$UN^%QUCHOIP
 S DX=50,DY=6 D CLEBAS^%VVIDEO,NORM^%VVIDEO,END^%QUCHOIP
 Q A

