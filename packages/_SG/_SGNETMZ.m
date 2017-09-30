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
;! Nomprog     : %SGNETMZ                                                     !
;! Module      : SYSTEME GENERAL                                              !
;! But         : Nettoyage de la partition routines.                          !
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
;! HL002 ! HL     ! 04/09/09 ! Laisser l'affichage visible avant de quitter.  !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

%SGNETMZ ;
 
 N Y1,CLE,I,J,SCR,GLOBAL,AGLOBAL,ZGLOBAL,IL,CH,GL,IG
 D CLEPAG^%VVIDEO,^%VZCD0("GESTION DU DISQUE")
 D NORM^%VVIDEO W !,!,!,!,"Vous allez supprimer des globals temporaires qui peuvent etre necessaires a d'autres utilisateurs..." H 1
 W !,!,! S Y1=$$CONFIRM^%VZEOUI($$^%QZCHW("Confirmez vous l'elimination")_" ? ") Q:(Y1'=1)&(Y1'="OUI")
 D MSG^%VZEATT($$^%QZCHW("Elimination en cours"))
 
 D NET2 G FFNET
 
 F IL=1:1 S CH=$P($P($T(TAB+IL),";;",2),"/") Q:CH=""  F IG=1:1 S GL=$P(CH,",",IG) Q:GL=""  K @("^"_GL)
 
 F IL=1:1 S CH=$P($P($T(TABJOB+IL),";;",2),"/") Q:CH=""  F IG=1:1 S GL=$P(CH,",",IG) Q:GL=""  K @("^"_GL)
 D CONT
FFNET D CLEAR^%SYSUTI1
 D INIT^%SGVAR,INITREM^%QZCHW,REMCTR^%SYSCLAV
 ;HL002 W !,"nettoyage termine, retapez %VACT"
 W !,"Nettoyage terminé, redémarrez Yexpert",!!! R "[RETURN]",*TMP
 H
 Q
 
