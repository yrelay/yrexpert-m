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

;%ABDLPA^INT^1^59547,73864^0
%ABDLPA ;
 
 S %PY=$Y D ^%ABPAR S EFF="        ",PY=%PY+%D
 I '($D(^[QU]OCGRIL(NOMG))) S AEFF=EFF D EFF K ^[QU]STRUCT(NOMG,2,%V,PY) G FIN
 D POCLEPA^%VVIDEO I $$MES^%VZEOUI($$^%QZCHW("Voulez-vous supprimer cette ligne de l'abaque")_" ? ","O")'=1 D POCLEPA^%VVIDEO S AEFF=EFF D EFF S AEFF=$S($D(^[QU]STRUCT(NOMG,2,%V,PY)):^[QU]STRUCT(NOMG,2,%V,PY),1:AEFF) D EFF G FIN
 D POCLEPA^%VVIDEO W $$^%QZCHW("Destruction em cours..")
 S AEFF=EFF D EFF K ^[QU]STRUCT(NOMG,2,%V,PY)
 S NORM=-1 F WU=1:1 S NORM=$N(^[QU]OCGRIL(NOMG,NORM)) Q:NORM=-1  S IDP=-1 F WV=1:1 S IDP=$N(^[QU]OCGRIL(NOMG,NORM,IDP)) Q:IDP=-1  K ^[QU]OCGRIL(NOMG,NORM,IDP,%V,PY)
 D POCLEPA^%VVIDEO S DX=0,DY=%PY
 
FIN K AEFF,EFF,WV,WU,REP,NORM,IDP Q
 
EFF S DX=0,DY=%PY X XY W AEFF Q

