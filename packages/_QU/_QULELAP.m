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

;%QULELAP^INT^1^59547,73885^0
%QULELAP ;;11:29 AM  6 Oct 1992; ; 03 Nov 92  5:22 PM
 
 
 
 
 
 
 
 
 
CTRB(TP) 
 N REPO,PEROBJ
 N CONF,TRANSL,DIAL,CAR,LIEN,REP,NIV,OBJ
 D NEW,GETVAR
 D MEMX^%QCAMEM
 D CLEPAG^%VVIDEO,^%QSATTRI(OBJ,REPO,5,2,70,18),CLEPAG^%VVIDEO
 D RVARX^%QCAMEM
 S MODG=0,OKU=1,SUPREM=1
 Q
CTRV(TP) 
 N D,A,PEROBJ,NL,REPP
 N CONF,TRANSL,DIAL,CAR,LIEN,REP,NIV,OBJ D GETVAR
 S MODG=0,OKU=0
 Q:'($D(@TP@("P")))  Q:@TP@("P")=""
 S NL=@GRAP@(@TP@("P"),@TP@("O"))
 S PEROBJ=@TRANSL@(@TP@("P")),REPP=$P(PEROBJ,$C(0)),PEROBJ=$P(PEROBJ,$C(0),2)
 
 I '($$QUAL^%QSGEL2(REPP,NL)) Q
 S D=$$NOML1^%QSGES20(PEROBJ,OBJ,NL,OBJ) Q:D=""  S A=$$LIENI^%QSGEL3 Q:'($$IR^%QSGEST5(A,D))
 D MEMX^%QCAMEM,CLEPAG^%VVIDEO,^%QSATTRI(D,A,5,2,70,18),CLEPAG^%VVIDEO,RVARX^%QCAMEM
 S OKU=1,SUPREM=1
 Q
CUT(TP) 
 N PEROBJ,REPP
 N CONF,TRANSL,DIAL,CAR,LIEN,REP,NIV,OBJ D GETVAR
 Q:'($D(@TP@("P")))  Q:@TP@("P")=""
 S LIEN=@GRAP@(@TP@("P"),@TP@("O"))
 S PEROBJ=@TRANSL@(@TP@("P")),REPP=$P(PEROBJ,$C(0)),PEROBJ=$P(PEROBJ,$C(0),2)
 D SUPS^%QSGEST3(REPP,PEROBJ,LIEN,REPO,OBJ)
 Q
 
PASTE(TP) 
 N PEROBJ,REPP,REPO
 N CONF,TRANSL,DIAL,CAR,LIEN,REP,NIV,OBJ D GETVAR
 S PEROBJ=@TRANSL@(@TP@("P")),REPP=$P(PEROBJ,$C(0)),PEROBJ=$P(PEROBJ,$C(0),2)
 D ADDS^%QSGEST3(REPP,PEROBJ,LIEN,REPO,OBJ)
 Q:'($$QUAL^%QSGEL2(REP,LIEN))
 
 Q
 
COUPER(TP) 
 N D,A,PEROBJ,NL,REPP,TLI,REPO
 N CONF,TRANSL,DIAL,CAR,LIEN,REP,NIV,OBJ D GETVAR
 S MODG=0,OKU=0
 Q:'($D(@TP@("P")))  Q:@TP@("P")=""
 S NL=@GRAP@(@TP@("P"),@TP@("O"))
 S PEROBJ=@TRANSL@(@TP@("P")),REPP=$P(PEROBJ,$C(0)),PEROBJ=$P(PEROBJ,$C(0),2)
 S TLI=$$TYPE2^%QSGEST9(REPP,NL)
 G:TLI=2 COUP2
 Q:'($$CONFIRM^%PKUTIL(2,14,60,$$^%QZCHW("Confirmez-vous la suppression de la liaison entre")_" "_PEROBJ_" "_$$^%QZCHW("et")_" "_OBJ))
 D SUPS^%QSGEST3(REPP,PEROBJ,NL,REPO,OBJ)
 G COUPFIN
COUP2 D ^%VSQUEAK
 Q:'($$CONFIRM^%PKUTIL(2,10,60,$$^%QZCHW("Attention la suppression de cette liaison va eliminer l'individu")_" "_OBJ_" "_$$^%QZCHW("du repertoire")_" "_$$NOMLOG^%QSF(REPO)_" "_$$^%QZCHW("Confirmez-vous cette suppression")))
 D SX^%QSGESTK(REPO,OBJ)
