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

;%QSKILL^INT^1^59547,73882^0
QSKILL ;
 
 
 
 
 
 N LIAT,ATT,C,CH,CHAMP,IDF,IND,IND1,IND2,LEX,NLEX,NOR,NOR1,NOR2,P,R1,R2,REP,%REP,VAL,SUITE,CAS,TYP
 F CHAMP=1:1:^%SCRE(SCR) D:$D(^%SCRE(SCR,CHAMP,"QUERY")) TCHAMP
 F CHAMP=1:1:^%SCRE(SCR) D:$D(^%SCRE(SCR,CHAMP,"LIEN")) TLIEN
 Q
 
TLIEN 
 S REP=-1
 F %REP=0:0 S REP=$N(^%SCRE(SCR,CHAMP,"LIEN",REP)) Q:REP=-1  D TL2
 Q
TL2 S CH=^%SCRE(SCR,CHAMP,"LIEN",REP),R1=$P(CH,",",1),R2=$P(CH,",",5)
 S IND1=$$IND($P(CH,",",2)),IND2=$$IND($P(CH,",",6))
 S NOR1=$P(CH,",",3),LIAT=$P(CH,",",4)
 S NOR1=$S(NOR1="":1,$E(NOR1,1)="?":$$IND($E(NOR1,2,$L(NOR1))),1:NOR1)
 S NOR2=$P(CH,",",7)
 S NOR2=$S(NOR2="":1,$E(NOR2,1)="?":$$IND($E(NOR2,2,$L(NOR2))),1:NOR2)
 
 
 S TYP=$$TYPE^%QSGEST9(R1,LIAT) Q:TYP=0
 I TYP=1 D OSUPS^%QSGEST3(R2,IND2,NOR1,LIAT,R1,$$NOMEX^%QSGES10(R1,IND1)) Q
 I TYP=2 D OSUPS^%QSGEST3(R1,IND1,NOR2,LIAT,R2,$$NOMEX^%QSGES10(R2,IND2)) Q
 D SUPS^%QSGEST3(R1,IND1,LIAT,R2,IND2) Q
 
TCHAMP 
 S REPZ=-1
 F %REP=0:0 S REPZ=$N(^%SCRE(SCR,CHAMP,"QUERY",REPZ)) Q:REPZ=-1  S REP=$S(REPZ="MOZ":$$GI^%MZQS,1:REPZ) D TREP
 Q
TREP S CH=^%SCRE(SCR,CHAMP,"QUERY",REPZ)
 
 S ATT=$P(CH,"~",1)
 S CAS=$S($E(ATT)'="?":0,ATT="?":1,1:2)
 I CAS=0 S VAL=AFRESU(CHAMP)
 
 I CAS=1 S ATT=AFRESU(CHAMP),VAL=AFRESU(CHAMP+1)
 I CAS=2 S SUITE=$E(ATT,2,$L(ATT)),ATT=$S(SUITE?.N:AFRESU(SUITE),1:""),VAL=$S($E(ATT)?1U:AFRESU(CHAMP),1:"")
 
 S IND=$$IND($P(CH,"~",2))
 
 S NOR=$P(CH,"~",3)
 
 
 S NOR=$S(NOR="":1,$E(NOR,1)="?":$$IND($E(NOR,2,$L(NOR))),1:NOR)
 
 D PS^%QSGESTI(REP,IND,ATT,VAL,NOR) Q
 
LEX 
 S LEX="",NLEX=1 Q:P>$L(IDF)  S C=$E(IDF,P) I C'?1N S LEX=C,NLEX=0,P=P+1 Q
BLEX S C=$E(IDF,P) Q:C'?1N  S LEX=LEX_C,P=P+1 G BLEX
 
IND(IDF) 
 N C,IND,LEX,NLEX,P S P=1,IND=""
BIDF D LEX Q:LEX="" IND
 I NLEX S IND=IND_AFRESU(LEX) Q:AFRESU(LEX)="" "" G BIDF
 I LEX="_" S IND=IND_"," G BIDF
 S IND=IND_LEX G BIDF

