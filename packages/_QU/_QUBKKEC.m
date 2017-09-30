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

;%QUBKKEC^INT^1^59547,73884^0
%QUBKKEC(VALDEF) ;;02:48 PM  6 May 1992;
 
 N %C,%R,PK,X,Y,GLO,I,STO,VAL,STOCK,TEMP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"R") K @(TEMP)
 S GLO=$$CONCAS^%QZCHAD(TEMP,"G")
 S VAL=$$CONCAS^%QZCHAD(TEMP,"V")
 D CLEPAG^%VVIDEO
 D:'($D(@GLO)) INIT
 
 S @VAL="STOCK"
 F I=2:2:4 S @VAL@(I)=""
 F I=1:1:3 S @VAL@((I*2)-1)=$P(VALDEF,$C(0),I)
 
 D ^%PKSAISI(1,0,1,0,1,GLO,VAL,.ERR)
 
 Q:'($D(STOCK)) ""
 Q STOCK
 
INIT 
 N NBC,I,J,OBLIG,TJSOK,PLL
 
 S NBC=5
 
 
 S @GLO@("FL")="LD"
 
 S @GLO="definition de l'etude"
 
 S @GLO@("H")=3,@GLO@("V")=3
 
 S @GLO@("NBC")=NBC
 
 S J=1,PLL=0 F I="Saisie","Liste","Titre" S @GLO@("CHAMPS",J)=I,J=J+2 S:$L(I)>PLL PLL=$L(I)
 F I=2:2:NBC-1 S @GLO@("CHAMPS",I)=" "
 
 S @GLO@("PLL")=PLL
 
 S @GLO@("L")=40 F I=1:1:NBC S @GLO@("LARG",I)=40
 
 F I=3:2:NBC S @GLO@("SUIV",I-2)=I,@GLO@("PREC",I)=I-2
 S @GLO@("SUIV",NBC)=1,@GLO@("PREC",1)=NBC
 
 S @GLO@("POP1")="",@GLO@("POP2")=""
 
 S @GLO@("AIDE",1)=$$^%QZCHW("Nom de la saisie")_$C(0)_$$^%QZCHW("multiple a activer")
 S @GLO@("AIDE",3)=$$^%QZCHW("Individus dont on saisira")_$C(0)_$$^%QZCHW("les caracteristiques")
 S @GLO@("AIDE",5)=$$^%QZCHW("Titre a afficher")
 
 
 
 S TJSOK="S OK=1"
 
 S @GLO@("STO.DER")=1
 
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 
 
 S @GLO@("EXEC.UCONT")="C"
 F I=1:1:NBC S @GLO@("UCONT.CHAMPS",I)=""
 S @GLO@("UCONT.CHAMPS",1)="D OKCONF^%QUBKKEC"
 S @GLO@("UCONT.CHAMPS",3)="D OKLIST^%QUBKKEC"
 S @GLO@("UCONT")="D OKGRIL^%QUBKKEC"
 
 S OBLIG="S OK=(VAL'="""")"
 F I=1:1:NBC S @GLO@("OBLIGAT",I)=TJSOK
 F I=1,3,5 S @GLO@("OBLIGAT",I)=OBLIG
 
 F I=1:1:NBC S @GLO@("FORMAT",I)=TJSOK
 
 F I=1:1:NBC S @GLO@("VALEG",I,0)="S OK=1"
 Q
 
 
 
 
OKGRIL S OK=((VAL(1)'="")&(VAL(3)'=""))&(VAL(5)'="") Q
 
 
OKCONF N TO,SAVR,TEMP,M1,SAVR
 S SAVR=%R
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T") K @(TEMP)
 S M1=$$CONCAS^%QZCHAD(TEMP,"M1")
 I $$GETLBLAN^%VTLBLAN(X)="?" S REUC=1 G CF2
 I X="" G CFOK
 I '($$EX^%QUBKKGE(X)) X ^%PKREAD(7) S %R=SAVR D PARAM^%PKPOP2("10,6\CHRL\1\\\"_$$^%QZCHW("Saisie inconnue")_"*") S %R=SAVR-1 D PARAM^%PKPOP(.Y) G CFNOK
 I '($$OKVALI^%QUBKKGE(X)) X ^%PKREAD(7) S %R=SAVR D PARAM^%PKPOP2("10,6\CHRL\1\\\"_$$^%QZCHW("Saisie non validee")_"*") S %R=SAVR-1 D PARAM^%PKPOP(.Y) G CFNOK
 G CFOK
CFNOK S %R=SAVR,OK=0 Q
CFOK S %R=SAVR,OK=1 Q
 
CF2 S X1=$$^%QZCHW("choix d'une saisie")
 S X2=$$^%QZCHW("consultation des saisies")
 S @M1@(X1)="",@M1@(X2)=""
BCL S X=$$TIT^%PKCHOIX(M1,5,10,5,$$^%QZCHW("saisie a activer"),0) G:X="" CFNOK
 I X=X1 S X=$$TIT^%PKCHOIX("^[QUI]RQSGLO(""QUBKGR"")",20,10,10,$$^%QZCHW("saisie"),0) G:X="" BCL G CFOK
 D CLEPAG^%VVIDEO,NEW^%VCMS("QUBKGR"),CLEPAG^%VVIDEO G BCL
 
 
 
OKLIST 
 N TO,SAVR
 S SAVR=%R
 G:X="" IOK
 I $$GETLBLAN^%VTLBLAN(X)="?" S X=$$UN^%PKCHOIX($$LISTIND^%QSGEST6("L0"),10,12,8),REUC=1 G:X="" IOK
 G:$$IR^%QSGE5("L0",X) IOK
 X ^%PKREAD(7) S %R=SAVR D PARAM^%PKPOP2("10,6\CHRL\1\\\"_$$^%QZCHW("N'est pas une liste")_"*") S %R=SAVR-3 D PARAM^%PKPOP(.Y) G INOK
IOK S %R=SAVR,OK=1 Q
INOK S %R=SAVR,OK=0 Q
 Q
 ;

