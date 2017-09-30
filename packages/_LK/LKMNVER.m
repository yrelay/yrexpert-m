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

;LKMNVER^INT^1^59547,74867^0
LKMNVER(TYPE,GR,REC,EXTERNE,EXTBANDE,MARQUE,SUPPORT,IO) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N MSG,LE,LA,REP,VAL
 S MSG=""
 S VAL=@GR(1)@(REC)
 
 S LE=$P(VAL,"^",$$POS^LKMZ(TYPE,1,"LE"))
 
 S LA=$P(VAL,"^",$$POS^LKMZ(TYPE,1,"LA"))
 
 S MARQUE=$P(VAL,"^",$$POS^LKMZ(TYPE,1,"MARQUE"))
 
 S REP=$P(VAL,"^",$$POS^LKMZ(TYPE,1,"REP"))
 
 S SUPPORT=$P(VAL,"^",$$POS^LKMZ(TYPE,1,"SUPPORT"))
 I '($$ENTP^%QZNBN(LE)) Q $$^%QZCHW("la longueur de l'enregistrement n'est pas un entier")
 I '($$ENTP^%QZNBN(LA)) Q $$^%QZCHW("la largeur de la zone attribut n'est pas un entier")
 I LE<LA Q $$^%QZCHW("la longueur de l'enregistrement est inferieure a la zone attribut")
 I MARQUE="" Q $$^%QZCHW("la marque n'est pas definie")
 I $$NOMINT^%QSF(REP)="" Q REP_" "_$$^%QZCHW("n'est pas un nom de repertoire")
 S @EXTERNE@("MARQUE")=MARQUE
 S @EXTERNE@("BASE")=$$NOMINT^%QSF(REP)
 S @EXTERNE@("LKEX",0,0,"*","D")=LA
 S @EXTERNE@("LKEX",0,0,"*","F")=LE
 S @EXTERNE@("LKEX",0,0,"*","T",1)="EXT"
 S @EXTERNE@("LKEX",0,0,"*","T",2)="NET^LKEXZ"
 S @EXTERNE@("LKEX",0,0,"*","T",3)="ALPHA"
 S @EXTERNE@("LKEX",0,0,"*","PD")=1
 S @EXTERNE@("LKEX",0,0,"*","PF")=LA-1
 S @EXTERNE@("LKEX",0,0,"*","PT",1)="EXTP"
 S @EXTERNE@("LKEX",0,0,"*","PT",2)="NET^LKEXZ"
 S @EXTERNE@("LKEX",0,0,"*","PT",3)="ALPHA"
 
 I SUPPORT="F" Q ""
 
 Q $$BANDE(TYPE,.GR,REC,EXTBANDE,.IO)
 
 
 
 
 
 
