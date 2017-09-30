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
;! HL002 ! HL     ! 20/07/12 ! Invalid function name                          !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%QMEXUT2^INT^1^59547,73878^0
%QMEXUT2 ;;09:57 AM  8 Sep 1993; 14 Oct 92  5:03 PM ; 08 Sep 93  9:57 AM
 
 
 
 
 
LEC(NIV) 
 N RR,II,RES
 S (RR,II,VALDEF)=""
 I $D(^[QUI]RQSDON("REM","LEC",$I,$P($ZPOS,"^",2),1)) S RR=^[QUI]RQSDON("REM","LEC",$I,$P($ZPOS,"^",2),1)
 I $D(^[QUI]RQSDON("REM","LEC",$I,$P($ZPOS,"^",2),2)) S II=^[QUI]RQSDON("REM","LEC",$I,$P($ZPOS,"^",2),2)
 I $$IR^%QSGE5(RR,II) S VALDEF=$$NOMLOG^%QSF(RR)_$C(0)_$C(0)_II
 S RES=$$CARAC(VALDEF)
 Q:RES="" 0
 S RR=$P(RES,$C(0)),II=$P(RES,$C(0),3)
 S ^[QUI]RQSDON("REM","LEC",$I,$P($ZPOS,"^",2),1)=RR
 S (^PARAENT($J,NIV,"INDFOC"),^[QUI]RQSDON("REM","LEC",$I,$P($ZPOS,"^",2),2))=$P(RES,$C(0),3)
 S ^PARAENT($J,NIV,"REPFOC")=$$NOMINT^%QSF(RR)
 Q 1
 
 
CARAC(VALDEF) ;;05:55 PM  8 Nov 1991;
 
 N %C,%R,PK,X,Y,GLO,I,STO,VAL,STOCK
 N TEMP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"R")
 S GLO=$$CONCAS^%QZCHAD(TEMP,"G")
 S VAL=$$CONCAS^%QZCHAD(TEMP,"V")
 D CLEPAG^%VVIDEO
 D:'($D(@GLO)) INIT
 
 S @VAL="STOCK"
 F I=1:1:3 S @VAL@(I)=$P(VALDEF,$C(0),I)
 
 D ^%PKSAISI(1,0,1,0,1,GLO,VAL,.ERR)
 
 Q:'($D(STOCK)) ""
 Q STOCK
 
INIT 
 N NBC,I,J,OBLIG,TJSOK,PLL
 S NBC=3
 S @GLO@("FL")="LD"
 S @GLO=""
 S @GLO@("H")=3,@GLO@("V")=3
 S @GLO@("NBC")=NBC
 S J=1,PLL=0 F I="Repertoire focus","Individu focus" S @GLO@("CHAMPS",J)=I,J=J+2 S:$L(I)>PLL PLL=$L(I)
 F I=2 S @GLO@("CHAMPS",I)=" "
 S @GLO@("PLL")=PLL
 S @GLO@("L")=40 F I=1:1:NBC S @GLO@("LARG",I)=40
 S @GLO@("SUIV",NBC)=1,@GLO@("PREC",1)=NBC
 S @GLO@("PREC",NBC)=1,@GLO@("SUIV",1)=NBC
 S @GLO@("POP1")="",@GLO@("POP2")=""
 S @GLO@("AIDE",1)=$$^%QZCHW("Repertoire de l'individu sur")_$C(0)_$$^%QZCHW("lequel est active le reseau")
 S @GLO@("AIDE",3)=$$^%QZCHW("Individu sur lequel est active le")_$C(0)_$$^%QZCHW("reseau semantique")
 ;HL002 S TJSOK=$XECUTE("S OK=1")
 S TJSOK="S OK=1"
 S @GLO@("STO.DER")=1
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 S @GLO@("EXEC.UCONT")="C"
 F I=1:1:NBC S @GLO@("UCONT.CHAMPS",I)=""
 S @GLO@("UCONT.CHAMPS",1)="D OKREP^%QMEXUT2"
 S @GLO@("UCONT.CHAMPS",3)="D OKINDI^%QMEXUT2"
 S @GLO@("UCONT")="D OKGRIL^%QMEXUT2"
 S OBLIG="S OK=(VAL'="""")"
 F I=2 S @GLO@("OBLIGAT",I)=TJSOK
 F I=1,3 S @GLO@("OBLIGAT",I)=OBLIG
 F I=1:1:NBC S @GLO@("FORMAT",I)=TJSOK
 F I=1:1:NBC S @GLO@("VALEG",I,0)="S OK=1"
 Q
 
OKGRIL S OK=(VAL(1)'="")&(VAL(3)'="") Q
 
OKREP 
 N TO,II,%II,IR,SAVR,TABUTI
 S SAVR=%R
 I $$GETLBLAN^%VTLBLAN(X)="?" S TABUTI=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"REP") K @(TABUTI) D REPA^%QSGEST9(TABUTI) S X=$$UN^%PKCHOIX(TABUTI,10,12,8),REUC=1
 G:X="" ROK S IR=$$NOMINT^%QSF(X)
 I IR="" D PARAM^%PKPOP2("10,6\CRHL\1\\\"_$$^%QZCHW("Repertoire inconnu")_"*",0) S %R=SAVR-1 D PARAM^%PKPOP(.Y) G RNOK
ROK S %R=SAVR,OK=1 Q
RNOK S %R=SAVR,OK=0 Q
 Q
 
 
 
OKINDI 
 N TO,SAVR
 S SAVR=%R
 G:X="" IOK
 I VAL(1)="" X ^%PKREAD(7) D PARAM^%PKPOP2("10,6\CHRL\1\\\"_$$^%QZCHW("Le repertoire doit etre defini")_"*") S %R=SAVR-3 D PARAM^%PKPOP(.Y) G INOK
 I $$GETLBLAN^%VTLBLAN(X)="?" S X=$$UN^%PKCHOIX($$LISTIND^%QSGEST6($$NOMINT^%QSF(VAL(1))),10,12,8),REUC=1,X=$$S^%QAX(X) G:X="" IOK
 G:$$IR^%QSGEST5($$NOMINT^%QSF(VAL(1)),$$M^%QAX(X)) IOK
 S REUC=1
 I '($$CONFIRM^%PKUTIL(2,14,60,$$^%QZCHW("Cet individu n'existe pas, voulez-vous le creer"))) G INOK
 I $$CREER^%QSGEIND($$NOMINT^%QSF(VAL(1)),X,"",1,.MSG) G INOK
IOK S %R=SAVR,OK=1 Q
INOK S %R=SAVR,OK=0 Q

