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

;%EDCLST^INT^1^59547,73869^0
EDCLST ;
 
 
 
 
 
 N PRIM,MES,TERM,LISTE
MENU 
 D CLEPAG^%VVIDEO
 S DX=25,DY=0 X XY D REV^%VVIDEO W " ACTIONS CONSULTATIVES SUR ^%ENVIRON "
 D NORM^%VVIDEO
 S DX=0,DY=4 X XY W " 0  FIN"
 S DX=0,DY=6 X XY W " 1  Liste des terminaux connectes"
 S DX=0,DY=8 X XY W " 2  Liste des primitives par terminal connecte"
 S DX=0,DY=10 X XY W " 3  Liste des terminaux connectes pour une primitive"
CH S DX=0,DY=14 X XY W "   Choix ? : " R *CHOIX D TOUCHE^%INCCLAV(CHOIX,.CHOIX) Q:(CHOIX="")!(CHOIX=13)
 S CHOIX=$C(CHOIX)
 I CHOIX>3 G CH
 G @CHOIX
0 Q
1 
 D CLEPAG^%VVIDEO K LISTE
 S DX=25,DY=0 X XY D REV^%VVIDEO W " LISTE DES APPAREILS CONNECTES "
 S TERM="",LISTE=""
 F I=0:0 S TERM=$O(^%ENVIRON(TERM)) Q:TERM=""  S LISTE(TERM)=""
 S DX=3,DY=3 X XY D NORM^%VVIDEO
 S TERM="" F I=0:0 S TERM=$O(LISTE(TERM)) Q:TERM=""  W TERM S DX=3,DY=DY+1 X XY
 D ^%VZEAVT(" ") K LISTE
 G MENU
2 
 D CLEPAG^%VVIDEO K LISTE
 W "Donnez le nom de l'appareil : " R TERM G MENU:TERM=""
 I '($D(^%ENVIRON(TERM))) D ^%VZEAVT("Ce terminal n'est declare dans ^%ENVIRON") G 2
 D CLEPAG^%VVIDEO
 S DX=0,DY=0 X XY D BLD^%VVIDEO,BLK^%VVIDEO W TERM
 S DX=25,DY=0 X XY D NORM^%VVIDEO,REV^%VVIDEO W " LISTE DES PRIMITIVES "
 S PRIM="",LISTE=""
 F I=0:0 S PRIM=$O(^%ENVIRON(TERM,PRIM)) Q:PRIM=""  S LISTE(PRIM)=""
 D NORM^%VVIDEO
 S PRIM="",COL=0,DY=1,INDICE=1
21 S PRIM=$O(LISTE(PRIM)) G 22:PRIM="" S DX=COL,DY=DY+1 X XY W PRIM
 I DY>18 S COL=COL+20,DY=1,INDICE=INDICE+1
 I INDICE>4 S INDICE=1 D ^%VZEAVT("Page suivante "),CLEPAG^%VVIDEO S DX=0,DY=0 X XY D BLD^%VVIDEO,BLK^%VVIDEO W TERM S DX=25,DY=0 X XY D NORM^%VVIDEO,REV^%VVIDEO W " LISTE DES PRIMITIVES " S COL=0,DY=1 D NORM^%VVIDEO G 21
 G 21
22 D ^%VZEAVT(" ") K LISTE
 G 2
3 
 D CLEPAG^%VVIDEO K LISTE
 W "Donnez le nom de la primitive a afficher : " R PRIM G MENU:PRIM=""
 S TERM="",LISTE=""
 F I=0:0 S TERM=$O(^%ENVIRON(TERM)) Q:TERM=""  S:$D(^%ENVIRON(TERM,PRIM)) LISTE(TERM)=""
 S DX=25,DY=4 X XY D REV^%VVIDEO W " LISTE DES APPAREILS " D NORM^%VVIDEO
 S TERM="",DY=DY+2
31 F I=0:0 S TERM=$O(LISTE(TERM)) Q:TERM=""  S DX=30,DY=DY+1 X XY W TERM
 D ^%VZEAVT(" ") K LISTE
 G 3

