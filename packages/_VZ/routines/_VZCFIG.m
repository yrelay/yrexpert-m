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
;! Nomprog     : %VZCFIG                                                      !
;! Module      :                                                              !
;! But         : Gestion des figures                                          !
;!                                                                            !
;! Description : Creer la globale ^TBFIG et dessine le graphe                 !
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
;! HL002 ! HL     ! 18/02/07 ! Remplacer ZL par : exemple CADRE+0^TOEXPGET    !
;! HL003 ! HL     ! 15/07/12 ! Nettoyer la zone d'affichage                   !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%VZCFIG^INT^1^59769,34943^0
ZGSTFIG ;HL Creer la globale ^TBFIG et dessine le graphe.
 
 
 
 
 K %FG,^TBI($J)
 ;HL002 S %FG(1)="ZL @%FG(""R"") S %FG(""I"")=1 F %FG(""U"")=0:1 S %FG(""L"")=$P($T(@%FG(""AD"")+%FG(""U"")),"";;"",2) Q:%FG(""L"")=""""  X %FG(2)"
 S %FG(1)="S %FG(""I"")=1 F %FG(""U"")=0:1 S %FG(""L"")=$P($T(@%FG(""AD"")+%FG(""U"")^@%FG(""R"")),"";;"",2) Q:%FG(""L"")=""""  X %FG(2)"
 S %FG(2)="F %FG(""V"")=1:1 S %FG(""K"")=$P(%FG(""L""),""/"",%FG(""V"")) Q:%FG(""K"")=""""  S ^TBI($J,%FG(""I""))=%FG(""K""),%FG(""I"")=%FG(""I"")+1"
 S %FG("R")=-1
 F %FG("W")=1:1 S %FG("R")=$N(TBFIG(%FG("R"))) Q:%FG("R")=-1  S %FG("ID")=-1 F %FG("X")=1:1 S %FG("ID")=$N(TBFIG(%FG("R"),%FG("ID"))) Q:%FG("ID")=-1  S %FG("AD")=TBFIG(%FG("R"),%FG("ID")) K ^TBI($J) X %FG(1) D KSP
 K %FG,TBFIG Q
KSP K ^TBFIG($J,%FG("AD")) S ZZ=$$CUROF^%VVIDEO1_$$G0ON^%VVIDEO1
 S NU=1,PP="" F %UV=1:1 S PP=$O(^TBI($J,PP)) Q:PP=""  S IDT=^TBI($J,PP),ID=$P(IDT,"~",2) D @ID S ZZ=""
 ;HL003 S ^TBFIG($J,%FG("AD"))=NU-1,^TBFIG($J,%FG("AD"),NU-1)=^TBFIG($J,%FG("AD"),NU-1)_$$G0OFF^%VVIDEO1_$$NORM^%VVIDEO1_$$CURON^%VVIDEO1 Q
 S ^TBFIG($J,%FG("AD"))=NU-1 S:'($D(^TBFIG($J,%FG("AD"),NU-1))) ^TBFIG($J,%FG("AD"),NU-1)="" S ^TBFIG($J,%FG("AD"),NU-1)=^TBFIG($J,%FG("AD"),NU-1)_$$G0OFF^%VVIDEO1_$$NORM^%VVIDEO1_$$CURON^%VVIDEO1 Q
L S DX=$P(IDT,"~",5),DY=$P(IDT,"~",6),LG=$P(IDT,"~",4) G @$P(IDT,"~",3)
H S ZZ=ZZ_$$XY^%VVIDEO1(DX,DY)_$TR($J("",LG)," ",$$CARSPE^%VVIDEO("q")),^TBFIG($J,%FG("AD"),NU)=ZZ,NU=NU+1 Q
V S LI=(DY+LG)-1
 F %W=DY:1:LI S ^TBFIG($J,%FG("AD"),NU)=ZZ_$$XY^%VVIDEO1(DX,%W)_$$CARSPE^%VVIDEO("x"),NU=NU+1,ZZ=""
 Q
KS S DX=$P(IDT,"~",4),DY=$P(IDT,"~",5),^TBFIG($J,%FG("AD"),NU)=ZZ_$$XY^%VVIDEO1(DX,DY)_$$CARSPE^%VVIDEO($P(IDT,"~",3)),NU=NU+1,ZZ="" Q
 
DES
 Q:'($D(^TBFIG($J,%FIG)))
 D CLETEX^%VVIDEO ;HL003
 N NU,%U O $I S NU=^TBFIG($J,%FIG) F %U=1:1:NU X XY W ^TBFIG($J,%FIG,%U)
 Q

