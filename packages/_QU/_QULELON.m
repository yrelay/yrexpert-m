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

;%QULELON^INT^1^59547,73885^0
%QULELON ;;03:22 PM  2 Jul 1993; ; 02 Jun 93  6:34 PM
 
 
 
 
 
ABRV(RIVX,LG) N GAG
 S GAG=$$VALEXAC(RIVX) Q $$S^%QAX(GAG)
 
 
FULL(TP) 
 N GAG
 S GAG=$$VALEXAC("@TP@(""O"")") Q $$S^%QAX(GAG)
 
 
 
INFO(TP) 
 N RES,%I,I,D,A,OBJP,OBJ,NIV,NUMET
 N CARETU,CONF,TRANSL,DIAL,CAR,ORDO,LIEN,REP
 S NIV=@TP@("N"),OBJ=@TP@("O"),OBJP=@TP@("P"),NUMET=@TP@("X")
 S CARETU=$$GLOCAR^%QULELOE(NUMET) D GETADR
 S ORDO=@CAR@("ORDO"),LIEN=@CAR@("LIEN"),REP=@CAR@("REP")
 S OBJ=$S(ORDO:@TRANSL@("CV",OBJ),1:OBJ)
 S RES=""
 S I="" F %I=1:1 S I=$O(@CONF@("COM",I)) Q:I=""  S RES=RES_@CONF@("COM",I)_$C(0)_I_$C(0)
 S I="" F %I=1:1 S I=$O(@CONF@("ATT",I)) Q:I=""  S RES=RES_@CONF@("ATT",I)_$C(0)_$$FORMEX^%QSCALVA($$REPINT(NIV),OBJ,I)_$C(0)
 Q:OBJP="" RES
 S OBJP=$S(ORDO:@TRANSL@("CV",OBJP),1:OBJP)
 S D=$$NOML1^%QSGES20(OBJP,OBJ,LIEN,OBJ) Q:D="" RES
 S A=$$LIENI^%QSGEL3 Q:'($$IR^%QSGEST5(A,D)) RES
 S I="" F %I=1:1 S I=$O(@CONF@("LIEN",I)) Q:I=""  S RES=RES_@CONF@("LIEN",I)_$C(0)_$$FORMEX^%QSCALVA(A,D,I)_$C(0)
 Q RES
 
 
 
REPINT(NIV) 
 Q:NIV=1 REP Q:$$TYPEL^%QSGES90(LIEN)>3 REP Q $$REPD^%QSGEL2(REP,LIEN)
 
 
 
 
 
VALEXAC(ADOBJ) 
 N OBJ
 S OBJ=$S(@ADOBJ="":"",ORDO:@TRANSL@("CV",@ADOBJ),1:@ADOBJ)
 Q OBJ
 
POIDS(PER,FIL) 
 N REPI,RES,D
 Q:'($D(@CONF@("POIDS"))) 0 Q:'($D(@CONF@("ORDRE"))) 0 Q:'($D(@CONF@("LIEN"))) 0
 G:@CONF@("LIEN") PDSL
 S REPI=$$REPINT($S(PER="":1,1:2))
 S RES=$$^%QSCALIN(REPI,FIL,@CONF@("POIDS"),1)
 G PDSFI
PDSL I PER="" S RES="" G PDSFI
 S RES=$$^%QSCALIN($$LIENI^%QSGEL3,$$NOML1^%QSGES20(PER,FIL,LIEN,FIL),@CONF@("POIDS"),1)
PDSFI S:(RES+0)'=RES RES=-99999
 I @CONF@("ORDRE") S RES=-(RES)
 Q RES
 
 
GETADR S CONF=$$CONCAS^%QZCHAD(CARETU,"C"),TRANSL=$$CONCAS^%QZCHAD(CARETU,"T")
 S DIAL=$$CONCAS^%QZCHAD(CARETU,"GD"),CAR=$$CONCAS^%QZCHAD(CARETU,"GC")
 Q
 
 
