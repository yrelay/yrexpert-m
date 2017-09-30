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
;! Nomprog     : %VZEAVT                                                      !
;! Module      : VIDEO                                                        !
;! But         : Affiche un message d'avertissement ligne par ligne           !
;!                                                                            !
;! Description : Affiche d'un message en bas de page ligne par ligne          !
;! le message est coupé, il faut appuyer sur [Entree] pour lire les lignes    !
;! suivantes.                                                                 !
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

;%VZEAVT^INT^1^59547,74037^0
%ZAVERTI(MSG) 
 
 
 
 
 
 
 
 
 
 
 
 
 D COL(MSG,0,79) Q

COLP(MSG) 
 N XG,PRET,LA
 S XG=0,LA=79,PRET=0
 G COL2
 
COLR(MSG,XG,LA,PRET) 
 G COL2
COL(MSG,XG,LA) 
 N PRET S PRET=1
COL2 N U,V,VV,REP,ESP,MSC S V=1,ESP=(LA-XG)+1
 
 S V=1,DY=23,MSG=MSG_" "
 G AUTRE
LOP S VV=$F(MSG," ",V),MSC=$E(MSG,1,VV-1)
 G W:MSC="",W:(10+$L(MSC))>ESP
 S V=VV G LOP
W U 0 S DX=XG D BLD^%VVIDEO,EFF W $E(MSG,1,V-1) S DX=$X,DY=$Y D NORM^%VVIDEO X XY S MSG=$E(MSG,V,999),V=1 I (MSG'="")!PRET W "[RETURN]" F U=0:0 R *REP:^TOZE($I,"ATTENTE") Q:(REP=13)!(REP=-1)
 Q:(MSG="")&(PRET=0)
 G FIN2:MSG="" S V=1 G LOP
FIN2 D EFF Q
EFF S DX=XG,DY=23 D CLEBAS^%VVIDEO Q
 
DIM D POCLEPA^%VVIDEO S XG=$$^%VZAME1("Colonne de depart : ") Q:XG=""
 D POCLEPA^%VVIDEO S LA=$$^%VZAME1("Largeur : ") Q:LA=""
 D COL^%VZEAVT(MSG,XG,LA) G DIM
TEST1 D POCLEPA^%VVIDEO S MSG=$$^%VZAME1("Message : ") Q:MSG=""
 G DIM
 
AUTRE N NBRE,LIGN,I,CONT
 S LIGN=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LIGN") K @(LIGN)
 S NBRE=$$LIGN^%QZCHMES(MSG,ESP-10,LIGN)
 D ^%VSQUEAK
 F I=1:1:NBRE U 0 S CONT=@LIGN@(I),DX=XG D BLD^%VVIDEO,EFF X XY W CONT S DX=$X,DY=$Y D NORM^%VVIDEO I (I'=NBRE)!PRET X XY W "[RETURN]" F U=0:0 R *REP:^TOZE($I,"ATTENTE") Q:(REP=13)!(REP=-1)
 K @(LIGN)
 I PRET=1 D EFF
 Q
 
 
INVDEO D REV^%VVIDEO X XY W MSG D NORM^%VVIDEO Q

TEST
 ; Exemple YXP>D TEST^%VZEAVT  
 D ^%VZEAVT("Ce n'est pas raisonnable de maltraiter ainsi ce pauvre terminal qui ne vous a pourtant rien fait, que je sache... Evitez a l'avenir un tel comportement irresponsable!") Q

TEST2 D POCLEPA^%VVIDEO S XG=$$^%VZAME1("Colonne de depart : ") Q:XG=""
 D POCLEPA^%VVIDEO S LA=$$^%VZAME1("Largeur :") Q:LA=""
 D COL^%VZEAVT("Ce n'est pas raisonnable de maltraiter ainsi ce pauvre terminal qui ne vous a pourtant rien fait, que je sache... Evitez a l'avenir un tel comportement irresponsable!",XG,LA) Q
 

