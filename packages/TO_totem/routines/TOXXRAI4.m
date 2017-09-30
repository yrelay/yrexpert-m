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

;TOXXRAI4^INT^1^59547,74877^0
TOXXRAI4 ;
NEWS S NEW=PAGIN(PGE,PY,PX) G:NEW'["'" NORM K AP S AP(1)=$P(NEW,"'",1),AP(2)=$P(NEW,"'",2) G MAT:AP(2)=$$^%QZCHW("MATIERE"),ART:AP(2)=$$^%QZCHW("ARTICLE")
 I '($D(^OBJVU($J,AP(2)))) S ^PILAVER($J,TPL)=AP(1)_"^MAT^???^"_AP(2)_"^"_NUFA G FIN
 I ^OBJVU($J,AP(2))=1 S TW=$O(^OBJVU($J,AP(2),"")),^PILAVER($J,TPL)=AP(1)_"^ART^"_TW_"^"_AP(2)_"^"_NUFA G FIN
 S TW="" F %U=1:1 S TW=$O(^OBJVU($J,AP(2),TW)) I TW[TWREF S ^PILAVER($J,TPL)=AP(1)_"^ART^"_TW_"^"_AP(2)_"^"_NUFA G FIN
 S TW="" F %U=1:1 S TW=$O(^OBJVU($J,AP(2),TW)) I TWREF[TW S ^PILAVER($J,TPL)=AP(1)_"^ART^"_TW_"^"_AP(2)_"^"_NUFA G FIN
 S TW=$O(^OBJVU($J,AP(2),"")),^PILAVER($J,TPL)=AP(1)_"^ART^"_TW_"^"_AP(2)_"^"_NUFA G FIN
ART S MAT=$S($D(^[QUI]PARMAT(NUFA,TWREF,$$^%QZCHW("ARTICLE"))):^[QUI]PARMAT(NUFA,TWREF,$$^%QZCHW("ARTICLE")),1:"???"),^PILAVER($J,TPL)=AP(1)_"^ART^"_TWREF_"^"_MAT_"^"_NUFA G FIN
MAT S MAT=$S($D(^[QUI]TVPAR(NUFA,TWREF,"FAMMAT")):^[QUI]TVPAR(NUFA,TWREF,"FAMMAT"),1:"???"),OSFA=MAT,SEP=".",ISFA="" F %GG=1:1 S PSFA=$P(OSFA,SEP,%GG) Q:PSFA=""  S MAT=ISFA_$S(ISFA="":"",1:SEP)_PSFA,ISFA=MAT Q:$D(^[QUI]FULL(MAT))
 S ^PILAVER($J,TPL)=AP(1)_"^MAT^"_TWREF_"^"_MAT_"^"_NUFA_"^"_OSFA G FIN
NORM S ^PILAVER($J,TPL)=NEW_"^"_OBJ_"^"_TWREF_"^"_ART_"^"_NUFA G FIN
FIN K AP,TW,SEP,ISFA,ISFA,OSFA,NEW Q

