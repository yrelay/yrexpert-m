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

;TO31GPAR^INT^1^59547,74869^0
TO31GPAR ;
 
 S VV="VALI"_YY,TT=$E(VV,1,$L(VV)-1)_$C($A($E(VV,$L(VV)))-1)_"z"
 F UU=0:0 S TT=$N(^[QUI]IMPTRIP(TT)) Q:(TT=-1)!($E(TT,1,$L(VV))'=VV)  D TRAIT
 Q
 
TRAIT S A=-1
 F CYZ=CYY:1 S A=$N(^[QUI]IMPTRIP(TT,A)) Q:A=-1  I ('($D(^[QUI]IMPLICI(YY,A))))&('($D(^[QUI]EXPL(YY,A)))) D SUIT
 Q
SUIT S ^[QUI]EXPL(YY,A)="$VALID",CP=$N(^[QUI]IMPTRP(TT,A,-1)) D GUNITI
 S ^[QUI]PAR(YY,NPAR)=A,PRX=A D ^%ABBUILT
 S ^[QUI]TREEIMP(ARTI,CYZ)=A,^REFTREE(YY,A)=CYZ,^NFISIMP($I,YY,CYZ)=1,^NIVPAR($I,YY,A)=1,NPAR=NPAR+1
 Q
GUNITI S CHUN=^[QUI]IMPTRIP(YY,A,CP),^[QUI]UNITE(YY,A)=$P(CHUN,"^",1) Q

