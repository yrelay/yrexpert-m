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

;%ATP^INT^1^59547,73866^0
%ATP ;;07:59 PM  11 Dec 1992; ; 03 Dec 92 11:39 AM
 
 
EXAMEN D EXAM I BUTVU=BUTMAX G FINBUT
 ;;
SELECT S TIME=TIME+1 D CHOIXOBJ^%ATPATN
 I OBJET="" G EXTREME ;;monoprocesseur
 S DECI=$$NEXTDECI(DECI)
 ;; insertion de la decision de choix d'objet
 D ACCEPTE(TIME,DECI,OBJET,0,0) S DECI=$$NEXTDECI(DECI) D VISU^%ATPATN
POSITION ;;
 S TIME=TIME+1,POSITION="",SENS="" D CHOIXPOSI^%ATPATN(OBJET,.POSITION,.SENS)
 I (POSITION="")!(SENS="") G SELECT
 D SITEMP^%ATPATN,EVALOC^%ATPATN(DECI,OBJET,POSITION,.REFUS)
FINLOC 
 I $D(@D@(DECI)),@D@(DECI,3)<0 S DECI=$$NEXTDECI(DECI)
 I REFUS D MALUS(OBJET,POSITION,SENS),REFUSE(TIME,DECI,OBJET,POSITION,SENS) G POSITION
 D EVAGLO^%ATPATN(.REFUS)
 I $D(@D@(DECI)),@D@(DECI,3)<0 S DECI=$$NEXTDECI(DECI)
 I REFUS D MALUS(OBJET,POSITION,SENS),REFUSE(TIME,DECI,OBJET,POSITION,SENS) G POSITION
 D ACCEPTE(TIME,DECI,OBJET,POSITION,SENS)
 D META
 G EXAMEN
 
FINBUT ;;
 I VISU U 0 W !," reussite de l'atn qui a atteint le sommet  ",OBBUT
 Q
FIN F OB=1:1:NOBJET I @ATTEND@(OB) U 0 W !,"veuillez liberer ",OB," (petri)"
 S decat="" F j=1:1 S decat=$O(@DECKAT@(decat)) Q:decat=""  S x=@D@(decat,1) U 0 W !,"veuillez liberer ",x,$S($D(@DECKAT@(decat,"ATTENTE.UTILISATEUR")):" attente utilisateur ",1:""),$S($D(@DECKAT@(decat,"ATTENTE.SYSTEME")):" attente systeme",1:"")
 Q
 ;; *******************************************************
 ;; *******************************************************
 ;;*** fin procedure principale ****
 ;;*** procedures  secondaires *****
 ;;
NEXTDECI(DECISION) 
 N NOUVDEC
 S @POPDECI=@POPDECI+1,NOUVDEC=@POPDECI
 S @PERE@(NOUVDEC)=DECISION
 Q NOUVDEC
EXAM ;;
 Q:DECI=0
 I @BUT@(@D@(DECI,1)) S BUTVU=BUTVU+1,OBBUT=@D@(DECI,1) Q
 S DELTATTEN=0 D EXATTENT I DELTATTEN=1 G FINLOC
 I VISU W !,"examen" H 1
 ;; examen algorithmique : a-t-on atteint un but
 ;; examen et interaction utilisateur : il veut peut etre imposer une
 ;; decision a la procedure,ou s'arreter ou indiquer une position de reprise ou de transfert
 Q
ACCEPTE(TIME,DECI,OBJET,POSITION,SENS) 
 S @ITRDT@(OBJET)=TIME,@D@(DECI,1)=OBJET,@D@(DECI,2)=POSITION,@D@(DECI,3)=SENS D MAJSIT^%ATPATN
 Q
