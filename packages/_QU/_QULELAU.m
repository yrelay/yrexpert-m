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

;%QULELAU^INT^1^59547,73885^0
%QULELAU ;;10:30 AM  6 Oct 1992; ; 08 Oct 92  5:08 PM
 
 
OKREP 
 N TO,II,%II,IR,SAVR,TABUTI
 S SAVR=%R
 I $$GETLBLAN^%VTLBLAN(X)="?" S TABUTI=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"REP") K @(TABUTI) D REPA^%QSGEST9(TABUTI) S X=$$UN^%PKCHOIX(TABUTI,10,12,8),REUC=1
 G:X="" ROK S IR=$$NOMINT^%QSF(X)
 I IR="" D PARAM^%PKPOP2("10,6\CRHL\1\\\"_$$^%QZCHW("Repertoire inconnu")_"*",0) S %R=SAVR-1 D PARAM^%PKPOP(.Y) G RNOK
 I $$REPVID^%QSGEST5(IR) D PARAM^%PKPOP2("10,6\CRHL\1\\\"_$$^%QZCHW("Repertoire vide")_"*",0) S %R=SAVR-1 D PARAM^%PKPOP(.Y) G RNOK
ROK S %R=SAVR,OK=1 Q
RNOK S %R=SAVR,OK=0 Q
 Q
 
OKLIEN 
 N TO,SAVR,TABUTI,TEMP1,M1,X1,X2,X3
 S TEMP1=$$TEMP^%SGUTIL,M1=$$TEMP^%SGUTIL
 S SAVR=%R
 G:X="" LOK
 I $$GETLBLAN^%VTLBLAN(X)="?" S REUC=1 G LL2
 I $$EX^%QMLILA(X) G LOK
 I $$EXILIEN^%QSGEL2(X) G LOK
 X ^%PKREAD(7) D PARAM^%PKPOP2("10,6\CRHL\1\\\"_$$^%QZCHW("N'est pas une liste d'attributs")_"*") S %R=SAVR-3 D PARAM^%PKPOP(.Y) G LNOK
LOK S OK=1,%R=SAVR Q
LNOK S OK=0,%R=SAVR Q
LL2 S X1=$$^%QZCHW("acces a la gestion des listes d'attributs")
 S X2=$$^%QZCHW("choix d'une liste d'attributs")
 S X3=$$^%QZCHW("construction d'une liste d'attributs lien")
 S @M1@(X1)="",@M1@(X2)="",@M1@(X3)=""
LBCL S REUC=1,X=$$TIT^%PKCHOIX(M1,5,10,5,$$^%QZCHW("liste d'attribut"),0) G:X="" LNOK
 I X=X1 D CLEPAG^%VVIDEO S X=$$^%QS0MEN2 D CLEPAG^%VVIDEO G LBCL
 I X=X2 S X=$$CHOIX^%QMLILAN G:X="" LBCL G LOK
 I X=X3 S X=$$MKLIS^%QMLILAL D CLEPAG^%VVIDEO G LOK
 
 
 
OKINDI 
 N TO,SAVR
 S SAVR=%R
 G:X="" IOK
 I VAL(1)="" X ^%PKREAD(7) D PARAM^%PKPOP2("10,6\CHRL\1\\\"_$$^%QZCHW("Le repertoire doit etre defini")_"*") S %R=SAVR-5 D PARAM^%PKPOP(.Y) G INOK
 I VAL(3)="" X ^%PKREAD(7) D PARAM^%PKPOP2("10,6\CHRL\1\\\"_$$^%QZCHW("Le lien doit etre defini")_"*") S %R=SAVR-5 D PARAM^%PKPOP(.Y) G INOK
 I $$GETLBLAN^%VTLBLAN(X)="?" S X=$$UN^%PKCHOIX($$LISTIND^%QSGEST6($$NOMINT^%QSF(VAL(1))),10,12,8),REUC=1,X=$$S^%QAX(X) G:X="" IOK
 I $$GETLBLAN^%VTLBLAN(X)="??" S X=$$UN^%PKCHOIX($$RAVO^%QSGE6("L0","BASE",$$NOMINT^%QSF(VAL(1)),1),10,12,8),REUC=1 G:X="" IOK
 G:X="*" IOK G:$$IR^%QSGEST5($$NOMINT^%QSF(VAL(1)),$$M^%QAX(X)) IOK
 G:$$VAIR^%QSGE5("L0",X,"BASE",$$NOMINT^%QSF(VAL(1))) IOK
 S REUC=1
 I '($$CONFIRM^%PKUTIL(2,14,60,$$^%QZCHW("Cet individu n'existe pas, voulez-vous le creer"))) G INOK
 I $$CREER^%QSGEIND($$NOMINT^%QSF(VAL(1)),X,"",1,.MSG) G INOK
 G IOK
 X ^%PKREAD(7) S %R=SAVR D PARAM^%PKPOP2("10,6\CHRL\1\\\"_$$^%QZCHW("N'estpas un individu du repertoire")_"*") S %R=SAVR-5 D PARAM^%PKPOP(.Y) G INOK
IOK S %R=SAVR,OK=1 Q
INOK S %R=SAVR,OK=0 Q
 Q
 
OKDIA 
 N TO,SAVR S SAVR=%R
 I $$GETLBLAN^%VTLBLAN(X)="?" S X=$$UN^%PKCHOIX("^[QUI]TLDIAL",10,12,8),REUC=1
 G:X="" DOK
 I '($D(^[QUI]TLDIAL(X))) D PARAM^%PKPOP2("10,6\CRHL\1\\\"_$$^%QZCHW("Dialogue inconnu")_"*",0) S %R=3 D PARAM^%PKPOP(.Y) G DNOK
DOK S %R=SAVR,OK=1 Q
DNOK S %R=SAVR,OK=0 Q
 
 
OKCONF 
 N TO,SAVR,TEMP,M1,SAVR,X1,X2,X3
 S SAVR=%R
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T") K @(TEMP)
 S M1=$$CONCAS^%QZCHAD(TEMP,"M1")
 D STAND
 I $$GETLBLAN^%VTLBLAN(X)="?" S REUC=1 G CF2
 I X'="",$D(^[QUI]RQSGLO("QULEL2",X)) G CFOK
CFNOK S %R=SAVR,OK=0 Q
CFOK S %R=SAVR,OK=1 Q
 
CF2 S X1=$$^%QZCHW("configuration standard")
 S X2=$$^%QZCHW("configuration specifique")
 S X3=$$^%QZCHW("consultation des configurations")
 S @M1@(X1)="",@M1@(X2)="",@M1@(X3)=""
BCL S X=$$TIT^%PKCHOIX(M1,5,10,5,$$^%QZCHW("configuration bas d'ecran"),0) G:X="" CFNOK I X=X1 S X="STANDARD" G CFOK
 I X=X2 S X=$$TIT^%PKCHOIX("^[QUI]RQSGLO(""QULEL2"")",20,10,10,$$^%QZCHW("configuration"),0) G:X="" BCL G CFOK
 D CLEPAG^%VVIDEO,NEW^%VCMS("QULELV2"),CLEPAG^%VVIDEO G BCL
 
 
 
 
EXISTE(CONF) 
 D STAND
 Q $D(^[QUI]RQSGLO("QULEL2",CONF))
 
STAND Q:$D(^[QUI]RQSGLO("QULEL2","STANDARD"))
 S ^[QUI]RQSGLO("QULEL2","STANDARD")="12^"
 S ^[QUI]RQSGLO("QULEL2","STANDARD","LIEN","*")="designation^1^2^quantite^2^2^^^^DESIGNATION^1^15^^^^^^^QUANTITE^2^12^^^^^^^"
 Q
 ;
 ;

