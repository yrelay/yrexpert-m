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

;%ANARBRE^INT^1^59547,73866^0
%ANARBRE ;
 
 
 
 
 
LVAR(A,NVAR,LISVAR) S NVAR=0 K LISVAR N TYP,V D INT(A) Q
INT(A) Q:A=0  S TYP=$$RED(A,"TYPE")
 I TYP="COMPARATEUR.BINAIRE" D CBI Q
 I TYP="COMPARATEUR.TERNAIRE" D CTE Q
 I TYP="COUPLE" D CPL Q
 I TYP="FONCTION" D FON Q
 I TYP="FONCTION.LOGIQUE" D FLO Q
 I TYP="FONCTION.SPECIALE" D FSP Q
 I TYP="AFFECTATION" D AFF Q
 I TYP="NEGATION" D NEG Q
 I TYP="NOMBRE" D NBR Q
 I TYP="ENTIER" D ENT Q
 I TYP="CHAINE" D CHA Q
 I TYP="OPERATEUR" D OPE Q
 I TYP="PRECEDENCE" D PRE Q
 I TYP="OPERATEUR.LOGIQUE" D OPL Q
 I TYP="VARIABLE" D VAR Q
 I TYP="ACTION" D ACT Q
 I TYP="ALFANUM" D ALF Q
 I TYP="INFERENCE" D INF Q
 I TYP="ATTRIBUT" D ATT Q
 I TYP="NOM" D NOM Q
 I TYP="INDICE" D IND Q
 I TYP="NIMP" D NIM Q
 I TYP="CHAINEX" D CHX Q
 
 Q
 
 
NIM Q
 
CHX N I F I=1:1:2 D INT($$RED(A,I))
 Q
 
NOM S NOM=$$RED(A,"TEXTE") Q
 
IND Q
 
ATT N I,NOM,VAR S (NOM,VAR)="" D INT($$RED(A,1))
 I $$RED(A,3)=0 S VAR="@" G ATTS
 D INT($$RED(A,3))
ATTS S:(VAR'="")&(NOM'="") LISVAR(VAR,NOM)="" Q
 
INF N I F I=1:1:2 D INT($$RED(A,I))
 Q
 
CBI N I F I=1:1:2 D INT($$RED(A,I))
 Q
 
CTE N I F I=1:1:2 D INT($$RED(A,I))
 Q
 
CPL N I F I=1:1:2 D INT($$RED(A,I))
 Q
 
FLO N NOM S NOM=$$RED(A,"TEXTE")
 I NOM="$EXISTE" G FLEXIS
 D POCLEPA^%VVIDEO,^%VZEAVT($$^%QZCHW("ANSARBRE : Fonction logique inconnue ...")_NOM)
 Q
FLEXIS N I F I=1:1:2 D INT($$RED(A,I))
 Q
 
NEG D INT($$RED(A,1)) Q
 
NBR Q
 
ENT Q
 
CHA Q
 
FON N NF S NF=$$RED(A,"TEXTE")
 I NF="$NOM" G FNOM
 I NF="$SSCH" G FSSC
 I NF="$PARTIE" G FPAR
 I NF="$DATE" G FDAT
 I NF="$HEURE" G FHEU
 I NF="$EQUIVALENT" G FEQU
 I NF="$LONGUEUR" G FLONG
 I NF="$JUSTIFIER" G FJUST
 I NF="$NETTOYER" G FNET
 I NF="$TROUVER" G FPAR
 Q:NF="$PARAM"
 D POCLEPA^%VVIDEO,^%VZEAVT($$^%QZCHW("ANSARBRE : Fonction inconnue ...")_NF)
 Q
FLONG N I F I=1:1:3 D INT($$RED(A,I))
 Q
FJUST N I F I=1:1:3 D INT($$RED(A,I))
 Q
FNET N I F I=1:1:3 D INT($$RED(A,I))
 Q
FEQU N I F I=1:1:2 D INT($$RED(A,I))
 Q
FNOM D INT($$RED(A,1)) Q
FSSC N I F I=1:1:3 D INT($$RED(A,I))
 Q
FPAR N I F I=1:1:3 D INT($$RED(A,I))
 Q
FDAT D INT($$RED(A,1)) Q
FHEU Q
 
FSP N NF S NF=$$RED(A,"TEXTE")
 I NF="$LISTE" G FSLI
 D POCLEPA^%VVIDEO,^%VZEAVT($$^%QZCHW("ANSARBRE : Fonction speciale inconnue ...")_NF)
 Q
FSLI D INT($$RED(A,1)) Q
 
OPE N I F I=1:1:2 D INT($$RED(A,I))
 Q
 
PRE N I F I=1:1:2 D INT($$RED(A,I))
 Q
 
OPL N I F I=1:1:2 D INT($$RED(A,I))
 Q
 
VAR S VAR=$$RED(A,"TEXTE") I '($D(LISVAR(VAR))) S NVAR=NVAR+1,LISVAR(VAR)=""
 Q
 
AFF N I F I=1:1:2 D INT($$RED(A,I))
 Q
 
ACT N AC S AC=$$RED(A,"TEXTE")
 I AC="$FIN" G AFIN
 I AC="$TRAIT" G ATRA
 I AC="$PLACER" G APLA
 I AC="$PLACERP" G APLA
 I AC="$PLACERD" G APLA
 I AC="$PAGE" G APAG
 I AC="$ETIQUETTE" G AETI
 I AC="$POUR" G APOU
 I AC="$POURVAL" G APOUV
 I AC="$TEXTE" G ATEX
 I AC="$DESSINER" G ADES
 I AC="$DESSINER.ETUDE" G ADESE
 I AC="$MODELE" G AMOD
 I AC="$TRAITER" G AMOD
 I AC="$FORMAT" G AFOR
 D POCLEPA^%VVIDEO,^%VZEAVT($$^%QZCHW("ANSARBRE : Action inconnue = ")_AC)
 Q
AFIN Q
ATRA N I F I=1:1:4 D INT($$RED(A,I))
 Q
APLA N I F I=1:1:3 D INT($$RED(A,I))
 Q
APAG Q
AETI D INT($$RED(A,1)) Q
AFOR D INT($$RED(A,1)) Q
APOU N I F I=1:1:3 D INT($$RED(A,I))
 Q
APOUV N I F I=1:1:3 D INT($$RED(A,I))
 Q
ATEX N I F I=1:1:4 D INT($$RED(A,I))
 Q
ADES N I F I=1:1:5 D INT($$RED(A,I))
 Q
ADESE N I F I=1:1:3 D INT($$RED(A,I))
 Q
AMOD N I F I=1:1:2 D INT($$RED(A,I))
 Q
 
ALF Q
 
RED(N,A) 
 Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

