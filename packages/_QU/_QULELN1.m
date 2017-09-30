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

;%QULELN1^INT^1^59547,73885^0
%QULELN1 ;;12:27 PM  6 May 1992
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
GETTRIPL(REP,LIEN,GRAC) 
 N %C,%R,PK,X,Y,GLO,I,STO,VAL,TEMP,TABUTI,GLO,ADRL,ADR,IN,IND,REPI,ORDO
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S STO=$$CONCAS^%QZCHAD(TEMP,"STO")
 S GLO=$$CONCAS^%QZCHAD(TEMP,"GLO")
 S TABUTI=$$CONCAS^%QZCHAD(TEMP,"TAB")
 S ORDO=0
 D CLEPAG^%VVIDEO
 D INIT
 S @VAL=$P(STO,")",1)
DEF 
 D ^%PKSAISI(0,0,1,0,1,GLO,VAL,.ERR)
 I '($D(@STO)) S (REP,IND,LIEN)="" G ECHEC
 S REP=$P(@STO,$C(0),1),LIEN=$P(@STO,$C(0),3),IND=$P(@STO,$C(0),5)
 S REPI=$$NOMINT^%QSF(REP)
 I IND="*" S REPI=$$NOMINT^%QSF(REP),@GRAC="REP^"_IND,IN="" F %I=1:1 S IN=$$NXTRI^%QSTRUC8(REPI,IN) G:IN="" FIN S @GRAC@(IN)=""
 I $$IR^%QSGE5(REPI,IND) S @GRAC="IND^"_IND,@GRAC@(IND)="" G FIN
 S @GRAC="LIS^"_IND
 S ADR=$$ADRLT^%QSGEST7(IND)
 I (ADR=0)!(ADR="") S ADR=$$ADRLIS^%QSGEST7(IND),ORDO=0,IN="" F %I=1:1 S IN=$O(@ADR@(IN)) G:IN="" FIN S @GRAC@(IN)=""
 S ORDO=1,IN="" F %I=1:1 S IN=$O(@ADR@(IN)) G:IN="" FIN S @GRAC@(IN)=@ADR@(IN)
FIN S @GRAC=@GRAC_"^"_ORDO
ECHEC K @(TEMP)
 Q
 
