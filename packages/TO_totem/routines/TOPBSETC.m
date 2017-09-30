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

;TOPBSETC^INT^1^59547,74874^0
TOPBSETC ;
 
 K ^LISTAFF($I),^SELEC($I) D ^TOPBGREQ G:'($D(^%QUERADM($I))) FIN S DX=0,DY=6 D CLEBAS^%VVIDEO W !,!,!,"Un instant..." D L7^%QSLIB S DX=0,DY=7 X XY
 S LI=100,STOP=0,EGAP=0,CONT=1,%REQ=-1 F %U=0:0 S %REQ=$N(^%QUERADM($I,%REQ)) Q:%REQ=-1  S ARC=-1 F %U=0:0 S ARC=$N(^%QUERADM($I,%REQ,ARC)) Q:ARC=-1  D TRAIT
 S %PROGTR="^TOPBTRSE" D ^TOPBAFPA,^TOPBETMG
FIN K %PROGTR,^%QUERADM($I),^SELEC($I),DATE,HOUR,ARC,%AA,B2,%BB,TAD,%RS,B3,PPAGE,LI,STOP
 Q
TRAIT S B2=-1 F %BB=1:1 S B2=$N(^[QUI]PSRLRTES(ARC,B2)) Q:B2=-1  S TAD=$P(^[QUI]PSRLRTES(ARC,B2),"^",2) Q:'($D(^[QUI]TREEWORK(B2)))  S %RS(1)=$P(^[QUI]TREEWORK(B2,0),"^",4),B3=0 D ^TOPBAFET
 Q

