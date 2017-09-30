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

;TO3GARG^INT^1^59547,74870^0
TO3GARG ;
 
DEB S MENUARG=NUARG K %TARG Q:EXPARG'["$"  D INDICE,^TO3GPDOL
 S POSD="" F HH=0:0 S POSD=$O(%TPDOL(POSD)) G:POSD="" FIN S POSDOL=-(POSD) D TRAIT
TRAIT S LARG=$L(EXPARG),PTH1=$F(EXPARG,"(",POSDOL)-1 D ^TO3THCOR
 S EXP=$E(EXPARG,POSDOL,PTHCOR) D ^TO3AFARG I %AFF=1 S %TARG(NUARG)=EXP,EXPARG=$E(EXPARG,1,POSDOL-1)_"$ARG"_NUARG_%IND_$E(EXPARG,PTHCOR+1,299),^[QUI]DELIMP(ARTI,"$ARG"_NUARG)=1,^[QUI]FULL(ARTI,"$ARG"_NUARG)=1,NUARG=NUARG+1
 
 Q
FIN S NNU=-1,LINUAR=NUARG-1 F ZZ=MENUARG:1:LINUAR S SSEXP=%TARG(ZZ) D ^TO3AJUAR S %TARG(ZZ)=FONCT
 D ^TO3IMFIC,EXPARG K %TARG,%AFF,LINUAR,ZZ,HH,POSD,POSDOL,LARG,PTH1,PTHCOR,NNU,FONCT Q
TEST S NCLE=1,B1=1,TABFICT="TB",ARTI="XXX",NUARG=1 W !,$$^%QZCHW("Expression a tester : ") R EXPARG Q:EXPARG=""  D ^TO3GARG F I=1:1 Q:'($D(%TARG(I)))  W !,%TARG(I)
 G TEST
EXPARG S REF=""""_ARTI_"""" F ZZ=2:1:NCLE S REF=REF_","""_@("B"_ZZ)_""""
 S VV=-1 F UU=1:1 S VV=$N(%TARG(VV)) Q:VV=-1  S ARG="$ARG"_VV_%IND,^[QUI]DEPARG(ARTI,ARG)=REF
 K ARG Q
INDICE S %IND="~",XDP=EXPARG D ^TORECITE S IT=-1 F %U=1:1 S IT=$N(IT(IT)) Q:IT=-1  I $D(^[QUI]INDICE(ARTI,"IND",IT)) S %IND=%IND_IT_"~"
 S %IND=$E(%IND,1,$L(%IND)-1) Q

