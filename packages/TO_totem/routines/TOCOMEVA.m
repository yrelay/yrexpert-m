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

;TOCOMEVA^INT^1^59547,74871^0
TOCOMEVA ;
 
PREMIS W !,$$^%QZCHW("Valeur des premisses : "),!,! S PPGR=-1 F QQ=0:0 S PPGR=$N(VPAR(PPGR)) G:PPGR=-1 END W !,?10,PPGR,?40," = ",VPAR(PPGR)
ECHEC W !,!,?10,$$^%QZCHW(" Echec sur l'evaluation ! ") G END
SELEC W !,!,$$^%QZCHW("Valeur retenue pour les premisses : "),!,! S PPG=-1 F QQ=0:0 S PPGR=$N(GRIL(PPGR)) Q:PPGR=-1  W !,?10,PPGR,?40," = ",GRIL(PPGR)
 W !,!,$$^%QZCHW("Parametres resultants et leurs valeurs "),!
 S DP=$P(%PG,"/",1),NBC=3 D PGE^%ABGRPAG S COL=$P(%PG,"/",2),COL=$S(COL=10:1,COL=33:2,1:3) W !,?10,$$^%QZCHW("Selection de la colonne "),COL,$$^%QZCHW(" de la page "),PGE,!
 F IU=0:0 S PRESU=$N(@%TAB@(PRESU)) Q:PRESU=-1  W !,?10,PRESU,?40," = ",^V($I,YA,PRESU)
END Q
DEFABA W ! F WRE=1:1:80 W "-"
 S RREE=$P(^[QUW]GROUGRIL(NUGR),"|",2) W !,!,$$^%QZCHW("Traitement de l'abaque : "),!,!
 W ?10,$P(RREE,"^",1),?50,$P(RREE,"^",2),!,?50,$P(RREE,"^",3),!,?50,$P(RREE,"^",4) G END
NONORM W !,!,$$^%QZCHW("Evaluation avortee ! La norme ne correspondant pas !!") G END

