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
;! Module      : Caractères graphiques (CG)                                   !
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

;%CGSUPEN^INT^1^59547,73867^0
CGSUPENS ;
 D CLEPAG^%VVIDEO,CAD
 S Y1=""
L1 S DX=10,DY=10 X XY W "Ensemble : " S DX=$X,DY=$Y W $J("",$L(Y1)) X XY D ^%VLEC G:(CTRLA=1)!(Y1="") FIN
 I Y1="?" D ^%CGCHENS G:%ENS="" FIN S Y1=%ENS G GO
 I '($D(^CAGRAPH(Y1))) D POCLEPA^%VVIDEO,^%VSQUEAK W "Cet ensemble n'existe pas ..." H 3 D POCLEPA^%VVIDEO G L1
GO D POCLEPA^%VVIDEO,^%VSQUEAK W "Voulez-vous vraiment supprimer " D REV^%VVIDEO W Y1 D NORM^%VVIDEO W " (O/N) ? [O] :" R *BID S:BID=13 BID=79 G:BID'=79 FIN
 K ^CAGRAPH(Y1) D POCLEPA^%VVIDEO W "OK" H 1
FIN K BID,CTRLA,DX,DXD,DXG,DY,DYB,DYH,%ENS,GRAPH,MSG,Y1 Q
CAD S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG="SUPPRESSION D'UN ENSEMBLE"
 D 4^%VZCD Q

