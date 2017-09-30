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

;%QSXL^INT^1^59547,73884^0
%QSXL ;;02:34 PM  16 Jun 1992
QSXL 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
LIEN(REP,LIEN,LISTE,STO,STO2,STO3) 
 N IND,I,J,OR,CARD,CARD1,OV,CARD0,CARD2,CARD3,TEMP,VAL,CARD4,CARD5,CARD6
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S VAL=$$CONCAS^%QZCHAD(TEMP,"VAL")
 S (CARD,CARD1,CARD0,CARD2,CARD3,CARD4,CARD5,CARD6)=0
 S IND=""
 F I=0:0 S IND=$O(@LISTE@(IND)) Q:IND=""  D L1
 
 
 
 
 
 S @STO@(REP,LIEN,"CARD")=CARD
 S @STO@(REP,LIEN,"CARD0")=CARD0
 S @STO@(REP,LIEN,"CARD1")=CARD1
 S @STO@(REP,LIEN,"CARD2")=CARD2
 S @STO@(REP,LIEN,"CARD3")=((CARD3+CARD4)+CARD5)+CARD6
 S @STO@(REP,LIEN,"CARD4")=CARD4
 S @STO@(REP,LIEN,"CARD5")=CARD5
 S @STO@(REP,LIEN,"CARD6")=CARD6
 K @(TEMP)
 Q
L1 N TYPE
 K @(VAL)
 D MVG^%QSCALVA(REP,IND,LIEN,VAL,.TYPE)
 S OR=""
 F J=0:0 S OR=$O(@VAL@(OR)) Q:OR=""  D L2
 Q
 
 
L2 S OV=$$OVLIR^%QSXL2(REP,IND,LIEN,@VAL@(OR),OR),CARD=CARD+1
 I OV=0 S CARD0=CARD0+1 Q
 I OV=1 S CARD1=CARD1+1 Q
 I OV=-1 S CARD2=CARD2+1 D:STO2'="" STO(STO2,IND) Q
 I OV=-2 S CARD3=CARD3+1 D:STO3'="" STO(STO3,IND) Q
 I OV=-4 S CARD4=CARD4+1 D:STO3'="" STO(STO3,IND) Q
 I OV=-5 S CARD5=CARD5+1 D:STO3'="" STO(STO3,IND) Q
 I OV=-6 S CARD6=CARD6+1 D:STO3'="" STO(STO3,IND) Q
 Q
STO(STO,IND) S @STO@(IND)=""
 Q
 ;

