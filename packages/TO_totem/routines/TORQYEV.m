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

;TORQYEV^INT^1^59547,74875^0
TORQYEV ;
 
 
 
 
 
 
 
 
 I $$^%QCAZG("REGLE")'="" G REGLE
 
 
 I OR'=1 G FAUX
 I AT="NOM" S VAL1=OBJS G SUITE
 I '($D(^[QUI]TVPAR(NU,TW,AT))) G FAUX
 S VAL1=^[QUI]TVPAR(NU,TW,AT)
SUITE 
 S VAL2=$$^%QSCALIN(REPC,OBJCIB,AT,OR) I VAL2="" G FAUX
 I VAL1=VAL2 G ACT
 I V1="=" G EGAL
 I V1="*" G QQV1
 I V2="*" G QQV2
 I V1'=VAL1 G FAUX
 I V1'=VAL2 G FAUX
 G ACT
 
EGAL 
 I VAL1'=VAL2 G FAUX
 G ACT
 
QQV1 
 I V2="*" G ACT
 I VAL2=V2 G ACT
 G EGAL
QQV2 
 I VAL1=V1 G ACT
 G EGAL
 
FAUX 
 G FAUX^%SCOA1
 
ACT 
 G ACT^%SCOA1
 
 
REGLE 
 I (VAR'="@")&(VAR'="REFERENCE") G SATT2^%ANARBR2
 I NOM="NOM" S VAL=CARBR1(VAR,"OBJET") G DEPIL^%ANGEPIL
 I '($D(^[QUI]TVPAR(NU,TW,NOM))) S POS=0,VAL="" G DEPIL^%ANGEPIL
 S VAL=^[QUI]TVPAR(NU,TW,NOM) G DEPIL^%ANGEPIL

