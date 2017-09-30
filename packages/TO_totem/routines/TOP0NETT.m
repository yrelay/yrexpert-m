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

;TOP0NETT^INT^1^59547,74874^0
TOP0NETT ;
 
NET0 
 S GLANET=$T(GLN),GLANET=$P(GLANET,";;",2),GLATES=$T(GLT),GLATES=$P(GLATES,";;",2)
 F %II=1:1 S GLN=$P(GLANET,";",%II),GLT=$P(GLATES,";",%II) Q:GLN=""  D NET
NET1 
 S P=-1 F %II=1:1 S P=$N(^[QUI]P0GETARC(P)) Q:P=-1  S V=-1 F %JJ=1:1 S V=$N(^[QUI]P0GETARC(P,V)) Q:V=-1  S ARC=-1 F %KK=1:1 S ARC=$N(^[QUI]P0GETARC(P,V,ARC)) Q:ARC=-1  D K2
NET2 
 S ARC=-1 F %II=1:1 S ARC=$N(^[QUI]CLICHE(ARC)) Q:ARC=-1  I ARC'="z" S DH=^[QUI]COMMEXI(ARC),D=$P(DH,"^",1),H=$P(DH,"^",2) I '($D(^[QUI]P0GETARC(D,H,ARC))) K ^[QUI]CLICHE(ARC),^[QUI]COMMEXI(ARC) W "X"
FIN K ARC,GLNET,GLATES,GLT,GLN,%II,%JJ,%KK,INEX,P,V,ARC,%II,%JJ Q
 Q
K2 Q:ARC="z"  I ('($D(^[QUI]CLICHE(ARC))))&('($D(^[QUI]PSRLFILI(ARC)))) K ^[QUI]P0GETARC(P,V,ARC) W "|"
 Q
NET S ARC=-1 F %JJ=1:1 S ARC=$N(@GLN@(ARC)) Q:ARC=-1  D KILL
 Q
KILL Q:ARC="z"  S INEX=1 F %KK=1:1 S GT=$P(GLT,",",%KK) Q:GT=""  I '($D(@GT@(ARC))) S INEX=INEX+1
 I INEX=%KK K @GLN@(ARC) W "."
 Q
GLN ;;^[QUI]PARCLICH;^[QUI]PSRLPARF;^[QUI]PSRLRTES;^[QUI]COMMEXI
GLT ;;^[QUI]CLICHE,^[QUI]PSRLFILI;^[QUI]PSRLFILI;^[QUI]PSRLFILI;^[QUI]PSRLFILI;^[QUI]CLICHE

