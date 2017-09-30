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

;%ATPATP1^INT^1^59547,73866^0
%ATPATP1 ;
 ;;algo de decision pour un GRAPHE de petri
 ;;*** initialisation de l'exemple test1 ***
 W !,!,"*** initialisation de test1"
 F j=1:1 S STRUC(j)=$T(STRUC+j) Q:$P(STRUC(j),";;",2)=""
 F j=1:1 S PETRI(j)=$T(PETRI+j) Q:$P(PETRI(j),";;",2)=""
 S NOBJET=9
 D INIT^qtest1
 S NBBUT=1,@BUT@(7)=1
 Q
INIT ;;
 W !,!,"*** initialisation pour atn de petri"
 ;;******** les variables*************
 S ob="^OBJET($J)",DEGINT="^DEGINT($j)",GRAPHE="^GRAPHE($J)",PETRI="^PETRI($j)",NBMAXJET="^NBMAXJET($j)",BUT="^BUT($j)",DECKAT="^DECKAT($j)",DEJAVUE="^DEJAVUE($j)",DEGEX="^DEGEX($j)",ARCVRAI="^ARCVRAI($j)",ORIJET="^ORIJET($j,@PASSAGE@(OBJET))",ATTEND="^ATTEND($j)",AT="^AT($j)",SOMENTREE="^SOMENTREE($j)",POSIJETON="^POSIJETON($J)",JETENSOM="^JETENSOM($j)",EPUISE="^EPUISE($j)",ITRDT="^ITRDT($j)",PASSAGE="^PASSAGE($j)",PASSARC="^PASSARC($J)",ORIJ="^ORIJET($j)"
 N j,s1,s2
 K @(ob),@(DEGINT),@(GRAPHE),@(PETRI),@(NBMAXJET),@(BUT),@(DECKAT),@(DEJAVUE),@(ARCVRAI),@(ORIJ),@(DEGEX),@(ATTEND),@(AT),@(SOMENTREE),@(POSIJETON),@(JETENSOM),@(EPUISE),@(PASSAGE),@(ITRDT),@(PASSARC) F j=1:1:NOBJET S @ob@(j)=$C(64+j),@DEGINT@(j)=0,@PETRI@(j)=0,@DEGEX@(j)=0,@ATTEND@(j)=0,@AT@(j)=0,@PASSAGE@(j)=0
 
 F j=1:1 S chg=STRUC(j),chg=$P(chg,";;",2) Q:chg=""  F j1=1:1 S arc=$P(chg,"!",j1) Q:arc=""  S s1=$P(arc,",",1),s2=$P(arc,",",2),@GRAPHE@(s1,s2)=1,@DEJAVUE@(0,s1,s2)=0,@DEGEX@(s1)=@DEGEX@(s1)+1,@DEGINT@(s2)=@DEGINT@(s2)+1,@PASSARC@(s1,s2)=0 W !,arc
 
 F j=1:1 S chg=PETRI(j),chg=$P(chg,";;",2) Q:chg=""  F j1=1:1 S arc=$P(chg,",",j1) Q:arc=""  S @PETRI@($P(chg,",",j1))=1
 
 
 F j=1:1:NOBJET S @BUT@(j)=0,@NBMAXJET@(j)=0
 F j=1:1:NOBJET I @PETRI@(j)=1 F j2=1:1:@DEGEX@(j) S @POSIJETON@(j,j2,"WHERE")="",@POSIJETON@(j,j2,"PASSAGE")=""
 ;;*************** init generale ***************
 S D="^DECI($j,NIVEAU)",S="^SITU($j,NIVEAU)",MXG="^MXG($j,NIVEAU)",MAL="^MALUS($j,NIVEAU)",POPDECI="^POPDECI($j)",PERE="^PERE($j)",JETON="^JETON($j)"
 S POSIMAX=1,NIVEAU=1,DECI=0,TIME=0,SHOWPOS=1,DELTAMAL=20
 S @S@("FO")="***",@S@("MAX")="***"
 S print=1,VISU=0,printer=0
 S NIVEAU=1,POSITION=0,BUTVU=0,BUTMAX=1 ;;nombre maxi de buts a atteindre avant
 ;; de rendre la main
 K @(D),@(MAL),@(POPDECI),@(PERE),@(JETON)
 ;; situation initiale
 K @(ITRDT) S @POPDECI=0,@PERE@(0)=0,@JETON@(1)="BLANC",@JETON@(1,"NB")=1
 S @NBMAXJET@(1)=1,OBJET=1
 S @ORIJET@(1,0)=1,@POSIJETON@(1,1,"WHERE")=1,@POSIJETON@(1,1,"PASSAGE")=0,@JETENSOM@(1)=1,@JETENSOM@(1,1,1)=1
 F j=2:1:NOBJET S @JETON@(j)="PAS.DE.JETON",@JETON@(j,"NB")=0
 Q
STRUC ;;
 ;;1,2!1,3!2,4!2,5!3,4!3,6!4,7!5,7!6,7!
 ;;
PETRI ;;
 ;;4
 
 
 
 
 
INIT2 
 S @SOMENTREE@(1)=1
 S TMP=$$TEMP^%SGUTIL
 S @TMP@("AFF")="$$AFF^qtest1"
 S @TMP@("FULL")="$$FULL^qtest1"
 S STRUCAFF=$$INIT^%QULELV(G,G,12,3,TMP,"1"_$C(0)_"20"_$C(0)_"atn "_NOMATN,0,1)
 Q
AFF(RIVX,LG) N VAL
 S VAL=@RIVX Q $S($D(^[QUI]RQSGLO("ATN",NOMATN,"TITRE",VAL)):^[QUI]RQSGLO("ATN",NOMATN,"TITRE",VAL),1:VAL)
 Q
 
FULL(TP) N VAL
 S VAL=@TP@("O") Q $S($D(^[QUI]RQSGLO("ATN",NOMATN,"TITRE",VAL)):^[QUI]RQSGLO("ATN",NOMATN,"TITRE",VAL),1:VAL)
 Q

