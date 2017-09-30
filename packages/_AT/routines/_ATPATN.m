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

;%ATPATN^INT^1^59547,73866^0
%ATPATN ;;08:31 PM  11 Dec 1992; ; 03 Dec 92  2:28 PM
 
 
 
 
 
CHOIXOBJ 
 N J S OBJET="" F J=1:1:NOBJET I '($D(@ITRDT@(J))),$$JETON(J)="BLANC",('(@PETRI@(J)))!(@PETRI@(J)&(@JETON@(J,"NB")=@DEGINT@(J))) S OBJET=J Q
 I VISU W !,"***** objet selectione >>>> ",$S(OBJET'="":OBJET,1:"____vide____")
 D VISUGRA(OBJET,1)
 Q
 
CHOIXPOSI(OBJET,POSITION,SENS) 
 S POSITION="",SENS=""
 F P=1:1:POSIMAX I '($D(@ITRDT@(OBJET,P))) S POSITION=P,SENS=1 Q
 I VISU W !,"***position >>>> ",OBJET," ",$S(POSITION'="":POSITION,1:"____vide____")
 Q
SITEMP ;;
 Q
EVALOC(DECI,OBJET,POSITION,REFUS) 
 S REFUS=0
 I $D(@MAL@(OBJET,POSITION)),@MAL@(OBJET,POSITION)>DELTAMAL S REFUS=1 Q
 S @DECKAT@(DECI)=TIME
 I $D(@SOMENTREE@(OBJET)) D ENTREE K @SOMENTREE@(OBJET)
 D REEVALOC(DECI,OBJET,POSITION,.REFUS) Q
REEVALOC(DECI,OBJET,POSITION,REFUS) 
 D EVAL(DECI,OBJET,POSITION)
 I @DECKAT@(DECI,"RESULTAT")="ECHEC" D TROISVALOC(DECI) Q
 I @DECKAT@(DECI,"RESULTAT")="REUSSITE" D QUATVALOC(DECI) Q
 I @DECKAT@(DECI,"RESULTAT")="ATTENTE" D CINQVALOC(DECI) Q
TROISVALOC(DECI) S REFUS=1 K @DECKAT@(DECI) D MAJETON("RESTITUER",DECI,OBJET)
 Q
QUATVALOC(DECI) S REFUS=0 K @DECKAT@(DECI) D MAJETON("DISTRIBUER",DECI,OBJET)
 Q
CINQVALOC(DECI) S REFUS=0
 S @DECKAT@(DECI,"ATTENTE.UTILISATEUR")=1,@DECKAT@(DECI,"ATTENTE.SYSTEME")=1,DELTATTEN=0
 Q
EVAGLO(REFUS) 
 Q
MAJSIT ;;
 Q:POSITION'>0
 Q:SENS'>0
 Q
MINSIT ;;
 Q:POSITION'>0
 Q:SENS'>0
 Q
VISU ;;
 I VISU=0 Q
 N d W !
 W !,?7,"Temps courant : ",?25,TIME,?40,"Decision courante : ",?62,DECI
 W !,?7,"Valeur courante : ",?25,@S@("FO"),?40,"Max",?62,@S@("MAX")
 D VISU2
 W !,?7,"decision",?16,"objet",?23,"position",?33,"sens"
 I '(print) Q
 I printer'=0 O printer
 F d=1:1:DECI I SHOWPOS,$D(@D@(d,3)),@D@(d,3)'<0 U printer W !,?11,d,?19,@D@(d,1),?27,@D@(d,2),?36,@D@(d,3)
 U printer F d=1:1:2 W ! F %d=1:1:80 W "*"
 U 0 R *%xxxx
 Q
VISU2 ;;
 Q
VISUGRA(OBJET,REAFF) N PERE
 Q:OBJET=""
 S PERE=$O(@ORIJET@(OBJET,"")),PERE=$S(PERE=0:"",1:PERE-1)
 D:REAFF AFF^%QULELV(STRUCAFF)
 D ELEM^%QULELV(STRUCAFF,OBJET-1,PERE)
 Q
JETON(OBJET) ;; renvoie la couleur du jeton s'il y en a un
 Q @JETON@(OBJET)
MAJETON(CHAINE,DECI,OBJET) 
 I CHAINE="RESTITUER" D RESTITUER(OBJET) Q
 I CHAINE="DISTRIBUER" D DISTRIBUER(OBJET) Q
 Q
RESTITUER(OBJET) 
 N OB Q:@JETON@(OBJET,"NB")'>0
 S OB="" F j=1:1 S OB=$O(@ORIJET@(OBJET,OB)) Q:OB=""  Q:OB=0  S @NBMAXJET@(OB)=@NBMAXJET@(OB)+1 U 0 W:VISU !,OBJET," restitue un jeton a ",OB S @JETON@(OBJET)="PAS.DE.JETON",@JETON@(OBJET,"NB")=@JETON@(OBJET,"NB")-1 D DISTRIBUER(OB)
 Q
 
DISTRIBUER(OBJET) 
 N OB,j
 I VISU U 0 W !," ~~~~~DISTRIBUTION de JETONS ~~~~~",OBJET
 S @JETON@(OBJET)="VERT"
 Q:@NBMAXJET@(OBJET)'>0
 S OB="" F j=1:1 S OB=$O(@GRAPHE@(OBJET,OB)) Q:OB=""  I @NBMAXJET@(OBJET)>0,'(@DEJAVUE@(OBJET,OB)) D EVARC(OBJET,OB) I @ARCVRAI@(OBJET,OB) S @NBMAXJET@(OBJET)=@NBMAXJET@(OBJET)-1,@JETON@(OB)="BLANC",@DEJAVUE@(OBJET,OB)=1,@ORIJET@(OB,OBJET)=1,@JETON@(OB,"NB")=@JETON@(OB,"NB")+1 D INDUCTION^%ATPATN3(OBJET,OB,DECI)
 Q
 
 
EVARC(OBJET,OB) 
 I VISU U 0 W !," ~~~~~VALIDATION DE L'ARC ~~~~~",OBJET,"-->",OB
 I ($$JETON(OB)="VERT")!($$JETON(OB)="ORANGE") S @ARCVRAI@(OBJet,OB)=0 Q
 
 
 
 S RESUL=$$EVALARC^%ATPATN2(OBJET,OB)
 S @ARCVRAI@(OBJET,OB)=RESUL Q
 
 
EVAL(DECI,OBJET,POSITION) 
 N x
 I VISU U 0 W !," ~~~~~evaluation de ~~~~~",OBJET," en ",POSITION," decision ",DECI
 S x=$$EVALATN^%ATPATN2(OBJET)
 
 I x=1 S @DECKAT@(DECI,"RESULTAT")="REUSSITE" Q
 I x=3 S @DECKAT@(DECI,"RESULTAT")="ECHEC" B  Q
 S @DECKAT@(DECI,"RESULTAT")="ATTENTE"
 Q
ENTREE 
 D ENTSTD^%ATNUTI(1,NOMATN)
 Q

