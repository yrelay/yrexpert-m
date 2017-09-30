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

;%QULELOU^INT^1^59547,73885^0
%QULELOU ;;12:23 PM  6 May 1992; ; 27 Jul 93 10:01 AM
 
 
OKREP 
 N TO,II,%II,IR,SAVR,TABUTI
 S SAVR=%R
 I $$GETLBLAN^%VTLBLAN(X)="?" S TABUTI=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"REP") K @(TABUTI) D REPA^%QSGEST9(TABUTI) S X=$$UN^%PKCHOIX(TABUTI,10,12,8),REUC=1
 G:X="" ROK S IR=$$NOMINT^%QSF(X)
 I IR="" D PARAM^%PKPOP2("10,6\CRHL\1\\\"_$$^%QZCHW("Repertoire inconnu")_"*",0) S %R=SAVR-1 D PARAM^%PKPOP(.Y) G RNOK
 
ROK S %R=SAVR,OK=1 Q
RNOK S %R=SAVR,OK=0 Q
 Q
 
OKLIEN 
 N TO,SAVR,TABUTI
 S SAVR=%R
 G:X="" LOK
 I VAL(1)="" X ^%PKREAD(7) D PARAM^%PKPOP2("10,6\CRHL\1\\\"_$$^%QZCHW("Le repertoire doit etre defini")_"*") S %R=SAVR-3 D PARAM^%PKPOP(.Y) G LNOK
 I $$GETLBLAN^%VTLBLAN(X)="?" S TABUTI=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LI") K @(TABUTI) D LIEN^%QSGEST9($$NOMINT^%QSF(VAL(1)),TABUTI) S X=$$UN^%PKCHOIX(TABUTI,10,12,8),REUC=1 Q:X=""
 I $$REPD^%QSGEL2($$NOMINT^%QSF(VAL(1)),X)="" X ^%PKREAD(7) D PARAM^%PKPOP2("10,6\CRHL\1\\\"_$$^%QZCHW("Ce lien ne part pas du repertoire")_"*") S OK=0,%R=SAVR-3 D PARAM^%PKPOP(.Y) G LNOK
LOK S OK=1,%R=SAVR Q
LNOK S OK=0,%R=SAVR Q
 Q
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
 N TO,SAVR,TEMP,M1,SAVR
 S SAVR=%R
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T") K @(TEMP)
 S M1=$$CONCAS^%QZCHAD(TEMP,"M1")
 D STAND
 I $$GETLBLAN^%VTLBLAN(X)="?" S REUC=1 G CF2
 I X'="",$D(^[QUI]RQSGLO("QULEL",X)) G CFOK
CFNOK S %R=SAVR,OK=0 Q
CFOK S %R=SAVR,OK=1 Q
 
CF2 S X1=$$^%QZCHW("configuration standard")
 S X2=$$^%QZCHW("configuration specifique")
 S X3=$$^%QZCHW("cons/modif/suppres. de configurations d'affichage")
 S @M1@(X1)="",@M1@(X2)="",@M1@(X3)=""
BCL S X=$$TIT^%PKCHOIX(M1,5,10,5,$$^%QZCHW("configuration bas d'ecran"),0) G:X="" CFNOK I X=X1 S X="STANDARD" G CFOK
 I X=X2 S X=$$TIT^%PKCHOIX("^[QUI]RQSGLO(""QULEL"")",20,10,10,$$^%QZCHW("configuration"),0) G:X="" BCL G CFOK
 D CLEPAG^%VVIDEO,NEW^%VCMS("QULELVIS"),CLEPAG^%VVIDEO G BCL
 
 
 
 
EXISTE(CONF) 
 D STAND
 Q $D(^[QUI]RQSGLO("QULEL",CONF))
STO(CONF,TAB) 
 S ^[QUI]RQSGLO("QULEL",CONF)=TAB Q
 
STAND I '($D(^[QUI]RQSGLO("QULEL","STANDARD"))) D STO("STANDARD","designation^1^2^quantite^2^2^^^^DESIGNATION^1^15^^^^^^^QUANTITE^2^12^^^^^^^12^^^^")
 Q
 
 
UTIL K ^%SCRE("QULELVIS"),^%SCRE("QULELVIS,COMMENT"),^%SCREC("QULELVIS")
 S ^%SCRE("QULELVIS")=33
 S ^%SCRE("QULELVIS",1)="INDEX",^%SCRE("QULELVIS",1,1)="",^(2)=2,^(3)=3,^(4)="",^(5)="",^(6)=0,^("INVISIBLE")="""QULEL"""
 S ^%SCRE("QULELVIS",2)="INDEX",^%SCRE("QULELVIS",2,1)="configuration :",^(2)=4,^(3)=3,^(4)="",^(5)="",^(6)=0
 F I=0,1,2 S ^%SCRE("QULELVIS",(I*3)+3,1)="-",^(2)=6,^(3)=I+6,^(4)="",^(5)="",^(6)=0,^%SCRE("QULELVIS",(I*3)+4,1)="-",^(2)=50,^(3)=I+6,^(4)="",^(5)="",^(6)=0,^%SCRE("QULELVIS",(I*3)+5,1)="-",^(2)=58,^(3)=I+6,^(4)="",^(5)="",^(6)=0
 F I=0,1,2 S ^%SCRE("QULELVIS",(I*3)+12,1)="-",^(2)=6,^(3)=I+10,^(4)="",^(5)="",^(6)=0,^%SCRE("QULELVIS",(I*3)+13,1)="-",^(2)=50,^(3)=I+10,^(4)="",^(5)="",^(6)=0,^%SCRE("QULELVIS",(I*3)+14,1)="-",^(2)=58,^(3)=I+10,^(4)="",^(5)="",^(6)=0
 F I=0,1,2 S ^%SCRE("QULELVIS",(I*3)+21,1)="-",^(2)=6,^(3)=I+14,^(4)="",^(5)="",^(6)=0,^%SCRE("QULELVIS",(I*3)+22,1)="-",^(2)=50,^(3)=I+14,^(4)="",^(5)="",^(6)=0,^%SCRE("QULELVIS",(I*3)+23,1)="-",^(2)=58,^(3)=I+14,^(4)="",^(5)="",^(6)=0
 
 S ^%SCRE("QULELVIS",30,1)="",^(2)=30,^(3)=17,^(4)="",^(5)="",^(6)=0
 S ^%SCRE("QULELVIS",31,1)="",^(2)=25,^(3)=18,^(4)="",^(5)="",^(6)=0
 S ^%SCRE("QULELVIS",32,1)="",^(2)=75,^(3)=18,^(4)="",^(5)="",^(6)=0
 S ^%SCRE("QULELVIS",33,1)="",^(2)=75,^(3)=19,^(4)="",^(5)="",^(6)=0
 S ^%SCRE("QULELVIS","GLOSTOC")="^[QUI]RQSGLO",^("POSITION")="0,1,79,23"
 S ^%SCRE("QULELVIS,COMMENT")=10
 S ^%SCRE("QULELVIS,COMMENT",1,1)="Commentaires",^(2)=17,^(3)=5,^("MODAFF")="REV"
 S ^%SCRE("QULELVIS,COMMENT",2,1)="Attributs de l'individu",^(2)=17,^(3)=9,^("MODAFF")="REV"
 S ^%SCRE("QULELVIS,COMMENT",3,1)="Attributs du lien",^(2)=17,^(3)=13,^("MODAFF")="REV"
 S ^%SCRE("QULELVIS,COMMENT",4,1)="~K~78~20",^(2)=2,^(3)=1,^("MODAFF")="NORM"
 S ^%SCRE("QULELVIS,COMMENT",5,1)="ligne",^(2)=50,^(3)=5,^("MODAFF")="NORM"
 S ^%SCRE("QULELVIS,COMMENT",6,1)="colonne",^(2)=58,^(3)=5,^("MODAFF")="NORM"
 S ^%SCRE("QULELVIS,COMMENT",7,1)="Longueur d'affichage :",^(2)=6,^(3)=17,^("MODAFF")="REV"
 S ^%SCRE("QULELVIS,COMMENT",8,1)="Attribut de tri :",^(2)=6,^(3)=18,^("MODAFF")="REV"
 S ^%SCRE("QULELVIS,COMMENT",9,1)="Sur lien (0/1) :",^(2)=50,^(3)=18,^("MODAFF")="REV"
 S ^%SCRE("QULELVIS,COMMENT",10,1)="Croissant (0/1) :",^(2)=50,^(3)=19,^("MODAFF")="REV"
 Q
 ;

