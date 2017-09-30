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
;! Nomprog     : %VTOZE                                                       !
;! Module      : VIDEO                                                        !
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

%VTOZE ;
 
SWITCH ;;A/TERM/Analyseur d'erreur sur les affectations/AFF^TOERRIMP/#AFF^TOERRIMP
 ;;C/TERM/Analyseur d'erreur sur le conditionnement/COND^TOERRIMP/#COND^TOERRIMP
 ;;NEWCADRE/TERM/nouveau cadre/1/0#0
 ;;NMN/TERM/Modification AIMENE/1/0#0
 ;;MESURE/JOB/Decompte et perfos/1/0#0
 ;;JRN/JOB/Journal et explications/10/11/1/0#0
 ;;CARSPE/TERM/Verification sur caracteres controles/1/0#0
 ;;CODSYN/TERM/Code synonyme/#
 ;;AFMEN/TERM/Affichage des menus/MAJUSCULE/minuscule#minuscule
 ;;B/TERM/Analyseur d'erreur sur les abaques/^TOERRABA/#^TOERRABA#$$OKR^%INCOIN("TO")
 ;;L/TERM/Connection au lexique/1/0#1
 ;;GROUPAGE/TERM/connexion du groupage/1/0#1
 ;;ATTENTE/TERM/Attente sur lectures/0/1/5/15/30/60/300/900/1800/3600#900
 ;;NUMLOCK/TERM/Clavier numerique/0/1#1
 ;;TRAC/TERM/Traces sur tri des implicites/0/E/I#0#$$OKR^%INCOIN("TO")
 ;;TRACOMP/TERM/Traces sur comparateur/1/0#0
 ;;TRABAC/TERM/Traces sur evaluation des abaques/0/E/I#0
 ;;BESABR/TERM/Recherche de la meilleure abreviation/1/0#0
 ;;EXEC/TERM/Mise en application du SF d'un article a la comprehension imparfaite/1/0/#1#$$OKR^%INCOIN("TO")
 ;;FULL/TERM/Consultation des grilles en FULL-MATCH/1/0#0
 ;;SIMUL/TERM/Simulation de saisie des fiches/1/0#0
 ;;NOCHAIR/TERM/Programmes sur utilisateur/1/0#0
 ;;GRAPH/TERM/Connection au graphisme/1/0#0#$$OKR^%INCOIN("SD")
 ;;PHASE/TERM/Connection des PHASES/1/0#1#$$OKR^%INCOIN("TO")
 ;;MATIERE/TERM/Connection aux matieres/1/0#1#$$OKR^%INCOIN("TO")
 ;;MACHINE/TERM/Connection aux machines/1/0#1#$$OKR^%INCOIN("TO")
 ;;ANIMATION/TERM/Animation sur etudes TOTEM/1/0#1#$$OKR^%INCOIN("TO")
 ;;MOZEV/TERM/Traitement de l'erreur sur MOZART/COND^%MZERRGL/#COND^%MZERRGL#$$OKR^%INCOIN("MOZ")
 ;;BELL/TERM/Sonnette audible/1/0#1
 ;;TOMOZ/TERM/Connection TOTEM-MOZART/1/0#0#$$OKR^%INCOIN("TORQS")
 ;;META/TERM/Connection aux metaregles/1/0#0#$$OKR^%INCOIN("TO")
 ;;LG/TERM/Langue courante/FR/GB#FR
 ;;TYPTERM/TERM/Type de terminal/VT220/VT100/C-DTM/PT-100G#VT220
 ;;DEBUG/TERM/Mode debug/1/0#0
 ;;HEVEA JOUR/USER/activation d'HEVEA avec journal/1/0#0#$$OKR^%INCOIN("QMEC")
 ;;SDXTRT/USER/generation de traitement a partir d'un objet graphique/1/0#1#$$OKR^%INCOIN("SD")
 ;;QSVA/USER/connexion des variables actives/0/1#0
 ;;
 Q
TAB K ^TBTOZE($J) F %U=0:1 S LI=$P($T(SWITCH+%U),";;",2) Q:LI=""  D TABT
 K LI,LI1,LI2,DEF,MNE,PR,COM,TBT,IT,NIT,COND
 Q
