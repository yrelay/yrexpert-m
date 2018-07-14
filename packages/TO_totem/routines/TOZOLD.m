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

;TOZOLD^INT^1^59547,74877^0
TOZE ;
 
 G DEB
ON S ^TOZE($I,"A")="G AFF^TOERRIMP",^TOZE($I,"C")="G COND^TOERRIMP",^TOZE($I,"B")="G ^TOERRABA" G FIN
OFF S ^TOZE($I,"A")="",^TOZE($I,"C")="",^TOZE($I,"B")="" G FIN
LG W !,$$^%QZCHW("Langue ? ") R LG S ^TOZE("LG")=LG G TRAD
LEXON S ^TOZE($I,"L")=1 G FIN
LEXOFF S ^TOZE($I,"L")=0 G FIN
TRACOF S ^TOZE($I,"TRAC")=0 G FIN
TRACE S ^TOZE($I,"TRAC")=$$^%QZCHW("E") G FIN
TRACI S ^TOZE($I,"TRAC")=$$^%QZCHW("I") G FIN
CPON S ^TOZE($I,"TRACOMP")=1 G FIN
CPOFF S ^TOZE($I,"TRACOMP")=0 G FIN
ABACOF S ^TOZE($I,"TRABAC")=0 G FIN
ABACEC S ^TOZE($I,"TRABAC")=$$^%QZCHW("E") G FIN
ABACIM S ^TOZE($I,"TRABAC")=$$^%QZCHW("I") G FIN
BABON S ^TOZE($I,"BESABR")=1 G FIN
BABOFF S ^TOZE($I,"BESABR")=0 G FIN
UCAON S ^TOZE($I,"EXEC")=1 G FIN
UCAOFF S ^TOZE($I,"EXEC")=0 G FIN
FULON S ^TOZE($I,"FULL")=1 G FIN
FULOFF S ^TOZE($I,"FULL")=0 G FIN
SIMON S ^TOZE($I,"SIMUL")=1 G FIN
SIMOFF S ^TOZE($I,"SIMUL")=0 G FIN
USON S ^TOZE($I,"NOCHAIR")=1 G FIN
USOFF S ^TOZE($I,"NOCHAIR")=0 G FIN
GRON S ^TOZE($I,"GRAPH")=1 G FIN
GROFF S ^TOZE($I,"GRAPH")=0 G FIN
PHASON S ^TOZE($I,"PHASE")=1 G FIN
PHASOF S ^TOZE($I,"PHASE")=0 G FIN
MATON S ^TOZE($I,"MATIERE")=1 G FIN
MATOFF S ^TOZE($I,"MATIERE")=0 G FIN
MACON S ^TOZE($I,"MACHINE")=1 G FIN
MACOFF S ^TOZE($I,"MACHINE")=0 G FIN
ANION S ^TOZE($I,"ANIMATION")=1 G FIN
ANIOFF S ^TOZE($I,"ANIMATION")=0 G FIN
MOZON S ^TOZE($I,"MOZEV")="G COND^%MZERRGL" G FIN
MOZOFF S ^TOZE($I,"MOZEV")="" G FIN
BELLON S ^TOZE($I,"BELL")=1 G FIN
BELLOF S ^TOZE($I,"BELL")=0 G FIN
CTMON S ^TOZE($I,"TOMOZ")=1 G FIN
CTMOFF S ^TOZE($I,"TOMOZ")=0 G FIN
METAON S ^TOZE($I,"META")=1 G FIN
METAOF S ^TOZE($I,"META")=0 G FIN
FIN Q
DEB S DEB=4 F UU=0:1 S VV=DEB+UU,LIG=$T(+VV) Q:$E(LIG,1,4)="FIN "  W !,UU+1,$$^%QZCHW(" "),$P(LIG,";",2)
 S FIN=(DEB+UU)-2 W !,$$^%QZCHW("Votre choix : ") R CHX G:(CHX<DEB)!(CHX>FIN) FIN S LIG=(DEB+CHX)-1 D NET X LIG
 Q
NET S LIG=$T(+LIG),LIG=$P(LIG,$$^%QZCHW(" "),2,599) F UU=1:1 Q:$E(LIG,1)'=$$^%QZCHW(" ")  S LIG=$E(LIG,2,599)
 Q
SWITCH ;;A:AFF^TOERRIMP/B:^TOERRABA/C:COND^TOERRIMP/L:1/TRAC:0/TRACOMP:0/TRABAC:0/DESABR:0/EXEC:1/FULL:0/SIMUL:0/NOCHAIR:0/GRAPH:0/PHASE:1/MATIERE:1/MACHINE:1/ANIMATION:0/MOZEV:COND^%MZERRGL/BELL:1/TOMOZ:0/META:0
STAND S SWI=$P($T(SWITCH),";;",2) F %U=1:1 S %U1=$P(SWI,"/",%U) Q:%U1=""  S %U2=$P(%U1,":",1),%U3=$P(%U1,":",2) I '($D(^TOZE($I,%U2))) S ^TOZE($I,%U2)=%U3
 S:'($D(^TOZE("LG"))) ^TOZE("LG")="FR" S:($D(^%SCRE)#10)'=1 ^%SCRE=^TOZE("LG") D:^%SCRE'=^TOZE("LG") TRAD K SWI,%U,%U1,%U2,%U3 Q
TRAD S LG=^TOZE("LG"),^%SCRE=LG,TB="^COMMENT(LG,""SCRE"")",SCR=-1
 F %U=0:0 S SCR=$N(@TB@(SCR)) S:$D(@TB@(SCR,"TITRE")) ^%SCRE(SCR,"TITRE")=@TB@(SCR,"TITRE") Q:SCR=-1  S CH=-1 F %U=0:0 S CH=$N(@TB@(SCR,CH)) Q:(CH="TITRE")!(CH=-1)  S ^%SCRE(SCR,CH,1)=@TB@(SCR,CH)
 S ^MN=LG,TB="^COMMENT(LG,""MN"")",SCR=-1
 F %U=0:0 S SCR=$N(@TB@(SCR)) Q:SCR=-1  S CH=-1 F %U=0:0 S CH=$N(@TB@(SCR,CH)) Q:CH=-1  S $P(^MN(SCR,CH),"^",1)=@TB@(SCR,CH)
 Q

