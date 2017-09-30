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

;TOPTPCOU^INT^1^59547,74874^0
TOPTPCOU ;
 
 S:'($D(%9MAXPT)) %9MAXPT=0 S:'($D(DEBCLE)) DEBCLE="" S:'($D(%NN)) %NN=0 S ^RGRDATA($I,%9NAMCOU,%9NUM)=NAME_"^"_DATE,(%9TUX,%9TUY)="NUM"
 S ADR="TRAIT^TOPTPCOU" D ^%QCAGTU1
TR S ^COURBE($I,%9NAMCOU,NAME,DATE,"X","TYPE UNITE")=%9TUX,^COURBE($I,%9NAMCOU,NAME,DATE,"Y","TYPE UNITE")=%9TUY,^COURBE($I,%9NAMCOU,NAME,DATE,"NBR.PTS")=%NN
 S ^COURBE($I,%9NAMCOU,NAME,DATE,"X","UNITE")=%9UX,^COURBE($I,%9NAMCOU,NAME,DATE,"Y","UNITE")=%9UY S:%NN>%9MAXPT %9MAXPT=%NN
 S %9AXE="X",%9NOM=NAME,%9DATE=DATE D ^PTRPPV S %9AXE="Y" D ^PTRPPV,^PTRPOURC
 Q
FIN K NU,%NN,COOR,PCH,ISNUM,%9NOM,%9DATE,%9UX,%9UY,%9AXE Q
TRAIT S BTN=NGLO_%TREFC_")",BTMN=@BTN,COOR="" F %TT=%TPX,%TPY D TR1
 S PCH=$P(COOR,"^",1) D TO^%QZNBN1 S:'(ISNUM) %9TUX="ALPHANUM" S %NN=%NN+1,^COURBE($I,%9NAMCOU,NAME,DATE,"X",%NN)=PCH,PCH=$P(COOR,"^",2) D TO^%QZNBN1 S:'(ISNUM) %9TUY="ALPHANUM" S ^COURBE($I,%9NAMCOU,NAME,DATE,"Y",%NN)=PCH
 Q
TR1 I %TT["C" S COOR=COOR_$P(%TREFC,",",$E(%TT,2,10))_"^" Q
 S COOR=COOR_$P(BTMN,%TS,$E(%TT,2,10))_"^" Q

