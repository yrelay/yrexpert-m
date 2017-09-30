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
;! HL002 ! HL     ! 26/08/12 ! ZN n'existe par pour GTM                       !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%TXPNET^INT^1^59547,74032^0
%TXPNET ;;08:19 PM  18 Jan 1996; 17 Sep 92 10:50 AM ; 24 Mar 93  2:09 PM
 
 
 
 
SUPROUT 
 N TEMP,I,J,PRF,LV,CH,ROUSUP,ROUNOSUP,ROU
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"SY")
 S TEMP="^["""_$P($ZPOS,"^",2)SPACE_"""]"_$E(TEMP,2,$L(TEMP)) K @(TEMP)
 S ROUSUP=$$CONCAS^%QZCHAD(TEMP,"R")
 S ROUNOSUP=$$CONCAS^%QZCHAD(TEMP,"N")
 D CLEPAG^%VVIDEO
 F I=0:1 S LV=$T(SYSEXT+I),CH=$P(LV,";;",2) Q:CH=""  F J=1:1 S ROU=$P(CH,"/",J) Q:ROU=""  I $$EXIROU^%SYSROUT("SYS",ROU) W !,"ajout de "_ROU S @ROUSUP@(ROU)=""
 S ROU="" F I=0:0 S ROU=$O(@ROUNOSUP@(ROU)) Q:ROU=""  K @ROUSUP@(ROU)
 D CLEPAG^%VVIDEO
 S ROU="" F I=0:1 S ROU=$O(@ROUSUP@(ROU)) Q:ROU=""  S DX=10,DY=10 X XY W ROU_$J("",10)
 S DX=5,DY=18 X XY W I_" routines a supprimer "
 
 I $$CONFIRM^%VZEOUI("ok") D SUPROU^%SYSROUT("SYS",ROUSUP)
 K @(TEMP)
 ;HL002 ZN $$PCONF^%INCASTS("PROG")
 S ZN=$$ZGBLDIR^%GTM($$PCONF^%INCASTS("PROG"))
 Q
 
SYSEXT ;;%TXP1RB/%TXP1RC/%TXP1RCC/%TXP2R/%TXP2RC/%TXP2RC1/%TXP2RCO/%TXPACT/%TXPCSLV/%TXPDRIV/
 ;;%TXPKCRE/%TXPKSA1/%TXPKSA2/%TXPKSCK/%TXPKSD/%TXPSLA/%TXPSIN/%TXPSLT/%TXPSLV/%TXPSUT3/
 ;

