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

;%TLTRDA2^INT^1^59547,74031^0
TLTRDIA2(NOM) 
 N %II,%III,FICH,VAL,VAL2
 S BID="INVISIBLE"
 
 S BASE=CXT("@","BASE"),INDIVIDU=CXT("@","OBJET")
 G EXT1
EXT(NOM,BASE,INDIVIDU) 
EXT1 D TITRE K ^LTAN($I) S FICH="" F %II=1:1 S FICH=$O(^[QUI]TLDIAL(NOM,FICH)) Q:FICH=""  S VAL=^[QUI]TLDIAL(NOM,FICH),NB=$L(VAL,"^") F %III=1:1:NB S VAL2=$P(VAL,"^",%III) I VAL2'="" S ^LTAN($I,VAL2)=$$^%QSCALVA(BASE,INDIVIDU,VAL2)
 D ^%QUSAIS2("^LTAN($I)",0,10,80,12)
 S ATTR=""
 F %II=1:1 S ATTR=$O(^LTAN($I,ATTR)) Q:ATTR=""  D TEST
 
 D CLEPAG^%VVIDEO Q
TEST S RESUL=^LTAN($I,ATTR) I RESUL["^" F %B=1:1 S PART=$P(RESUL,"|",%B) Q:PART=""  S PA1=$P(PART,"^",1),PA2=$P(PART,"^",2) D PA^%QSGESTI(BASE,INDIVIDU,ATTR,PA2,PA1)
 Q:RESUL["|"
 D PA^%QSGESTI(BASE,INDIVIDU,ATTR,^LTAN($I,ATTR),1) Q
TITRE D BLD^%VVIDEO S MSG="Mentionnez la valeur des attributs pour l'individu : "_INDIVIDU,DXG=1,DXD=78,DYH=2,DYB=6,GRAPH=0 D CLEPAG^%VVIDEO,4^%VZCD,NORM^%VVIDEO Q

