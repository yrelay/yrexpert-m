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

;%UTSTC^INT^1^59547,74033^0
%UTSTC ;;08:22 PM  18 Jan 1996; 26 Apr 93 11:34 AM
 N REP,IR
BCL D CLEPAG^%VVIDEO
 W "UTILITAIRES STC",!
 W "===============",!
 W !,"  nettoyage de moz et sys                  SUP"
 W !,"  installation                             INS"
 W !,"  definition rapide d'utilisateur          DEF"
 W !,"  formattage nouveau query                 NEW"
 W !,"  caracteres de controles dans les QUERYS  CTRL"
 W ! R REP Q:REP=""
 F IR="SUP","NEW","CTRL" I REP=IR D @IR
 G BCL
 
DEF 
 
 
 
 
 
 G BCL
 
NEW D NEWQRY^%UTSTCC
 Q
CTRL D ^%UTSTCCS
 Q
INS G BCL
 W !,"mot de passe" R mdp
 ;G:mdp'=$$MDP^%VACTLIM BCL
 W !,"droit d'acces"
 
SUP N REP,IR
SBCL D CLEPAG^%VVIDEO
 W "UTILITAIRES STC DE SUPPRESSION",!
 W !,"  utilisateurs inutiles  (sur moz et sys)               1"
 W !,"  schema de donnees inutiles (sur moz)                  2"
 W !,"  attribut AVEC.TECHNOLOGIE.<technologie>               3"
 W !,"  globals inutiles depuis v2.r31 (SUR QUI)              4"
 W !,"  globals temporaires en $J (sur moz)                   5"
 W !,"  routines parasites sur moz                            6"
 W !,"  routines parasites sur SYS (dont %UT mais pas %UTSTC) 7"
 W !,"  module de suivi de production  (%GX*)                 8"
 W !,"  module de suivi matiere  (sr*)                        9"
 W !,"  globals inutiles (sur SYS)                           10"
 W ! R REP Q:REP=""
 F IR=1:1:10 I REP=IR D @("S"_IR)
 G SBCL
 
S1 N TEMP,LW,LWSUP,%M,M
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T") K @(TEMP)
 S LWH=$$CONCAS^%QZCHAD(TEMP,"W"),LWSUP=$$CONCAS^%QZCHAD(TEMP,"WS")
 D CLEPAG^%VVIDEO,^%VZEAVT("SELECTION DES USERS A SUPPRIMER")
 F G="^INCONNE(""CNX"")","^INCONNE(""CNY"")","^TABIDENT","^TABIDMOZ" S M="" F %M=0:0 S M=$O(@G@(M)) Q:M=""  S @LWH@(M)=""
 D INIT^%QUCHOIP(LWH,1,"",0,3,80,19),AFF^%QUCHOIP
 D ^%QUCHOYP(LWSUP)
 D END^%QUCHOIP
 D CLEPAG^%VVIDEO
 S M="" F %M=0:0 S M=$O(@LWSUP@(M)) Q:M=""  W !,M
 W !,"SUPPRESSION DE CES USER (O/N)" R R I $E(R)'="O" K @(TEMP) Q
 S M="" F %M=0:0 S M=$O(@LWSUP@(M)) Q:M=""  F G="^INCONNE(""CNX"")","^INCONNE(""CNY"")","^TABIDENT","^TABIDMOZ","^TOZE" K @G@(M)
 K @(TEMP) Q
 
