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

;%QMEXCT5^INT^1^59547,73878^0
%QMEXCT5 ;;11:05 AM  8 Dec 1992; 07 Dec 92  2:52 PM ; 29 Mar 93 11:28 AM
 
 
 
 
 
SAISIE(REP,IND,ATTCXT) 
 N %C,%R,PK,X,Y,GLO,I,STO,VAL,VALDEF,STOCK
 D CLEPAG^%VVIDEO
 S STO="STOCK",VAL="VALDEF"
 S GLO=$$TEMP^%SGUTIL
 D INIT
 
 S VALDEF(1)="",VALDEF(2)="OUI",VALDEF(3)="NON"
 I $$^%QSCALIN(REP,IND,ATTCXT,1)'="LISTE" G LI2
 S VALDEF(1)=$$^%QSCALIN(REP,IND,ATTCXT,2) S:VALDEF(1)=" " VALDEF(1)=""
 S I=$$^%QSCALIN(REP,IND,ATTCXT,"PARALLELISABLE")
 S VALDEF(2)=$S(I="NON":I,1:"OUI")
 S I=$$^%QSCALIN(REP,IND,ATTCXT,"SUPPRESSION.DE.LA.LISTE")
 S VALDEF(3)=$S(I="OUI":I,1:"NON")
LI2 
 S VALDEF="STOCK"
 
 D ^%PKSAISI(0,0,1,0,1,GLO,VAL,.ERR)
 
 Q:'($D(STOCK))
 F I=1:1:3 S VALDEF(I)=$P(STOCK,$C(0),I)
 D PA^%QSGESTI(REP,IND,ATTCXT,"LISTE",1)
 D PA^%QSGESTI(REP,IND,ATTCXT,$S(VALDEF(1)="":" ",1:VALDEF(1)),2)
 D PA^%QSGESTI(REP,IND,ATTCXT,$S(VALDEF(2)="NON":"NON",1:"OUI"),"PARALLELISABLE")
 D PA^%QSGESTI(REP,IND,ATTCXT,$S(VALDEF(3)="OUI":"OUI",1:"NON"),"SUPPRESSION.DE.LA.LISTE")
 K STOCK,@(GLO)
 Q
 
INIT 
 N NBC,I,J,OBLIG,TJSOK
 S NBC=3
 S @GLO@("FL")="LDR"
 S @GLO="liste sur laquelle les traitements seront actives"
 S @GLO@("H")=6,@GLO@("V")=4
 S @GLO@("NBC")=NBC
 S PLL=0,J=0 F I="Liste","Activation parallele possible","Suppression de la liste" S J=J+1,@GLO@("CHAMPS",J)=I S:$L(I)>PLL PLL=$L(I)
 S @GLO@("PLL")=PLL
 S @GLO@("L")=35 F I=1:1:NBC S @GLO@("LARG",I)=35
 F I=1:1:NBC S J=(I#NBC)+1,@GLO@("SUIV",I)=J,@GLO@("PREC",J)=I
 S @GLO@("POP1")="",@GLO@("POP2")=""
 S @GLO@("AIDE",1)=" [return] pour repertoire focus"_$C(0)_"ou nom d'une liste"_$C(0)_"ou attribut temporaire"
 S @GLO@("AIDE",2)="d'autres ordinateurs (cosolveurs)"_$C(0)_"peuvent-ils traiter certains individus de la listes ?"_$C(0)_" (OUI ou NON)"
 S @GLO@("AIDE",3)="la liste doit-elle etre supprimee apres"_$C(0)_"execution des actions de l'etat ?"_$C(0)_" (OUI ou NON)"
 S TJSOK="S OK=1"
 
 S @GLO@("STO.DER")=1
 
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 
 
 S @GLO@("EXEC.UCONT")="C"
 S @GLO@("UCONT.CHAMPS",1)="D OKLISTE^%QMEXCT5"
 S @GLO@("UCONT.CHAMPS",2)=TJSOK
 S @GLO@("UCONT.CHAMPS",3)=TJSOK
 S @GLO@("UCONT")=""
 
 S OBLIG="S OK=(VAL'="""")"
 F I=1:1:NBC S @GLO@("OBLIGAT",I)=TJSOK
 
 
 F I=1:1:NBC S @GLO@("FORMAT",I)=TJSOK
 
 F I=1:1:NBC S @GLO@("VALEG",I,0)=""
 Q
 
 
 
 
OKLISTE 
 N TO,II,%II,IR,SAVR,TABUTI
 S SAVR=%R
 
ROK S %R=SAVR,OK=1 Q
RNOK S %R=SAVR,OK=0 Q
 Q
 ;
 ;