CONT 
 S SCR=""
 F I=1:1 S SCR=$O(^%SCRE(SCR)) Q:SCR=""  D:(((SCR'[".")&(SCR'["COMMENT"))&(SCR'["/"))&(SCR'[":") KILL
 Q
KILL S AGLOBAL="^A"_SCR,ZGLOBAL="^Z"_SCR W "#"
 K @(AGLOBAL),@(ZGLOBAL)
 Q
 
NETJOB(JJ) 
 N GL,IL
 S GL="" F IL=1:1 S GL=$O(^RQSGLU("GLOJOB",GL)) Q:GL=""  K @("^"_GL_"("_JJ_")")
 
 Q
 
MAKETAB N CH,IL,GL,IG
 F IL=1:1 S CH=$P($P($T(TABJOB+IL),";;",2),"/") Q:CH=""  F IG=1:1 S GL=$P(CH,",",IG) Q:GL=""  S ^RQSGLU("GLOJOB",GL)=""
 Q
 
 
 
TAB ;;
 ;;GM1,GM2,GM3,GM4,GM5,GM6,GLOMENU/
 ;;AIGNDR,ARBTHEO,AUTREFOR/
 ;;BLOCPHAS,COMPILVU,COMPNOM,CSTEST,DEJAVU,DEDUIT/
 ;;ERRAMADA,ESTFONCT,ETUARC,ETUDIE,FICAMADA,IGCURGRI/
 ;;LTREQU,GEPAG,GETABAC2,GETGROUP,GLOETUD,GLOETUPH/
 ;;GRIL,GRILDVU,GROUVU,IMP/
 ;;NBRGLEV,NFISIMP,NIVPAR,NOFONCT,NUIRG,NUNOM/
 ;;ORDNIV,ORDEXPLI/
 ;;PARFIX,PARVU,PARAINDEF,PARALFA,PARASSOC,PDEJASOC,PHASE,PHASADM/
 ;;PRESCR,PIL,PILE,PILETUD,POSFUL,POSICOMP,POSID,PREPA/
 ;;REFTREE,S,SAISIMU,SAVAR,SAVVAL,SC/
 ;;TACOMPIL,TBWHOIS,TEMPORAY/
 ;;TBTOZE,TBTRI,TORQS,TPBLIMP,VERIF/
 ;;/
 
 
 
TABJOB ;;
 ;;ATT,ATTRI,AFF,AFFGAM,AFFIND,AFFPAG,ATTREP,AFFSYN/
 ;;BASP,COL,CXZ,DEJALU,DESC,DOC,ENSFOR,ENSMDL/
 ;;GF1,GF2,GF3,GF4,GF5,GF6,GCURGRIL,GETIME/
 ;;GRILSUP,GRILVAL,GRILVU,GAMASUP,GAMAIMP,GAMAREC,GAMADUP,GOCC,GRC,GESMEM/
 ;;FLUX,LATT,LTREQU,LISFLUX,OPEFLUX,LISTE,IND,INTER,KASE/
 ;;MENUMOD/
 ;;MOZCH,MOZSAV,MOZED,MOZETAT,MOZMEN,MOZMOUV,MOZCOM,MOZTABU,MOZTABUU/
 ;;MOZTRAIT,MOZSAVU,MOZLIEN,MOZLIEN2,MOZP2,MOZU,MULSAV/
 ;;NAVARACT,NUPLET,NIV,OABRES,OP,OPMOD,OPVU,OPVUU,ORDRESUL/
 ;;PAGE,PIL,PLH,PILANAD,PILANVAL,PILMOD,PILMOTRE,PILGRI,POSENR,QX/
 ;;RESMEM,RESSOUR,RQSINDIV,REMANENCE/
 ;;SANAREQ,SAVMEM,SAVOAB,SAVOP,SAVMUL,SAVAR,SAVVAR,SATBMEM,SATBVAR,SAVVARX,SC/
 ;;TATINDB,TATINDM,TEMPORAI,TEMP,TEMPO,TMP,TOR1,TOR2,TOR3,TSP,TS5/
 ;;U,UU,UTILITY,V,VAL,VALCONC,ZPILF,ZPILFEN,ZPILFEN2,Z/
 ;;/
 ;;
 
NET2 
 
 
 N TEMP,IL
 S TEMP="^TEMPORAI" K @(TEMP)
 F IL=1:1 S CH=$P($P($T(GLUTIL+IL),";;",2),"/") Q:CH=""  F IG=1:1 S GL=$P(CH,",",IG) Q:GL=""  S @TEMP@("KEEP",GL)=""
 F IL=1:1 S CH=$P($P($T(GLUTIE+IL),";;",2),"/") Q:CH=""  F IG=1:1 S GL=$P(CH,",",IG) Q:GL=""  S @TEMP@("KEEPE",GL)=""
 S GL="^A" I $D(@GL) K:$$NOKEEP(GL) @(GL)
 
FFNEX 
 S GL=$O(@GL)
 S GL=$P(GL,"^",2) ;HL2
 G:GL="" FFI
 
 ;HL2 K:(GL'="^TEMPORAI")&$$NOKEEP(GL) @("^"_GL)
 W !,GL I (GL'="TEMPORAI")&$$NOKEEP(GL) W " (ELIMINER)" K @("^"_GL)
 
 S GL="^"_GL
 G FFNEX
FFI S GL="^TEMPORAI" K @(GL)
 
 ;HL2 D ^%VACTLIS
 Q
NOKEEP(GLO) 
 N GG,%G
 I $D(@TEMP@("KEEP",GLO)) Q 0
 S GG="" F %G=0:0 S GG=$O(@TEMP@("KEEPE",GG)) Q:GG=""  I $E(GLO,1,$L(GG))=GG G KK
 Q 1
KK Q 0
 
GLUTIL ;; 
 ;;ARCCOS,ARCCTG,ARCSIN,ARCTG,COMMENT,COS,COTG,ENVCONF,ENVPAP,INCONNE,MN,MNUS,MODEPAS,NAMEFUL,SIN,TABIDENT,TABIDMOZ,TABITEM,TD,TOLISGLO,TOLISRAM,library/
 ;;/
 
GLUTIE ;;
 ;;MOZ,RQS/
 ;;

