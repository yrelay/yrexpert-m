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

;%ABIMPGR^INT^1^59547,73864^0
%ABIMPGR ;
 
 S IMPR=^TABIDENT(WHOIS,"PRINTER") O IMPR U IMPR
 W #,!,!,!
 S LIB=^TABIDENT(WHOIS,"ENTETE"),MSG="" F UU=1:1 S CC=$E(LIB,UU) Q:CC=""  S MSG=MSG_CC_" "
 W !,?40-($L(MSG)\2),MSG,!,!,?40-(($L(WHOIS)+4)\2),"* ",WHOIS," *",!,!,!,!,!
 W !,?5,$$^%QZCHW("Objet : "),NOMG,?45,$$^%QZCHW("Norme : "),%NORM,!,?5,$$^%QZCHW("Identification : "),%IDENT,?45,$$^%QZCHW("Titre : "),RESUL(4)
 S LCHP1=LCHP+1,LLI=$L(LIG2)+8,COL=DP,XX=9 W ! F WW=1:1:NBC W ?XX,":",COL S XX=XX+LCHP1,COL=COL+PVAR
 W ?LLI,":"
 W !,?9,LIG2
 S %VV="P",CV=0,CP=%CP+3,CP=%CP F YY=4:1 D TRAIT Q:CV=%CP
 W !,?9,LIG2 S CP=%CR,CV=0,%VV="R",CP=PSEP+%CR
 F YY=PSEP+1:1 D TRAIT Q:CV=%CR
 W !,?9,LIG2
 W !,?5,$$^%QZCHW("Date : "),RESUL(17),?45,$$^%QZCHW("Type norme : "),RESUL(18)
 S HH="* "_HEURE_" *" W !,?40-($L(HH)\2),HH,?60,$$^%QZCHW("Page : "),PGE
 W !,!,!,!,!,!,?29,$$^%QZCHW("- Edite le "),%DAT," -"
 W !,! S MSG=$$^%QZCHW("- T O T E M  copyright Yrelay -") W ?40-($L(MSG)\2),MSG,!
FIN W *23,*13 C IMPR Q
TRAIT 
 
 I '($D(^[QUW]STRUCT(NOMG,2,%VV,YY))) G END
 
 W !,^[QUW]STRUCT(NOMG,2,%VV,YY) S CV=CV+1
 I '($D(^[QUW]OCGRIL(NOMG,%NORM,DP,%VV,YY))) W ?9,LIG3 G END1
 S COL=10,XX=10 F UU=1:1:NBC S LIB=$S($D(^[QUW]OCGRIL(NOMG,%NORM,DP,%VV,YY,XX)):^[QUW]OCGRIL(NOMG,%NORM,DP,%VV,YY,XX),1:"") W ?XX-1,":",LIB S XX=XX+LCHP1
 W ?LLI,":" G END1
END1 I $D(^[QUW]OCUNIT(NOMG,%NORM,%IDENT,%VV,YY)) W " ",^[QUW]OCUNIT(NOMG,%NORM,%IDENT,%VV,YY)
END Q

