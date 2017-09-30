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

;TOWPTEX2^INT^1^59547,74876^0
TOWPTEX2 ;
 
 S AUTOMA="A" K IO,IOP U 0 D CLEPAG^%VVIDEO
 W !,!,$$^%QZCHW(" Preparation d'un cliche pour "),NUFA,!,!,!,$$^%QZCHW("*** Document : CLICHES ATF *** Exemplaire no "),%EXPL
 S USR=2,FRM=1,VAR="^[QUI]WPSCR($J,V)",LIST="",PRINT=0,IODES=""
DATE D ZD^%QMDATE4 S MOIS=$P(%DAT,"/",2) D JOUR
 S MO=$P($$^%QZCHW("janvier,f{vrier,mars,avril,mai,juin,juillet,aout,septembre,octobre,novembre,d{cembre"),",",MOIS)
 S %DAT1=JO_" "_MO_" 19"_$P(%DAT,"/",3)
 D ^TOPARTEX
 S LIBRE=14,DOC=$$^%QZCHW("CLICHE EN VARIABLE")
 S POP=0,PRINT=0,IODES="",USR=2,FRM=1,VAR="^[QUI]WPSCR($J,V)" D ^TOWPTEX3
 
 Q
JOUR S JOUR=$P(%DAT,"/",1),JO=JOUR S:$E(JOUR,1,1)=0 JO=$E(JOUR,2,2)

