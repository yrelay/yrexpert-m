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

;%DLJCPTI^INT^1^59547,73868^0
DLJCPTI ;
 
 S YA=ARTI
 D KTAB
RECABR K FLTAB S NOMTAB="^[QUI]DLJ" D GETNAMFU
 S ERREUR=0
 S (ETUD,ADEL)="DLJ",NTAB="^[QUI]FLPLJ(ARTI,"
 S IPREM=1,NCLE=4,PNUM=1,NFOR=1,F1=17
 D RECON^%DLJGABR
 I ERREUR D KTAB
FIN Q
 
 
VAL 
 N NOMTAB,FLTAB
 S YA=ARTI
 K ^[QUI]ADLJ(WB1,WB2,WB3,WB4)
 K FLTAB S NOMTAB="^[QUI]DLJ" D GETNAMFU
 S ERREUR=0
 D VAL^%DLJGABR
 I ERREUR K ^[QUI]ADLJ(WB1,WB2,WB3,WB4)
 Q
 
 
COND 
 N NOMTAB,FLTAB
 S YA=ARTI
 K ^[QUI]CDLJ(WB1,WB2,WB3,WB4,WB5)
 K FLTAB S NOMTAB="^[QUI]DLJCOND" D GETNAMFU
 S ERREUR=0
 D COND^%DLJGABR
 I ERREUR K ^[QUI]CDLJ(WB1,WB2,WB3,WB4,WB5)
 Q
 
GETNAMFU 
 D ^%VTNAMFU S:%NFU="" %NFU=NOMTAB
 S FLTAB=%NFU K %NF1,%NFU
 Q
 
KTAB F UU=0:1 S LTAB=$P($T(TAB+UU),";;",2) Q:LTAB=""  F VV=1:1 S TB=$P(LTAB,",",VV) Q:TB=""  S TB="^[QUI]"_TB_"(ARTI)" K @TB@(WB2,WB3,WB4)
 K UU,VV
TAB ;;CDLJ
 ;;ADLJ

