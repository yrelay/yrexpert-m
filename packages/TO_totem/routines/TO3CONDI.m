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

;TO3CONDI^INT^1^59547,74870^0
TO3CONDI ;
 
CONDIT S:$P(CONTAB,"^",CD+1)="" $P(CONTAB,"^",CD+1)="="
 S IMPCTE=0 S:CONDI'=0 LOGI=$S($P(CONTAB,"^",CD+3)=$$^%QZCHW("ET"):"&",$P(CONTAB,"^",CD+3)=$$^%QZCHW("OU"):"!",1:"") S:$P(CONTAB,"^",CD+4)="" LOGI="" S:CD'<13 LOGI=""
 S UCD=PNUM+16,CD4=CD+4,PCD4=$P(CONTAB,"^",CD4) I CD4=UCD S LOGI="" G CD2
 I (LOGI="")&((CD4'=UCD)&(PCD4'="")) S LOGI="&"
CD2 S PCH2=$P(CONTAB,"^",CD+2)
 S CPB=$P(CONTAB,"^",CD+1) G:(CPB="[]")!((CPB="[[")!((CPB="]]")!(CPB="]["))) BRAQ D ^TO3COPAR S:CONDI'=0 CONDI=CONDI_"("_PCHC0_$P(CONTAB,"^",CD+1)_CD2_")"_LOGI G FIN
BRAQ S CR1=$S($E(CPB,1)="[":"'<",1:">"),CR2=$S($E(CPB,2)="]":"'>",1:"<"),BORN=$P(CONTAB,"^",CD+2),BORI=$P(BORN,",",1),BORS=$P(BORN,",",2) F PCH4="BORI","BORS" S PCH2=@PCH4 D ^TO3COPAR S @PCH4=CD2
 S:CONDI'=0 CONDI=CONDI_"((^V($I,YA,"""_PCHC0_""")"_CR1_BORI_")&(^V($I,YA,"""_PCHC0_""")"_CR2_BORS_"))"_LOGI
FIN K PCD4,UCD,CD4,PCHC0,BORI,BORN,BORS,CD2,LOGI,PCH2,PCH4,POSII Q

