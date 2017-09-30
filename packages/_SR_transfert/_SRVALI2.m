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

;%SRVALI2^INT^1^59547,73891^0
SRVALI2 ;
 
 
 
 
 
STO 
 N TEST,LB,OK,NOK,COMPIL,DEF
 S TEST="I $L(LIB)>LB S LB=$L(LIB)",DEF=""
 I (P+0)'=P D INS(ERR,$$M(P)_$$^%QZCHW("le numero doit etre numerique"))
 S CONT=@ADR@("CHAMPS",P)
 
 
 S LIB=$P(CONT,$C(0),2),LB=$L(LIB)
 I LIB="" D INS(ERR,$$M(P)_$$^%QZCHW("libelle du champ indefini")) G DEF
 X TEST
 
 
 S LIB=$P(CONT,$C(0),3)
 I (LIB'="O")&(LIB'="N") D INS(ERR,$$M(P)_$$^%QZCHW("modifiable valeur O ou N"))
 X TEST
 
 S LIB=$P(CONT,$C(0),4)
 I (LIB'="O")&(LIB'="N") D INS(ERR,$$M(P)_$$^%QZCHW("obligatoire valeur O ou N"))
 X TEST
DEF 
 
 S LIB=$P(CONT,$C(0),5) I LIB="" G LAR
 X TEST
 D UDEF
 S DEF=LIB
 
LAR 
 S LIB=$P(CONT,$C(0),6),LAR=LIB
 I (LAR="")!(LAR=0) S LAR=LV
 X TEST
 I (LIB+0)'=LIB D INS(ERR,$$M(P)_$$^%QZCHW("la largeur doit etre numerique"))
CLE 
 S LIB=$P(CONT,$C(0),7) I LIB="" G RECUP
 X TEST
 I LIB=0 D INS(ERR,$$M(P)_$$^%QZCHW("la cle = 0")) G RECUP
 I (LIB+0)'=LIB D INS(ERR,$$M(P)_$$^%QZCHW("la cle doit etre numerique"))
 S CLE(LIB,P)=LAR,CLE=CLE+1
 
RECUP 
 S LIB=$P(CONT,$C(0),8) I LIB="" G NAT
 X TEST
 I (LIB'="O")&(LIB'="N") D INS(ERR,$$M(P)_$$^%QZCHW("recuperation valeur O ou N"))
 I (((XG+LB)+LAR)+5)>79 D INS(ERR,$$M(P)_$$^%QZCHW("largeur trop grande"))
 
 
NAT 
 I '($D(@ADR@("CHAMPS",P,"CONTROLES"))) S COMPIL="S OK=1" G FSTO
 S CONT=@ADR@("CHAMPS",P,"CONTROLES")
 I CONT="" S COMPIL="S OK=1" G FSTO
 S LIB=$P(CONT,$C(0),1) I LIB="" S NAT="X" G FOR
 I DEF="$POPER" S COMPIL="S OK=1" D INS(WARNING,$$M(P)_$$^%QZCHW("nature et format inutiles")) G FSTO
 I ((("ANX"'[LIB)&(LIB'="$DATE"))&(LIB'="$JOUR"))&(LIB'="$HEURE") D INS(ERR,$$M(P)_$$^%QZCHW("Nature du champ inconnue"))
 S NAT=LIB
FOR S LIB=$P(CONT,$C(0),2)
 I NAT="$DATE" G D
 I NAT="$JOUR" G J
 I NAT="$HEURE" G H
 I LIB="" S COMPIL="S OK=VAL?."_$S(NAT="A":"A",NAT="N":"N",1:"E") G FSTO
 
 D AN^%SRVALI3(LIB,NAT,.COMPIL,.OK)
 I '(OK) Q
 
FSTO D AFFECT
FST2 S NOK=$$VALEG^%SRCOMPV(ERR,ADR,ADRCOMP,P)
 Q
 
D 
 I LIB'="" D INS(WARNING,$$M(P)_$$^%QZCHW("format inutile")) Q
 S COMPIL="S OK=($$^%QMDASAI(VAL,.OK))+0"
 G FSTO
J 
 I LIB'="" D INS(WARNING,$$M(P)_$$^%QZCHW("format inutile")) Q
 S COMPIL="S VAL=$$MAJ^%VMINUSC($$GETLBLAN^%VTLBLAN(VAL)),LVAL=$L(VAL),OK=(VAL=$E(""LUNDI"",1,LVAL))!(VAL=$E(""MARDI"",1,LVAL))!(VAL=$E(""MERCREDI"",1,LVAL))!(VAL=$E(""JEUDI"",1,LVAL))!(VAL=$E(""VENDREDI"",1,LVAL))!(VAL=$E(""SAMEDI"",1,LVAL))"
 S COMPIL=COMPIL_"!(VAL=$E(""DIMANCHE"",1,LVAL))"
 G FSTO
H 
 S LIB=LIB+0
 I (LIB=0)!(LIB>2) D INS(ERR,$$M(P)_$$^%QZCHW("nature et format incompatibles")) Q
 S COMPIL="S OK=$$FORM"_LIB_"^%QMDAHEU(VAL)"
 G FSTO
 
M(P) 
 N M
 S M=$$^%QZCHW("champ")_" "_P_" : "
 Q M
 
INS(ERR,M) 
 S @ERR@($E(M,1,74))="" I $L(M)>LMAX S LMAX=$L(M)
 Q
 
UDEF 
 N PAR
 I $E(LIB)'="$" Q
 I LIB="$JOUR" Q
 I LIB="$POPER" Q
 I $E(LIB,1,6)="$HEURE" D UDEF2("$HEURE") Q
 I $E(LIB,1,5)="$DATE" G DATE
 I $E(LIB,1,6)="$ANNEE" D UDEF2("$ANNEE") Q
 I $E(LIB,1,5)="$JOUR" D INS(WARNING,$$M(P)_" "_LIB_" "_$$^%QZCHW("est considere comme une valeur"))
 Q
UDEF2(L) 
 S PAR=$$EXT(LIB)
 I (PAR'=1)&(PAR'=2) D INS(ERR,$$M(P)_$$^%QZCHW(L)_" "_$$^%QZCHW("parametre inconnu"))
 Q
DATE I '($D(^RQSGLU)) D ^%QMDAINI
 S PAR=$$EXT(LIB)
 I PAR="" D INS(ERR,$$M(P)_$$^%QZCHW("$DATE")_" "_$$^%QZCHW("necessite un parametre")) Q
 I '($D(^RQSGLU("QMDA","FORM",PAR))) D INS(ERR,$$M(P)_$$^%QZCHW("$DATE")_" "_$$^%QZCHW("parametre inconnu"))
 Q
 
EXT(LIB) 
 Q $$GETLBLAN^%VTLBLAN($P($P(LIB,"(",2),")",1))
 
AFFECT 
 S ^[QUI]RQSDON("SR","COMP",SA,"FORMAT",P)=COMPIL
 Q

