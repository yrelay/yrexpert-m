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

;%QSATPR^INT^1^59547,73880^0
%QSATPR(REP,ATR,VALA,TAB) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N DEFDAT
 S DEFDAT=0
 
ATPR I ATR="" S TAB=0 Q
 N GLO,COMP,CMP,CPT,VAL,EXP,LOG,NF,I,NEG
 S CPT=1,GLO="^[QUI]RQSATPR(REP,ATR)",COMP=""
BCO 
 S COMP=$O(@GLO@(COMP)) I COMP="" G FIN
 S VAL=""
BCV 
 S VAL=$O(@GLO@(COMP,VAL)) I VAL="" G BCO
 
 S CMP=COMP
 I (((((((CMP="[[")!(CMP="]]"))!(CMP="[]"))!(CMP="]["))!(CMP="'[["))!(CMP="']]"))!(CMP="'[]"))!(CMP="'][") G DBL
 S EXP="VALA"_CMP_"VAL" G CAL
DBL 
 S NEG=""
 I $E(CMP)="'" S NEG="'",CMP=$P(CMP,",",2)
 S EXP=NEG_"(("_"VALA"_$S($E(CMP,1,1)="[":"'<",1:">")_$P(VAL,",")_")&("_"VALA"_$S($E(CMP,2,2)="[":"<",1:"'>")_$P(VAL,",",2)_"))"
CAL 
 S @("LOG="_EXP)
 I '(LOG) G BCV
 S NF=""
BCF 
 S NF=$O(@GLO@(COMP,VAL,NF)) I NF="" G BCV
 
 D INS(@GLO@(COMP,VAL,NF),REP,.CPT)
 G BCF
 
FIN 
 S TAB=CPT-1
 Q
 
ATPRDAT(REP,ATR,VALA,DEFDAT,TAB) 
 G ATPR
 
INS(LATPR,REP,CPT) 
 N ATPR,I,VD,OK
 I '($D(DEFDAT)) N DEFDAT S DEFDAT=0
 S I=1
BCL S ATPR=$P(LATPR,"^",I)
 I ATPR="" G INSF
 S VD=$P(LATPR,"^",I+1)
 
 I VD'="",$$FINT^%QMDAUC(REP,ATPR,.VD)=0 G INSF
 I VD="",DEFDAT=1,$$FINT2^%QMDAUC(REP,ATPR,.VD)=0 G INSF
 
 S TAB(CPT,ATPR)=VD,CPT=CPT+1
INSF S I=I+2
 I I'=17 G BCL
 Q
 
 
ALL(REP,TAB) 
 N NF,CPT
 S NF="",CPT=1
BCNF 
 S NF=$O(^[QUI]RQSATPR(REP,"*","*","*",NF)) G:NF="" FIN
 D INS(^[QUI]RQSATPR(REP,"*","*","*",NF),REP,.CPT)
 G BCNF
 
 
INDIV(BASE,IND,TABLE) 
 N ATB,V1,TAB,I,ATR,OO,REP
 S REP=$$NOMINT^%QSF(BASE)
 S ATB=$O(^[QUI]RQSATPR(BASE,""))
 I ATB'="*" S ATB="" G BAT
 D TOUS
BAT S ATB=$O(^[QUI]RQSATPR(BASE,ATB)) G:ATB="" NOM
 G:ATB="NOM" BAT
 S OO=""
BV1 S OO=$$NXTRIAO^%QSTRUC8(REP,IND,ATB,OO) G:OO="" BAT
 S V1=$$VALEUR^%QSTRUC8(REP,IND,ATB,OO)
 D ^%QSATPR(BASE,ATB,V1,.TAB)
 F I=1:1 S ATR=$O(TAB(I,"")) Q:ATR=""  I '($D(@TABLE@(ATR))) S @TABLE@(ATR)=TAB(I,ATR)
 K TAB
 G BV1
NOM 
 D ^%QSATPR(BASE,"NOM",$$^%QSCALVA(REP,IND,"NOM"),.TAB)
 F I=1:1 S ATR=$O(TAB(I,"")) Q:ATR=""  S @TABLE@(ATR)=TAB(I,ATR)
 K TAB
 Q
TOUS 
 D ALL(BASE,.TAB)
 F I=1:1 S ATR=$O(TAB(I,"")) Q:ATR=""  S @TABLE@(ATR)=TAB(I,ATR)
 K TAB
 Q

