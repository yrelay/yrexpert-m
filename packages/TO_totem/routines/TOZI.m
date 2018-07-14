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
;! HL001 ! HL     ! 01/01/01 ! Erreur %GTM-E-INVCMD -> $ZT="G ..."            !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;TOZI^INT^1^59547,74877^0
TOZE ;
 
SWITCH ;;A/TERM/Analyseur d'erreur sur les affectations/AFF^TOERRIMP/#AFF^TOERRIMP
 ;;C/TERM/Analyseur d'erreur sur le conditionnement/COND^TOERRIMP/#COND^TOERRIMP
 ;;B/TERM/Analyseur d'erreur sur les abaques/^TOERRABA/#^TOERRABA
 ;;L/TERM/Connection au lexique/1/0#1
 ;;ATTENTE/TERM/Attente sur lectures/0/1/5/15/30/60/300/900/1800/3600#900
 ;;TRAC/TERM/Traces sur tri des implicites/0/E/I#0
 ;;TRACOMP/TERM/Traces sur comparateur/1/0#0
 ;;TRABAC/TERM/Traces sur evaluation des abaques/0/E/I#0
 ;;BESABR/TERM/Recherche de la meilleure abreviation/1/0#0
 ;;EXEC/TERM/Mise en application du SF d'un article a la comprehension imparfaite/1/0/#1
 ;;FULL/TERM/Consulattion des grilles en FULL-MATCH/1/0#0
 ;;SIMUL/TERM/Simulation de saisie des fiches/1/0#0
 ;;NOCHAIR/TERM/Programmes sur utilisateur/1/0#0
 ;;GRAPH/TERM/Connection au graphisme/1/0#0
 ;;PHASE/TERM/Connection des PHASES/1/0#1
 ;;MATIERE/TERM/Connection aux matieres/1/0#1
 ;;MACHINE/TERM/Connection aux machines/1/0#1
 ;;ANIMATION/TERM/Animation sur etudes TOTEM/1/0#0
 ;;MOZEV/TERM/Traitement de l'erreur sur MOZART/COND^%MZERRGL/#COND^%MZERRGL
 ;;BELL/TERM/Sonnette audible/1/0#1
 ;;TOMOZ/TERM/Connection TOTEM-MOZART/1/0#0
 ;;META/TERM/Connection aux metaregles/1/0#0
 ;;LG//Langue courante/FR/GB#FR
 ;;
 Q
TAB K ^TBTOZE($J) F %U=0:1 S LI=$P($T(SWITCH+%U),";;",2) Q:LI=""  D TABT
 K LI,LI1,LI2,DEF,MNE,PR,COM,TBT,IT,NIT Q
TABT S LI1=$P(LI,"#",1),DEF=$P(LI,"#",2),MNE=$P(LI,"/",1),PR=$P(LI,"/",2),COM=$P(LI,"/",3),TBT=$S(PR="":"^TOZE",1:"^TOZE("_PR_")")
 F IT="MNE","PR","DEF","COM","TBT" S ^TBTOZE($J,MNE,IT)=@IT
 S LI2=$P(LI1,"/",4,999),NIT=$L(LI2,"/") F IT=1:1:NIT S ^TBTOZE($J,MNE,"VAL",IT)=$P(LI2,"/",IT)
 Q
ON S ^TOZE($I,"A")="G AFF^TOERRIMP",^TOZE($I,"C")="G COND^TOERRIMP",^TOZE($I,"B")="G ^TOERRABA" G FIN
OFF S ^TOZE($I,"A")="",^TOZE($I,"C")="",^TOZE($I,"B")="" G FIN
ANION S ^TOZE($I,"ANIMATION")=1 G FIN
ANIOFF S ^TOZE($I,"ANIMATION")=0 G FIN
METAON S ^TOZE($I,"META")=1 G FIN
METAOF S ^TOZE($I,"META")=0 G FIN
SIMON S ^TOZE($I,"SIMUL")=1 G FIN
SIMOFF S ^TOZE($I,"SIMUL")=0 G FIN
FIN Q
STAND S TERM=$I
STANDS D TAB S MNE=-1 F %U=1:1 S MNE=$N(^TBTOZE($J,MNE)) Q:MNE=-1  S TB=^TBTOZE($J,MNE,"TBT") I '($D(@TB@(MNE))) S @TB@(MNE)=^TBTOZE($J,MNE,"DEF")
 S:($D(^%SCRE)#10)'=1 ^%SCRE=^TOZE("LG") S:($D(^MN)#10)'=1 ^MN=^TOZE("LG") D:(^%SCRE'=^TOZE("LG"))!(^MN'=^TOZE("LG")) TRAD K SWI,%U,%U1,%U2,%U3,MNE,%U,TB,^TBTOZE($J) Q
TRAD S LG=^TOZE("LG"),^%SCRE=LG,TB="^COMMENT(LG,""SCRE"")",SCR=-1
 F %U=0:0 S SCR=$N(@TB@(SCR)) S:$D(@TB@(SCR,"TITRE")) ^%SCRE(SCR,"TITRE")=@TB@(SCR,"TITRE") Q:SCR=-1  S CH=-1 F %U=0:0 S CH=$N(@TB@(SCR,CH)) Q:(CH="TITRE")!(CH=-1)  S ^%SCRE(SCR,CH,1)=@TB@(SCR,CH)
 S ^MN=LG,TB="^COMMENT(LG,""MN"")",SCR=-1
 F %U=0:0 S SCR=$N(@TB@(SCR)) Q:SCR=-1  S CH=-1 F %U=0:0 S CH=$N(@TB@(SCR,CH)) Q:CH=-1  S $P(^MN(SCR,CH),"^",1)=@TB@(SCR,CH)
 Q

