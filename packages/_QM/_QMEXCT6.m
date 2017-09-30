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

;%QMEXCT6^INT^1^59547,73878^0
%QMEXCT6 ;;06:26 PM  11 Mar 1993; 07 Dec 92  2:52 PM ; 29 Mar 93 11:06 AM
 
 
 
 
 
 
SAISIE(REP,IND,ATTCXT) 
 N %C,%R,PK,X,Y,GLO,I,STO,VAL,VALDEF,STOCK
 D CLEPAG^%VVIDEO
 S STO="STOCK",VAL="VALDEF"
 S GLO=$$TEMP^%SGUTIL
 D INIT
 
 S VALDEF(1)="",VALDEF(2)="",VALDEF(3)="OUI",VALDEF(4)="",VALDEF(5)="OUI"
 I $$^%QSCALIN(REP,IND,ATTCXT,1)'="REQUETE" G REQU2
 S VALDEF(1)=$$^%QSCALIN(REP,IND,ATTCXT,2)
 S VALDEF(2)=$$^%QSCALIN(REP,IND,ATTCXT,3) S:VALDEF(2)=" " VALDEF(2)=""
 S VALDEF(3)=$$^%QSCALIN(REP,IND,ATTCXT,"PARALLELISABLE") S:VALDEF(3)'="NON" VALDEF(3)="OUI"
 S VALDEF(4)=$$^%QSCALIN(REP,IND,ATTCXT,"VARIABLE.D.INSTANCIATION")
 S VALDEF(5)=$$^%QSCALIN(REP,IND,ATTCXT,"SUPPRESSION.DE.LA.LISTE") S:VALDEF(5)'="NON" VALDEF(5)="OUI"
