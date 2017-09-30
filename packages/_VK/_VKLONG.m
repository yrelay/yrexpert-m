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

;%VKLONG^INT^1^59547,74035^0
LONGET ;
 
 
 Q:('($D(NOMTAB)))!('($D(SCR)))
 S IN="",RS=""
 F ICC=1:1 Q:'($D(^%SCRE(SCR,ICC)))  S:$D(^%SCRE(SCR,ICC))'=11 RESUL(ICC)="" D IND:$D(^%SCRE(SCR,ICC))=11
 S NOM=NOMTAB_"("_IN_")" I $D(@NOM) D RES
 Q
RES D INDXE
RES2 S INL=1 F ICC=1:1:^%SCRE(SCR) Q:'($D(@NOM@(INL)))  I $D(^%SCRE(SCR,ICC))'=11 S RS=@NOM@(INL) D RES1
 Q
RES1 S INL=INL+1 F IX=1:2 S IXC=$P(RS,"^",IX),RZZ=IXC D CLEAR^%VKMST S IXC=RZZ,IXC=0+IXC Q:'(IXC)  S RESUL(IXC)=$P(RS,"^",IX+1)
 Q
IND 
 S IN=IN_$S(IN="":""""_RESUL(ICC)_"""",1:","_""""_RESUL(ICC)_"""")
 Q
INDXE S INDXE=0,NOM=%NOM F ICC=1:1:^%SCRE(SCR) I $D(^%SCRE(SCR,ICC))=11 S INDXE=INDXE+1,RESUL(ICC)=@("B"_INDXE)

