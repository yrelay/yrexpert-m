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
;! Nomprog     : %MZGLO                                                       !
;! Module      : MOZART                                                       !
;! But         : Générer le contenu de la global ^MOZ.                        !
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
;! HL002 ! HL     ! 12/09/09 ! Undefined local variable: %MZGLO1.             !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

%MZGLO ;
MOZGLO ;

 ;HL002 RESTOR k ^MOZ s $zt="",X0="ZL @("""_$P($ZPOS,"^",2)_"""_I) F J=3:1 S LI=$T(+J) Q:LI=""""  S LI=$P(LI,"";;"",2,500) Q:LI=""""  S RF=$P(LI,""="",1),VL=$P(LI,""="",2,500),@RF=VL" f I=1:1:15 x X0

RESTOR K ^MOZ S $ZT="",X0="ZL (""_"_$P($ZPOS,"%",2)_"""_I) S R="""_$P($ZPOS,"^",2)_"""_I F J=1:1 S LI=$T(DATA+J^@R) Q:LI=""""  S LI=$P(LI,"";;"",2,500) Q:LI=""""  S RF=$P(LI,""="",1),VL=$P(LI,""="",2,500),@RF=VL" F I=1:1:15 X X0

FIN Q

