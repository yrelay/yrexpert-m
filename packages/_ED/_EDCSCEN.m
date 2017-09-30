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

;%EDCSCEN^INT^1^59547,73869^0
%EDCSCEN(COL,VER,X,Y,AGR) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N OR,P,SAVTA,%DESSIN
 I '($D(%9EPA)) S %9EPA=1E-3
 S %DESSIN=1
 I COL="" D POCLEPA^%VVIDEO W $$^%QZCHW("Impossible d'identifier le nom de la collection") H 4 D POCLEPA^%VVIDEO Q
 I VER="" D POCLEPA^%VVIDEO W $$^%QZCHW("Impossible d'identifier la version de la collection") H 4 D POCLEPA^%VVIDEO Q
 
 Q:'($$EXI^%SDCCMS(COL,VER))
 S OR=$$^%QCAZG("^V($J,""%"",""%ORIENTATION"",1)")
 S:OR="" OR="VERTICALE"
 
 D XY^%EDCDESE(X,Y,.X,.Y)
 S SAVTA=^V($J,"%","%TAILLE",1)
 I AGR="" S AGR=$S($$^%QCAZG("^V($J,""%"",""%COEFFICIENT.AGRANDISSEMENT"",1)")'="":^V($J,"%","%COEFFICIENT.AGRANDISSEMENT",1),1:1)
 
 S ^V($J,"%TAILLE",1)=1
 D TRANSOUT
 D COOR^%EDCENVL
 S %FONC="MOUV" D ^%PBPZ
 D INIT5^%PBMFN(COL,VER,X,Y)
 D ^%SDSCACT(COL,VER,1,0,%PORT,%TERM,%DESSIN,AGR)
 S ^V($J,"%","%TAILLE",1)=SAVTA
 Q
 
ORIENT 
 
 I (^V($J,"%","%TAILLE",1)<17)&(OR="HORIZONTALE") S ^V($J,"%","%TAILLE",1)=17 Q
 I (^V($J,"%","%TAILLE",1)>16)&(OR="VERTICALE") S ^V($J,"%","%TAILLE",1)=1
 Q
 
TRANSOUT N %ATT,%VAL,%ORD
 S %ATT=""
BOUT S %ATT=$O(^V($J,"%",%ATT))
 Q:%ATT=""
 S %ORD=""
BOUTORTD S %ORD=$O(^V($J,"%",%ATT,%ORD))
 G:%ORD="" BOUT
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),%ATT,^V($J,"%",%ATT,%ORD),%ORD)
 G BOUTORTD
 Q

