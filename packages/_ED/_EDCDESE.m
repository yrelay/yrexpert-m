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

;%EDCDESE^INT^1^59547,73868^0
EDCDESET(ETU,X,Y) 
 
 
 
 
 
 
 
 
 
 
 
 
 I ETU="" D MSG^%VZEATT("Etude non definie, impossible de tracer son graphe....") H 4 D POCLEPA^%VVIDEO Q
 N AGR,OR,R,%DESSIN S OR=$$^%QCAZG("^V($J,""%"",""%ORIENTATION"",1)"),%DESSIN=1
 S AGR=$S($$^%QCAZG("^V($J,""%"",""%COEFFICIENT.AGRANDISSEMENT"",1)"):^V($J,"%","%COEFFICIENT.AGRANDISSEMENT",1),1:1)
 D XY(X,Y,.X,.Y) S R=$S(OR="HORIZONTALE":0,1:270)
 D COOR^%EDCENVL
 D PAPIER^%PBITOTL(ETU,X,Y,AGR) Q
XY(X,Y,DX,DY) 
 N H S H=4096/297E-1
 S DX=$P(H*X,".",1),DY=$P(3120-(H*Y),".",1)
 I ^V($J,"%","%ORIENTATION",1)="VERTICALE" S DX=15748E-2*X,DY=(-15748E-2*Y)+445669E-2 Q
 I ^V($J,"%","%ORIENTATION",1)="HORIZONTALE" S DX=15748E-2*X,DY=(-15748E-2*Y)+311811E-2 Q
ENDXY S DX=157480E-2,DY=288199E-2 Q
 ;