COUPFIN 
 D MAKEGRA^%QULELAM
 S (OKU,MODG)=1
 Q
 
INDIV(TP) 
 N LINV,Y1,INDV,TLI,TABUTI,K,TLIEN
 N CONF,TRANSL,REPO,DIAL,CAR,LIEN,REP,NIV,OBJ D GETVAR
 S (MODG,OKU)=0
 S TABUTI=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LI") K @(TABUTI)
 S TLIEN=$$LIENI^%QSGEL3
 D LIEN^%QSGEST9(REPO,TABUTI)
 S TLI="" F %L=0:0 S TLI=$O(@TABUTI@(TLI)) Q:TLI=""  S K=0 S:$$TYPE2^%QSGEST9(REPO,TLI)=1 K=1 S:K=0 K=$$REPD^%QSGEL2(REPO,TLI)=TLIEN K:K @TABUTI@(TLI)
LIENB D POCLEPA^%VVIDEO W $$^%QZCHW("Lien : ") S DX=$X,DY=$Y D ^%VLEC
 Q:Y1=""
 I $$GETLBLAN^%VTLBLAN(Y1)="?" S Y1=$$UN^%PKCHOIX(TABUTI,10,12,8) Q:Y1=""  G LB2
 I '($D(@TABUTI@(Y1))) X ^%PKREAD(7) D PARAM^%PKPOP2("10,6\CRHL\1\\\"_$$^%QZCHW("Il est impossible de creer une telle liaison")_"*") G LIENB
LB2 S TLI=$$TYPE2^%QSGEST9(REPO,Y1)
 S LIEN=Y1
INDBCL D POCLEPA^%VVIDEO W $$^%QZCHW("Individu : ") S DX=$X,DY=$Y D ^%VLEC
 Q:Y1=""
 S INDV=Y1
 S REP=$$REPD^%QSGEL2(REPO,LIEN)
 I TLI=2 S INDV=OBJ_","_INDV G:$$IR^%QSGEST5(REP,INDV) LIENB S (OKU,MODG)=0 Q:$$CREER^%QSGEIND(REP,INDV,"",1,.MSG)  G INDOK
 I INDV="?" S INDV=$$UN^%PKCHOIX($$LISTIND^%QSGEST6(REP),10,2,18) G:INDV="" INDBCL G INDLI
 I '($$IR^%QSGEST5(REP,INDV)) Q:'($$CONFIRM^%PKUTIL(2,14,60,$$^%QZCHW("Cet individu n'existe pas, voulez-vous le creer")))  Q:$$CREER^%QSGEIND(REP,INDV,"",1,.MSG)
INDLI D ADDS^%QSGEST3(REPO,OBJ,LIEN,REP,INDV)
INDOK S (OKU,MODG)=1
 D AJGRA^%QULELAM(REPO,OBJ,LIEN,REP,INDV)
 Q
 
TRAITER(TP) 
 N NIV,TRT,NEX,LINV,Y1,INDV,RES,RAFF
 N CONF,REPO,TRANSL,DIAL,CAR,LIEN,REP,NIV,OBJ D GETVAR
 S RAFF=0
 S TRT=$$GET^%TLDIAL2("Nom du traitement :",.RAFF)
 Q:TRT=""
 D MEMX^%QCAMEM
 K (QUI,WHOIS,TRT,REPO,OBJ) D CURRENT^%IS,VARSYS^%QCSAP
 D CLEPAG^%VVIDEO
 S RES=$$^%TLIACUN(TRT,REPO,OBJ,0,0)
 D RVARX^%QCAMEM
 S MODG=1 D MAKEGRA^%QULELAM
 Q
 
 
NEW N NUMET,CONF,TRANSL,DIAL,CAR,LIEN,REP,NIV,OBJ,REPO
 
GETVAR N CARETU,NUMET
 S NIV=@TP@("N"),NUMET=@TP@("X")
 S CARETU=$$GLOCAR^%QULELAE(NUMET)
 S CONF=$$CONCAS^%QZCHAD(CARETU,"C"),TRANSL=$$CONCAS^%QZCHAD(CARETU,"T")
 S DIAL=$$CONCAS^%QZCHAD(CARETU,"GD"),CAR=$$CONCAS^%QZCHAD(CARETU,"GC")
 S LIEN=@CAR@("LIEN"),REP=@CAR@("REP")
 S OBJ=$S(@TP@("O")="":"",1:@TRANSL@(@TP@("O")))
 S REPO=$P(OBJ,$C(0)),OBJ=$P(OBJ,$C(0),2)
 Q