TABT N OK
 S LI1=$P(LI,"#",1),DEF=$P(LI,"#",2),COND=$P(LI,"#",3)
 S MNE=$P(LI,"/",1),PR=$P(LI,"/",2),COM=$P(LI,"/",3)
 S TBT=$S(PR="":"^TOZE",1:"^TOZE("_PR_")")
 S COND="S OK="_$S(COND'="":COND,1:1)
 X COND Q:'(OK)
 F IT="MNE","PR","DEF","COM","TBT" S ^TBTOZE($J,MNE,IT)=@IT
 S LI2=$P(LI1,"/",4,999),NIT=$L(LI2,"/") F IT=1:1:NIT S ^TBTOZE($J,MNE,"VAL",IT)=$P(LI2,"/",IT)
 Q

 
TABSPE(PR) 
 N OK,LI,LI1,LI2,DEF,MNE,COM,TBT,IT,NIT,COND
 K ^TBTOZE($J)
 F %U=0:1 S LI=$P($T(SWITCH+%U),";;",2) Q:LI=""  D TABTSPE
 Q
TABTSPE 
 Q:PR'=$P(LI,"/",2)
 S LI1=$P(LI,"#",1),DEF=$P(LI,"#",2),COND=$P(LI,"#",3)
 S MNE=$P(LI,"/",1),COM=$P(LI,"/",3)
 S TBT=$S(PR="":"^TOZE",1:"^TOZE("_PR_")")
 S COND="S OK="_$S(COND'="":COND,1:1)
 ;HL2 S $ZT="ERRCOND^%VTOZE"
 ;HL2 X COND Q:'(OK)
 F IT="MNE","PR","DEF","COM","TBT" S ^TBTOZE($J,MNE,IT)=@IT
 S LI2=$P(LI1,"/",4,999),NIT=$L(LI2,"/") F IT=1:1:NIT S ^TBTOZE($J,MNE,"VAL",IT)=$P(LI2,"/",IT)
 Q
ERRCOND 
 ;HL S $ZT="" Q
 Q  ;HL
 
ON S ^TOZE($I,"A")="AFF^TOERRIMP",^TOZE($I,"C")="COND^TOERRIMP",^TOZE($I,"B")="^TOERRABA"
 G FIN
OFF S ^TOZE($I,"A")="",^TOZE($I,"C")="",^TOZE($I,"B")="" G FIN
ANION S ^TOZE($I,"ANIMATION")=1 G FIN
ANIOFF S ^TOZE($I,"ANIMATION")=0 G FIN
METAON S ^TOZE($I,"META")=1 G FIN
METAOF S ^TOZE($I,"META")=0 G FIN
SIMON S ^TOZE($I,"SIMUL")=1 G FIN
SIMOFF S ^TOZE($I,"SIMUL")=0 G FIN
FIN Q
STAND Q:'($D(WHOIS))
 S TERM=$I,JOB=$J,USER=WHOIS
STANDS D TAB
 S MNE=-1 F %U=1:1 S MNE=$N(^TBTOZE($J,MNE)) Q:MNE=-1  S TB=^TBTOZE($J,MNE,"TBT") I '($D(@TB@(MNE))) S @TB@(MNE)=^TBTOZE($J,MNE,"DEF")
 Q
 
 
 
 
 
STANDSPE(SPE,VAL) 
 N MNE,TB,%U,TERM,USER,JOB
 Q:((SPE'="TERM")&(SPE'="USER"))&(SPE'="JOB")
 S @(SPE_"=VAL")
 D TABSPE(SPE)
 S MNE=-1 F %U=1:1 S MNE=$N(^TBTOZE($J,MNE)) Q:MNE=-1  S TB=^TBTOZE($J,MNE,"TBT") I '($D(@TB@(MNE))) S @TB@(MNE)=^TBTOZE($J,MNE,"DEF")
 K ^TBTOZE($J)
 Q
 
STANDI D STANDSPE("TERM",$I) Q
STANDJ D STANDSPE("JOB",$J) Q
STANDW D STANDSPE("USER",WHOIS) Q
 
STANDONE(SWITCH)
 N TY,VDEF
 Q:'($$VDEF(SWITCH,.TY,.VDEF))
 Q:(TY="USER")&('($D(WHOIS)))
 S PT=$S(TY="USER":WHOIS,TY="TERM":$I,TY="JOB":$J),^TOZE(PT,SWITCH)=VDEF
 Q
VDEF(SWITCH,TY,VDEF) 
 N %U,LI,SW,PT
 S SW=""
 F %U=0:1 S LI=$P($T(SWITCH+%U),";;",2) Q:LI=""  S SW=$P(LI,"/") Q:SW=""  Q:SW=SWITCH
 Q:SW="" 0 S TY=$P(LI,"/",2),VDEF=$P(LI,"#",2) Q 1
 
 
TRAD Q
 F %U=0:0 S SCR=$N(@TB@(SCR)) S:$D(@TB@(SCR,"TITRE")) ^%SCRE(SCR,"TITRE")=@TB@(SCR,"TITRE") Q:SCR=-1  S CH=-1 F %U=0:0 S CH=$N(@TB@(SCR,CH)) Q:(CH="TITRE")!(CH=-1)  S ^%SCRE(SCR,CH,1)=@TB@(SCR,CH)
 S ^MN=LG,TB="^COMMENT(LG,""MN"")",SCR=-1
 F %U=0:0 S SCR=$N(@TB@(SCR)) Q:SCR=-1  S CH=-1 F %U=0:0 S CH=$N(@TB@(SCR,CH)) Q:CH=-1  S $P(^MN(SCR,CH),"^",1)=@TB@(SCR,CH)
 Q

