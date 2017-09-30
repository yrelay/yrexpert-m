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
;! Nomprog     : %QULELOP                                                     !
;! Module      : REQUETE SUR LISTE / EDITEUR EN LIEN                          !
;! But         : Activation des opérations sur l'éditeur en lien              !
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

;%QULELOP^INT^1^59547,73885^0
%QULELOP ;;05:28 PM  5 Oct 1993; ; 05 Oct 93  5:32 PM
 
 
CTRB(TP) 
 N REPO,PEROBJ
 N CONF,TRANSL,DIAL,CAR,ORDO,LIEN,REP,NIV,OBJ D GETVAR
 S REPO=$S(NIV=2:$$REPD^%QSGEL2(REP,LIEN),1:REP)
 D MEMX^%QCAMEM
 D CLEPAG^%VVIDEO,^%QSATTRI(OBJ,REPO,5,2,70,18),CLEPAG^%VVIDEO
 D RVARX^%QCAMEM
 S MODG=0,OKU=1,SUPREM=1
 Q
CTRV(TP) 
 N D,A,PEROBJ
 N CONF,TRANSL,DIAL,CAR,ORDO,LIEN,REP,NIV,OBJ D GETVAR
 S MODG=0,OKU=0
 Q:'($D(@TP@("P")))  Q:@TP@("P")=""
 S PEROBJ=$S(@TP@("P")="":"",ORDO:@TRANSL@("CV",@TP@("P")),1:@TP@("P"))
 S NIV=@TP@("N")
 S D=$$NOML1^%QSGES20(PEROBJ,OBJ,LIEN,OBJ) Q:D=""  S A=$$LIENI^%QSGEL3 Q:'($$IR^%QSGEST5(A,D))
 D MEMX^%QCAMEM,CLEPAG^%VVIDEO,^%QSATTRI(D,A,5,2,70,18),CLEPAG^%VVIDEO,RVARX^%QCAMEM
 S OKU=1,SUPREM=1
 Q
CUT(TP) 
 N PEROBJ
 N CONF,TRANSL,DIAL,CAR,ORDO,LIEN,REP,NIV,OBJ D GETVAR
 N PILCUT D GETVAR2
 Q:'($D(@TP@("P")))  Q:@TP@("P")=""
 S PEROBJ=$S(@TP@("P")="":"",ORDO:@TRANSL@("CV",@TP@("P")),1:@TP@("P"))
 S:'($D(@PILCUT)) @PILCUT=0
 I $$QUAL^%QSGEL2($$REPINT(NIV-1),LIEN) S @PILCUT=@PILCUT+1 D STOATTL
 D SUPS^%QSGEST3($$REPINT(NIV-1),PEROBJ,LIEN,$$REPINT(NIV),OBJ)
 Q
 
PASTE(TP) 
 N PEROBJ
 N CONF,TRANSL,DIAL,CAR,ORDO,LIEN,REP,NIV,OBJ D GETVAR
 N PILCUT D GETVAR2
 S PEROBJ=$S(@TP@("P")="":"",ORDO:@TRANSL@("CV",@TP@("P")),1:@TP@("P"))
 D ADDS^%QSGEST3($$REPINT(NIV-1),PEROBJ,LIEN,$$REPINT(NIV),OBJ)
 Q:'($$QUAL^%QSGEL2(REP,LIEN))
 I $D(@PILCUT),@PILCUT>0 D AFFATTL S @PILCUT=@PILCUT-1
 I $D(@DIAL@("L",LIEN)) D EXT^%TLTRDIA(@DIAL@("L",LIEN),$$LIENI^%QSGEL3,$$NOML1^%QSGES20(PEROBJ,OBJ,LIEN,OBJ),"")
 Q
 
STOATTL 
 N ILIEN1,NOMLIEN,REPL
 N A,O,%O,V,TAB,LI
 S ILIEN1=$$NOML1^%QSGES20(PEROBJ,OBJ,LIEN,OBJ) Q:ILIEN1=""
 S NOMLIEN=LIEN,REPL=$$LIENI^%QSGEL3
 F A="REP.SOURCE","REP.DESTINATION","NUMERO.ORDRE","NOM.LIEN","NOM","DESTINATION."_NOMLIEN,"SOURCE."_NOMLIEN S TAB(A)=""
 S A=""
