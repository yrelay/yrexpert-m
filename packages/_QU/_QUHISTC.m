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

;%QUHISTC^INT^1^59547,73885^0
ZHICAP ;
 D G0ON^%VVIDEO,BLD^%VVIDEO
 F COL=1:1:NBCOL S Y=@GLO@(COL,"Z")-YMIN,DYC=((DYORIG-((PASE/PASY)*Y))+5E-1)\1,POS(COL)=DYC
 F COL=1:1:NBCOL D PLAT,TRANSI
 K POS D G0OFF^%VVIDEO
 Q
PLAT S DY=POS(COL)
 S DX=((((COL-1)*LCOL)+MARGE)+DXORIG)+1
 W:$$YY(DX,DY) $E("qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq",1,LCOL-1)
 Q
TRANSI S DX=(DX+LCOL)-1
 S (Y,DY)=POS(COL) I '($D(POS(COL+1))) W:$$XY(DX,DY) "q" Q
 S YS=POS(COL+1),ST=YS-Y I ST=0 W:$$XY(DX,DY) "q" Q
 D MON:ST<0,DES:ST>0 Q
MON W:$$XY(DX,DY) "j" F DY=Y-1:-1:YS+1 W:$$XY(DX,DY) "x"
 S DY=YS W:$$XY(DX,DY) "l" Q
DES W:$$XY(DX,DY) "k" F DY=Y+1:1:YS-1 W:$$XY(DX,DY) "x"
 S DY=YS W:$$XY(DX,DY) "m" Q
XY(DX,DY) 
 Q:(DY'>((DYORIG-HAUT)+1))!(DY>DYORIG) 0
 X XY Q 1

