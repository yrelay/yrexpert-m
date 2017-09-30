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

;%QSINDIV^INT^1^59547,73882^0
%QSINDIV(MODEL,REPER,INDIV,XG,YH,HA,LA,LE) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N DESCRIPT,ROUTAFF
 
 D DESC(.LA)
 I '($D(^OAFF)) S ^OAFF="Ordre affichage QSGBASE et QSAJCMS"
 I '($D(^OAFF($I))#10) S ^OAFF($I)=0
 D INIT(MODEL,REPER,INDIV,XG,YH,HA,LA,LE,"^RQSINDIV($J)","^ATTREP($J)",^OAFF($I))
 D ^%QSCOLF(XG,YH,HA,LA,LE,"DESCRIPT","^RQSINDIV($J)","^ATTREP($J)",MODEL,REPER,INDIV,^OAFF($I))
 K ^ATTREP($J),^RQSINDIV($J) Q
 
 
 
DESC(LA) 
 N LATR
 I SUB="C-IBM PC" S:(XG+LA)>79 LA=79-XG
 S DESCRIPT=2,LATR=((LA-6)\2)-3,ROUTAFF="AFF^%QSINDIV"
 
 S DESCRIPT(1)="Attributs^REV,BLD^"_LATR
 S DESCRIPT(1,"UC")="ATTR^%QSINDIV"
 S DESCRIPT(1,"TRT")="TATT^%QSINDIV"
 S DESCRIPT(2)="Valeur^BLD^"_LATR
 S DESCRIPT(2,"UC")="VALE^%QSINDIV"
 S DESCRIPT(2,"TRT")="TVAL^%QSINDIV"
 Q
 
INIT(MODEL,REPER,INDIV,XG,YH,HA,LA,LE,GLO,GLA,AFF) 
 N %A,%D,%O,%V,A,D,I,L,LAT,LI,O,V,TEMP,REP
 D MSG^%VZEATT($$^%QZCHW("Initialisations en cours"))
 K @(GLO),@(GLA)
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 
 S (LI,L)=0,REP=$$NOMLOG^%QSF(REPER)
 F I=1:1:$ZP(^[QUI]RQSMOD4L(REP,"")) S A=^[QUI]RQSMOD4L(REP,I),V=$$^%QSCALVA(REPER,INDIV,A) D @("INST"_AFF_"(A,V,1,.L)") S @GLO@(L,1,"PROTECT")=1,LAT(A)=""
 S A=""
 F %A=0:0 S A=$$NXTRIA^%QSTRUC8(REPER,INDIV,A) Q:A=""  I $$^%QSDROIT(REPER,A,"V",WHOIS) S O="" F %O=0:0 S O=$$NXTRIAO^%QSTRUC8(REPER,INDIV,A,O) Q:O=""  S V=$$VALEUR^%QSTRUC8(REPER,INDIV,A,O) D TO
 D RECATPR
 D @("TAB"_AFF)
 S @GLO=L
 Q
 
OKA() 
 Q $$^%QSDROIT(REPER,A,"V",WHOIS)
 
TO 
 Q:$D(LAT(A))  Q:$D(^[QUI]RQSLIEN(REPER,A))
 D @("INST"_AFF_"(A,V,O,.L)")
 Q
INST0(AT,V,O,L) 
 
 
 S:V=($TR($J("",99)," ","Z")_"reserve") V=""
 S L=L+1,@GLO@(L,1)=AT_$S(O=1:"",1:" ("_O_")")
 S @GLO@(L,2)=V,@GLA@(AT,O)=L
 Q
 
INST1(AT,V,O,LI) 
 S LI=LI+1,@TEMP@(O,AT,LI)=V Q
 
INST2(AT,V,O,LI) 
 S:V="" V=$TR($J("",99)," ","Z")_"reserve"
 S LI=LI+1,@TEMP@(AT,V,LI)=O Q
 
 
TAB0 Q
 
TAB1 
 S D="",L=0
 F %D=0:0 S D=$O(@TEMP@(D)) Q:D=""  S A="" F %A=0:0 S A=$O(@TEMP@(D,A)) Q:A=""  S V="" F %V=0:0 S V=$O(@TEMP@(D,A,V)) Q:V=""  I '($D(@GLA@(A,D))) D INST0(A,@TEMP@(D,A,V),D,.L)
 K @(TEMP)
 Q
 
