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

;TOREAUS2^INT^1^59547,74874^0
TOREAUS2 ;
 
 D L7^%QSLIB S TYMOD="Saisie" D ^TO3TYMOD S (PY,DY)=DEBP-1,DX=43 X XY
DEB S DY=PY+2,DX=43 X XY S MPASX=0,MPASY=2,NXI=42,NXS=44,NYI=7,NYS=21 X XY D ^TOREAUS3 G:(X1=1)!(X1=6) END G DEB
FIN Q
END K PY,MPASX,MPASY,NXI,NXS,NYI,NYS,TYMOD,ADPY,DPY,GF,DE,FI,PARAM Q
EDIT D POCLEPA^%VVIDEO W "Un instant..." S (DLIG,LIG)=-1 F FG=1:1 S LIG=$N(^POSENR($I,PAGE,LIG)) Q:LIG=-1  S DLIG=LIG
 S LI=$S(DLIG=-1:8,1:DLIG+2) I LI>21 S LI=8,PAGE=PAGE+1
 K LIG,DLIG,FG S %FIN=1 F I=1:1 S INEXT=$N(^[QUI]EXPLICI(USI,INEXT)) D EXP
 S PAGE=0 G FIN
EXP S NEXT=$N(^[QUI]EXPLICI(USI,INEXT,-1))
 S ^POSENR($I,PAGE,LI)=NEXT,^POSFUL($I,PAGE,LI)=NEXT,^PARVAL($I,NEXT)="",^DON($I,NEXT)=I,^VALPAR($I,NEXT)="",LI=LI+2 I LI>(LILIM+1) S PAGE=PAGE+1,LI=8
 Q

