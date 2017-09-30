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

;%QMEXCTL^INT^1^59547,73878^0
%QMEXCTL ;;05:31 PM  9 Dec 1992; 07 Dec 92  2:52 PM ; 23 Mar 93  3:32 PM
 
 
 
 
 
 
SAISIE(REP,IND,ATTCXT) 
 N %C,%R,PK,X,Y,GLO,I,STO,VAL,VALDEF,STOCK
 D CLEPAG^%VVIDEO
 S STO="STOCK",VAL="VALDEF"
 S GLO=$$TEMP^%SGUTIL
 D INIT
 
 S VALDEF(1)="",VALDEF(2)="",VALDEF(3)="OUI"
 I $$^%QSCALIN(REP,IND,ATTCXT,1)'="LIES" G LIE2
 S VALDEF(1)=$$^%QSCALIN(REP,IND,ATTCXT,2)
 S VALDEF(2)=$$^%QSCALIN(REP,IND,ATTCXT,3) S:VALDEF(2)="" VALDEF(2)=" "
 S VALDEF(3)=$$^%QSCALIN(REP,IND,ATTCXT,"PARALLELISABLE") S:VALDEF(3)'="NON" VALDEF(3)="OUI"
LIE2 S VALDEF="STOCK"
 
 D ^%PKSAISI(0,0,1,0,1,GLO,VAL,.ERR)
 
 Q:'($D(STOCK))
 F I=1:1:3 S VALDEF(I)=$P(STOCK,$C(0),I)
 D PA^%QSGESTI(REP,IND,ATTCXT,"LIES",1)
 D PA^%QSGESTI(REP,IND,ATTCXT,VALDEF(1),2)
 D PA^%QSGESTI(REP,IND,ATTCXT,$S(VALDEF(2)="":" ",1:VALDEF(2)),3)
 D PA^%QSGESTI(REP,IND,ATTCXT,$S(VALDEF(3)'="NON":"OUI",1:VALDEF(3)),"PARALLELISABLE")
 K STOCK,@(GLO)
 Q
 
INIT 
 N NBC,I,J,OBLIG,TJSOK
 S NBC=3
 S @GLO@("FL")="LDR"
 
 S @GLO="Individus lies"
 S @GLO@("H")=6,@GLO@("V")=4
 
 S @GLO@("NBC")=NBC
 S PLL=0
 S J=0 F I="Individus lies par le lien ","A l'individu ","Activation parallele possible" S J=J+1,@GLO@("CHAMPS",J)=I S:$L(I)>PLL PLL=$L(I)
 S @GLO@("PLL")=PLL
 S @GLO@("L")=30 F I=1:1:NBC S @GLO@("LARG",I)=30
 F I=1:1:NBC S J=(I#NBC)+1,@GLO@("SUIV",I)=J,@GLO@("PREC",J)=I
 
 S @GLO@("POP1")="",@GLO@("POP2")=""
 S @GLO@("AIDE",1)="nom du lien a"_$C(0)_"parcourir"
 S @GLO@("AIDE",2)="nom de l'individu racine"
 S @GLO@("AIDE",3)="d'autres ordinateurs (cosolveurs)"_$C(0)_"peuvent-ils traiter certains individus de la listes ?"_$C(0)_" (OUI ou NON)"
 
 S TJSOK="S OK=1"
 
 S @GLO@("STO.DER")=1
 
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 
 
 S @GLO@("EXEC.UCONT")="C"
 S @GLO@("UCONT.CHAMPS",1)="D OKLIEN^%QMEXCTL"
 S @GLO@("UCONT.CHAMPS",2)="D OKINDI^%QMEXCTL"
 S @GLO@("UCONT.CHAMPS",2)=TJSOK
 S @GLO@("UCONT")=""
 
 S OBLIG="S OK=(VAL'="""")"
 S @GLO@("OBLIGAT",1)=OBLIG
 S @GLO@("OBLIGAT",2)=TJSOK
 S @GLO@("OBLIGAT",3)=TJSOK
 
 
 F I=1:1:NBC S @GLO@("FORMAT",I)=TJSOK
 
 F I=1:1:NBC S @GLO@("VALEG",I,0)=""
 Q
 
 
OKLIEN 
 N TO,SAVR,TEMP,M1,SAVR
 S SAVR=%R
 S %R=SAVR,OK=1 Q
 
 
OKINDI 
 S OK=1 Q
 
 
 
OKREQU 
 N TO,SAVR,TEMP,M1,SAVR
 S SAVR=%R
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T") K @(TEMP)
 S M1=$$CONCAS^%QZCHAD(TEMP,"M1")
 I $$GETLBLAN^%VTLBLAN(X)="?" S REUC=1 G CF2
 I X'="",$$EXISTE^%QSINTER(X) G CFOK
CFNOK S %R=SAVR,OK=0 Q
CFOK S %R=SAVR,OK=1 Q
 
CF2 S X1=$$^%QZCHW("choix d'une requete")
 S X2=$$^%QZCHW("acces au menu des requetes")
 S @M1@(X1)="",@M1@(X2)=""
BCL S X=$$TIT^%PKCHOIX(M1,5,10,5,$$^%QZCHW("Requetes"),0) G:X="" CFNOK
 I X=X1 S X=$$TIT^%PKCHOIX("^[QUI]RQS1",20,10,10,$$^%QZCHW("requete"),0) G:X="" BCL G CFOK
 D CLEPAG^%VVIDEO
 S X=$$^%QS D CLEPAG^%VVIDEO G BCL
 ;
 ;

