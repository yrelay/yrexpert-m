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

;TOP0EDCL^INT^1^59547,74873^0
TOP0EDCL ;
 
 D CLEPAG^%VVIDEO S %FIN=0,IMPR=0,DEV="ECR",DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG="EDITION DE CLICHES S.D.B." D TO4^%VZCD
 D ^TOP0DAHE G:'(%OK) FIN
LECSUP S DX=0,DY=6 D CLEBAS^%VVIDEO S DY=12 X XY W $$L19^%QSLIB1 R *SUP G:SUP=1 FIN G:(SUP'=69)&(SUP'=73) LECSUP
 S DOLARI=$I I SUP=69 D CLEPAG^%VVIDEO,132^%VVIDEO,AFF,80^%VVIDEO G FIN
 I $D(^TABIDENT(WHOIS,"PRINTER")) S IMPR=^TABIDENT(WHOIS,"PRINTER")
 W !,"Impression en cours..." O IMPR D AFF C IMPR
FIN K PG,LG,I,J,DATE,HEURE,REP,RET,%FIN,DOLARI,IMPR Q
AFF S PG=-1 F I=1:1 D:(I'=1)&(%FIN'=1) FINPAG S PG=$N(^[QUI]CLICHE(DATE,HEURE,PG)) Q:(PG=-1)!(%FIN=1)  U IMPR W # S LG=-1 F J=1:1 S LG=$N(^[QUI]CLICHE(DATE,HEURE,PG,LG)) Q:(LG=-1)!(%FIN=1)  D:(LG#20)=0 FINPAG U IMPR W !,^[QUI]CLICHE(DATE,HEURE,PG,LG)
 Q
FINPAG I (IMPR=0)!(IMPR=DOLARI) D POCLEPA^%VVIDEO W "Cliche No : ",PG,"      ",$$L2^%QSLIB R *RET D TOUCHE^%INCCLAV(RET,.RET) S:RET=1 %FIN=1 D CLEPAG^%VVIDEO Q

