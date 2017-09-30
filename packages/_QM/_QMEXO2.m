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

;%QMEXO2^INT^1^59547,73878^0
%QMEXO2 ;;10:40 AM  22 Nov 1993; ; 19 Nov 93  4:25 PM
 
 
 
MAKEGRA 
 
 
 
 N TEMP,PILE,X,Y,Z,%I,%J,%K,CPT,VU,RAC,IRAC,CODEX,O,%O
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"MAKE") K @(TEMP)
 S PILE=$$CONCAS^%QZCHAD(TEMP,"P")
 S VU=$$CONCAS^%QZCHAD(TEMP,"V")
 
 K @(GRAP)
 S RAC="" F CPT=1:1 S RAC=$O(@GRAC@(RAC)) Q:RAC=""  S @PILE@(CPT)=RAC,@VU@(RAC)=""
 S %I=CPT,CPT=0
 F %K=0:0 S CPT=$O(@PILE@(CPT)) Q:CPT=""  S X=@PILE@(CPT) I $$AIR^%QSGEST5(REP,X,LIEN) S Y="" F %I=%I:1 S Y=$$NXTRIAO^%QSTRUC8(REP,X,LIEN,Y) Q:Y=""  S @GRAP@(X,Y)="" S:'($D(@VU@(Y))) @PILE@(%I)=Y,@VU@(Y)=""
 
 K @(TEMP)
 Q
 
 
AJGRA(XX,XY) 
 N TEMP,PILE,VU,CPT,%I,%K,X,Y,CODEX,LCPT,CPT
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"AJ") K @(TEMP)
 S PILE=$$CONCAS^%QZCHAD(TEMP,"P"),VU=$$CONCAS^%QZCHAD(TEMP,"V")
 S @GRAP@(XX,XY)=""
 
 I $D(@GRAP@(XY))>9 G AJGRAFI
 S CPT=0,@PILE@(CPT)=XY,@VU@(XY)=""
 S %I=1,CPT=""
 F %K=0:0 S CPT=$O(@PILE@(CPT)) Q:CPT=""  S X=@PILE@(CPT) I $$AIR^%QSGEST5(REP,X,LIEN) S Y="" F %I=%I:1 S Y=$$NXTRIAV^%QSTRUC8(REP,X,LIEN,Y) Q:Y=""  S @GRAP@(X,Y)="" I '($D(@VU@(Y))) S @VU@(Y)="" I $D(@GRAP@(Y))<10 S @PILE@(%I)=Y
 G AJGRAFI
AJGRAFI K @(TEMP)
 Q
 
 
SUPGRA(XY) 
 N XX,%X
 I $D(@GRAP@(XY)) K @GRAP@(XY)
 S XX="" F %X=0:0 S XX=$O(@GRAP@(XX)) Q:XX=""  I $D(@GRAP@(XX,XY)) K @GRAP@(XX,XY)
 Q
 
 
CTRB(TP) 
 N REPO,OBJ
 S OBJ=$S(@TP@("O")="":"",1:@TP@("O"))
 S REPO="ETAT.RESEAU"
 D MEMX^%QCAMEM
 D CLEPAG^%VVIDEO,^%QSATTRI(OBJ,REPO,5,2,70,18),CLEPAG^%VVIDEO
 D RVARX^%QCAMEM
 S MODG=0,OKU=1,SUPREM=1
 Q
 
CTRV(TP) 
 N OBJ,REP,PEROBJ,D,A,PRD,Y1
 S OBJ=@TP@("O")
 S REP="ETAT.RESEAU",LIEN="ETAT.PRECEDE"
 S MODG=0,OKU=0,SUPREM=0
 Q:'($D(@TP@("P")))  Q:@TP@("P")=""
 S PEROBJ=$S(@TP@("P")="":"",1:@TP@("P"))
 S D=$$NOML1^%QSGES20(PEROBJ,OBJ,LIEN,OBJ) Q:D=""  S A=$$LIENI^%QSGEL3 Q:'($$IR^%QSGEST5(A,D))
 D MEMX^%QCAMEM
 D CLEPAG^%VVIDEO,^%QSATTRI(D,A,5,2,70,18),CLEPAG^%VVIDEO
 D RVARX^%QCAMEM
 S MODG=0,OKU=1,SUPREM=1
 Q
 
 
PRED(TP) 
 N OBJ,REP,PEROBJ,D,A,PRD,Y1
 S OBJ=@TP@("O")
 S REP="ETAT.RESEAU",LIEN="ETAT.PRECEDE"
 S MODG=0,OKU=0,SUPREM=0
 Q:'($D(@TP@("P")))  Q:@TP@("P")=""
 S PEROBJ=$S(@TP@("P")="":"",1:@TP@("P"))
 S D=$$NOML1^%QSGES20(PEROBJ,OBJ,LIEN,OBJ) Q:D=""  S A=$$LIENI^%QSGEL3 Q:'($$IR^%QSGEST5(A,D))
 I $$OAIR^%QSGE5(A,D,"PREDICAT",1) S Y1=$$VALEUR^%QSTRUC8(A,D,"PREDICAT",1) G CTRV2
 I '($$CONFIRM^%PKUTIL(2,14,60,$$^%QZCHW("Il n'y a pas de predicat sur cette transition, voulez-vous en mettre un ?"))) S (OKU,MODG)=0 Q
 S DX=0,DY=21 D CLEBAS^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW("Predicat : "),"",2,75,22,22,"","$$UCPRD^%QMEXO2",.CTR,.Y1)
 Q:Y1=""
 S SUPREM=1
 D PA^%QSGESTI(A,D,"PREDICAT",Y1,1)