BANDE(TYPE,GR,REC,EXTBANDE,IO) 
 N VAL,CODAGE,LABEL,L,LE,LB
 
 I ($D(@GR(2)@(REC))#10)=0 Q $$^%QZCHW("vous devez definir un protocole de lecture de bande")
 S VAL(2)=@GR(2)@(REC)
 S VAL(1)=@GR(1)@(REC)
 S IO=$P(VAL(2),"^",$$POS^LKMZ(TYPE,2,"IO"))
 S CODAGE=$P(VAL(2),"^",$$POS^LKMZ(TYPE,2,"CODAGE"))
 S LABEL=$P(VAL(2),"^",$$POS^LKMZ(TYPE,2,"LABEL"))
 S L=$P(VAL(2),"^",$$POS^LKMZ(TYPE,2,"L"))
 S LE=$S(TYPE="EC":$$MAXENR^LKMZ(REC),1:$P(VAL(1),"^",$$POS^LKMZ(TYPE,1,"LE")))
 S LB=$P(VAL(2),"^",$$POS^LKMZ(TYPE,2,"LB"))
 
 I ((IO'="47")&(IO'="48"))&(IO'="49") Q $$^%QZCHW("le derouleur de bande doit avoir comme numero 47 ou 48 ou 49 et non")_" : "_IO
 I (CODAGE'="ASCII")&(CODAGE'="EBCDIC") Q $$^%QZCHW("le codage des caracteres doit etre ASCII ou EBCDIC et non")_" : "_CODAGE
 I (LABEL'="OUI")&(LABEL'="NON") Q $$^%QZCHW("vous devez specifier si la bande est labellee (OUI) ou pas (NON) et non")_" : "_LABEL
 I (L'="V")&(L'="F") Q $$^%QZCHW("la longueur des enregistrements doit etre fixe (F) ou variable (V) et non")_" : "_L
 I '($$ENTP^%QZNBN(LE)) Q $$^%QZCHW("la longueur des enregistrements doit etre un entier positif et non")_" : "_LE
 I LE>501 Q $$^%QZCHW("la longueur des enregistrements doit etre un entier positif inferieur a 501 et non")_" : "_LE
 I '($$ENTP^%QZNBN(LB)) Q $$^%QZCHW("la longueur des blocs doit etre un entier positif et non")_" : "_LB
 I LB>8192 Q $$^%QZCHW("la longueur des blocs doit etre un entier positif inferieur a 8192 et non")_" : "_LB
 I (LB#LE)'=0 Q LB_" "_$$^%QZCHW("la longueur des blocs doit etre un multiple de la longueur des enregistrements")_" "_LE
 S @EXTBANDE@("CAR")=$S(CODAGE="EBCDIC":"E",1:"A")
 S @EXTBANDE@("ENR")=L
 S @EXTBANDE@("LBL")=$S(LABEL=$$^%QZCHW("NON"):"U",1:"L")
 S @EXTBANDE@("SIZ")=LE
 S @EXTBANDE@("BLK")=LB
 Q ""
 
 
MM(TYPE,GR,REC,EXTERNE,EXTBANDE,SUPPORT,IO) 
 N BASE,MSG,REP,VAL,ORD,SUP,TEMP,FORCFIC
 S FORCFIC=0 G GOMM
 
ACTEC(TYPE,GR,REC,EXTERNE,EXTBANDE,SUPPORT,IO) 
 N BASE,MSG,REP,VAL,ORD,SUP,TEMP,FORCFIC
 S FORCFIC=1
GOMM 
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"MN") K @(TEMP)
 S MSG=""
 S VAL=@GR(1)@(REC)
 S BASE=$P(VAL,"^",$$POS^LKMZ(TYPE,1,"REP"))
 S @EXTERNE@("BASE")=$$NOMINT^%QSF(BASE)
 S @EXTERNE@("NUM")=$P(VAL,"^",$$POS^LKMZ(TYPE,1,"LE"))
 I FORCFIC!DTM S SUPPORT="F" G MNS
 I $$TABID^%INCOIN("ORDINATEUR")="PDP" S SUPPORT="B" G MNS
 D POCLEPA^%VVIDEO
 S SUP=$$^%VZECH2($$^%QZCHW("Support choisi :"),$$^%QZCHW("BANDE"),$$^%QZCHW("FICHIER"))
 I (SUP=1)!(SUP=6) S IO="" Q "STOP"
 I SUP=$$^%QZCHW("BANDE") S SUPPORT="B"
 E  S SUPPORT="F"
MNS 
 I SUPPORT="B" S MSG=$$BANDE(TYPE,.GR,REC,EXTBANDE,.IO)
 I MSG'="" G MNFIN
 
 D INT2^LKMMCV(TYPE,.GR,REC,EXTERNE)
 
MNFIN K @(TEMP) Q MSG
 
 
VEREC1(TYPE,GR,REC,EXTERNE,SUPPORT,BASE) 
 
 I ($D(@GR(1)@(REC))#10)=0 K @(TEMP) Q $S(TYPE["X":$$^%QZCHW("la sortie"),1:$$^%QZCHW("la recuperation"))_" "_REC_" "_$$^%QZCHW("n'est pas definie")
 S VAL=@GR(1)@(REC)
 
 S LE=$P(VAL,"^",$$POS^LKMZ(TYPE,1,"LE"))
 
 S REP=$P(VAL,"^",$$POS^LKMZ(TYPE,1,"REP"))
 
 S SUPPORT=$P(VAL,"^",$$POS^LKMZ(TYPE,1,"SUPPORT"))
 
 I '($$ENTP^%QZNBN(LE)) K @(TEMP) Q LE_" "_$$^%QZCHW("la longueur de l'enregistrement n'est pas un entier")
 S BASE=$$NOMINT^%QSF(REP)
 I BASE="" K @(TEMP) Q REP_" "_$$^%QZCHW("n'est pas un nom de repertoire")
 Q ""

