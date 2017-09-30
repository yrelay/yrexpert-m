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

;%SYSDKI^INT^1^59547,73892^0
SYSDKI ;
 
 
 
 
 
 
 
 
 
 
 
 
 N Y1,CLE,I,J,SCR,GLOBAL,AGLOBAL,ZGLOBAL
 D CLEPAG^%VVIDEO,^%VZCD0("GESTION DU DISQUE")
 D NORM^%VVIDEO W !,!,!,!,"Vous allez supprimer des globals temporaires qui peuvent etre necessaires a d'autres utilisateurs..." H 3
 I ^%INCONNE("INCA3","TYPECR")'="C-DTM" W !,!,"Voici la liste des process en cours...",!,! H 3 D CLEPAG^%VVIDEO,^%SS
 W !,!,! S Y1=$$CONFIRM^%VZEOUI($$^%QZCHW("Confirmez vous l'elimination")_" ? ") Q:(Y1'=1)&(Y1'="OUI")
 D MSG^%VZEATT($$^%QZCHW("Elimination en cours"))
 K ^T
 D ^%QCAGLTX("TAB^%SYSDKI","^T")
 S CLE=""
 F I=1:1 S CLE=$O(^T(CLE)) Q:CLE=""  F J=1:1 S GLOBAL=$P(CLE,"/",J) Q:GLOBAL=""  W "." S GLOBAL="^"_GLOBAL K @(GLOBAL)
 K ^T
 
CONT S SCR=""
 F I=1:1 S SCR=$O(^%SCRE(SCR)) Q:SCR=""  D:(((SCR'[".")&(SCR'["COMMENT"))&(SCR'["/"))&(SCR'[":") KILL
 Q
KILL S AGLOBAL="^A"_SCR,ZGLOBAL="^Z"_SCR W "#"
 K @(AGLOBAL),@(ZGLOBAL)
 Q
 
TAB ;;|"GM1/GM2/GM3/GM4/GM5/GM6/GLOMENU/GF1/GF2/GF3/GF4/GF5/GF6"||
 ;;|"AIGNDR/ATT/ATTRI/AFF/AFFGAM/AFFIND/AFFPAG/ATTREP/AFFSYN/ARBTHEO/AUTREFOR"||
 ;;|"BASP/BLOCPHAS/COL/COMPILVU/COMPNOM/CSTEST/CXZ/DEJAVU/DEDUIT/DESC/DOC"||
 ;;|"ENSFOR/ENSMDL/ERRAMADA/ESTFONCT/ETUARC/ETUDIE/FICAMADA/IGCURGRI"||
 ;;|"FLUX/OPEFLUX/LISFLUX/LATT/LTREQU/LISTE"||
 ;;|"GAMASUP/GAMAIMP/GAMAREC/GAMADUP/GOCC/GRC"||
 ;;|"GEPAG/GCURGRIL/GETABAC2/GETGROUP/GLOETUD/GLOETUPH"||
 ;;|"GRC/GRIL/GRILSUP/GRILDVU/GRILVAL/GRILVU/GROUVU/IMP/IND/INTER/KASE"||
 ;;|"MOZCH/MOZED/MOZETAT/MOZSAV/MOZMOUV/MOZCOM/MOZTABU/MOZTABUU/MOZSAVU"||
 ;;|"MOZLIEN/MOZLIEN2/MOZMEN/MOZP2/MOZU/MOZTRAIT/MULSAV"||
 ;;|"NAVARACT/NBRGLEV/NFISIMP/NIV/NIVPAR/NOFONCT/NUIRG/NUPLET/NUNOM"||
 ;;|"OABRES/ORDNIV/ORDEXPLI/ORDRESUL/OP/OPMOD/OPVU/OPVUU"||
 ;;|"PAGE/PARFIX/PARVU/PARAINDEF/PARALFA/PARASSOC/PDEJASOC/PHASE/PHASADM/PILANAD/PILANVAL"||
 ;;|"PILMOD/PILMOTRE/PRESCR/PIL/PILE/PILETUD/PILGRI/POSENR/POSFUL/POSICOMP/POSID/PREPA"||
 ;;|"QX/RQSINDIV/REFTREE/RESSOUR/RESMEM"||
 ;;|"S/SAISIMU/SANAREQ/SAVAR/SAVMEM/SAVOAB/SAVOP/SAVMUL/SAVVAL/SAVMEM/SAVVAR/SATBMEM/SC"||
 ;;|"TACOMPIL/TATINDB/TATINDM/TBWHOIS/TEMP/TEMPO/TEMPORAI/TEMPORAY/TMP"||
 ;;|"TBTOZE/TBTRI/TORQS/TPBLIMP/TOR1/TOR2/TOR3/TSP/TS5"||
 ;;|"U/UU/UTILITY/V/VAL/VALCONC/VERIF/ZPILF/ZPILFEN/ZPILFEN2/Z"||
 ;;
 
 
 
ACT 
 N Y1,CLE,I,J,SCR,GLOBAL,AGLOBAL,ZGLOBAL
 D ^%VZEATT
 K ^ATT($J),^ATTRI($J),^AFF($J),^AFFGAM($J),^AFFIND($J),^AFFPAG($J),^ATTREP($J),^AFFSYN($J)
 K ^BASP($J),^COL($J),^CXZ($J),^DEJALU($J),^DESC($J),^DOC($J),^ENSFOR($J),^ENSMDL($J),^GCURGRIL($J)
 K ^GF1($J),^GF2($J),^GF3($J),^GF4($J),^GF5($J),^GF6($J)
 K ^GRILSUP($J),^GRILVAL($J),^GRILVU($J),^GAMASUP($J),^GAMAIMP($J),^GAMAREC($J),^GAMADUP($J),^GOCC($J),^GRC($J)
 K ^FLUX($J),^LATT($J),^LTREQU($J),^LISFLUX($J),^OPEFLUX($J),^LATT($J),^LISTE($J),^IND($J),^INTER($J),^KASE($J)
 K ^MOZCH($J),^MOZSAV($J),^MOZED($J),^MOZETAT($J),^MOZMEN($J),^MOZMOUV($J),^MOZCOM($J),^MOZTABU($J),^MOZTABUU($J)
 K ^MOZTRAIT($J),^MOZSAVU($J),^MOZLIEN($J),^MOZLIEN2($J),^MOZP2($J),^MOZU($J),^MULSAV($J)
 K ^NAVARACT($J),^NUPLET($J),^NIV($J),^OABRES($J),^OP($J),^OPMOD($J),^OPVU($J),^OPVUU($J),^ORDRESUL($J)
 K ^PAGE($J),^PIL($J),^PLH($J),^PILANAD($J),^PILANVAL($J),^PILMOD($J),^PILMOTRE($J),^PILGRI($J),^POSENR($J),^QX($J)
 K ^RESMEM($J),^RESSOUR($J),^RQSINDIV($J),^SANAREQ($J),^SAVMEM($J),^SAVOAB($J),^SAVOP($J),^SAVMUL($J),^SAVAR($J),^SAVMEM($J),^SAVVAR($J),^SATBMEM($J),^SC($J)
 K ^TATINDB($J),^TATINDM($J),^TEMPORAI($J),^TEMP($J),^TEMPO($J),^TMP($J),^TOR1($J),^TOR2($J),^TOR3($J),^TSP($J),^TS5($J)
 K ^U($J),^UU($J),^UTILITY($J),^V($J),^VAL($J),^VALCONC($J),^ZPILF($J),^ZPILFEN($J),^ZPILFEN2($J),^Z($J)
 D POCLEPA^%VVIDEO
 Q