COPL2 S A=$$NXTRIA^%QSTRUC8(REPL,ILIEN1,A) Q:A=""
 G:$D(TAB(A)) COPL2
 S O="" F %O=0:0 S O=$$NXTRIAO^%QSTRUC8(REPL,ILIEN1,A,O) Q:O=""  S V=$$VALEUR^%QSTRUC8(REPL,ILIEN1,A,O),@PILCUT@(@PILCUT,A,O)=V
 G COPL2
 
 
AFFATTL 
 N NOML,A,%A,O,%O,REPL,CCC
 S REPL=$$LIENI^%QSGEL3
 S NOML=$$NOML1^%QSGES20(PEROBJ,OBJ,LIEN,OBJ) Q:NOML=""
 S CCC=@PILCUT
 S A="" F %A=0:0 S A=$O(@PILCUT@(CCC,A)) Q:A=""  S O="" F %O=0:0 S O=$O(@PILCUT@(CCC,A,O)) Q:O=""  D PA^%QSGESTI(REPL,NOML,A,@PILCUT@(CCC,A,O),O)
 Q
INDIV(TP) 
 N LINV,Y1,INDV
 N CONF,TRANSL,DIAL,CAR,ORDO,LIEN,REP,NIV,OBJ D GETVAR
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
 
TRAITER(TP) 
 N NIV,TRT,NEX,LINV,Y1,INDV,RES,RAFF
 N CONF,TRANSL,DIAL,CAR,ORDO,LIEN,REP,NIV,OBJ D GETVAR
 S RAFF=0
 S TRT=$$GET^%TLDIAL2("Nom du traitement :",.RAFF)
 Q:TRT=""
TRAIBCL 
 
 
 
 
 
 
 
 S NEX=$$REPINT(NIV)
 D MEMX^%QCAMEM
 K (QUI,WHOIS,TRT,NEX,OBJ) D CURRENT^%IS,VARSYS^%QCSAP
 D CLEPAG^%VVIDEO
 S RES=$$^%TLIACUN(TRT,NEX,OBJ,0,0)
 D RVARX^%QCAMEM
 S MODG=1 D MAKEGRA^%QULELOM
 Q
 
 
 
REPINT(NIV) 
 Q:NIV=1 REP Q:$$TYPEL^%QSGES90(LIEN)>3 REP Q $$REPD^%QSGEL2(REP,LIEN)
 
 
 
 
 
VALEXAC(ADOBJ) 
 N OBJ
 S OBJ=$S(@ADOBJ="":"",ORDO:@TRANSL@("CV",@ADOBJ),1:@ADOBJ)
 Q OBJ
 
 
NEW N NUMET,CONF,TRANSL,DIAL,CAR,ORDO,LIEN,REP,NIV,OBJ
 
GETVAR N CARETU,NUMET
 S NIV=@TP@("N"),NUMET=@TP@("X")
 S CARETU=$$GLOCAR^%QULELOE(NUMET)
 S CONF=$$CONCAS^%QZCHAD(CARETU,"C"),TRANSL=$$CONCAS^%QZCHAD(CARETU,"T")
 S DIAL=$$CONCAS^%QZCHAD(CARETU,"GD"),CAR=$$CONCAS^%QZCHAD(CARETU,"GC")
 S LIEN=@CAR@("LIEN"),REP=@CAR@("REP"),ORDO=@CAR@("ORDO")
 S OBJ=$S(@TP@("O")="":"",ORDO:@TRANSL@("CV",@TP@("O")),1:@TP@("O"))
 Q
GETVAR2 N CARETU,NUMET
 S NUMET=@TP@("X")
 S CARETU=$$GLOCAR^%QULELOE(NUMET)
 S PILCUT=$$CONCAS^%QZCHAD(CARETU,"PILCUT")
 Q

