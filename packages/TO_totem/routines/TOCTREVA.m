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

;TOCTREVA^INT^1^59547,74871^0
TOCTREVA ;
 K CTV S CTV("TB")="^PHASADM($I,NUFA,TWREF,""TOCTREV"")",CTV("TB1")="^[QUI]TOCTREVO(YA,0)",CTV("TB2")="^[QUI]TOCTREVO(YA,1)"
 S CTV("NF")=-1 F CTV("%U")=1:1 S CTV("NF")=$N(@CTV("TB1")@(CTV("NF"))) Q:CTV("NF")=-1  D T0 S @CTV("TB")@(0,CTV("NF"))=CTV("PER")_"^"_CTV("REF")
 S CTV("P")=-1 F CTV("%U")=1:1 S CTV("P")=$N(@CTV("TB2")@(CTV("P"))) Q:CTV("P")=-1  S CTV("NF")=-1 F CTV("%V")=1:1 S CTV("NF")=$N(@CTV("TB2")@(CTV("P"),CTV("NF"))) Q:CTV("NF")=-1  D T0 S @CTV("TB")@(1,CTV("P"),CTV("NF"))=CTV("PER")_"^"_CTV("REF")
FIN K CTV Q
T0 S CTV("REP")=^[QUI]IREPFICH(YA,CTV("NF")),CTV("REF")=$P(CTV("REP"),"^",2),CTV("CTR")=@("^[QUI]TOCTREV(YA,"_CTV("REF")_")"),CTV("PER")=$P(CTV("CTR"),"^",1),CTV("PER")=$S(CTV("PER")=$$^%QZCHW("PERMANENT"):CTV("PER"),1:$$^%QZCHW("EPHEMERE")) Q

