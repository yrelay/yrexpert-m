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

;%QSMJMAC^INT^1^59547,73882^0
QSMJMAC(%RE,%PT) 
 
 
 
 
 
 
 
 
BEG N FC,RF,%U,%V,FQ
 G KILL:'($$IR^%QSGEST5(%RE,%PT)),EXIS:$D(^[QUI]DESMACH(%PT))
 S FC=$$FA S:FC="" FC=%PT S RF="",%V=^%SCRE("DESMACH") F %U=1:1:%V S RF=RF_$S($D(^%SCRE("DESMACH",%U,"QUERY")):$C(26),$D(^%SCRE("DESMACH",%U,"LIEN")):$C(26),1:"")_"^"
 S ^[QUI]DESMACH(%PT,FC)=RF G FIN
EXIS S FC=$O(^[QUI]DESMACH(%PT,"")),FQ=$$FA S:FQ="" FQ=%PT G:FC=FQ FIN
 S RF=^[QUI]DESMACH(%PT,FC) K ^[QUI]DESMACH(%PT) S ^[QUI]DESMACH(%PT,FQ)=RF G FIN
KILL G:%PT="" FIN
 K ^[QUI]DESMACH(%PT)
 S RF="" F %U=1:1 S RF=$O(^%SCRE("DESMACH","RELATION",RF)) Q:RF=""  I $D(^%SCRE(RF,"GLOSTOC")) K @(^%SCRE(RF,"GLOSTOC")_"(%PT)")
FIN Q
FA() Q $$^%QSCALVA(%RE,%PT,"FAMILLE.POSTE")
ATTR(X) D CLEPAG^%VVIDEO,^%VZCD0("attributs de "_X)
 D ^%QSATTRI(X,"POSTE.DE.TRAVAIL",0,6,80,17),CLEPAG^%VVIDEO Q
OUT(X) D CLEPAG^%VVIDEO,^%VZCD0("attributs de "_X)
 D ^%QSATTRI(X,"OUTILLAGE",0,6,80,17),CLEPAG^%VVIDEO Q