CTRV2 D CLEPAG^%VVIDEO
 D ^%PSPRSA1(Y1,2,15)
 S OKU=1
 Q
 
UCPRD(YY1,REAF) 
 N CONNU,ECRMOD
 S REAF=0
 Q:YY1="" 0
 I YY1="?" S YY1=$$CHOIX^%PSPRSA Q:YY1="" 0
 I $$EXIPRED^%PSPRGES(YY1) Q 1
 I '($$CONFIRM^%PKUTIL(2,14,60,$$^%QZCHW("Ce predicat n'existe pas, desirez-vous le creer ?"))) Q 0
 Q 1
 
REGLE(TP) 
 N OBJ,REP,PEROBJ,D,A,PRD,Y1,ORD,RAFF,TRT
 S D=@TP@("O")
 S A="ETAT.RESEAU"
 S MODG=0,OKU=0,SUPREM=0,RAFF=0
 F ORD=1:1 G:'($$OAIR^%QSGE5(A,D,"REGLE",ORD)) REGCRE S Y1=$$VALEUR^%QSTRUC8(A,D,"REGLE",ORD) I $P(Y1,"\")="TRAITER" S Y1=$P(Y1,"\",2) G REGLE2
REGCRE I '($$CONFIRM^%PKUTIL(2,14,60,$$^%QZCHW("Il n'y a pas de traitement sur ce noeud, voulez-vous en mettre un ?"))) S (OKU,MODG)=0 Q
 S DX=0,DY=21 D CLEBAS^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW("Traitement : "),"",2,75,22,22,"","$$TRT^%QMEXO2",.CTR,.Y1)
 Q:Y1=""
 D PA^%QSGESTI(A,D,"REGLE","TRAITER\"_Y1,ORD)
REGLE2 D CLEPAG^%VVIDEO
 D ^%TLSAISI(Y1)
 S OKU=1
 Q
 
TRT(YY1,REAF) 
 N CONNU,ECRMOD
 S REAF=0
 Q:YY1="" 0
 I YY1="?" S YY1=$$SEARCHE^%LXABR("","^[QUI]TTL",.ECRMOD,.CONNU) Q YY1'=""
 I $$EXISTE^%TLGEST(YY1) Q 1
 I '($$CONFIRM^%PKUTIL(2,14,60,$$^%QZCHW("Ce traitement n'existe pas, desirez-vous le creer ?"))) Q 0
 D CREER^%TLGEST(YY1) Q 1
 Q YY1'=""
 
SUPP(TP) 
 N OBJ,REP,PEROBJ,D,A,PRD,Y1,ORD
 S D=@TP@("O")
 S A="ETAT.RESEAU"
 S MODG=0,OKU=0,SUPREM=0
 I '($$CONFIRM^%PKUTIL(2,14,60,$$^%QZCHW("Voulez-vous reellement supprimer cet etat ?"))) S (OKU,MODG)=0 Q
 D SX^%QSGESTK(A,D)
 D SUPGRA(D)
 K @GRAC@(D)
 S OKU=1,MODG=1
 Q
 
TERM(TP) 
 N OBJ
 S OBJ=$S(@TP@("O")="":"",1:@TP@("O"))
 D SAISIE^%QMEXST(OBJ)
 S MODG=0,SUPREM=1
 Q
 
TRAIT(TP) 
 S MODG=0,SUPREM=0,IKU=1
 D CLEPAG^%VVIDEO
 D ^%TLMENUG
 Q
 
INDIV(TP) 
 N PEROBJ,REP,LIEN,OBJ,Y1,INDV,ATN,IDFC
 S REP="ETAT.RESEAU",LIEN="ETAT.PRECEDE",IDFC=@TP@("X"),ATN=@IDFC@("ATN")
 S OBJ=$S(@TP@("O")="":"",1:@TP@("O"))
 S MODG=1,OKU=1
INDBCL D POCLEPA^%VVIDEO W $$^%QZCHW("Individu : ") S DX=$X,DY=$Y D ^%VLEC
 I Y1="" S MODG=0 Q
 I Y1="?" S Y1=$$UN^%PKCHOIX($$LISTVAL^%QSGEST6("RESEAU",ATN,"ETAT.RESEAU"),10,2,18) G:Y1="" INDBCL
 S INDV=ATN_","_Y1
 G:$$IR^%QSGEST5(REP,INDV) INDLI
 I '($$CONFIRM^%PKUTIL(2,14,60,$$^%QZCHW("Cet individu n'existe pas, voulez-vous le creer"))) S (OKU,MODG)=0 Q
 I $$CREER^%QSGEIND(REP,INDV,"",1,.MSG) S (OKU,MODG)=0 Q
INDLI D AJGRA^%QMEXO2(@TP@("O"),INDV)
 D ADDS^%QSGEST3(REP,OBJ,LIEN,REP,INDV)
 Q
 
CXTACT(TP) 
 N REPO,OBJ,TERM
 S OBJ=$S(@TP@("O")="":"",1:@TP@("O"))
 S REPO="ETAT.RESEAU"
 D ^%QMEXCT(REPO,OBJ)
 S MODG=1,SUPREM=1
 Q
POIDS(X,Y) N LIEN Q:(X="")!(Y="") 0
 S LIEN=$$NOML^%QSGES20(X,Y,"ETAT.PRECEDE",Y)
 Q $$^%QSCALIN("LIEN.I",LIEN,"BONUS.UTILISATEUR",1)+0

