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

;%SRANAL^INT^1^59547,73891^0
SRANAL ;
 
LEC S C=$E(CH,P)
 S P=P+1
 G:C=" " LEC
 Q
 
LEC1 S C=$E(CH,P)
 S P=P+1
 Q
 
EXPRESS(CH,COMPIL,CHAMP,MERR) 
 N C,P,ADR,N,RES,ENT,CHA
 S P=1
 D LEC
 I C="" S MERR=$$^%QZCHW("Chaine vide") Q 0
 K CHAMP
 S COMPIL="(",RES=1,ADR=0
 D EMPADR("RBEXP")
 G EXPR
RBEXP Q:'(RES) 0
 I C'="" S RES=0,MERR=$$^%QZCHW("Caracteres en trop")
 S COMPIL=COMPIL_")"
 Q RES
 
EXPR D EMPADR("EXPR1")
 G OP
EXPR1 G:'(RES) RETADR
 
 G:C="" RETADR
 G:C=")" RETADR
 S NEG=C="'"
 I NEG D LEC
 I "_<>+=-\/!& #*[]"'[C S MERR=$$^%QZCHW("Operateur attendu"),RES=0 G RETADR
 S COMPIL=COMPIL_$S(NEG:"'",1:"")_C
 D LEC
 D EMPADR("EXPR2")
 G OP
EXPR2 G:'(RES) RETADR
 G EXPR1
 
OP 
 G:C="(" SSEXP
 G:C="$" FONCT
 G:C="""" CHAINE
 G NOMBRE
 
SSEXP D LEC
 D EMPADR("SSEXP1")
 S COMPIL=COMPIL_"(" G EXPR
SSEXP1 G:'(RES) RETADR
 I C'=")" S MERR=$$^%QZCHW(""")"" attendu"),RES=0 G RETADR
 D LEC
 S COMPIL=COMPIL_")"
 G RETADR
 
FONCT G:$E(CH,P,P+2)="CH(" CHAMP
 G:$E(CH,P,P+5)="POPER(" POPER
 G:$E(CH,P,P+8)="NETTOYER(" NETTOI
 S RES=0
 S MERR=$$^%QZCHW("$CH, $POPER ou $NETTOYER uniquement")
 G RETADR
 
POPER F I=1:1:7 D LEC
 D EMPADR("POPER1")
 S COMPIL=COMPIL_"$$GEN^%QCAPOP("
 G CHAINE
POPER1 G:'(RES) RETADR
 I C'=")" S RES=0,MERR=$$^%QZCHW(""")"" attendu") G RETADR
 I $L(CHA)>3 S RES=0,MERR=$$^%QZCHW("$POPER : 3 caracteres seulement") G RETADR
 D LEC
 S COMPIL=COMPIL_")"
 G RETADR
 
NETTOI F I=1:1:10 D LEC
 D EMPADR("NETTOI1")
 S COMPIL=COMPIL_"$$GETLBLAN^%VTLBLAN("
 G EXPR
NETTOI1 G:'(RES) RETADR
 I C'=")" S RES=0,MERR=$$^%QZCHW(""")"" attendu") G RETADR
 D LEC
 S COMPIL=COMPIL_")"
 G RETADR
 
CHAMP F I=1:1:4 D LEC
 D EMPADR("CHAMP1")
 S COMPIL=COMPIL_"VAL("
 G ENTIER
CHAMP1 G:'(RES) RETADR
 I C'=")" S RES=0,MERR=$$^%QZCHW(""")"" attendu") G RETADR
 S CHAMP(ENT)=""
 D LEC
 S COMPIL=COMPIL_")"
 G RETADR
 
ENTIER S ENT=""
 I C'?1N S RES=0,MERR=$$^%QZCHW("Nombre attendu") G RETADR
 F I=0:0:0 Q:C'?1N  S ENT=ENT_C D LEC1
 S COMPIL=COMPIL_ENT
 D:C=" " LEC
 G RETADR
 
