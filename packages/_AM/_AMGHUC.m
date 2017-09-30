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

;%AMGHUC^INT^1^59547,73865^0
%AMGHUC ;;02:40 PM  8 Nov 1993;
 
 
 
 
ROUFEN S TYPE=$P(TX,$C(0),2)
 I INST=0 G PREMPAGE
 S DX=0,DY=1 X XY W "reseau",?12,$P(GEN,$C(0))
 S DX=0,DY=2 X XY W "etat",?12,$P(GEN,$C(0),2)
 S DX=0,DY=3 X XY W "repertoire",?12,$P(GEN,$C(0),3)
 S DX=0,DY=4 X XY W "individu",?12,$P(GEN,$C(0),4)
 G:TYPE="REGLE" PRESTRT
 G:TYPE="TEXTE" PRESTXT
 G:TYPE="RESEAU" PRESRES
 G:TYPE="ETAT" PRESATT
 G:TYPE="TRANSITION" PRESTRA
 G:TYPE="CONTEXTE" PRESCXT
 G:TYPE="COURANT" PRESCOUR
 Q
PRESTRT W !," activation du traitement "_$P(TX,$C(0),3) I $P(TX,$C(0),4)'="" W " (etude "_$P(TX,$C(0),4)_")"
 Q
PRESTXT W !,$P(TX,$C(0),3) Q
PRESATT W !," passage a l'etat "_$P(TX,$C(0),4) Q
PRESRES W !," appel du reseau  "_$P(TX,$C(0),3) I $P(TX,$C(0),4)'="" W " (etude "_$P(TX,$C(0),4)_")"
 Q
PRESCXT W !," nouveau contexte d'activation : ",!,"  ",$P(TX,$C(0),3),!," ("_$P(TX,$C(0),4)_" individus)" Q
PRESCOUR 
 W !,"  repertoire courant ",$P(TX,$C(0),3)
 W !,"  individu courant   ",$P(TX,$C(0),4)
 Q
 
PRESTRA W !,"test de la transition entre les etats "
 W !,"    "_$P(TX,$C(0),4)
 W !," et "_$P(TX,$C(0),5)
 W !,"------>",$S($P(TX,$C(0),6):" REUSSITE ",1:" ECHEC ")
 Q
PREMPAGE W !,?5,"DEBUT",!,?10,"DE",!,?15,"L'ETUDE"
 W !,!,"reseau",?12,$P(GEN,$C(0))
 W !,"repertoire",?12,$P(GEN,$C(0),2)
 W !,"individu",?12,$P(GEN,$C(0),3)
 Q
 
 
 
 
 
FENREG N LIGNE,COUR
 S ICOM=INST F %IC=0:0 Q:$D(@GJOURN@(ICOM,"D"))  S ICOM=$ZP(@GJOURN@(ICOM))
 S LIGNE=@GJOURN@(ICOM,"T")
 W /COLOR(0,3)
 S DX=0,DY=0 X XY
 W LIGNE Q
 
 
 
TLSAISI(TRT,VAL) 
 D ^%TLSAISI(TRT) Q 1
 
 
 
EDITRES(RES,VAL) 
 D EDITE^%QMEXO1(RES) Q 1
 
 
 
EDITETAT(RES,ETAT,VAL) 
 D ^%QSATTRI(RES_","_ETAT,$$REPETAT^%QMEXUTI,2,3,78,18)
 Q 1
 
 
 
EDITTRA(RES,ETAT1,ETAT2,VAL) 
 N D,A,LIEN
 S LIEN="ETAT.PRECEDE"
 S D=$$NOML1^%QSGES20(RES_","_ETAT1,RES_","_ETAT2,LIEN,RES_","_ETAT2) Q:D="" 0
 S A=$$LIENI^%QSGEL3 Q:'($$IR^%QSGEST5(A,D)) 0
 D ^%QSATTRI(D,A,5,2,70,18)
 Q 1
 
 
 
EDITCXT(TXT,CARD,VAL) 
 N GLOBAL,R
 S GLOBAL="^[QUI]RQSDON(""SAVCXT"","""_JRN_""","""_VAL_""")"
 S @GLOBAL=CARD
 S R=$$AFFIFEN^%AMUTXT2("individus du contexte ",GLOBAL,"")
 Q 1
 
GLO(GEN) N TYPO,VAL
 S TYPO=$P(GEN,$C(0),5)
 Q:(TYPO'="TRANSIT")&(TYPO'="ETAT") ""
 S VAL=$P(GEN,$C(0),6)
 Q "^[QUI]RQSDON(""AFFITRANS"",JRN,"""_VAL_""")"
GLOET(GEN) 
 S TYPO=$P(GEN,$C(0),5)
 Q:(TYPO'="TRANSIT")&(TYPO'="ETAT") ""
 S VAL=$P(GEN,$C(0),6)
 Q "^[QUI]RQSDON(""VALTRANS"",JRN,"""_VAL_""")"
 
AFFIVAL(TYPE,DESC,VAL) 
 Q:TYPE="TRANSITION" $S(VAL=1:"reussite",VAL=0:"echec",1:"???")
 Q:TYPE="ETAT" VAL
 Q "???"

