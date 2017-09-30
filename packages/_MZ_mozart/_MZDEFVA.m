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

;%MZDEFVA^INT^1^59547,73871^0
MOZDEFVA ;
 
 K ^TABITEM($I),^PILARG($I) S NITEM=1,NARG=1
DEB S %PCH=ITEM D ^%QZNBN1 G:ISNUM FIN S LAT=0 S:ITEM["'" LAT=1
DEFITEM I ITEM'["'" G NRL
 S EF=$P(ITEM,"'",1),EP=$P(ITEM,"'",2) I EP="" S ITEM=EF G DEFITEM
 D RECON G:ISNRL NRL G:IMPCTE=1 FIN S YART=EP,PCHB=%PCH,(EFB,%PCH)=EF
 I '($D(^[QUI]PAR(YART))) S OASFA=SFA,SFA=YART D ^MOZVSFAB S SFA=OASFA K OASFA
 S %PCH=PCHB I '($D(^[QUI]FULL(EP,EF))) S ITEMF=EFB,PPP=EP G XYZ
 G ITF
NRL G:$D(^[QUI]FULL("MOZ",ITEM)) ITF I ((CAS-1)#4)'=0 S ITEMF=""""_ITEM_"""",VAPA="" D VAPA G FIN
 S ITEMF=ITEM,VAPA="???" D VAPA G FIN
ITF S ITEMF=$S(ITEM'["'":ITEM,1:$P(ITEM,"'",1))
 G:LAT=1 SUITE S VAPA=$S($D(V(YA,ITEMF)):V(YA,ITEMF),1:" ??? ") D VAPA G FIN
SUITE 
FIN Q
RECON 
END K %M Q
VAPA S ^TABITEM($I,NITEM)=ITEMF_"~"_VAPA,NITEM=NITEM+1 Q
 Q
ART I %TBVAL["TVPAR" S ITEM=EF,ISNRL=1 Q
 S ITEMF=EF_" de "_@%TBVAL@(NUFA,NSFA,"ARTICLE"),VAPA=$S($D(^[QUI]TVPAR(NUFA,NSFA,EF)):^[QUI]TVPAR(NUFA,NSFA,EF),1:" ???"),IMPCTE=1 D VAPA Q
 Q
 Q

