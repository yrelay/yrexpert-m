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

;%SGPDKSF^INT^1^59547,73890^0
%SGPDKSF ;
 
 
 
 
RESTK(NFIC) 
 N K
 D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("PROBLEME DE RESTAURATION"))
 S DX=2,DY=7 X XY
 D REV^%VVIDEO,BLK^%VVIDEO
 W "ATTENTION votre fichier "_NFIC_" contient des connaissances DKBMS : "
 D NORM^%VVIDEO,ECHON^%VVIDEO,CURON^%VVIDEO
 F K="FORMATS","MASQUES DE SAISE","MODELES","PASSERELLES SUITES DE VALEURS","PREDICATS","REQUETES","TRAITEMENTS" S DX=10,DY=DY+1 X XY W K
 S DX=2,DY=17 X XY
 W "Voulez-vous les restaurer ? (O/N) : "
 S DX=38,DY=17 X XY D ^%VLEC
 D:(Y1="O")!(Y1="o") AFF2^%SGPKIN(NFIC)
 Q
 
 
 
RESTD(NFIC) 
 N K
 D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("PROBLEME DE RESTAURATION"))
 S DX=2,DY=7 X XY
 D REV^%VVIDEO,BLK^%VVIDEO
 W "ATTENTION votre fichier "_NFIC_" contient des donnees DKBMS : "
 D NORM^%VVIDEO,ECHON^%VVIDEO,CURON^%VVIDEO
 F K="INDIVIDUS","ATTRIBUTS","LIENS","VALEURS" S DX=10,DY=DY+1 X XY W K
 S DX=2,DY=17 X XY
 W "Voulez-vous les restaurer ? (O/N) : "
 S DX=38,DY=17 X XY D ^%VLEC
 D:(Y1="O")!(Y1="o") NFICH2^%SGPDIN(NFIC)
 Q
 
 
 
 
RESTSF(NFIC) 
 N K
 D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("PROBLEME DE RESTAURATION"))
 S DX=2,DY=7 X XY
 
 W "ATTENTION le format du fichier "_NFIC_" ne correspond pas a la restauration choisie "
 
 
 
 
 
 
 S DX=0,DY=23 U 0 X XY W $$^%QZCHW("[RETURN]") R RET
 Q
 
 
RESTPBF(NFIC) 
 N K
 D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("PROBLEME DE RESTAURATION"))
 S DX=2,DY=13 X XY
 D REV^%VVIDEO,BLK^%VVIDEO
 W "ATTENTION probleme d'ouverture avec votre fichier "_NFIC
 D NORM^%VVIDEO,ECHON^%VVIDEO,CURON^%VVIDEO
 S DX=0,DY=23 U 0 X XY W $$^%QZCHW("[RETURN]") R RET
 Q
 ;

