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

;%SGNETQA^INT^1^59547,73890^0
%SGNETQA ;;03:19 PM  2 Nov 1993; ; 02 Nov 93  3:41 PM
 
 
 
 
 
 
 
 
 
 
 N Y1,CLE,I,J,SCR,GLOBAL,AGLOBAL,ZGLOBAL,IL,CH,GL,IG
 N SUPPABA,SUPPPAS,SUPPSDX,SUPPDIV,SUPPTOT
 D INT^%DIR,CURRENT^%IS,VARSYS^%QCSAP
 D CLEPAG^%VVIDEO,^%VZCD0(" Nettoyage (retour a minima) de la partition Utilisateur") H 1
 W !,!,! S Y1=$$CONFIRM^%VZEOUI($$^%QZCHW("Confirmez vous l'elimination")_" ? ") Q:(Y1'=1)&(Y1'="OUI")
 S (SUPPPAS,SUPPABA,SUPPSDX,SUPPDIV)=1 D INIEXI
 I EXIPAS W ! S Y1=$$CONFIRM^%VZEOUI($$^%QZCHW("Supression des passerelles")_" ? "),SUPPPAS=Y1=1
 I EXIABA W ! S Y1=$$CONFIRM^%VZEOUI($$^%QZCHW("Supression des abaques")_" ? "),SUPPABA=Y1=1
 I EXISDX W ! S Y1=$$CONFIRM^%VZEOUI($$^%QZCHW("Supression des objets SDX")_" ? "),SUPPSDX=Y1=1
 I EXIDIV W ! S Y1=$$CONFIRM^%VZEOUI($$^%QZCHW("Supression des dialogues, etats et predefinis")_" ? "),SUPPDIV=Y1=1
 I EXIMOZ W ! S Y1=$$CONFIRM^%VZEOUI($$^%QZCHW("Supression des grilles de garde Mozart")_" ? "),SUPPMOZ=Y1=1
 I EXITOT W ! S Y1=$$CONFIRM^%VZEOUI($$^%QZCHW("Supression du savoir-faire Totem")_" ? "),SUPPTOT=Y1=1
 D CLEPAG^%VVIDEO
 D MSG^%VZEATT($$^%QZCHW("Elimination en cours")) H 3
 
 D INTERNE(SUPPABA,SUPPSDX,SUPPPAS,SUPPDIV,SUPPMOZ,SUPPTOT)
xx I EXIABA,'(SUPPABA) D ^%VZEAVT("Vous devez faire une recomprehension de vos abaques")
 I EXISDX,'(SUPPSDX) D ^%VZEAVT("Vous devez faire une recomprehension de vos objets graphiques")
 I EXITOT,'(SUPPTOT) D ^%VZEAVT("Vous devez faire une validation et une comprehension TOTEM")
 W !,"nettoyage termine, retapez %VACT"
yy Q
INTERNE(SUPPABA,SUPPSDX,SUPPPAS,SUPPDIV,SUPPMOZ,SUPPTOT) 
 
 K ^GL($J)
 F IL=1:1 S CH=$P($P($T(MINI+IL),";;",2),"/") Q:CH=""  F IG=1:1 S GL=$P(CH,",",IG) Q:GL=""  S ^GL($J,GL)=""
 I '(SUPPABA) F IL=1:1 S CH=$P($P($T(ABAQ+IL),";;",2),"/") Q:CH=""  F IG=1:1 S GL=$P(CH,",",IG) Q:GL=""  S ^GL($J,GL)=""
 I '(SUPPSDX) F IL=1:1 S CH=$P($P($T(SDX+IL),";;",2),"/") Q:CH=""  F IG=1:1 S GL=$P(CH,",",IG) Q:GL=""  S ^GL($J,GL)=""
 I '(SUPPPAS) F IL=1:1 S CH=$P($P($T(PASS+IL),";;",2),"/") Q:CH=""  F IG=1:1 S GL=$P(CH,",",IG) Q:GL=""  S ^GL($J,GL)=""
 I '(SUPPDIV) F IL=1:1 S CH=$P($P($T(DIVERS+IL),";;",2),"/") Q:CH=""  F IG=1:1 S GL=$P(CH,",",IG) Q:GL=""  S ^GL($J,GL)=""
 I '(SUPPMOZ) F IL=1:1 S CH=$P($P($T(MOZ+IL),";;",2),"/") Q:CH=""  F IG=1:1 S GL=$P(CH,",",IG) Q:GL=""  S ^GL($J,GL)=""
 I '(SUPPTOT) F IL=1:1 S CH=$P($P($T(TOTEM+IL),";;",2),"/") Q:CH=""  F IG=1:1 S GL=$P(CH,",",IG) Q:GL=""  S ^GL($J,GL)=""
 
 
 S CH="A"
 
 F IL=0:1 S CH="^[QUI]"_CH,CH=$O(@CH) W:'(IL#3) ! W ?25*(IL#3),CH Q:CH=""  I '($D(^GL($J,CH))),'(((CH["QUER")!(CH["RQS"))!(CH["ZLI")) W " -> tue" H 5E-1 K @("^[QUI]"_CH)
 W !,!
 
 K ^[QUI]RQSDON
 D INIT^%SGVAR,INITREM^%QZCHW,REMCTR^%SYSCLAV
 Q
 
