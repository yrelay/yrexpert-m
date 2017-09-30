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

;%EDCDESS^INT^1^59547,73868^0
EDCDESSI(OBJ,VER,R,X,Y) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N AGR,OR,P,R,XX,YY,SAVTA,%DESSIN S %DESSIN=1
 I OBJ="" D POCLEPA^%VVIDEO W "Impossible d'identifier le nom du dessin... " H 4 D POCLEPA^%VVIDEO Q
 I VER="" D POCLEPA^%VVIDEO W "Impossible d'identifier la version du dessin... " H 4 D POCLEPA^%VVIDEO Q
 Q:'($$EXIST^%PBSOV(OBJ,VER))
 S R=0,OR=$$^%QCAZG("^V($J,""%"",""%ORIENTATION"",1)") S:OR="" OR="VERTICALE"
 D XY^%EDCDESE(X,Y,.X,.Y)
 S SAVTA=^V($J,"%","%TAILLE",1)
 S AGR=$S($$^%QCAZG("^V($J,""%"",""%COEFFICIENT.AGRANDISSEMENT"",1)")'="":^V($J,"%","%COEFFICIENT.AGRANDISSEMENT",1),1:1)
 S XX=$P((AGR*$$LEC^%PBSOV(OBJ,VER,"XO"))+X,".",1)
 S YY=$P((AGR*$$LEC^%PBSOV(OBJ,VER,"YO"))+Y,".",1)
 D ORIENT
 D COOR^%EDCENVL S %FONC="MOUV" D ^%PBPZ
 
 D INIT5^%PBMFN(OBJ,VER,X,Y),^%PBISAGE(OBJ,VER,0,0,R,AGR,0,0)
 S ^V($J,"%","%TAILLE",1)=SAVTA Q
ORIENT 
 
 
 I (^V($J,"%","%TAILLE",1)<17)&(OR="HORIZONTALE") S ^V($J,"%","%TAILLE",1)=17 G FIN
 I (^V($J,"%","%TAILLE",1)>16)&(OR="VERTICALE") S ^V($J,"%","%TAILLE",1)=1
FIN 
 Q

