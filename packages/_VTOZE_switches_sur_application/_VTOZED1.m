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
;! HL002 ! HL     ! 12/11/17 ! Sortir du menu avec CTRLF                      !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%VTOZED1^INT^1^59547,74036^0
%VTOZED1 ;
 S MPASX=0,MPASY=1,NXI=1,NXS=80,NYI=8,NYS=19,TBMOV="^POSFUL($J)",(PX,DX)=2,(PY,DY)=9
;HL002 LEC S DX=PX,DY=PY,X1=$$ADR^%VMOV001(TBMOV,.PX,.PY) G FIN:X1=1,LEC:'($D(^POSFUL($J,PY,PX))),P:X1=13,LEC
LEC S DX=PX,DY=PY,X1=$$ADR^%VMOV001(TBMOV,.PX,.PY) G FIN:(X1=1)!(X1=6),LEC:'($D(^POSFUL($J,PY,PX))),P:X1=13,LEC
P S VV=^POSENR($J,PGE,PY,23),MNE=^POSENR($J,PGE,PY,3)
 S TBT=^TBTOZE($J,MNE,"TBT")
 S NV=-1
 F %U=1:1 S NV=$N(^TBTOZE($J,MNE,"VAL",NV)) Q:NV=-1  Q:^TBTOZE($J,MNE,"VAL",NV)=VV
 S NV=$N(^TBTOZE($J,MNE,"VAL",NV)) S:NV=-1 NV=$N(^TBTOZE($J,MNE,"VAL",NV))
 S NV=^TBTOZE($J,MNE,"VAL",NV)
 S @TBT@(MNE)=NV,^POSENR($J,PGE,PY,23)=NV
 D CUROF^%VVIDEO S DX=22,DY=PY X XY W $J("",18)
 S DX=23 X XY W NV D CURON^%VVIDEO
 G LEC
FIN Q

