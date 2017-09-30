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

;TO3GEQUI^INT^1^59547,74870^0
TO3GEQUI ;
 
 S:'($D(%DESAC)) %DESAC=0 D ^TO4GEXPL,^TO4CHSOU K ^EQUIVAL($I),^DESACOR($I)
 S ADR="TRAIT^TO3GEQUI",NOMTAB=TABCOM_"(YB",NUEQ=1 D ^%VTENR
 Q
TRAIT I $D(^TOZE($I,"TRACOMP")),^TOZE($I,"TRACOMP")=1 W !,B2
 S %ARTCOMP=%RS(1),%NDESAC=0 D ^TO4CHVAL,^TO4COMPA
 I %ACCECH=1 S ^EQUIVAL($I,NUEQ)=B2_"^"_%ARTCOMP_$S($D(^[QUI]TREEWORK(B2)):$S($P(^[QUI]TREEWORK(B2,0),"^",2)=$P(%ARTCOMP,"/",1):"",1:" dans "_$P(^[QUI]TREEWORK(B2,0),"^",2)),1:$$^%QZCHW("Etude non archivee"))
 S NUEQ=NUEQ+1 Q
 
TEST W !,$$^%QZCHW("quel article : ") R YA Q:YA=""
 S YB=YA,NU=-1 F UU=0:0 S NU=$N(^[QUI]EXPLICI(YA,NU)) Q:NU=-1  S PAR=$N(^[QUI]EXPLICI(YA,NU,-1)) W !,?10,PAR," ? " R VAL S ^V($I,YA,PAR)=VAL
 W !,$$^%QZCHW("Merci..."),! D ^TO4GEQUI
 S NU=-1 F UU=0:0 S NU=$N(^EQUIVAL($I,NU)) Q:NU=-1  W !,^EQUIVAL($I,NU)
 G TEST

