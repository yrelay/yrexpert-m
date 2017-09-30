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

;%ATPATP3^INT^1^59547,73866^0
%ATPATP3 ;;10:04 PM  15 Dec 1992;
 
INDUCTION(OBJET,OB,DECI) 
 
 Q:'(@PETRI@(OB))  I @JETON@(OB,"NB")'<@DEGINT@(OB),@ATTEND@(OB) S @JETON@(OB)="BLANC" Q
 I @JETON@(OB,"NB")<@DEGINT@(OB) D INSERT(OBJET,OB,DECI) Q
 Q
INSERT(OBJET,OB,DECI) 
 
 I @ATTEND@(OB) D INSERT1(OBJET,OB,DECI) Q
 S TIME=TIME+1,DECIP=$$NEXTDECI^%ATP0(DECI)
 
 D ACCEPTE^%ATP0(TIME,DECIP,OB,0,0) S @DECKAT@(DECIP)=TIME,@DECKAT@(DECIP,"RESULTAT")="ATTENTE",@DECKAT@(DECIP,"ATTENTE.SYSTEME")=1,@DECKAT@(DECIP,"ATTENTE.UTILISATEUR")=0,@ATTEND@(OB)=DECIP
 S g="" F j=1:1:NOBJET Q:'($D(@GRAPHE@(j,OB)))  S @DECKAT@(DECIP,"ATTEND.PRED",g)=TIME
 S @JETON@(OB)="ATTEND."_DECIP
 Q
INSERT1(OBJET,OB,DECI) 
 S DECIP=@ATTEND@(OB)
 K @DECKAT@(DECIP,"ATTEND.PRED",OBJET)
 I '($D(@DECKAT@(DECIP,"ATTEND.PRED"))),@JETON@(OB,"NB")'<@DEGINT@(OB) S @JETON@(OB)="BLANC" K @DECKAT@(DECIP) S @ATTEND@(OB)=0 Q
 I '($D(@DECKAT@(DECIP,"ATTEND.PRED"))),@JETON@(OB,"NB")<@DEGINT@(OB) S @JETON@(B)="BLANC",DECIP=@ATTEND@(OB) K @DECKAT@(DECIP) S @ATTEND@(OB)=0
 Q
 
PROPAG(x) 
 N OB1,OB2 S @AT@(x)=1 I VISU U 0 W !,x," provisoirement non recusable"
 S OB1="" F OB2=1:1 S OB1=$O(@ORIJET@(x,OB1)) Q:OB1=0  Q:OB1=""  I '(@AT@(OB1)) D PROPAG(OB1)
 Q
 
ECHOUER(OBJET) 
 
 S DECIP=@ATTEND@(OBJET)
 K @DECKAT@(DECIP)
 S @ATTEND@(OB)=0 Q

