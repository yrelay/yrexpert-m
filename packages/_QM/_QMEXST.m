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

;%QMEXST^INT^1^59547,73878^0
%QMEXST ;;12:21 PM  16 Dec 1992; 07 Dec 92  2:52 PM ; 16 Dec 92  2:51 PM
 
 
 
 
 
 
 
 
SAISIE(NOEUD) 
 N %C,%R,PK,X,Y,GLO,I,STO,VAL,VALDEF,STOCK,REP
 D CLEPAG^%VVIDEO
 S STO="STOCK",VAL="VALDEF"
 S GLO=$$TEMP^%SGUTIL,REP="ETAT.RESEAU"
 D INIT
 
 S VALDEF(1)=$$^%QSCALIN(REP,NOEUD,"NOEUD.TERMINAL",1)
 S VALDEF(1)=$S(VALDEF(1)="":"NON",VALDEF(1)=1:"OUI",1:"NON")
 S VALDEF(2)=$$^%QSCALIN(REP,NOEUD,"NOEUD.DE.PETRI",1)
 S VALDEF(2)=$S(VALDEF(2)="":"NON",VALDEF(2)=1:"OUI",1:"NON")
 S VALDEF(3)=$$^%QSCALIN(REP,NOEUD,"NOEUD.FINAL",1)
 S VALDEF(3)=$S(VALDEF(3)="":"NON",VALDEF(3)=1:"OUI",1:"NON")
 S VALDEF="STOCK"
 
 D ^%PKSAISI(0,0,1,0,1,GLO,VAL,.ERR)
 
 Q:'($D(STOCK))
 F I=1:1:3 S VALDEF(I)=$P(STOCK,$C(0),I)
 D PA^%QSGESTI(REP,NOEUD,"NOEUD.TERMINAL",$S(VALDEF(1)="NON":0,1:1),1)
 D PA^%QSGESTI(REP,NOEUD,"NOEUD.DE.PETRI",$S(VALDEF(2)="NON":0,1:1),1)
 D PA^%QSGESTI(REP,NOEUD,"NOEUD.FINAL",$S(VALDEF(3)="NON":0,1:1),1)
 K STOCK,@(GLO)
 Q
 
INIT 
 N NBC,I,J,OBLIG,TJSOK
 S NBC=3
 S @GLO@("FL")="LDR"
 
 S @GLO="Caracteristiques de l'etat "_$P(NOEUD,",",2)
 S @GLO@("H")=2,@GLO@("V")=5
 
 S @GLO@("NBC")=NBC
 S PLL=0
 S J=0 F I="Etat terminal","Sommet de Petri","Etat final" S J=J+1,@GLO@("CHAMPS",J)=I S:$L(I)>PLL PLL=$L(I)
 S @GLO@("PLL")=PLL
 S @GLO@("L")=40 F I=1:1:NBC S @GLO@("LARG",I)=10
 F I=1:1:NBC S J=(I#NBC)+1,@GLO@("SUIV",I)=J,@GLO@("PREC",J)=I
 
 S @GLO@("POP1")="",@GLO@("POP2")=""
 S @GLO@("AIDE",1)="l'execution doit-elle s'arreter avec succes"_$C(0)_"lorsque cet etat est atteint ?"_$C(0)_"  (OUI ou NON) "
 S @GLO@("AIDE",2)="cet etat est-il un sommet de Petri ?"_$C(0)_"  (OUI ou NON) "
 S @GLO@("AIDE",3)="cet etat est-il un sommet dont les actions "_$C(0)_"echouent systematiquement (ce qui"_$C(0)_"provoque une recusation)"_$C(0)_"  (OUI ou NON) "
 
 S TJSOK="S OK=1"
 
 S @GLO@("STO.DER")=1
 
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 
 
 S @GLO@("EXEC.UCONT")="C"
 S @GLO@("UCONT.CHAMPS",1)="S OK=1"
 S @GLO@("UCONT.CHAMPS",2)="S OK=1"
 S @GLO@("UCONT.CHAMPS",3)="S OK=1"
 S @GLO@("UCONT")=""
 
 S OBLIG="S OK=(VAL'="""")"
 S @GLO@("OBLIGAT",1)=OBLIG
 S @GLO@("OBLIGAT",2)=OBLIG
 S @GLO@("OBLIGAT",3)=OBLIG
 
 
 F I=1:1:NBC S @GLO@("FORMAT",I)=TJSOK
 
 S @GLO@("VALEG",1,0)="S OK=$S(VAL=""OUI"":1,VAL=""NON"":2,1:0)"
 S @GLO@("VALEG",2,0)="S OK=$S(VAL=""OUI"":1,VAL=""NON"":2,1:0)"
 S @GLO@("VALEG",3,0)="S OK=$S(VAL=""OUI"":1,VAL=""NON"":2,1:0)"
 Q
 ;
 ;
 ;

