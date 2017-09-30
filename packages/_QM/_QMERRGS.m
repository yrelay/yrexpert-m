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

;%QMERRGS^INT^1^59547,73878^0
QMERRGS ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
CREA(S,OK) 
 N TEMPB,TEMPO,CATT,MENU1,RESUL,GLO
 I $$IR^%QSGEST5("SAISIE.I",S) G MODIF
 D AJ^%QMEAMOD(.S)
 I S="" S OK=0 Q
MODIF 
 S TEMPB=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMPB)
 S TEMPO=$$CONCAS^%QZCHAD(TEMPB,"VARIABLES")
 D INIT^%ANGEPIL
 D EMPIL^%ANGEPIL("RETMOS^%QMERRGS") G ^%QMEAMOD
RETMOS 
 S OK=1
 D EPIL^%ANGEPIL
 K @(TEMPB)
 Q
 
 N MN,MEN1,AD,CONTR,RESUL,SCR,QMEA01
 N S,GLO,AFF,VAL,ORD,ATT,IND,AT,NOT,RETOUR
 S MN="MEN1",SCR="QMEASG",RETOUR="RETCREA^%QMERRGS"
 K RESUL S RESUL(1)=SAISIE
 G AJ1^%QMEASA1
RETCREA S:S="" OK=0
 S OK=1,SAISIE=S
 Q
 
 
 
 
AFFI(SAISIE) 
 D ^%QMEAMOD(SAISIE)
 Q
 
 
 
 
 
 
 
MOD(SAISIE,OK) 
 D ^%QMEAMOD(SAISIE)
 S OK=1
 Q

