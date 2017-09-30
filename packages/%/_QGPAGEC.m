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

;%QGPAGEC^INT^1^59547,73876^0
GRPAGECR ;
MOING S RETOUR=2 Q:PAG=1  S PAG=PAG-1 D APG^%QGPAG S DX1=2,DY1=6,NYSG=NDLG+1 Q
PLUG S RETOUR=2 Q:NBPAG=PAG  S PAG=PAG+1 D APG^%QGPAG S DX1=2,DY1=6,NYSG=NDLG+1 Q
NOPG S RETOUR=2,DX=6,DY=3 X XY W *-1 S XXX=$C(X1) W XXX S DX=DX+1 X XY D ^%VLEC S Y1=XXX_Y1 G:CTRLA FIN1 Q:CTRLF  D NUM D:NUM'=1 APG^%QGPAG S RETOUR=2 Q:NUM'=1
 I Y1>NBPAG D APG^%QGPAG Q
 S PAG=Y1 D APG^%QGPAG S DX1=2,DY1=6,NYSG=NDLG+1 Q
NEXT I $D(ZOOM) Q:ZOOM
 S (DY1,L)=$Y,P=PAG
BNXT D:L=20 PNXT S L=L+1 G:'($D(^PAG($J,P,L))) FNXT G:'($D(@GROAFF@(^PAG($J,P,L)))) OKNXT G BNXT
PNXT S P=P+1,L=5 Q
OKNXT I P'=PAG S PAG=P D APG^%QGPAG
 S DY1=L,RETOUR=2 Q
FNXT D POCLEPA^%VVIDEO,^%VSQUEAK W "Aucun",%ei," ",%ninds," non affecte",%ei," dans ce qui suit" H 2 S RETOUR=1 Q
MOIND S RETOUR=2 Q:PAD=1  S PAD=PAD-1 D APD^%QGPAG S DX1=42,DY1=6,NYSD=NDLD+1 Q
PLUD S RETOUR=2 Q:NBPAD=PAD  S PAD=PAD+1 D APD^%QGPAG S DX1=42,DY1=6,NYSD=NDLD+1 Q
NOPD S RETOUR=2,DX=46,DY=3 X XY W *-1 S XXX=$C(X1) W XXX S DX=DX+1 X XY D ^%VLEC S Y1=XXX_Y1 G:CTRLA FIN1 Q:CTRLF  D NUM D:NUM'=1 APD^%QGPAG S RETOUR=2 Q:NUM'=1
 I Y1>NBPAD D APD^%QGPAG Q
 S PAD=Y1 D APD^%QGPAG S DX1=42,DY1=6,NYSD=NDLD+1 Q
FIN1 S RETOUR=1 Q
NUM I ((Y1?1N)!(Y1?2N))!(Y1?3N) S NUM=1 Q
 E  S NUM=0 Q