TAB2 
 S A="",L=0
 F %A=0:0 S A=$O(@TEMP@(A)) Q:A=""  S V="" F %V=0:0 S V=$O(@TEMP@(A,V)) Q:V=""  S D="" F %D=0:0 S D=$O(@TEMP@(A,V,D)) Q:D=""  I '($D(@GLA@(A,@TEMP@(A,V,D)))) D INST0(A,V,@TEMP@(A,V,D),.L)
 K @(TEMP)
 Q
 
RECATPR 
 N ATB,V1,TAB,I,ATT,OO
 S ATB=$O(^[QUI]RQSATPR(REP,""))
 I ATB'="*" S ATB="" G BAT
 D ATPRALL
BAT S ATB=$O(^[QUI]RQSATPR(REP,ATB))
 G:ATB="" ATTNOM
 G:ATB="NOM" BAT
 S OO=""
BV1 S OO=$$NXTRIAO^%QSTRUC8(REPER,INDIV,ATB,OO)
 G:OO="" BAT
 S V1=$$VALEUR^%QSTRUC8(REPER,INDIV,ATB,OO)
 D ^%QSATPR(REP,ATB,V1,.TAB)
 F I=1:1 S ATT=$O(TAB(I,"")) Q:ATT=""  I '($$AIR^%QSGE5(REPER,INDIV,$P(ATT,"("))) D INSP($P(ATT," ("),TAB(I,ATT),$$ORD(ATT))
 K TAB
 G BV1
 
ATPRALL 
 D ALL^%QSATPR(REP,.TAB)
 F I=1:1 S ATT=$O(TAB(I,"")) Q:ATT=""  D INSP($P(ATT," ("),TAB(I,ATT),$$ORD(ATT))
 K TAB
 Q
 
ATTNOM 
 D ^%QSATPR(REP,"NOM",$$^%QSCALVA(REPER,INDIV,"NOM"),.TAB)
 F I=1:1 S ATT=$O(TAB(I,"")) Q:ATT=""  D INSP($P(ATT," ("),TAB(I,ATT),$$ORD(ATT))
 K TAB Q
 
INSP(AT,VAL,D) 
 
 Q:'($$^%QSDROIT(REPER,AT,"C",WHOIS))
 S:D="" D=1 Q:$$OAIR^%QSGE5(REPER,INDIV,AT,D)
 D @("INST"_AFF_"(AT,VAL,D,.L)")
 D PA^%QSGESTI(REPER,INDIV,AT,VAL,D)
 Q
 
ATTR(O,N,C,L) 
 Q $$^%QSDROIT(REPER,N,"M",WHOIS)
 
VALE(O,N,C,L) 
 Q:'($D(^RQSINDIV($J,L,C-1))) 0
 Q $$^%QSDROIT(REPER,$P(^RQSINDIV($J,L,C-1)," (",1),"M",WHOIS)
 
TATT(O,N,C,L,OO,ON) 
 Q:'($D(^RQSINDIV($J,L,C+1)))
 I N="" D PS^%QSGESTI(REPER,INDIV,O,^RQSINDIV($J,L,C+1),OO) Q
 D PA^%QSGESTI(REPER,INDIV,N,^RQSINDIV($J,L,C+1),ON)
 Q
 
TVAL(O,N,C,L,OO,ON) 
 Q:'($D(^RQSINDIV($J,L,C-1)))
 N ATT,CONT,NUM
 S CONT=^RQSINDIV($J,L,C-1),ATT=$P(CONT," (",1),NUM=$S(CONT'["(":1,1:$P($P(CONT,"(",2),")",1))
 I ATT="" D PS^%QSGESTI(REPER,INDIV,ATT,O,NUM) Q
 D PA^%QSGESTI(REPER,INDIV,ATT,N,NUM) Q
 
AFF2(MODEL,REPER,INDIV,XG,YH,HA,LA,LE) 
AFF 
 
 S REP=REPER
 D @(LE_"^%VVIDEO"),TITRE^%QSAJCM4,AFFHIE^%QSAJCM4(PIL)
 S COLON="DESCRIPT",DONNE="^RQSINDIV($J)",GATT="^ATTREP($J)"
 D REAFF^%QSCOLF3 Q
 
ORD(A) N D S D=$P($P(A," (",2),")")
 S:$E(D)="""" D=$E(D,2,$L(D)-1) Q D

