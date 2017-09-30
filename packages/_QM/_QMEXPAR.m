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

;%QMEXPAR^INT^1^59547,73878^0
%QMEXPAR ;;10:54 AM  23 Nov 1992; ; 23 Nov 92 12:03 PM
 
 
 
CARGEN(RESEAU,REP,IND) 
 N %C,%R,PK,X,Y,GLO,I,STO,VAL,VALDEF,STOCK,SOR
 D CLEPAG^%VVIDEO
 S STO="STOCK",VAL="VALDEF"
 S GLO=$$TEMP^%SGUTIL
 D INIT
 
 F I=1:1:5 S VALDEF(I)=""
 S VALDEF(1)=RESEAU
 I $D(^[QUI]RQSDON("REM","LEC",$J,$P($ZPOS,"^",2),RESEAU,1)) S VALDEF(3)=^[QUI]RQSDON("REM","LEC",$J,$P($ZPOS,"^",2),RESEAU,1)
 I $D(^[QUI]RQSDON("REM","LEC",$J,$P($ZPOS,"^",2),RESEAU,2)) S VALDEF(5)=^[QUI]RQSDON("REM","LEC",$J,$P($ZPOS,"^",2),RESEAU,2)
 S VALDEF="STOCK"
DEF 
 D ^%PKSAISI(0,0,1,0,1,GLO,VAL,.ERR)
 K @(GLO)
 
 Q:'($D(STOCK)) 0
 S REP=$P(STOCK,$C(0),3) S:REP'="" ^[QUI]RQSDON("REM","LEC",$J,$P($ZPOS,"^",2),RESEAU,1)=REP
 S IND=$P(STOCK,$C(0),5) S:IND'="" ^[QUI]RQSDON("REM","LEC",$J,$P($ZPOS,"^",2),RESEAU,2)=IND
 Q 1
 
INIT 
 N NBC,I,J,OBLIG,TJSOK,PLL
 
 S NBC=5
 
 
 
 
 
 
 S @GLO@("FL")="LD"
 
 S @GLO=$$^%QZCHW("caracteristiques generales")
 
 S @GLO@("H")=2,@GLO@("V")=6
 
 S @GLO@("NBC")=NBC
 
 S @GLO@("CHAMPS",1)=$$^%QZCHW("Reseau")
 S @GLO@("CHAMPS",3)=$$^%QZCHW("Repertoire focus")
 S @GLO@("CHAMPS",5)=$$^%QZCHW("Individu focus")
 S (@GLO@("CHAMPS",2),@GLO@("CHAMPS",4))=" "
 
 S PLL=0 F I=1:1:NBC I $L(@GLO@("CHAMPS",I))>PLL S PLL=$L(@GLO@("CHAMPS",I))
 S @GLO@("PLL")=PLL
 
 S @GLO@("L")=30 F I=1:1:NBC S @GLO@("LARG",I)=30
 
 S @GLO@("SUIV",3)=5,@GLO@("PREC",3)=5
 S @GLO@("SUIV",5)=3,@GLO@("PREC",5)=3
 
 
 S @GLO@("POP1")="",@GLO@("POP2")=""
 
 S @GLO@("AIDE",3)="Repertoire de"_$C(0)_"l'individu associe"_$C(0)_"a l'etude"
 S @GLO@("AIDE",5)="Nom de l'individu"_$C(0)_"associe a l'etude"
 
 
 
 S TJSOK="S OK=1"
 
 
 S @GLO@("STO.DER")=1
 
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 
 
 
 S @GLO@("EXEC.UCONT")="C"
 F I=1:1:NBC S @GLO@("UCONT.CHAMPS",I)=""
 S @GLO@("UCONT.CHAMPS",3)="D OKREP^%QMEXPAR"
 S @GLO@("UCONT.CHAMPS",5)="D OKINDI^%QMEXPAR"
 S @GLO@("UCONT")=""
 
 
 S OBLIG="S OK=(VAL'="""")"
 F I=1:1:NBC S @GLO@("OBLIGAT",I)=TJSOK
 F I=3,5 S @GLO@("OBLIGAT",I)=OBLIG
 
 
 
 F I=1:1:NBC S @GLO@("FORMAT",I)=TJSOK
 
 
 F I=1:1:NBC S @GLO@("VALEG",I,0)=TJSOK
 Q
 
 
 
OKREP 
 N TO,II,%II,IR,SAVR,TABUTI
 S SAVR=%R
 I $$GETLBLAN^%VTLBLAN(X)="?" S TABUTI=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"REP") K @(TABUTI) D REPA^%QSGEST9(TABUTI) S X=$$UN^%PKCHOIX(TABUTI,10,12,8),REUC=1
 G:X="" ROK S IR=$$NOMINT^%QSF(X)
 I IR="" D PARAM^%PKPOP2("10,6\CRHL\1\\\"_$$^%QZCHW("Repertoire inconnu")_"*",0) S %R=SAVR-3 D PARAM^%PKPOP(.Y) G RNOK
ROK S %R=SAVR,OK=1 Q
RNOK S %R=SAVR,OK=0 Q
 Q
 
 
OKINDI 
 N TO,SAVR
 S SAVR=%R
 G:X="" IOK
 I VAL(3)="" X ^%PKREAD(7) D PARAM^%PKPOP2("10,6\CHRL\1\\\"_$$^%QZCHW("Le repertoire doit etre defini")_"*") S %R=SAVR-5 D PARAM^%PKPOP(.Y) G INOK
 I $$GETLBLAN^%VTLBLAN(X)="?" S X=$$UN^%PKCHOIX($$LISTIND^%QSGEST6($$NOMINT^%QSF(VAL(3))),10,12,8),REUC=1,X=$$S^%QAX(X) G:X="" IOK
 G:$$IR^%QSGE5($$NOMINT^%QSF(VAL(3)),$$M^%QAX(X)) IOK
 S REUC=1
 I '($$CONFIRM^%PKUTIL(2,14,60,$$^%QZCHW("Cet individu n'existe pas, voulez-vous le creer"))) G INOK
 I $$CREER^%QSGEIND($$NOMINT^%QSF(VAL(3)),X,"",1,.MSG) G INOK
IOK S %R=SAVR,OK=1 Q
INOK S %R=SAVR,OK=0 Q
 Q
 ;

