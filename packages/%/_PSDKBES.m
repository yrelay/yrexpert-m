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

;%PSDKBES^INT^1^59573,39842^0
%PSDKBES(VALDEF) ;;02:03 AM  6 May 1992;
 
 N %C,%R,PK,X,Y,GLO,I,STO,VAL,STOCK
 N TEMP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"R") K @(TEMP)
 S GLO=$$CONCAS^%QZCHAD(TEMP,"G")
 S VAL=$$CONCAS^%QZCHAD(TEMP,"V")
 D CLEPAG^%VVIDEO
 D:'($D(@GLO)) INIT
 
 S @VAL="STOCK"
 F I=2:2:6 S @VAL@(I)=""
 F I=1:1:4 S @VAL@((I*2)-1)=$P(VALDEF,$C(0),I)
 
 D ^%PKSAISI(1,0,1,0,1,GLO,VAL,.ERR)
 
 Q:'($D(STOCK)) ""
 Q STOCK
 
INIT 
 N NBC,I,J,OBLIG,TJSOK,PLL
 
 S NBC=7
 
 
 
 
 
 
 S @GLO@("FL")="LD"
 
 S @GLO="definition de l'etude"
 
 S @GLO@("H")=3,@GLO@("V")=3
 
 S @GLO@("NBC")=NBC
 
 S J=1,PLL=0 F I="Repertoire","Individu","Domaine","But" S @GLO@("CHAMPS",J)=I,J=J+2 S:$L(I)>PLL PLL=$L(I)
 F I=2:2:NBC-1 S @GLO@("CHAMPS",I)=" "
 
 S @GLO@("PLL")=PLL
 
 S @GLO@("L")=40 F I=1:1:NBC S @GLO@("LARG",I)=40
 
 F I=3:2:NBC S @GLO@("SUIV",I-2)=I,@GLO@("PREC",I)=I-2
 S @GLO@("SUIV",NBC)=1,@GLO@("PREC",1)=NBC
 
 
 
 S @GLO@("POP1")="",@GLO@("POP2")=""
 
 S @GLO@("AIDE",1)=$$^%QZCHW("Nom du repertoire auquel")_$C(0)_$$^%QZCHW("l'individu origine appartient")
 S @GLO@("AIDE",3)=$$^%QZCHW("Nom de l'individu origine")
 
 
 
 S TJSOK=$XECUTE("S OK=1")
 
 
 S @GLO@("STO.DER")=1
 
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 
 
 
 S @GLO@("EXEC.UCONT")="C"
 F I=1:1:NBC S @GLO@("UCONT.CHAMPS",I)=""
 S @GLO@("UCONT.CHAMPS",1)="D OKREP^%PSDKBES"
 S @GLO@("UCONT.CHAMPS",3)="D OKINDI^%PSDKBES"
 S @GLO@("UCONT.CHAMPS",7)="D OKBUT^%PSDKBES"
 S @GLO@("UCONT")="D OKGRIL^%PSDKBES"
 
 S @GLO@("AIDE",1)=$$^%QZCHW("Nom du repertoire auquel")_$C(0)_$$^%QZCHW("les racines appartiennent")
 S @GLO@("AIDE",3)=$$^%QZCHW("Nom du lien a parcourir")
 S @GLO@("AIDE",5)=$$^%QZCHW("Nom d'un individu du repertoire")_$C(0)_$$^%QZCHW(" ou d'une liste d'individus")_$C(0)_$$^%QZCHW(" ou * pour tout le repertoire")_$C(0)_$$^%QZCHW(" (? pour choix d'un individu,")_$C(0)_$$^%QZCHW("  ?? pour choix d'une liste)")
 
 
 S OBLIG="S OK=(VAL'="""")"
 F I=1:1:NBC S @GLO@("OBLIGAT",I)=TJSOK
 F I=1,3,5,7 S @GLO@("OBLIGAT",I)=OBLIG
 
 
 F I=1:1:NBC S @GLO@("FORMAT",I)=TJSOK
 
 F I=1:1:NBC S @GLO@("VALEG",I,0)="S OK=1"
 Q
 
 
 
 
 
OKGRIL S OK=(((VAL(1)'="")&(VAL(3)'=""))&(VAL(5)'=""))&(VAL(7)'="") Q
 
 
OKREP N TO,II,%II,IR,SAVR,TABUTI
 S SAVR=%R
 I $$GETLBLAN^%VTLBLAN(X)="?" S TABUTI=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"REP") K @(TABUTI) D REPA^%QSGEST9(TABUTI) S X=$$UN^%PKCHOIX(TABUTI,10,12,8),REUC=1
 G:X="" ROK S IR=$$NOMINT^%QSF(X)
 I IR="" D PARAM^%PKPOP2("10,6\CRHL\1\\\"_$$^%QZCHW("Repertoire inconnu")_"*",0) S %R=SAVR-1 D PARAM^%PKPOP(.Y) G RNOK
 I $$REPVID^%QSGEST5(IR) D PARAM^%PKPOP2("10,6\CRHL\1\\\"_$$^%QZCHW("Repertoire vide")_"*",0) S %R=SAVR-1 D PARAM^%PKPOP(.Y) G RNOK
ROK S %R=SAVR,OK=1 Q
RNOK S %R=SAVR,OK=0 Q
 Q
 
 
OKINDI N TO,SAVR
 S SAVR=%R
 G:X="" IOK
 I VAL(1)="" X ^%PKREAD(7) D PARAM^%PKPOP2("10,6\CHRL\1\\\"_$$^%QZCHW("Le repertoire doit etre defini")_"*") S %R=SAVR-3 D PARAM^%PKPOP(.Y) G INOK
 I $$GETLBLAN^%VTLBLAN(X)="?" S X=$$UN^%PKCHOIX($$LISTIND^%QSGEST6($$NOMINT^%QSF(VAL(1))),10,12,8),REUC=1,X=$$S^%QAX(X) G:X="" IOK
 I $$IR^%QSGEST5($$NOMINT^%QSF(VAL(1)),X) G IOK
 X ^%PKREAD(7) S %R=SAVR D PARAM^%PKPOP2("10,6\CHRL\1\\\"_$$^%QZCHW("N'est pas un individu du repertoire")_"*") S %R=SAVR-3 D PARAM^%PKPOP(.Y) G INOK
IOK S %R=SAVR,OK=1 Q
INOK S %R=SAVR,OK=0 Q
 Q
 
 
OKBUT 
 N %SAVR,PRB
 S SAVR=%R
 I X="" S X=$$GEN^%QCAPOP("PRD") D ^%PSPRSA1(X,3,5) S REUC=1 G BUTOK
 I $$GETLBLAN^%VTLBLAN(X)="?" S REUC=1,X=$$CHOIX^%PSPRSA G:X="" BUTNOK G BUTOK
 G:$$EXIPRED^%PSPRGES(X) BUTOK
 X ^%PKREAD(7) S %R=SAVR D PARAM^%PKPOP2("10,6\CHRL\1\\\"_$$^%QZCHW("Predicat inconnu")_"*") S %R=SAVR-7 D PARAM^%PKPOP(.Y)
BUTNOK S %R=SAVR,OK=0 Q
BUTOK S %R=SAVR,OK=1 Q
 ;

