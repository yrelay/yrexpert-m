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

;%TXCSAN^INT^1^59547,74031^0
%TXCSAN ;
 
 
 
 
 
 S QUI="IF"
 F I=1:1:4 S GLOB="^[QUI]QUERY"_I_"(""CSA"")",GLOT="^[QUI]QUERYT",REP="CSA" D TEN Q
 Q
TEN S IND="" F I=0:0 S IND=$O(@GLOB@(IND)) Q:IND=""  D NET
 Q
NET 
 S X=5,Y=10,DX=10,DY=20 X XY W "                                                            "
 S X=5,Y=10,DX=10,DY=20 X XY W "DESTRUCTION DE L'INDIVIDU : ",IND
 D SX^%QSGESTI(REP,IND)
 K @GLOT@(REP,IND)
 Q
LIEN 
 S GLOB="^[QUI]QUERY2(""PATIENT"",""CSA"",""CSA"",""CSA"")",REP="PATIENT",ATT="CSA"
 S IND="" F I=0:0 S IND=$O(@GLOB@(IND)) Q:IND=""  D NETLI
 Q
NETLI 
 D PSO^%QSGESTI(REP,IND,ATT,ATT)
 S X=5,Y=10,DX=10,DY=20 X XY W "DESTRUCTION DU LIEN CSA DE ",IND
 Q
 
 
 
 
NET2 
 N I,II,III,VAL,IND,OBJ
 S VAL="" F I=1:1 S VAL=$O(^[QUI]QUERY2("PATIENT","CSA",VAL)) Q:VAL=""  S IND="" F II=1:1 S IND=$O(^[QUI]QUERY2("PATIENT","CSA",VAL,IND)) Q:IND=""  S OBJ="" F III=1:1 S OBJ=$O(^[QUI]QUERY2("PATIENT","CSA",VAL,IND,OBJ)) Q:OBJ=""  D TUECSA
 Q
TUECSA 
 W !,!,"VAL ",VAL," IND ",IND," OBJ ",OBJ
 K ^[QUI]QUERY1("PATIENT",OBJ,"CSA")
 K ^[QUI]QUERY2("PATIENT","CSA",VAL,IND,OBJ)
 K ^[QUI]QUERY3("PATIENT",OBJ,IND,"CSA")
 K ^[QUI]QUERY4("PATIENT",IND,"CSA")
 Q
 
 
 
TUEQU 
 N REP,I
 S REP="" F I=1:1 S REP=$O(^[QUI]QUERY2(REP)) Q:REP=""  D:REP["," KQU
 Q
KQU 
 W !,REP
 B  K ^[QUI]QUERY1(REP)
 K ^[QUI]QUERY2(REP)
 K ^[QUI]QUERY3(REP)
 K ^[QUI]QUERY4(REP)
 Q