GOTO(TP) 
 N PEROBJ,RR,REP,LIEN,OBJ,IDFC,ATN,A,%A,NOMLIEN,REPLIEN,O,%O,V
 N CONF,TRANSL,DIAL,CAR,ORDO,LIEN,REP,NIV,OBJ D GETVAR^%QULELOP
 S OBJ=$S(@TP@("O")="":"",1:@TP@("O"))
 S OBJ=$S(ORDO:@TRANSL@("CV",OBJ),1:OBJ)
 S RR=1
 S Y1=$$GET($$^%QZCHW("Individu : "),OBJ,.RR)
 Q:Y1="" ""
 S OKU=1
 Q $S(ORDO:@TRANSL@("VC",Y1),1:Y1)
 
GET(MESGET,VDEF,ZZZ) 
ZZG N TRT,CTRLA,CONCUR,Y1,NY1,CTR
ZGET2 D POCLEPA^%VVIDEO
 D LIRE2^%VREAD(MESGET,VDEF,0,78,21,22,"","",.CTR,.Y1)
 Q:CTR'="" "" Q:Y1="" ""
 S ECRMOD=0,CONNU=0 S:Y1="?" Y1=""
 S NY1=$$SEARCHE^%LXABR(Y1,$$CONCAS^%QZCHAD(TRANSL,"VC"),.ECRMOD,.CONNU)
 I CONNU=0 D ^%VZEAVT($$^%QZCHW("Individu inconnu")) G ZGET2
 S ZZZ=ZZZ+ECRMOD
 Q:NY1="" ""
 I NY1'=Y1 D POCLEPA^%VVIDEO S DX=0,DY=20 W MESGET_" "_NY1 H 5E-1 S Y1=NY1
 Q Y1
 
 
INDIV(TP) 
 N LINV,Y1,INDV
 N CONF,TRANSL,DIAL,CAR,ORDO,LIEN,REP,NIV,OBJ D GETVAR^%QULELOP
 S MODG=1,OKU=1
INDBCL D POCLEPA^%VVIDEO W $$^%QZCHW("Individu : ") S DX=$X,DY=$Y D ^%VLEC
 I Y1="" S MODG=0 Q
 I Y1="?" S Y1=$$UN^%PKCHOIX($$LISTIND^%QSGEST6($$REPINT(NIV+1)),10,2,18) G:Y1="" INDBCL
 S INDV=Y1
 G:$$IR^%QSGEST5($$REPINT(NIV+1),INDV) INDLI
 I '($$CONFIRM^%PKUTIL(2,14,60,$$^%QZCHW("Cet individu n'existe pas, voulez-vous le creer"))) S (OKU,MODG)=0 Q
 I $$CREER^%QSGEIND($$REPINT(NIV+1),INDV,"",1,.MSG) S (OKU,MODG)=0 Q
 I $D(@DIAL@("R",$$REPINT(NIV+1))) D DIALOGUE^%QSATTRI(INDV,$$REPINT(NIV+1),@DIAL@("R",$$REPINT(NIV+1)),"")
INDLI D AJGRA^%QULELOM($S(ORDO:@TRANSL@("CV",@TP@("O")),1:@TP@("O")),INDV)
 D ADDS^%QSGEST3($$REPINT(NIV),OBJ,LIEN,$$REPINT(NIV+1),INDV)
 Q:'($$QUAL^%QSGEL2(REP,LIEN))
 I $D(@DIAL@("L",LIEN)) D DIALOGUE^%QSATTRI($$NOML1^%QSGES20(OBJ,INDV,LIEN,INDV),$$LIENI^%QSGEL3,@DIAL@("L",LIEN),"")
 S LINV=$$LIENI^%QSGEL2($$REPINT(NIV),$$REPINT(NIV+1),LIEN,$$TYPEL^%QSGES90(LIEN)) Q:LINV=""
 I $D(@DIAL@("L",LINV)) D DIALOGUE^%QSATTRI($$NOML1^%QSGES20(INDV,OBJ,LINV,OBJ),$$LIENI^%QSGEL3,@DIAL@("L",LINV),"")
 Q
 ;

