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

;%SGCOSTA1^INT^1^59547,73890^0
%SGCOSTA1 ;;09:30 AM  19 May 1993; ; 19 May 93  9:30 AM
 
 
 
 
STAT N STAT,TOT,NATPB,%NATPB,J,%J
 S STAT=$$TEMP^%SGUTIL,TOT=$$TEMP^%SGUTIL
 S V($J)=0
 D FOND
STBCL D MKAFF
 D AFF
 K @(STAT),@(TOT)
 Q
STAFI D CLEPAG^%VVIDEO,CURON^%VVIDEO Q
 
 
UN N STAT,TOT,NATPB,%NATPB,J,%J
 S STAT=$$TEMP^%SGUTIL,TOT=$$TEMP^%SGUTIL
 D FOND
 D MKAFF
 D AFF
 K @(STAT),@(TOT)
 D CURON^%VVIDEO Q
 
 
FOND D CLFEN^%VVIDEO(0,4,12,79)
 D CUROF^%VVIDEO
 
 
 S DX=1,DY=5 X XY W ?3,"job",?10,"contextes",?30,"traitements",?50,"TXP ",?66,"atelier "
 Q
 
MKAFF K @(STAT),@(TOT)
 
 S NATPB="" F %NATPB=0:0 S NATPB=$O(^[QUI]cptpb(NATPB)) Q:NATPB=""  S @TOT@(NATPB)=0,J="" F %J=0:0 S J=$O(^[QUI]cptpb(NATPB,J)) Q:J=""  S @STAT@(J,NATPB)=^[QUI]cptpb(NATPB,J),@TOT@(NATPB)=@TOT@(NATPB)+@STAT@(J,NATPB)
 
 Q
 
AFF D CLFEN^%VVIDEO(0,6,10,79)
 S I=0
 S J="" F %J=6:1 S J=$O(@STAT@(J)) Q:J=""  S DX=1,DY=%J X XY D LSTAT
 Q
 
LSTAT D:J=$J BLD^%VVIDEO S I=0
 W ?3,J
 F NATPB="SX","TRAITEMENT","TXP2RB","ATELIER" D CASE
 D:J=$J NORM^%VVIDEO
 Q
CASE 
 S V=$S($D(@STAT@(J,NATPB)):@STAT@(J,NATPB),1:0) W ?(15+(I*18))-$L(V),V
 S V=$S('($D(@TOT@(NATPB))):0,@TOT@(NATPB)=0:0,1:(V*100)\@TOT@(NATPB)) S:J=$J V($J,NATPB)=V S V="("_$S($L(V)=1:"  ",$L(V)=2:" ",1:"")_V_" %)" W ?16+(I*18),V S I=I+1
 Q
 
 
GETV 
 F NATPB="SX","TRAITEMENT","TXP2RB","ATELIER" D PBN
 Q
PBN 
 S TOT=0,J="" F %J=0:0 S J=$O(^[QUI]cptpb(NATPB,J)) Q:J=""  S TOT=TOT+^[QUI]cptpb(NATPB,J)
 S V($J,NATPB)=$S(TOT=0:0,'($D(^[QUI]cptpb(NATPB,J))):0,1:(^[QUI]cptpb(NATPB,J)*100)\TOT)
 Q
 ;

