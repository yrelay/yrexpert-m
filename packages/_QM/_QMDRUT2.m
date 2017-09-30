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

;%QMDRUT2^INT^1^59547,73877^0
%QMDRUT2 ;;11:34 AM  28 Apr 1993; ; 28 Apr 93 12:25 PM
 
 
 
 
AJHDEL(REGI,DAT,NBH) 
 N D,AJH,H1,HF,REST,HDEP
 S HDEP=$P(DAT,",",2),D=$P(DAT,",")
 S AJH=(NBH*60)*60
 
 
 I '($D(^[QUI]PLPLACAL(REGI,D))) S D=$O(^[QUI]PLPLACAL(REGI,D)) G:D="" ERR S H1=$O(^[QUI]PLPLACAL(REGI,D,"")) G NXH1
 S H1=$ZP(^[QUI]PLPLACAL(REGI,D,HDEP)) G:H1="" AGA
 S HF=$O(^[QUI]PLPLACAL(REGI,D,H1,""))
 
 I HF>HDEP S AJH=AJH+(HDEP-H1) G NXH1
 G AGA
NXH1 S HF=$O(^[QUI]PLPLACAL(REGI,D,H1,"")) I (HF-H1)>AJH S HRES=H1+AJH G TR
 S AJH=AJH-(HF-H1)
AGA S H1=$O(^[QUI]PLPLACAL(REGI,D,H1)) G:H1'="" NXH1
 S D=$O(^[QUI]PLPLACAL(REGI,D)) G:D="" ERR S H1="" G AGA
 
TR S REST=D_","_HRES
 Q REST
 
ERR Q 0
 
 
 
 
RETHDEL(REGI,DAT,NBH) 
 N D,DJHS,HDEP,H1,HF,REST
 S HDEP=$P(DAT,",",2),D=$P(DAT,",")
 S DJHS=(NBH*60)*60
 
 
 I '($D(^[QUI]PLPLACAL(REGI,D))) S D=$ZP(^[QUI]PLPLACAL(REGI,D)) G:D="" SERR S H1=$ZP(^[QUI]PLPLACAL(REGI,D,"")) G SNXH1
 S H1=$ZP(^[QUI]PLPLACAL(REGI,D,HDEP)) G:H1="" SAGA
 S HF=$O(^[QUI]PLPLACAL(REGI,D,H1,""))
 
 I HF>HDEP S DJHS=DJHS+(HF-HDEP)
SNXH1 S HF=$O(^[QUI]PLPLACAL(REGI,D,H1,"")) I (HF-H1)'<DJHS S HRES=HF-DJHS G STR
 S DJHS=DJHS-(HF-H1)
SAGA S H1=$ZP(^[QUI]PLPLACAL(REGI,D,H1)) G:H1'="" SNXH1
 S D=$ZP(^[QUI]PLPLACAL(REGI,D)) G:D="" ERR S H1="" G SAGA
 
STR S REST=D_","_HRES
 Q REST
 
SERR Q 0
 ;