EXATTENT 
 I VISU U 0 W !,"   examen des attentes  >>>>>>>>" H 1
 N decat,j,OB
 F j=1:1:NOBJET S @AT@(j)=0
 S decat="" F j=1:1 S decat=$O(@DECKAT@(decat)) Q:decat=""  D relance(decat)
 S decat="" F j=1:1 S decat=$O(@DECKAT@(decat)) Q:decat=""  S x=@D@(decat,1) D PROPAG^%ATPATN3(x)
 F OB=1:1:NOBJET I @ATTEND@(OB) S x=OB D PROPAG^%ATPATN3(x)
 Q
relance(decat) 
 I VISU U 0 W !,"  reexamen de la decision ",decat," en attente  >>>>>>>>" H 1
 I (@DECKAT@(decat,"ATTENTE.UTILISATEUR")=0)&(@DECKAT@(decat,"ATTENTE.SYSTEME")=0) S DELTATTEN=1,DECI=decat Q
 I @DECKAT@(decat,"ATTENTE.UTILISATEUR")=1 S DECI=decat D REEVALOC^%ATPATN(DECI,OBJET,POSITION,.REFUS) Q
 I @DECKAT@(decat,"ATTENTE.SYSTEME")=1 U 0 W !,!,decat,"  ","attente systeme " Q
 
RECUSATION ;;
 I DECI=0 G FIN
 S DELTATTEN=0 D EXATTENT I DELTATTEN=1 G FINLOC
RECUSE 
 S TIME=TIME+1 I '($D(@D@(DECI))) S DECI=DECI-1 G RECUSATION
 I VISU U 0 W !,!,"**** R E C U S A T I O N ****" H 2 W *7,*7,*7 H 1
 I VISU W !,"de",?11,DECI,?19,@D@(DECI,1),?27,@D@(DECI,2),?36,@D@(DECI,3)
 D VISU^%ATPATN S SENS=@D@(DECI,3),OBJET=@D@(DECI,1),POSITION=@D@(DECI,2)
 D VISUGRA^%ATPATN(OBJET,0)
 I @AT@(OBJET) S DECI=DECI-1 G:DECI=0 FIN G RECUSE
 G:SENS>0 PLUS G:SENS<0 MOINS
 ;;SENS=0
 I @ATTEND@(OBJET) W:VISU !,OBJET," en attente de jetons " S DECI=DECI-1 G RECUSE
 D LIBERM(OBJET) K @D@(DECI)
LIBOUCL S DECI=DECI-1 G:DECI=0 FIN I '($D(@D@(DECI))) G LIBOUCL
 S SENS=@D@(DECI,3),OBJET=@D@(DECI,1),POSITION=@D@(DECI,2)
 D VISUGRA^%ATPATN(OBJET,0)
 G POSITION
LIBERM(OBJET) ;;
 N OB,j K @ITRDT@(OBJET,POSITION) K:@D@(DECI,2)=0 @ITRDT@(OBJET)
 S OB="" F j=1:1 S OB=$O(@GRAPHE@(OBJET,OB)) Q:OB=""  Q:'(@ATTEND@(OB))  D INSERT1^%ATPATN3(OBJET,OB,DECI)
 D MAJETON^%ATPATN("RESTITUER",DECI,OBJET)
 Q
PLUS D MALUS(OBJET,POSITION,SENS),MINSIT^%ATPATN,REFUSE(TIME,DECI,OBJET,POSITION,SENS) G POSITION
MOINS 
 N LASTDEC
 K @D@(DECI) S DECI=DECI-1 G RECUSATION
EXTREME ;;
 I VISU U 0 W !,!,"**** situation extreme *****" H 2 W *7
 D VISU^%ATPATN,EXAM G RECUSATION
META ;;
 Q
REFUSE(TIME,DECI,OBET,POSITION,SENS) ;;
 D ACCEPTE(TIME,DECI,OBJET,POSITION,-(SENS))
 S @ITRDT@(OBJET,POSITION)=TIME
 Q
MALUS(OBJET,POSITION,SENS) ;;
 I '($D(@MAL@(OBJET,POSITION))) S @MAL@(OBJET,POSITION)=0
 S @MAL@(OBJET,POSITION)=@MAL@(OBJET,POSITION)+1
 Q