S2 N TEMP,LMOD,LMSUP,%M,M
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T") K @(TEMP)
 S LMOD=$$CONCAS^%QZCHAD(TEMP,"M")
 S LMSUP=$$CONCAS^%QZCHAD(TEMP,"MS")
 D CLEPAG^%VVIDEO,^%VZEAVT("SELECTION DES MODELES A SUPPRIMER")
 F G="^RQSMOD","^RQSMOD1","^RQSMOD2","^RQSMOD3","^RQSMOD4","^RQSMOD5","^RQSMOD6","^RQSMOD7","^RQSMOD8","^RQSMOD9" S M="" F %M=0:0 S M=$O(@G@(M)) Q:M=""  S @LMOD@(M)=""
 F G="^RQSMDL","^RQSMDL1","^RQSMDL2","^RQSMDL3","^RQSMDL4","^RQSMDL5","^RQSMDL6","^RQSMDL7","^RQSMDL8","^RQSMDL9" S M="" F %M=0:0 S M=$O(@G@(M)) Q:M=""  S @LMOD@(M)=""
 F G="^RQSAUTOR" S M="" F %M=0:0 S M=$O(@G@(M)) Q:M=""  S @LMOD@(M)=""
 D INIT^%QUCHOIP(LMOD,1,"",0,3,80,19),AFF^%QUCHOIP,^%QUCHOYP(LMSUP),END^%QUCHOIP,CLEPAG^%VVIDEO
 S M="" F %M=0:0 S M=$O(@LMSUP@(M)) Q:M=""  W !,M
 W !,"SUPPRESSION DE CES MODELES(O/N)" R R I $E(R)'="O" K @(TEMP) Q
 S M="" F %M=0:0 S M=$O(@LMSUP@(M)) Q:M=""  F G="^RQSMOD","^RQSMOD1","^RQSMOD2","^RQSMOD3","^RQSMOD4","^RQSMOD5","^RQSMOD6","^RQSMOD7","^RQSMOD8","^RQSMOD9","^RQSMDL","^RQSMDL1","^RQSMDL2","^RQSMDL3","^RQSMDL4","^RQSMDL5","^RQSMDL6","^RQSMDL7","^RQSMDL8","^RQSMDL9","^RQSAUTOR" K @G@(M)
 K @(TEMP) Q
 
S3 D TECHNO^%UTSTCN Q
 
S4 K ^[QUI]QSLIENI,^[QUI]MOZART,^[QUI]TOLEXC
 Q
 
S5 D ^%SGNETMZ Q
 
S6 D SUPMOZ^%UTSTCI Q
 
S7 D SUPSYS^%UTSTCI Q
 
S8 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T") K @(TEMP)
 S LM=$$CONCAS^%QZCHAD(TEMP,"M")
 D SELECT^%SYSROUT("SYS","%GX",LM)
 I $$CONFIRM^%PKUTIL(2,14,60,"confirmez-vous la suppression") D SUPROU^%SYSROUT("SYS",LM)
 K @(TEMP) Q
 
S9 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T") K @(TEMP)
 S LM=$$CONCAS^%QZCHAD(TEMP,"M")
 D SELECT^%SYSROUT("MOZ","sr",LM)
 I $$CONFIRM^%PKUTIL(2,14,60,"confirmez-vous la suppression") D SUPROU^%SYSROUT("MOZ",LM)
 K @(TEMP) Q
 
S10 N I,L,J,GR,MN
 F I=1:1 S L=$T(GRILLES+I),L=$P(L,";;",2) Q:L=""  F J=1:1 S GR=$P(L,"/",J) Q:GR=""  K ^%SCRE(GR),^%SCRE(GR_",COMMENT"),^%SCREC(GR)
 F I=1:1 S L=$T(MENUS+I),L=$P(L,";;",2) Q:L=""  F J=1:1 S MN=$P(L,"/",J) Q:MN=""  K ^%MN(MN)
 
 Q
 
 
GRILLES ;; grilles inutiles sur une partition DKBMS distribuee au client
 ;;ANSTGACT/ANSTGBR/ANSTGCLI/ANSTGDS/ANSTGFAB/ANSTGMAR/ANSTGMAT/ANSTGPER/ANSTGPRO/ANSTGSEC/ANSTGTM/
 ;;ANSTGUSI/BLOCNOTE/BLONOIMP/CLIENCGD/CLIENT/CODNORM/DEMO
 ;;EEVOCA/ELIMBASEF/ELIMBASEP/EMDROIT/ESC/ESPR/ETICILPMI/EXISGLO/EXISROUT/
 ;;FAIT/FICHINST/IFANN/IFRAGEN/IFRDV/IFRDVLI/IFRMANE/IFRMCHI/IFRMGEN
 ;;IFRMGYN/IFRMOBS/JCTEST/JOB/MENUARB/USINART/USINE/USINECGD/UTANOM/UTPB
 ;;
 
MENUS ;; menus inutiles sur une partition DKBMS distribuee au client
 ;;ARTICLES/AST/CLIENT/COMMANDES/COPICLI/CROSS/DOCUMENTATION/DOCUMGLO/DOCUMROU/FAMILLE/GENRAL/GESTIONNAIRE MENU/
 ;;LOCACROSS/Modif. des Tarifs/NOTE/OPCROSS/PRODUCTION/REPGRA/RM/SATCABLE/SECTIONS/SOUS-FAMILLES/SYSTAC/SYSTACC/TEST/TEST1/TEST2/
 ;;TEXTES/TREECROS/Touches de fonction/USINE/ZSVG/
 ;;	