INIEXI 
 S (EXIABA,EXIPAS,EXISDX,EXIDIV,EXIMOZ,EXITOT)=0
 F IL=1:1 S CH=$P($P($T(ABAQ+IL),";;",2),"/") Q:CH=""  F IG=1:1 S GL=$P(CH,",",IG) Q:GL=""  I $D(@("^[QUI]"_GL)) S EXIABA=1 Q
 F IL=1:1 S CH=$P($P($T(PASS+IL),";;",2),"/") Q:CH=""  F IG=1:1 S GL=$P(CH,",",IG) Q:GL=""  I $D(@("^[QUI]"_GL)) S EXIPAS=1 Q
 F IL=1:1 S CH=$P($P($T(SDX+IL),";;",2),"/") Q:CH=""  F IG=1:1 S GL=$P(CH,",",IG) Q:GL=""  I $D(@("^[QUI]"_GL)) S EXISDX=1 Q
 F IL=1:1 S CH=$P($P($T(DIVERS+IL),";;",2),"/") Q:CH=""  F IG=1:1 S GL=$P(CH,",",IG) Q:GL=""  I $D(@("^[QUI]"_GL)) S EXIDIV=1 Q
 F IL=1:1 S CH=$P($P($T(MOZ+IL),";;",2),"/") Q:CH=""  F IG=1:1 S GL=$P(CH,",",IG) Q:GL=""  I $D(@("^[QUI]"_GL)) S EXIMOZ=1 Q
 F IL=1:1 S CH=$P($P($T(TOTEM+IL),";;",2),"/") Q:CH=""  F IG=1:1 S GL=$P(CH,",",IG) Q:GL=""  I $D(@("^[QUI]"_GL)) S EXITOT=1 Q
 Q
 
MINI ;;
 ;;CPTEUR,EDFORMAT,EDMOD
 ;;LPBDEF,MN,PLACHOJO,PLCAJOFE,PLCAREGI
 ;;PLPLACAL
 ;;TOLEX,TTL
 ;;VERSION,ZSYSMORE
 
 
PASS ;;
 ;;LKYATR2,LKYENR,LKY,LKY2,LKX
 
 
ABAQ ;;
 ;;AUTOPLAF,GAMLAF,OCGRIL,OCUNIT,PRONUM,SAISIGAM,SCRC,STRUCT
 
 
SDX ;;
 ;;SDOBJ,SDTEXT,SDCOL
 
 
DIVERS ;;
 ;;TLDIAL,TLDIALI,TLDIALF,QSETAT,QSETATP,QSETATS,RQSATPR,MN
 
MOZ ;;
 ;;MOZ,MOZGARDE,MOZITEM,MOZPARA
 
TOTEM ;;
 ;;ACOMMEB,CODNORM,COMPARAT,CONSTANT,CONVUNIT,COUCOMP,CTACHCPT,DENDIMO,DENOPER,DESMACH,DIMOUT,ESSABAC,EXPGIMP,EXPLICI,FORMULE,IGNORER,IMPLICI,IMPMAC,IMPMAT,IMPTRIP,INDEFIND,INDICE,MACHPAUT,AUTREFO
 ;;MACSEL,MATIERE,MATSTOCK,MAXMAT,NOMENC,OUTCONS,PEXPMACH,PHASE,PROBTEST,SECTION,SELMAT,SYNTETUD,TOCTREV,TOP0ALGE,TOP0CORR,TRANSCRT,TREEIMP,VALITOLE
 ;

