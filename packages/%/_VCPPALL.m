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

;%VCPPALL^INT^1^59547,74034^0
GECPPALL ;
 
 
 
 
 
 
 N ATT,C,CH,CHAMP,IDF,IND,IND1,IND2,LEX,NLEX,NOR,NOR1,NOR2,P,R1,R2,REP,%REP,VAL,SUITE
 K ^%SCREC(SCR,"GERQS")
 F CHAMP=1:1:^%SCRE(SCR) I ($D(^%SCRE(SCR,CHAMP))#10)'=1,$D(^%SCRE(SCR,CHAMP,"QUERY")) D TCHAMP
 
 Q
TLIEN S REP=-1
 F %REP=0:0 S REP=$N(^%SCRE(SCR,CHAMP,"LIEN",REP)) Q:REP=-1  D TL2
 Q
TL2 S CH=^%SCRE(SCR,CHAMP,"LIEN",REP),R1=$P(CH,",",1),R2=$P(CH,",",4)
 S IND1=$$IND($P(CH,",",2)),IND2=$$IND($P(CH,",",5))
 S NOR1=$P(CH,",",3)
 S NOR1=$S(NOR1="":1,$E(NOR1,1)="?":$$IND($E(NOR1,2,$L(NOR1))),1:NOR1)
 S NOR2=$P(CH,",",6)
 S NOR2=$S(NOR2="":1,$E(NOR2,1)="?":$$IND($E(NOR2,2,$L(NOR2))),1:NOR2)
 D ADD^%QSGEST3(R1,IND1,NOR1,R2,IND2,NOR2) Q
 
TCHAMP S REP=-1
 S REP=$N(^%SCRE(SCR,CHAMP,"QUERY",REP)) Q:REP=-1  D TREP S ^%SCREC(SCR,"GERQS",CHAMP)="$$^%QSCALI2("_PER_","_IND_","_ATT_","_NOR_")" W !,CHAMP,") ",^%SCREC(SCR,"GERQS",CHAMP)
 Q
TREP S CH=^%SCRE(SCR,CHAMP,"QUERY",REP)
 
 S ATT=$P(CH,"~",1)
 
 
 I $E(ATT)="?" S SUITE=$E(ATT,2,$L(ATT)) S:SUITE="" SUITE=CHAMP-1 S ATT="RESUL("_SUITE_")" G IND0
 S ATT=""""_ATT_""""
IND0 
 S IND=$$IND($P(CH,"~",2))
 
 S NOR=$P(CH,"~",3)
 
 
 S NOR=$S(NOR="":1,$E(NOR,1)="?":$$IND($E(NOR,2,$L(NOR))),1:""""_NOR_"""")
 S PER=$S(REP="MOZ":"$$GI^%MZQS",1:""""_REP_"""")
 Q
 
LEX 
 S LEX="",NLEX=1 Q:P>$L(IDF)  S C=$E(IDF,P) I C'?1N S LEX=C,NLEX=0,P=P+1 Q
BLEX S C=$E(IDF,P),NUM=C?1N Q:'(NUM)  S LEX=LEX_C,P=P+1 G BLEX
 
IND(IDF) 
 N NUM,C,IND,LEX,NLEX,P S P=1,IND="",IDF=$TR(IDF,"_",",")
BIDF D LEX Q:LEX="" IND
 I NLEX S IND=IND_"RESUL("_LEX_")" G BIDF
 I '(NUM) S IND=IND_"_"""_LEX_"""_" G BIDF
 S IND=IND_LEX G BIDF
 
TEST W !,"Grille : " R SCR Q:$A(SCR)<32  I '($D(^%SCRE(SCR))) W " ???" G TEST
 D ^%VCPPALL G TEST

