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

;%ABV4^INT^1^59547,73864^0
%ABV4 ;
 
 W !,!,$$^%QZCHW("Module 4 de verification des donnees"),!,?5,$$^%QZCHW("Initialisation et comprehension des abaques"),!
BEG D NETABAC K ^TACOMPIL($I) S PAGE=1,LI=1
LISTE S QU=QUI,Y1=-1 F UU=0:0 S Y1=$N(^[QU]SCRC(Y1)) Q:Y1=-1  I Y1'="GAMLAC" D TRAIT
FIN D ^%VCLEVAR,CURRENT^%IS,^%ABCPGEX
 D ^%VCLEVAR,CURRENT^%IS Q
TRAIT Q:'($D(^[QU]PRONUM(Y1)))
 S NORM=-1 F VV=0:0 S NORM=$N(^[QU]PRONUM(Y1,NORM)) Q:NORM=-1  S IDENT=-1 F WW=0:0 S IDENT=$N(^[QU]PRONUM(Y1,NORM,IDENT)) Q:IDENT=-1  D TYPN S NOMG=Y1,TYPGR="(P)",^TACOMPIL($I,PAGE,LI)=NOMG_"^"_NORM_"^"_IDENT_"^"_TYPGR_"^"_TYPNORM,LI=LI+1
END Q
TYPN S %NOM="^[QU]PRONUM(Y1,NORM,IDENT)" I $D(@%NOM)=10 D ^%VKMULNG G TYPNS
 S RS=@%NOM D ^%VKMULC
TYPNS S TYPNORM=$S($D(%RS(15)):%RS(15),1:"") K RS,%RS G END
NETABAC 
 S LISTB=$P($T(TAB),";;",2)
 F UU=1:1 S TB=$P(LISTB,",",UU) Q:TB=""  D KILL
FINI S ^[QUI]CPTEUR("GRILABAC")=1 K ^[QUI]CPTEUR("GROUPGRIL") S ^[QUI]CPTEUR("GROUPGRIL")=1 Q
KILL S TAB="^[QUI]"_TB,N=-1
 F VV=1:1 S N=$N(@TAB@(N)) Q:N=-1  W "." I N'="z" K @TAB@(N)
 Q
TAB ;;TOCPVPAR,TOCPVCOL,TOCPBORN,TOCPNUPL,DEFGROUP,GROUGRIL,RESUGRIL,PARAGRIL,REFABAC,INTERGRI,GRUPLET,EVALGRIL,GRILRESU,SSGROUP,SSGRGRI,GRTYPN,ABDEJEV,GRILRESU

