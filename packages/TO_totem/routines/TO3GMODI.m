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

;TO3GMODI^INT^1^59547,74870^0
TO3GMODI ;
 
 D POCLEPA^%VVIDEO W $$L23^%QSLIB2("CTRLF pour ajouter un parametre")," " S TYMOD="MODIFICATION" D ^TO3TYMOD S (PY,DY)=DEBP,DX=43 X XY
DEB S DY=PY+1,DX=43,MPASX=0,MPASY=1,NXI=42,NXS=44,NYI=DEBP-1,NYS=20 X XY D ^TO3PGOT G:X1=1 FIN G:X1=6 AJOUT D MAJ G DEB
AJOUT S TYMOD=$$^%QZCHW("AJOUT") D ^TO3TYMOD S (ADPY,DPY)=-1 F GF=0:0 S DPY=$N(^POSENR($I,DPY)) Q:DPY=-1  S ADPY=DPY
 S:ADPY=-1 ADPY=5 S DY=ADPY+1,DX=5 X XY D ^%VLEC I (CTRLA=1)!((CTRLF=1)!(Y1="")) S DE=DY,FI=DY,TYMOD="MODIFICATION" D ^TO3TYMOD,^%ABNETTO G DEB
 S PARAM=Y1 W ?40," = " S DX=$X D ^%VLEC I (CTRLA=1)!((CTRLF=1)!(Y1="")) S DE=DY,FI=DY,TYMOD="MODIFICATION" D ^TO3TYMOD,^%ABNETTO G DEB
 S ^POSENR($I,DY,43)=Y1_"^"_PARAM,PY=DY,PX=43,TYMOD="MODIFICATION" D MAJ,^TO3TYMOD G DEB
MAJ Q:'($D(^POSENR($I,PY,PX)))  S PARAM=$P(^POSENR($I,PY,PX),"^",2),VAL=$P(^POSENR($I,PY,PX),"^",1),^[QUI]TVPAR(NUFA,TWREF,PARAM)=VAL,^[QUI]RAISON(NUFA,TWREF,PARAM)="IMPLI"_"MODIFICATION"
FIN Q

