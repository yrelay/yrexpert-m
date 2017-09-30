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
;! Nomprog     : %VZCD                                                        !
;! Module      : VIDEO                                                        !
;! But         : Affiche l'entete des menus                                   !
;!                                                                            !
;! Description :                                                              !
;!               Exemple :                                                    !
;!                                                                            !
;!                                    ┌─────────────────────────────────────┐ !
;!               REQUETE              │          DMO sur /dev/pts/0           !
;!                                    └─────────────────────────────────────┘ !
;!                                                                            !
;!----------------------------------------------------------------------------!
;! Modif ! Auteur ! Date     ! Commentaires                                   !
;!-------!--------!----------!------------------------------------------------!
;!       ! HL     ! 22/03/01 ! Creation                                       !
;! HL001 ! HL     ! 00/00/00 ! Description succincte de la modification.      !
;! HL002 ! HL     ! 04/09/09 ! Doubler le cadre graphique si GRAPH=1v         !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%ZENCADR(DXG,DXD,DYH,DYB,GRAPH,BIG,MSG) 

%VZCD(DXG,DXD,DYH,DYB,GRAPH,BIG,MSG) ;
 ;Exemple YXP>D ^%VZCD(0,38,0,4,1,1,"Menu general")
;-----------------------------------------------------------------------------
 ;DXG   : Coin haut gauche
 ;DXD   : Coin haut droit
 ;DYH   : Coin bas gauche
 ;DYB   : Coin bas droit
 ;GRAPH : Double le cadre graphique
 ;BIG   : Afficher caractère double (ou couleur)
 ;MSG   : Nom du menu
;-----------------------------------------------------------------------------

 N LIPI,LIP,DX,DY,QA,DYP,DYM,CAG,ALLREV
 S ALLREV=1 D CAD
 Q
 
CAD
 S CAG=$S(GRAPH=1:$$CAG^%VVIDEO1,1:"")
 ;HL002 I '(TADTM) S:GRAPH=1 DXD=(DXD*2)-1 S:DXD>79 DXD=79
 S:GRAPH=1 DXD=(DXD*2)-1 S:DXD>79 DXD=79
 D CUROF^%VVIDEO,REV^%VVIDEO S LIP=$J("",(DXD-DXG)+1)
 S DY=DYH,DX=DXG X XY W CAG X XY W LIP
 S DYP=DYH+1,DYM=DYB-1
 F DY=DYP:1:DYM S DX=DXG X XY W CAG X XY W " " S DX=DXD X XY W " "
 S DX=DXG,DY=DYB X XY W CAG X XY W LIP
 X XY D:'(ALLREV) NORM^%VVIDEO S DY=(DYH+DYB)\2,DX=((DXG+DXD)\2)-($L(MSG)\2)
 I BIG=1 O $I S DXG=DX,DYH=DY D BIG^%VVIDEO G FIN
 X XY W MSG
FIN D:ALLREV NORM^%VVIDEO
 D CURON^%VVIDEO Q
 
4 D ^%VZCD(DXG,DXD,DYH,DYB,GRAPH,0,MSG) Q
 
TO4 D ^%VZCD(DXG,DXD,DYH,DYB,GRAPH,0,MSG) Q
 
3 D ^%VZCD(DXG,DXD,DYH,DYB,0,0,"") Q
TO3 
 D ^%VZCD(DXG,DXD,DYH,DYB,1,1,TIT) Q
 
 
 
ALLREV(DXG,DXD,DYH,DYB,GRAPH,BIG,MSG) 
 N LIPI,LIP,DX,DY,QA,DYP,DYM,CAG,ALLREV
 S ALLREV=1
 D CAD Q
 ;

ZSWITCH
