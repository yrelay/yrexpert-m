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

;%QMEXO3^INT^1^59547,73878^0
%QMEXO3 ;;03:27 PM  11 Jun 1993; ; 13 May 93 10:32 AM
 
 
 
 
 
 
 
 
 
 
 
 
 
ABRV(RIVX,LG) N GAG
 S GAG=$P(@RIVX,",",2) Q $$S^%QAX(GAG)
 
MODEAFF(RIVX) N ATN,RES
 S RES=@RIVX
 I $$AIR^%QSGE5("ETAT.RESEAU",RES,"RESEAU.ASSOCIE") Q "BLD"
 Q "NORM"
 
FULL(TP) 
 N GAG
 S GAG=$P(@TP@("O"),",",2) Q $$S^%QAX(GAG)
 
INFO(TP) 
 N RES,%I,I,D,A,OBJP,OBJ,NIV,NUMET,ATN,TERM,IDFC
 N CARETU,LIEN,REP
 S OBJ=@TP@("O"),OBJP=@TP@("P"),IDFC=@TP@("X"),ATN=@IDFC@("ATN")
 S LIEN="ETAT.PRECEDE",REP="ETAT.RESEAU"
 S RES=""
 S TERM=$$^%QSCALIN(REP,OBJ,"NOEUD.TERMINAL",1)
 S RES=RES_1_$C(0)_1_$C(0)_$$^%QZCHW("etat")_"  "_$P(OBJ,",",2)_" ("_$S(TERM=1:"",1:"non"_" ")_$$^%QZCHW("terminal")_")"
 S TERM=$$^%QSCALIN(REP,OBJ,"CONTEXTE.D.ACTIVATION",1)
 I TERM="" D PA^%QSGESTI(REP,OBJ,"CONTEXTE.D.ACTIVATION",1,1)
 Q:OBJP="" RES
 S D=$$NOML1^%QSGES20(OBJP,OBJ,LIEN,OBJ) Q:D="" RES
 S A=$$LIENI^%QSGEL3 Q:'($$IR^%QSGEST5(A,D)) RES
 S RES=RES_$C(0)_2_$C(0)_1_$C(0)_$$^%QZCHW("Predicat de transition")_"   "
 S PRD=" (sans) "
 I $$OAIR^%QSGE5(A,D,"PREDICAT",1) S PRD=$$VALEUR^%QSTRUC8(A,D,"PREDICAT",1)
 S RES=RES_PRD
 
 Q RES
 
 
CUT(TP) 
 N PEROBJ,REP,LIEN,OBJ,PILCUT,ICUT,NOMLIEN,REPLIEN,A,%A,O,%O,V
 S REP="ETAT.RESEAU",LIEN="ETAT.PRECEDE"
 S OBJ=$S(@TP@("O")="":"",1:@TP@("O"))
 S PILCUT=@TP@("X")
 S (ICUT,@PILCUT@("CUT"))=@PILCUT@("CUT")+1
 K @PILCUT@("CUT",ICUT)
 Q:'($D(@TP@("P")))  Q:@TP@("P")=""
 S PEROBJ=@TP@("P")
 S REPLIEN=$$LIENI^%QSGEL3
 S NOMLIEN=$$NOML1^%QSGES20(PEROBJ,OBJ,LIEN,OBJ)
 S A="" F %A=0:0 S A=$$NXTRIA^%QSTRUC8(REPLIEN,NOMLIEN,A) Q:A=""  I $$OKA(A) S O="" F %O=0:0 S O=$$NXTRIAO^%QSTRUC8(REPLIEN,NOMLIEN,A,O) Q:O=""  S V=$$VALEUR^%QSTRUC8(REPLIEN,NOMLIEN,A,O),@PILCUT@("CUT",ICUT,"A",A,O)=V
 D SUPS^%QSGEST3(REP,PEROBJ,LIEN,REP,OBJ)
 Q
OKA(A) Q:A="NOM" 0 Q:A="NOM.LIEN" 0 Q:A="NUMERO.ORDRE" 0 Q:A=("DESTINATION."_LIEN) 0 Q:A=("SOURCE."_LIEN) 0 Q:A="REP.SOURCE" 0 Q:A="REP.DESTINATION" 0
 Q 1
 
