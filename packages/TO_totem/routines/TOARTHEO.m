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

;TOARTHEO^INT^1^59547,74871^0
TOARTHEO ;
 
 K ^COMPNOM($I,YA),^ARBTHEO($I,YA) S RAC=YA,ARB="^ARBTHEO($I,YA",^ARBTHEO($I,YA,0)=YA,^COMPNOM($I,YA,YA)=1,TOTAB="^[QUI]NOMENC(RAC)",IPI=1,COMP=-1,NIV="0",LAT=1
GET F UU=0:0 S COMP=$N(@TOTAB@(COMP)) G:COMP=-1 SUIT S PILC(IPI)=COMP_"^"_NIV_","_LAT,REF=NIV_","_LAT D GREF S IPI=IPI+1,LAT=LAT+1
SUIT S IPI=IPI-1 G:'($D(PILC(IPI))) FIN S RAC=$P(PILC(IPI),"^",1),NIV=$P(PILC(IPI),"^",2),LAT=1 G GET
GREF S TREF=ARB F VV=1:1 S RRE=$P(REF,"^",VV) G:RRE="" END S TREF=TREF_","_RRE
END S TREF=TREF_")",@TREF=COMP,^COMPNOM($I,YA,COMP)=1 Q
FIN Q
TEST W $$^%QZCHW("Racine : ") R YA D ^TOARTHEO G FIN

