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

;%MZGFIC^INT^1^59547,73871^0
MOZGFIC ;
 
 S MPASX=0,MPASY=1,NXI=-1,NXS=79,NYI=7,NYS=21 D POCLEPA^%VVIDEO W $$L23^%QSLIB2("[RETURN] selection, CTRLG gomme") S DX=0,DY=8,PY=8
 D ECHOFF^%VVIDEO
LEC S DY=PY X XY D ^%VZECUR G:(X1'=1)&(X1'=13) LEC G @X1
1 G FIN
13 G:'($D(^RELSEL($J,PGE,$Y))) LEC S PY=$Y,RF=^RELSEL($J,PGE,$Y) F %U=1:1:4 S @("B"_%U)=$P(RF,"^",%U)
 S RS=^[QUI]MOZREL(B1,B2,B3,B4) D ^%VKMULC K RESUL F %U=1:1:4 S RESUL(%U)=@("B"_%U)
 S B1=^%SCRE("MOZREL")-4 F %U=1:1:B1 S RESUL(%U+4)=$S($D(%RS(%U)):%RS(%U),1:"")
 S SCR="MOZREL",NOMTAB="^[QUI]MOZREL" D ^%VAFIGRI,^%VAFISCR,POCLEPA^%VVIDEO W "[RETURN] pour continuer " R *X:60
 D CLEPAG^%VVIDEO S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG="Acces aux fiches de SF" D 4^%VZCD
AFF1 O 0 S DY=-1 F %QY=1:1 S DY=$N(^RELSEL($J,PGE,DY)) Q:DY=-1  D AFF2
 K PTS,PS,PS1,PS2 D POCLEPA^%VVIDEO W "[RETURN] pour selectionner,CTRLA:Abandon,CTRLG:Gomme " S DX=0,PY=PY+1 S:PY>21 PY=21 G LEC
AFF2 S DX=0 X XY S PS=^RELSEL($J,PGE,DY) W $P(PS,"^",1),?20,$E($P(PS,"^",2),1,25),?46,$E($P(PS,"^",3),1,25),?73,$P(PS,"^",4)
 Q
FIN K %U,B1,B2,B3,B4,RF,MPASX,MPASY,NXI,NXS,NYI,NYS,PY Q