PASTE(TP) 
 N PEROBJ,REP,LIEN,OBJ,IDFC,PILCUT,ICUT,A,%A,NOMLIEN,REPLIEN,O,%O,V
 S REP="ETAT.RESEAU",LIEN="ETAT.PRECEDE"
 S OBJ=$S(@TP@("O")="":"",1:@TP@("O"))
 S PEROBJ=$S(@TP@("P")="":"",1:@TP@("P"))
 S PILCUT=@TP@("X")
 S ICUT=@PILCUT@("CUT")
 D ADDS^%QSGEST3(REP,PEROBJ,LIEN,REP,OBJ)
 S REPLIEN=$$LIENI^%QSGEL3
 S NOMLIEN=$$NOML1^%QSGES20(PEROBJ,OBJ,LIEN,OBJ)
 S A="" F %A=0:0 S A=$O(@PILCUT@("CUT",ICUT,"A",A)) Q:A=""  S O="" F %O=0:0 S O=$O(@PILCUT@("CUT",ICUT,"A",A,O)) Q:O=""  S V=@PILCUT@("CUT",ICUT,"A",A,O) D PA^%QSGESTI(REPLIEN,NOMLIEN,A,V,O)
 K @PILCUT@("CUT",ICUT)
 S @PILCUT@("CUT")=ICUT-1
 Q
 
GOTO(TP) 
 N PEROBJ,RR,REP,LIEN,OBJ,IDFC,ATN,A,%A,NOMLIEN,REPLIEN,O,%O,V
 S REP="ETAT.RESEAU",LIEN="ETAT.PRECEDE"
 S OBJ=$S(@TP@("O")="":"",1:@TP@("O"))
 S PEROBJ=$S(@TP@("P")="":"",1:@TP@("P"))
 S ATN=$P(OBJ,","),ELEM=$P(OBJ,",",2)
 S RR=1
 S Y1=$$GET($$^%QZCHW("Individu : "),ELEM,ATN,.RR)
 Q:Y1="" ""
 S OKU=1
 Q ATN_","_Y1
 
GET(MESGET,VDEF,ATN,ZZZ) 
ZZG N TRT,CTRLA,CONCUR,Y1,NY1,CTR
ZGET2 D POCLEPA^%VVIDEO
 D LIRE2^%VREAD(MESGET,VDEF,0,78,21,22,"","",.CTR,.Y1)
 Q:CTR'="" "" Q:Y1="" ""
 S ECRMOD=0,CONNU=0 S:Y1="?" Y1=""
 S NY1=$$SEARCHE^%LXABR(Y1,$$LISTVAL^%QSGEST6("RESEAU",ATN,"ETAT.RESEAU"),.ECRMOD,.CONNU)
 I CONNU=0 D ^%VZEAVT($$^%QZCHW("Traitement inconnu")) G ZGET2
 S ZZZ=ZZZ+ECRMOD
 Q:NY1="" ""
 I NY1'=Y1 D POCLEPA^%VVIDEO S DX=0,DY=20 W MESGET_" "_NY1 H 5E-1 S Y1=NY1
 Q Y1
 
 
DOC(TP) 
 N REP,OBJ,ORD,GLO,VAL
 S GLO=$$TEMP^%SGUTIL
 S REP="ETAT.RESEAU"
 S OBJ=$S(@TP@("O")="":"",1:@TP@("O")) Q:OBJ=""
 
 S VAL=$$^%QZCHW("Etat")_" : "_$P(OBJ,",",2)
 S ORD=""
 S ORD=$S($$VAIR^%QSGE5(REP,OBJ,"NOTE",VAL):$$NXTRIAVO^%QSTRUC8(REP,OBJ,"NOTE",VAL,""),1:"")
 D ^%QSNOTE("M",1,2,70,10,REP,OBJ,"NOTE",VAL,.ORD,GLO,.AFF)
 D:ORD'="" PA^%QSGESTI(REP,OBJ,"NOTE",VAL,ORD)
 Q
 
 
CARGEN(TP) 
 N OBJ,ATN
 S OBJ=$S(@TP@("O")="":"",1:@TP@("O")) Q:OBJ=""
 S ATN=$P(OBJ,",")
 D CARGEN^%QMEXCAR(ATN,0)
 Q
 
COUPER(TP) 
 N ICUT,PILCUT,REP,LIEN,OBJ,PEROBJ
 S PILCUT=@TP@("X")
 S REP="ETAT.RESEAU",LIEN="ETAT.PRECEDE"
 S OBJ=$S(@TP@("O")="":"",1:@TP@("O"))
 S (ICUT,@PILCUT@("CUT"))=@PILCUT@("CUT")+1
 S @PILCUT@("CUT",ICUT,"INDIV")=OBJ
 Q:'($D(@TP@("P")))  Q:@TP@("P")=""
 S PEROBJ=@TP@("P")
 D SUPS^%QSGEST3(REP,PEROBJ,LIEN,REP,OBJ)
 S MODG=1
 Q
 
COLLER(TP) 
 N ICUT,PILCUT,REP,OBJ
 S PILCUT=@TP@("X")
 S ICUT=@PILCUT@("CUT")
 S REP="ETAT.RESEAU",LIEN="ETAT.PRECEDE"
 S OBJ=$S(@TP@("O")="":"",1:@TP@("O"))
 S PEROBJ=$S(@TP@("P")="":"",1:@TP@("P"))
 D ADDS^%QSGEST3(REP,PEROBJ,LIEN,REP,OBJ)
 S MODG=1
 Q
 ;