NOMBRE I C="+" D LEC G NOMB2
 I C="-" S COMPIL=COMPIL_"(0-" D EMPADR("NOMNEG")
NOMB2 I C="." S COMPIL=COMPIL_"0." D LEC G NOMB4
 D EMPADR("NOMB3")
 G ENTIER
NOMB3 G:'(RES) RETADR
 G:C'="." RETADR
 S COMPIL=COMPIL_"0."
 D LEC
NOMB4 D EMPADR("NOMB5")
 G ENTIER
NOMB5 G RETADR
 
NOMNEG S COMPIL=COMPIL_")"
 G RETADR
 
CHAINE I C'="""" S MERR=$$^%QZCHW("Chaine de caracteres attendue (doit debuter par "") ..."),RES=0 G RETADR
 D LEC1 S CHA=""""
CHAIN1 F B=0:0 Q:(C="""")!(C="")  S CHA=CHA_C D LEC1
 I C'="""" S MERR=$$^%QZCHW("Chaine de caracteres doit finir par "" ..."),RES=0 G RETADR
 S CHA=CHA_"""" D LEC1
 I C="""" S CHA=CHA_C D LEC1 G CHAIN1
 S COMPIL=COMPIL_CHA
 G RETADR
 
INDIVIDU(CH,COMPIL,INDI,INDILI,MERR) 
 N C,P,ADR,N,RES,NOMB,ENT
 S P=1,(INDI,INDLI)=""
 S COMPIL="",RES=1,ADR=0
 D LEC
 I $E(CH,P-1,P+3)="$IND(" G IND
 I $E(CH,P-1,P+7)="$INDLIEN(" G INDLI
 S MERR=$$^%QZCHW("""$IND"" ou ""$INDLIEN"" attendu")
 Q 0
 
IND F I=1:1:5 D LEC
 D EMPADR("INDR")
 S COMPIL="%INDI("
 G ENTIER
INDR Q:'(RES) 0
 I C'=")" S MERR=$$^%QZCHW(""")"" attendue") Q 0
 D LEC
 I C'="" S MERR=$$^%QZCHW("Caracteres en trop") Q 0
 S INDI=ENT
 S COMPIL=COMPIL_")"
 Q 1
 
INDLI F I=1:1:9 D LEC
 D EMPADR("INDLIR")
 S COMPIL="%INDLI("
 G ENTIER
INDLIR Q:'(RES) 0
 I C'=")" S MERR=$$^%QZCHW(""")"" attendue") Q 0
 D LEC
 I C'="" S MERR=$$^%QZCHW("Caracteres en trop") Q 0
 S INDLI=ENT
 S COMPIL=COMPIL_")"
 Q 1
 
INDIV(CH,COMPIL,INDI,MERR) 
 N C,P,ADR,N,RES,NOMB,ENT
 S P=1,INDI=""
 S COMPIL="",RES=1,ADR=0
 D LEC
 I $E(CH,P-1,P+3)'="$IND(" S MERR=$$^%QZCHW("""$IND"" attendu") Q 0
 
 G IND
 
PART(CH,PART,MERR) 
 N C,P
 S P=1,MERR=""
 K PART
 D LEC
BPAR I C="" G FPAR
 I "ADC"'[C S MERR=$$^%QZCHW("A(jout), D(ate), C(umul) uniquement") Q 0
 S PART(C)=""
 D LEC
 G:C="" FPAR
 I C'="," S MERR=$$^%QZCHW(""","" attendue") Q 0
 D LEC
 G BPAR
FPAR I $D(PART("C")),$D(PART("A"))!$D(PART("D")) S MERR=$$^%QZCHW("""C"" n'est compatible ni avec ""A"", ni avec ""D""") Q 0
 Q 1
 
EMPADR(ADRR) 
 S N=ADR+1
 S ADR(N)=ADRR
 S ADR=N
 Q
 
RETADR S N=ADR
 S ADR=N-1
 G @ADR(N)
 
TEST X ^DMO
 W !,"Chaine : " R CH
 W !,?10,$$INDIV(CH,.CHC,.CHI,.MES)
 Q

