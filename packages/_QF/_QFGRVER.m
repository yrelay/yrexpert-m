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

;%QFGRVER^INT^1^59547,73875^0
QFGRVER(LISTIND,LLISTEN,OO,MSG) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N ALL,I,LLISTE,LISTGR,VIDE
 S ALL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"ALL") K @(ALL)
 D MSG^%VZEATT($$^%QZCHW("verification des postes"))
 D TYPL(OO,LLISTEN,"","L0")
 D TYPL(OO,LISTIND,"","")
 
 D LLISTEN
 
 S I=$O(@ALL@(""))
 I (I="")&(VIDE=1) D ADD(OO,$$^%QZCHW("Aucune des listes de")_" "_LLISTEN_" "_$$^%QZCHW("n'est de type individu"))
 I I'="",$O(@ALL@(I))'="" D ADD(OO,$$^%QZCHW("les listes de")_" "_LLISTEN_" "_$$^%QZCHW("contiennent des individus de repertoires differents"))
 I $O(@OO@(""))'="" S MSG=" "
 K @(ALL)
 Q
LLISTEN 
 S VIDE=0
 S LLISTE=$$ADRLIS^%QSGEST7(LLISTEN)
 I (LLISTE=0)!(LLISTE="") D ADD(OO,$$^%QZCHW("Impossible de retrouver les postes de")_" "_LLISTEN) Q
 S LISTGR=""
 F I=0:0 S LISTGR=$O(@LLISTE@(LISTGR)) Q:LISTGR=""  D TYPL(OO,LISTGR,ALL,"") S VIDE=1
 Q
 
TYPL(OO,L,ALL,LBASE) 
 N ADR,BASE
 I $$TYP^%QSGEST7(L)'="INDIVIDU" D ADD(OO,$$^%QZCHW("la liste")_" "_L_" "_$$^%QZCHW("ne contient pas des individus"))
 S BASE=$$BASE^%QSGEST7(L)
 I BASE="" D ADD(OO,$$^%QZCHW("la liste")_" "_L_" "_$$^%QZCHW("ne contient pas des individus"))
 I LBASE'="",BASE'=LBASE D ADD(OO,$$^%QZCHW("la liste")_" "_L_" "_$$^%QZCHW("devrait avoir pour individus des")_" "_$$NOMLOG^%QSF(LBASE))
 I ALL'="",BASE'="" S @ALL@(BASE,L)=""
 S ADR=$$ADRLIS^%QSGEST7(L)
 I (ADR=0)!(ADR="") D ADD(OO,$$^%QZCHW("impossible de retrouver les individus de la liste")_" "_L)
 Q
 
ADD(OO,TXT) 
 S @OO@($ZP(@OO@(""))+1)=TXT
 Q
 
 
 
 
PART(LISTIND,LLISTEN,OO,MSG) 
 N ABS,MORE,LOC,TEMP,DESIGN,I
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 F I="ABS","MORE","LOC" S @I=$$CONCAS^%QZCHAD(TEMP,I)
 D MSG^%VZEATT($$^%QZCHW("verification du partitionnement"))
 S MSG=$$ISPART^%QSGE11(LLISTEN,LISTIND,LOC,MORE,ABS,1)
 I MSG'="" D NOPART
 I $O(@OO@(""))'="" S MSG=" "
 K @(TEMP)
 Q
 
NOPART 
 D ADD(OO,MSG)
 I $D(@ABS) D PARTABS
 I $D(@MORE) D PARTLOC
 Q
 
PARTABS 
 N I,X
 D ADD(OO,$$^%QZCHW("les listes de")_" "_LLISTEN_" "_$$^%QZCHW("ne sont pas incluses dans la liste")_" "_LISTIND)
 D ADD(OO,$$^%QZCHW("par exemple")_" :")
 S X=$O(@ABS@(""))
 F I=1:1:50 Q:X=""  D PARTA1 S X=$O(@ABS@(X))
 Q
PARTA1 D ADD(OO,X_" "_$$^%QZCHW("element de")_" "_$O(@LOC@(X,""))_" "_$$^%QZCHW("est absent de")_" "_LISTIND)
 Q
 
PARTLOC 
 N I,X,L,J,BASE
 D ADD(OO,$$^%QZCHW("les listes de")_" "_LLISTEN_" "_$$^%QZCHW("ne sont pas d'intersection vide"))
 D ADD(OO,$$^%QZCHW("par exemple")_" :")
 S X=$O(@MORE@("")),BASE=$$BASE^%QSGEST7(LLISTEN)
 F I=1:1:50 Q:X=""  D PARTL1 S X=$O(@MORE@(X))
 Q
PARTL1 D ADD(OO,X_" "_$$^%QZCHW("est element de")_" :")
 S L=$O(@LOC@(X,""))
 F J=1:1:50 Q:L=""  D PARTL2 S L=$O(@LOC@(X,L))
 Q
PARTL2 S DESIGN=$$^%QSCALVA(BASE,L,$$SYN^%QFGRACT)
 I DESIGN="" D ADD(OO,"  "_L)
 E  D ADD(OO,"  "_DESIGN_" ("_L_")")
 Q
 
 
 
 
 
 
 
 
 
 
 
INTER(LISTE,REPG,GAM,OO,OK) 
 N %O,O,ADR,MSG,LIEN,FILS,BASE
 I REPG="" S REPG="GAMME"
 S BASE=$$NOMINT^%QSF(REPG)
 S OK=0
 I GAM="" D ADD(OO,"La gamme est indefinie") Q
 I '($$IR^%QSGEST5(BASE,GAM)) D ADD(OO,"La gamme "_GAM_" est inexistante dans le repertoire "_REPG) Q
 D TYPL(OO,LISTE,"","")
 I $D(@OO) Q
 S ADR=$$ADRLIS^%QSGEST7(LISTE),LIEN=$$LIEN1^%QSGEL2(BASE,$$OI^%MZINTER(REPG),2)
 S O="",OK=1
 F %O=0:0 S O=$O(@ADR@(O)) Q:O=""  I $$EXILIEN^%QSGES21(GAM,LIEN,O)=0 D ADD(OO,O_" "_$$^%QZCHW("de la liste")_" "_LISTE_" "_$$^%QZCHW("n'est pas inclus dans la gamme")_" "_GAM) S OK=0
 Q

