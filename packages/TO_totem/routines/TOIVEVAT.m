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

;TOIVEVAT^INT^1^59547,74872^0
TOIVEVAT ;
 D ^TOIVPOP,RFSH^TOEVCOUR K ^V($I) S ID=$P(%ART,":",2),%ART=$P(%ART,":",1),(%ARTYA,%ARTYB,YA,YB)=%ART I $D(^[QUI]ACOMMEB(%ART)) S (%ARTYA,YA)=$P(^[QUI]ACOMMEB(%ART),"^",1)
 D ^TO4GEXPL S NU=-1
LEX S NU=$N(^TO4GEXPL($I,NU)) G:NU=-1 T0 S PARA=^TO4GEXPL($I,NU),VPA=$P(ID,"/",NU),CHP=^[QUI]EXPLICI(YA,NU,PARA) D ^TOTVLEG G:'(VOK) FIN S ^V($I,YA,PARA)=VPA G LEX
T0 S %ABEND=0,(%TREFC,%TABTV,%TABRA,TWREF,NOMTREE,%PR,STOP)="X" K ^ADRTRAIT($J) F %U=0:1 S LI=$P($T(TR+%U),";;",2) Q:LI=""  F %V=1:1 S %W=$P(LI,"/",%V) Q:%W=""  S ^ADRTRAIT($J,$P(%W,",",1))="^"_$P(%W,",",2)
 D CHAR S NBT=-1
LBUT S NBT=$N(^BUT($J,NBT)) G:NBT=-1 FIN S BUT=^BUT($J,NBT),%DOM=$P(BUT,"~",1),%IMPL=$P(BUT,"~",2) D ^TOTBACK,AFF G LBUT
FIN Q
TRAIT S DOM=$P($P(%N,",",2),"""",2),%REG=$P(%N,",",4),YB=$P($P(%N,",",1),"""",2),YA=$S($D(^[QUI]ACOMMEB(YB)):$P(^[QUI]ACOMMEB(YB),"^",1),1:YB) Q:'($D(^ADRTRAIT($J,DOM)))  D @^ADRTRAIT($J,DOM) Q
AFF I %DOM="IMPLICI" S ^[QUI]EVBACK(NUFA,%IMPL)=$S($D(^V($I,%ARTYA,%IMPL)):^V($I,%ARTYA,%IMPL),1:"???")
END Q
CHAR S PREF="END^TOIVEVAT",POSF="TRAIT^TOIVEVAT",G="^BACKIMPL($J)" Q
TR ;;IMPLICI,TOIVIMPG/

