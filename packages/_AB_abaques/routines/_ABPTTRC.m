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

;%ABPTTRC^INT^1^59547,73864^0
%ABPTTRC ;
 
 K ^RGRDATA($I),^COURBE($I) I '($D(^TACOMPIL($I))) S FINCOU=0 G FIN
LEC S (%9TUX,%9TUY)="NUM",%9MAXPT=-100,FINCOU=1,DX=0,DY=5 D CLEBAS^%VVIDEO S DX=0,DY=8 X XY W "Nom de ce graphique : " S DX=$X D ^%VLEC I CTRLA!CTRLF S FINCOU=1 G FIN
 G:Y1="" LEC S DX=0,DY=6,FINCOU=0 D CLEBAS^%VVIDEO W "Un instant..."
 S %9NAMCOU=Y1,%9NUM=0,PAG=-1 F PP=1:1 S PAG=$N(^TACOMPIL($I,PAG)) Q:PAG=-1  S LG=-1 F LL=1:1 S LG=$N(^TACOMPIL($I,PAG,LG)) Q:LG=-1  D TRCOL Q:(%9NUM=LIMCOU)!(FINCOU=1)
FIN D POCLEPA^%VVIDEO K ^TACOMPIL($I),%9NOMAB,%9COL,Y1,%9TCOL,%9TPAG Q
TRCOL S %9NUM=%9NUM+1,ENR=^TACOMPIL($I,PAG,LG),PLC=0 F WW="%9NAME","%9DATE","%9NOMAB","%9TPAG","%9TCOL" S PLC=PLC+1,PAR=$P(ENR,"^",PLC),@WW=PAR
 D ^%ABPTGOC Q

