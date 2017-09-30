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

;%QWINMO3^INT^1^59547,73886^0
%QWINMO3(MODEL,REPER,INDIV,XG,YH,HA,LA,LE) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N DESCRIPT,ROUTAFF
 D POCLEPA^%VVIDEO,MES^%QSCOLF3("Un instant...")
 D DESC(.LA)
 D INIT(MODEL,REPER,INDIV,XG,YH,HA,LA,LE,"^RQSINDIV($J)","^ATTREP($J)",0)
 D ^%QSCOLF(XG,YH,HA,LA,LE,"DESCRIPT","^RQSINDIV($J)","^ATTREP($J)",MODEL,REPER,INDIV,0)
 K ^ATTREP($J),^RQSINDIV($J) Q
 
 
 
 
DESC(LA) 
 N LATR
 I SUB="C-IBM PC" S:(XG+LA)>79 LA=79-XG
 S DESCRIPT=2,LATR=((LA-6)\2)-3,ROUTAFF="AFF^%QWINMO3"
 
 S DESCRIPT(1)="Attributs^REV,BLD^"_LATR
 S DESCRIPT(1,"UC")="ATTR^%QWINMO3"
 S DESCRIPT(1,"TRT")="TATT^%QWINMO3"
 S DESCRIPT(2)="Valeur^BLD^"_LATR
 S DESCRIPT(2,"UC")="VALE^%QWINMO3"
 S DESCRIPT(2,"TRT")="TVAL^%QWINMO3"
 Q
 
INIT(MODEL,REPER,INDIV,XG,YH,HA,LA,LE,GLO,GLA,AFF) 
 N %A,%D,%O,%V,A,D,I,L,LAT,LI,O,V,TEMP,REP
 D MSG^%VZEATT($$^%QZCHW("Initialisations en cours"))
 K @(GLO),@(GLA)
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 
 S (LI,L)=0,REP=$$NOMLOG^%QSF(REPER)
 F I=1:1:$ZP(^[QUI]RQSMOD4L(REP,"")) S A=^[QUI]RQSMOD4L(REP,I),V=$$^%QSCALVA(REPER,INDIV,A) D:AFF=0 INS(A,V,1,.L) D:AFF=1 INST(A,V,1,.L) S @GLO@(L,1,"PROTECT")=1,LAT(A)=""
 S A="" F %A=0:0 S A=$O(@WWSTOCK@(REPER,INDIV,A)) Q:A=""  I $$OKA S O="" F %O=0:0 S O=$O(@WWSTOCK@(REPER,INDIV,A,O)) Q:O=""  S V=@WWSTOCK@(REPER,INDIV,A,O) D TO
 
 I AFF=1 D TAB
 S @GLO=L
 Q
 
OKA() 
 Q $$^%QSDROIT(REPER,A,"V",WHOIS)
 
TO 
 Q:$D(LAT(A))  Q:$D(^[QUI]RQSLIEN(REPER,A))
 D INS(A,V,O,.L)
 Q
ATTR(O,N,C,L) 
 Q $$^%QSDROIT(REPER,N,"M",WHOIS)
 
VALE(O,N,C,L) 
 Q:'($D(^RQSINDIV($J,L,C-1))) 0
 Q $$^%QSDROIT(REPER,$P(^RQSINDIV($J,L,C-1)," (",1),"M",WHOIS)
 
TATT(O,N,C,L,OO,ON) 
 Q:'($D(^RQSINDIV($J,L,C+1)))
 K @WWSTOCK@(REPER,INDIV,O,OO),@WWINIT@(REPER,INDIV,O,OO)
 I N'="" S (@WWSTOCK@(REPER,INDIV,N,ON),@WWINIT@(REPER,INDIV,N,ON))=^RQSINDIV($J,L,C+1)
 Q
 
TVAL(O,N,C,L,OO,ON) 
 Q:'($D(^RQSINDIV($J,L,C-1)))
 N ATT,CONT,NUM
 S CONT=^RQSINDIV($J,L,C-1),ATT=$P(CONT," (",1),NUM=$S(CONT'["(":1,1:$P($P(CONT,"(",2),")",1))
 S (@WWSTOCK@(REPER,INDIV,ATT,NUM),@WWINIT@(REPER,INDIV,ATT,NUM))=N
 Q
INS(AT,V,O,L) 
 
 
 S L=L+1,^RQSINDIV($J,L,1)=AT_$S(O=1:"",1:" ("_O_")")
 S ^RQSINDIV($J,L,2)=V,^ATTREP($J,AT,O)=L
 Q
 
INST(AT,V,O,LI) 
 S LI=LI+1,@TEMP@(O,AT,LI)=V Q
 
 
TAB 
 S D=""
 F %D=0:0 S D=$O(@TEMP@(D)) Q:D=""  S A="" F %A=0:0 S A=$O(@TEMP@(D,A)) Q:A=""  S V="" F %V=0:0 S V=$O(@TEMP@(D,A,V)) Q:V=""  I '($D(^ATTREP($J,A,D))) D INS(A,@TEMP@(D,A,V),D,.L)
 K @(TEMP) Q
 
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
 G:V1="" BAT
 S V1=$$VALEUR^%QSTRUC8(REPER,INDIV,ATB,OO)
 D ^%QSATPR(REP,ATB,V1,.TAB)
 F I=1:1 S ATT=$O(TAB(I,"")) Q:ATT=""  I '($$AIR^%QSGEST5(REPER,INDIV,$P(ATT,"("))) D INSP($P(ATT," ("),TAB(I,ATT),$$ORD(ATT))
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
 D INS(AT,VAL,D,.L),PA^%QSGESTI(REPER,INDIV,AT,VAL,D)
 Q
 
AFF2(MODEL,REPER,INDIV,XG,YH,HA,LA,LE) 
AFF 
 D @(LE_"^%VVIDEO"),TITRE^%QWINMO3,AFREP^%QWINMOA($$NOMLOG^%QSF(REPER)),AFIND^%QWINMOA(INDIV)
 S COLON="DESCRIPT",DONNE="^RQSINDIV($J)",GATT="^ATTREP($J)"
 D REAFF^%QSCOLF3 Q
 
ORD(A) N D S D=$P($P(A," (",2),")")
 S:$E(D)="""" D=$E(D,2,$L(D)-1) Q D