INIT 
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S STO=$$CONCAS^%QZCHAD(TEMP,"STO")
 S GLO=$$CONCAS^%QZCHAD(TEMP,"GLO")
 S @GLO=""
 S @GLO@("H")=10,@GLO@("V")=6,@GLO@("FL")="LD"
 S @GLO@("STO.DER")=0,@GLO@("EXEC.UCONT")="C"
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 S @GLO@("NBC")=5,@GLO@("L")=40,@GLO@("PLL")=15
 S @GLO@("CHAMPS",1)=$$^%QZCHW("Repertoire"),@GLO@("CHAMPS",2)=" "
 S @GLO@("CHAMPS",3)=$$^%QZCHW("Lien"),@GLO@("CHAMPS",4)=" "
 S @GLO@("CHAMPS",5)=$$^%QZCHW("Individu racine")
 S @GLO@("POP1")="",@GLO@("POP2")=""
 F I=1:1:5 S @GLO@("LARG",I)=40
 S @GLO@("SUIV",1)=3,@GLO@("PREC",1)=5
 S @GLO@("SUIV",3)=5,@GLO@("PREC",3)=1
 S @GLO@("SUIV",5)=1,@GLO@("PREC",5)=3
 F I=1:1:5 S @GLO@("FORMAT",I)="S OK=1"
 F I=1,3,5 S @GLO@("OBLIGAT",I)="S OK=(VAL'="""")",@GLO@("VALEG",I,0)="S OK=1"
 F I=2,4 S @GLO@("OBLIGAT",I)="S OK=1"
INIV 
 K @GLO@("UCONT.CHAMPS"),@GLO@("UCONT")
 S @GLO@("UCONT.CHAMPS",1)="D OKREP^%QULELN1"
 S @GLO@("UCONT.CHAMPS",3)="D OKLIEN^%QULELN1"
 S @GLO@("UCONT.CHAMPS",5)="D OKINDI^%QULELN1"
 S @GLO@("UCONT")="D OKGRIL^%QULELN1"
 S @GLO@("AIDE",1)=$$^%QZCHW("Nom du repertoire auquel")_$C(0)_$$^%QZCHW("les racines appartiennent")
 S @GLO@("AIDE",3)=$$^%QZCHW("Nom du lien a parcourir")
 S @GLO@("AIDE",5)=$$^%QZCHW("Nom d'un individu du repertoire")_$C(0)_$$^%QZCHW(" ou d'une liste d'individus")_$C(0)_$$^%QZCHW(" ou * pour tout le repertoire")_$C(0)_$$^%QZCHW(" (? pour choix d'un individu,")_$C(0)_$$^%QZCHW("  ?? pour choix d'une liste)")
 
 S VAL=$$CONCAS^%QZCHAD(TEMP,"VAL")
 F I=1:1:5 S @VAL@(I)=""
 D POCLEPA^%VVIDEO
 Q
 
 
OKREP 
 N TO,II,%II,IR
 S OK=1
 I $$GETLBLAN^%VTLBLAN(X)="?" K @(TABUTI) D REPA^%QSGEST9(TABUTI) S X=$$UN^%PKCHOIX(TABUTI,10,12,8),REUC=1
 Q:X=""  S IR=$$NOMINT^%QSF(X)
 I IR="" D PARAM^%PKPOP2("10,6\CRHL\1\\\"_$$^%QZCHW("Repertoire inconnu")_"*",0) S %R=6 D PARAM^%PKPOP(.Y) S %R=6,OK=0 Q
 I $$REPVID^%QSGEST5(IR) D PARAM^%PKPOP2("10,6\CRHL\1\\\"_$$^%QZCHW("Repertoire vide")_"*",0) S %R=6 D PARAM^%PKPOP(.Y) S %R=6,OK=0 Q
 Q
 
OKLIEN 
 N TO
 S OK=1 Q:X=""
 I VAL(1)="" X ^%PKREAD(7) S %R=6 D PARAM^%PKPOP("10\CRHL\1\\\"_$$^%QZCHW("Le repertoire doit etre defini")_"*") S OK=0,%R=6 D PARAM^%PKPOP(.Y) S %R=6 Q
 I $$GETLBLAN^%VTLBLAN(X)="?" K @(TABUTI) D LIEN^%QSGEST9($$NOMINT^%QSF(VAL(1)),TABUTI) S X=$$UN^%PKCHOIX(TABUTI,10,12,8),REUC=1 Q:X=""
 I $$REPD^%QSGEL2($$NOMINT^%QSF(VAL(1)),X)="" X ^%PKREAD(7) S %R=6 D PARAM^%PKPOP("10\CRHL\1\\\"_$$^%QZCHW("Ce lien ne part pas du repertoire")_"*") S OK=0,%R=6 D PARAM^%PKPOP(.Y) S %R=6 Q
 Q
OKINDI 
 N TO,SAVR
 S SAVR=%R
 S OK=1 Q:X=""
 I VAL(1)="" X ^%PKREAD(7) S %R=6 D PARAM^%PKPOP("10\CHRL\1\\\"_$$^%QZCHW("Le repertoire doit etre defini")_"*") S OK=0,%R=6 D PARAM^%PKPOP(.Y) S %R=6 Q
 I VAL(3)="" X ^%PKREAD(7) S %R=6 D PARAM^%PKPOP("10\CHRL\1\\\"_$$^%QZCHW("Le lien doit etre defini")_"*") S OK=0,%R=6 D PARAM^%PKPOP(.Y) S %R=6 Q
 I $$GETLBLAN^%VTLBLAN(X)="?" S X=$$UN^%PKCHOIX($$LISTIND^%QSGEST6($$NOMINT^%QSF(VAL(1))),10,12,8),REUC=1,X=$$S^%QAX(X) Q:X=""
 I $$GETLBLAN^%VTLBLAN(X)="??" S X=$$UN^%PKCHOIX($$RAVO^%QSGE6("L0","BASE",$$NOMINT^%QSF(VAL(1)),1),10,12,8),REUC=1 Q:X=""
 Q:X="*"  Q:$$IR^%QSGEST5($$NOMINT^%QSF(VAL(1)),$$M^%QAX(X))
 Q:$$VAIR^%QSGE5("L0",X,"BASE",$$NOMINT^%QSF(VAL(1)))
 X ^%PKREAD(7) S %R=6 D PARAM^%PKPOP("10\CHRL\1\\\"_$$^%QZCHW("N'est pas un individu du repertoire")_"*") S OK=0,%R=6 D PARAM^%PKPOP(.Y) S %R=6 Q
 Q
 
OKGRIL S OK=((VAL(1)'="")&(VAL(3)'=""))&(VAL(5)'="") Q
 ;
 ;