REQU2 S VALDEF="STOCK"
 
 D ^%PKSAISI(0,0,1,0,1,GLO,VAL,.ERR)
 
 Q:'($D(STOCK))
 F I=1:1:5 S VALDEF(I)=$P(STOCK,$C(0),I)
 D PA^%QSGESTI(REP,IND,ATTCXT,"REQUETE",1)
 D PA^%QSGESTI(REP,IND,ATTCXT,VALDEF(1),2)
 D PA^%QSGESTI(REP,IND,ATTCXT,$S(VALDEF(2)="":" ",1:VALDEF(2)),3)
 D PA^%QSGESTI(REP,IND,ATTCXT,$S(VALDEF(3)'="NON":"OUI",1:VALDEF(3)),"PARALLELISABLE")
 D:VALDEF(4)="" PSO^%QSGESTI(REP,IND,ATTCXT,"VARIABLE.D.INSTANCIATION")
 D:VALDEF(4)'="" PA^%QSGESTI(REP,IND,ATTCXT,VALDEF(4),"VARIABLE.D.INSTANCIATION")
 D PA^%QSGESTI(REP,IND,ATTCXT,$S(VALDEF(5)'="NON":"OUI",1:VALDEF(5)),"SUPPRESSION.DE.LA.LISTE")
 K STOCK
 I $D(^[QUI]RQS1(VALDEF(1),"PARAMETRES")) D PARAM(VALDEF(1))
 Q
 
INIT 
 N NBC,I,J,OBLIG,TJSOK
 S NBC=5
 S @GLO@("FL")="LDR"
 
 S @GLO="Liste resultat d'une requete"
 S @GLO@("H")=6,@GLO@("V")=2
 
 S @GLO@("NBC")=NBC
 S PLL=0
 S J=0 F I="Requete","Liste source","Activation parallele possible","Attribut nom de la liste","Suppression de la liste" S J=J+1,@GLO@("CHAMPS",J)=I S:$L(I)>PLL PLL=$L(I)
 S @GLO@("PLL")=PLL
 S @GLO@("L")=35 F I=1:1:NBC S @GLO@("LARG",I)=35
 F I=1:1:NBC S J=(I#NBC)+1,@GLO@("SUIV",I)=J,@GLO@("PREC",J)=I
 
 S @GLO@("POP1")="",@GLO@("POP2")=""
 S @GLO@("AIDE",1)="nom de la requete a activer"_$C(0)_"(?) pour acceder au module des requetes"
 S @GLO@("AIDE",2)="  nom d'une liste"_$C(0)_"ou [return] pour activation sur tout le repertoire focus"
 S @GLO@("AIDE",3)="d'autres ordinateurs (cosolveurs)"_$C(0)_"peuvent-ils traiter certains individus de la listes ?"_$C(0)_" (OUI ou NON)"
 S @GLO@("AIDE",4)="attribut temporaire a affecter avec"_$C(0)_"le nom de la liste construite par requete"_$C(0)_" (facultatif)"
 S @GLO@("AIDE",5)="la liste creee par la requete doit-elle etre"_$C(0)_"supprimee apres execution des actions de l'etat ?"_$C(0)_" (OUI ou NON)"
 S TJSOK="S OK=1"
 
 S @GLO@("STO.DER")=1
 
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 
 
 S @GLO@("EXEC.UCONT")="C"
 S @GLO@("UCONT.CHAMPS",1)="D OKREQU^%QMEXCT6"
 S @GLO@("UCONT.CHAMPS",2)="S OK=1"
 S @GLO@("UCONT.CHAMPS",3)="S OK=1"
 S @GLO@("UCONT.CHAMPS",4)="S OK=1"
 S @GLO@("UCONT.CHAMPS",5)="S OK=1"
 S @GLO@("UCONT")=""
 
 S OBLIG="S OK=(VAL'="""")"
 S @GLO@("OBLIGAT",1)=OBLIG
 S @GLO@("OBLIGAT",2)=TJSOK
 S @GLO@("OBLIGAT",3)=TJSOK
 S @GLO@("OBLIGAT",4)=TJSOK
 S @GLO@("OBLIGAT",5)=TJSOK
 
 
 F I=1:1:NBC S @GLO@("FORMAT",I)=TJSOK
 
 F I=1:1:NBC S @GLO@("VALEG",I,0)=""
 Q
 
 
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
 
 
 
PARAM(REQU) 
 N %C,%R,PK,X,Y,GLO,I,STO,VAL,VALDEF,STOCK
 N NBC,I,J,OBLIG,TJSOK,OREQU
 N IPAR,NBPAR
 D CLEPAG^%VVIDEO
 S STO="STOCK",VAL="VALDEF"
 S GLO=$$TEMP^%SGUTIL
 S OBLIG="S OK=(VAL'="""")",TJSOK="S OK=1"
 S @GLO@("FL")="LDR",@GLO="Valeur des parametres de la requete"
 S @GLO@("H")=10,@GLO@("V")=6
 S PLL=0
 F IPAR=1:1 Q:'($D(^[QUI]RQS1(REQU,"PARAMETRES",IPAR)))  D CHPS
 S NBC=IPAR-1
 S @GLO@("NBC")=NBC,@GLO@("PLL")=PLL
 S @GLO@("L")=30 F I=1:1:NBC S @GLO@("LARG",I)=30
 F I=1:1:NBC S J=(I#NBC)+1,@GLO@("SUIV",I)=J,@GLO@("PREC",J)=I
 S @GLO@("POP1")="",@GLO@("POP2")=""
 S @GLO@("STO.DER")=1
 S @GLO@("BOU.AJOUT")=0,@GLO@("BOU.ERREUR")=1
 S @GLO@("EXEC.UCONT")="C"
 S @GLO@("UCONT")=""
 
 
 F I=1:1:NBC S VALDEF(I)=""
 G:$$^%QSCALIN(REP,IND,ATTCXT,1)'="REQUETE" PARA2
 G:$$^%QSCALIN(REP,IND,ATTCXT,2)'=REQU PARA2
 F I=1:1:NBC S VALDEF(I)=$$^%QSCALIN(REP,IND,ATTCXT,I+3)
PARA2 
 S VALDEF="STOCK"
 
 D ^%PKSAISI(0,0,1,0,1,GLO,VAL,.ERR)
 
 Q:'($D(STOCK))
 F I=1:1 S VALDEF(I)=$P(STOCK,$C(0),I) Q:VALDEF(I)=""  D PA^%QSGESTI(REP,IND,ATTCXT,VALDEF(I),I+3)
 K STOCK
 Q
 
CHPS S I=^[QUI]RQS1(REQU,"PARAMETRES",IPAR),@GLO@("CHAMPS",IPAR)=I S:$L(I)>PLL PLL=$L(I)
 S @GLO@("AIDE",IPAR)="Indiquez la valeur que"_$C(0)_"devra prendre le parametre"_$C(0)_^[QUI]RQS1(REQU,"PARAMETRES",IPAR)_$C(0)_"lors de l'activation"
 S @GLO@("OBLIGAT",IPAR)=OBLIG
 S @GLO@("UCONT.CHAMPS",IPAR)="S OK=1"
 S @GLO@("FORMAT",IPAR)=TJSOK
 S @GLO@("VALEG",IPAR,0)=""
 Q

