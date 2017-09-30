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

;%QMEXCT3^INT^1^59547,73878^0
%QMEXCT3 ;;02:53 PM  7 Dec 1992; 07 Dec 92  2:52 PM ; 08 Dec 92  9:38 AM
 
 
 
 
 
SAISIE(REP,IND,ATTCXT) 
 N %C,%R,PK,X,Y,GLO,I,STO,VAL,VALDEF,STOCK
 D CLEPAG^%VVIDEO
 S STO="STOCK",VAL="VALDEF"
 S GLO=$$TEMP^%SGUTIL
 D INIT
 
 F I=1:1:1 S VALDEF(I)=""
 I $$^%QSCALIN(REP,IND,ATTCXT,1)=3 S VALDEF(1)=$$^%QSCALIN(REP,IND,ATTCXT,2)
 S VALDEF="STOCK"
 
 D ^%PKSAISI(0,0,1,0,1,GLO,VAL,.ERR)
 
 Q:'($D(STOCK))
 F I=1:1:2 S VALDEF(I)=$P(STOCK,$C(0),I)
 D PA^%QSGESTI(REP,IND,ATTCXT,3,1)
 D PA^%QSGESTI(REP,IND,ATTCXT,VALDEF(1),2)
 K STOCK,@(GLO)
 Q
 
INIT 
 N NBC,I,J,OBLIG,TJSOK
 S NBC=1
 S @GLO@("FL")="LDR"
 
 S @GLO="individu symbolique sur lequel les traitements seront actives"
 S @GLO@("H")=10,@GLO@("V")=6
 
 S @GLO@("NBC")=NBC
 S PLL=0
 S J=0 F I="Individu" S J=J+1,@GLO@("CHAMPS",J)=I S:$L(I)>PLL PLL=$L(I)
 S @GLO@("PLL")=PLL
 S @GLO@("L")=50 F I=1:1:NBC S @GLO@("LARG",I)=50
 F I=1:1:NBC S J=(I#NBC)+1,@GLO@("SUIV",I)=J,@GLO@("PREC",J)=I
 
 S @GLO@("POP1")="",@GLO@("POP2")=""
 
 
 S TJSOK="S OK=1"
 
 S @GLO@("STO.DER")=1
 
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 
 
 S @GLO@("EXEC.UCONT")="C"
 S @GLO@("UCONT.CHAMPS",1)="D OKVARPCT^%QMEXCT3"
 S @GLO@("UCONT")=""
 
 S OBLIG="S OK=(VAL'="""")"
 F I=1:1:NBC S @GLO@("OBLIGAT",I)=OBLIG
 
 
 F I=1:1:NBC S @GLO@("FORMAT",I)=TJSOK
 
 F I=1:1:NBC S @GLO@("VALEG",I,0)=""
 Q
 
 
 
OKVARPCT 
 N TO,II,%II,IR,SAVR,TABUTI
 S SAVR=%R
 I $E(X)'="%" D PARAM^%PKPOP2("10,6\CRHL\1\\\"_$$^%QZCHW("Une variable temporaire doit commencer par le signe %")_"*",0) S %R=SAVR-1 D PARAM^%PKPOP(.Y) G RNOK
ROK S %R=SAVR,OK=1 Q
RNOK S %R=SAVR,OK=0 Q
 Q
 ;
 ;

