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

;LKGEN^INT^1^59547,74867^0
LKGEN(AS,NS,DS,AD,ND,DD,PROT,VECT,ID,IF,CNT) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N I,ROOTS,ROOTD,ERRA,TEMP,DATA,PAR,PVECT,ER
 
 
 
 S ROOTS="^[QUI]LK("""_AS_""","""_NS_""","""_DS_""")"
 S ROOTD="^[QUI]LK("""_AD_""","""_ND_""","""_DD_""")"
 S ERRA=$$EX^LKZ(ROOTS)_",""ERR"")"
 S TEMP="^TEMPORAI($J,""LKGEN"")"
 S DATAS=$$EX^LKZ(ROOTS)_",""DATA"")"
 S DATAD=$$EX^LKZ(ROOTD)_",""DATA"")"
 S PAR=$$EX^LKZ(TEMP)_",""PAR"")"
 S PVECT=$$EX^LKZ(TEMP)_",""PVECT"")"
 S ADRPROT=PROT_"^LKLOPRO"
 
 
 K @(TEMP)
 F I="ROOTS","AS","NS","DS","ROOTD","AD","ND","DD","PROT","VECT" S @PAR@(I)=@I
 D ^LKTXTN(VECT,PAR)
 D ^LKTXTN(ADRPROT,PVECT)
 
 F I="ID","IF","CNT" S:@I="" @I=""""""
 S @("ER=$$"_@PVECT@("FCT")_"("_ID_","_IF_","_CNT_")")
 Q ER

