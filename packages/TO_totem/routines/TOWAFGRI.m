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

;TOWAFGRI^INT^1^59547,74876^0
TOWAFGRI ;
 
DEB D SCH^%ABGRIL
FREQ S YY=1,VAL=DP,DY=2,%PCH=^[QUW]OCGRIL(NOMG),PREF="" D ^%QZNBN1 I '(ISNUM) S PREF=^[QUW]OCGRIL(NOMG),VAL=$P(DP,PREF,2)
 S PDP=PVAR+VAL D POSGET
FREQ1 S YY=1,DX=0,DY=-1 F UU=0:0 S DY=$N(^[QU]STRUCT(NOMG,2,DY)) Q:DY=-1  X XY W ^[QU]STRUCT(NOMG,2,DY)
 Q
POSGET I TYPV="H" G SUIT
 F DX=10:ESPC+1 Q:YY>NBC  X XY W PREF_VAL S YY=YY+1,VAL=VAL+PVAR
 G FIN
SUIT S MIN=$E(DP,3,4),HEU=$E(DP,1,$L(DP)-2) S:HEU="" HEU=0 S:MIN="" MIN=0
 F DX=10:ESPC+1 Q:YY>NBC  S:$L(MIN)<2 MIN="0"_MIN S HEMI=HEU_MIN,LH=$L(HEMI),HEMI=$S(LH=2:"00",LH=3:"0",1:"")_HEMI X XY W HEMI S YY=YY+1,MINS=MIN+PVAR,MIN=$S(MINS<60:MINS,1:MINS-60),HEU=$S(MINS<60:HEU,1:HEU+1) S:HEU=24 HEU=0
FIN Q
POCLEPA W *
 Q
LISJEU 

