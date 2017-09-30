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

;TOSTOC^INT^1^59547,74875^0
TOSTOC ;
 
 Q
 S DE=7,FI=8 D ^TONETTOI I $E(REP,1)="N" S NOFAB=0 Q
 I '($D(^STOC(IDSTO))) S DX=5,DY=7,NOFAB=0,NOFAB=0 X XY W "Ce produit n'est pas en stock !" Q
QUES S QP=^STOC(IDSTO),DX=5,DY=7 X XY W "La quantite de ",$P(^[QUI]TBNOM(NUFA,S),"^",2)," en stock est de ",QP
 S DX=5,DY=8 X XY W "Il vous en faut ",^[QUI]QUANTI(NUFA,S)," pour cette commande" S DX=5,DY=10 X XY W "Combien en retirez vous ? " S XG=$X R REP I REP="" D ^%VSQUEAK G QUES
 I (REP>QP)!((REP>^[QUI]QUANTI(NUFA,S))!(REP<0)) S DX=XG X XY W "      " G QUES
 S ^STOC(IDSTO)=QP-REP,NOFAB=0,^[QUI]QUANTI(NUFA,S)=^[QUI]QUANTI(NUFA,S)-REP S:^STOC(IDSTO)=0 NOFAB=1
 S DX=5,DY=12 X XY W "Nouvel valeur du stock : ",^STOC(IDSTO) R RC S DE=7,FI=$Y D ^TONETTOI Q

