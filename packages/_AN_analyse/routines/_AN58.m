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

;%AN58^INT^1^59547,73866^0
AN58 ;
 
 
 
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
 
PORT 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="PORT",@TEMPO@(3)="CAPT",@TEMPO@(4)="ORDRE",@TEMPO@(5)="VAR1",@TEMPO@(6)="VAR2",@TEMPO@(7)="VAR3"
 D EMPV^%ANGEPIL(TEMPO)
 S (PORT,CAPT,ORDRE,VAR1,VAR2,VAR3)=0
 
 F I=1:1:$L($$^%QZCHW("$PORT"))+1 D LEC
 
 D EMPIL^%ANGEPIL("PORT0^%AN58") G EXPRESS^%AN4
PORT0 I RESULT=0 G DEPIL^%ANGEPIL
 S PORT=NORES
 D CAR
 
 I C'=";" D M("Un "";"" etait attendu ...") G ERR
 
 D LEC,EMPIL^%ANGEPIL("PORT1^%AN58") G EXPRESS^%AN4
PORT1 I RESULT=0 G DEPIL^%ANGEPIL
 S CAPT=NORES
 D CAR
 I C'=";" D M("Un "";"" etait attendu ...") G ERR
 
 D LEC,EMPIL^%ANGEPIL("PORT2^%AN58") G EXPRESS^%AN4
PORT2 I RESULT=0 G ERR
 S ORDRE=NORES
 D CAR
 I (C'=";")&(C'=")") D M("Un "";"" ou une "")"" etait attendus ...") G ERR
 I C=")" G PORTF
 
 D LEC,EMPIL^%ANGEPIL("PORT3^%AN58") G VARTEMP^%AN3
PORT3 I RESULT=0 G ERR
 S VAR1=NORES
 D CAR
 I (C'=";")&(C'=")") D M("Un "";"" ou une "")"" etait attendus ...") G ERR
 I C=")" G PORTF
 
 D LEC,EMPIL^%ANGEPIL("PORT4^%AN58") G VARTEMP^%AN3
PORT4 I RESULT=0 G ERR
 S VAR2=NORES
 D CAR
 I (C'=";")&(C'=")") D M("Un "";"" ou une "")"" etait attendus ...") G ERR
 G:C=")" PORTF
 
 D LEC,EMPIL^%ANGEPIL("PORT5^%AN58") G VARTEMP^%AN3
PORT5 I RESULT=0 G ERR
 S VAR3=NORES
 D CAR
 
 I C'=")" D M("Une "")"" etait attendue ...") G ERR
PORTF S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$PORT")
 D SET^%ANA(NORES,1,PORT),SET^%ANA(NORES,2,CAPT),SET^%ANA(NORES,3,ORDRE)
 D SET^%ANA(NORES,4,VAR1),SET^%ANA(NORES,5,VAR2),SET^%ANA(NORES,6,VAR3)
 D LEC
 G DEPIL^%ANGEPIL
 
ERR F I=PORT,CAPT,ORDRE,VAR1,VAR2,VAR3 D KILL^%ANA(I)
 S RESULT=0
 G DEPIL^%ANGEPIL
 
 
AJDEL 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="NBJ",@TEMPO@(3)="DAT",@TEMPO@(4)="REG"
 S @TEMPO@(5)="LIBFON"
 D EMPV^%ANGEPIL(TEMPO)
 S LIBFON="$AJOUTER.DELAI"
 
 F I=1:1:$L($$^%QZCHW("$AJOUTER.DELAI"))+1 D LEC
 G PARDELAI
 
 
RETDEL 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="NBJ",@TEMPO@(3)="DAT",@TEMPO@(4)="REG"
 S @TEMPO@(5)="LIBFON"
 D EMPV^%ANGEPIL(TEMPO)
 S LIBFON="$RETRANCHER.DELAI"
 
 F I=1:1:$L($$^%QZCHW("$RETRANCHER.DELAI"))+1 D LEC
 
 
PARDELAI S (NBJ,DAT,REG)=0
 
 D EMPIL^%ANGEPIL("DELPAR0^%AN58") G ATTRIBUT^%AN3
DELPAR0 I RESULT=0 G DEPIL^%ANGEPIL
 S DAT=NORES
 D CAR
 
 I C'=";" D M("Un "";"" etait attendu ...") G ERRDEL
 
 D LEC,EMPIL^%ANGEPIL("DELPAR1^%AN58") G EXPRESS^%AN4
DELPAR1 I RESULT=0 G ERRDEL
 S NBJ=NORES
 D CAR
 G:C=")" FDEL
 
 I C'=";" D M("Un "";"" etait attendu ...") G ERRDEL
 
 D LEC,EMPIL^%ANGEPIL("DELPAR2^%AN58") G EXPRESS^%AN4
DELPAR2 I RESULT=0 G ERRDEL
 S REG=NORES
 D CAR
 I C'=")" D M("Une "")"" etait attendue ...") G ERRDEL
 
FDEL D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE",LIBFON)
 D SET^%ANA(NORES,1,DAT),SET^%ANA(NORES,2,NBJ),SET^%ANA(NORES,3,REG)
 G DEPIL^%ANGEPIL
 
ERRDEL D KILL^%ANA(DAT),KILL^%ANA(NBJ),KILL^%ANA(REG)
 S RESULT=0
 G DEPIL^%ANGEPIL
 
TRASAI 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="SAIS",@TEMPO@(3)="CONT",@TEMPO@(4)="ACTRT",@TEMPO@(5)="TRTSA",@TEMPO@(6)="STO",@TEMPO@("7")="IMP"
 D EMPV^%ANGEPIL(TEMPO)
 S (SAIS,CONT,ACTRT,TRTSA,STO,IMP)=0
 
 F I=1:1:$L($$^%QZCHW("$TRANSFERER.SAISIE"))+1 D LEC
 
 D EMPIL^%ANGEPIL("TRSA0^%AN58") G EXPRESS^%AN4
TRSA0 I RESULT=0 G DEPIL^%ANGEPIL
 S SAIS=NORES
 D CAR
 
 G:C=")" TRSAF
 I (C'=";")&(C'=")") D M("Un "";"" ou une "")"" etaient attendus ...") G ERRTR
 
 D LEC,EMPIL^%ANGEPIL("TRSA1^%AN58") G EXPRESS^%AN4
TRSA1 I RESULT=0 G DEPIL^%ANGEPIL
 S CONT=NORES
 D CAR
 I C'=";" D M("Un "";"" etait attendu ...") G ERRTR
 
 D LEC,EMPIL^%ANGEPIL("TRSA2^%AN58") G EXPRESS^%AN4
TRSA2 I RESULT=0 G ERRTR
 S ACTRT=NORES
 D CAR
 I C'=";" D M("Un "";"" etait attendu ...") G ERRTR
 
 D LEC,EMPIL^%ANGEPIL("TRSA3^%AN58") G EXPRESS^%AN4
TRSA3 I RESULT=0 G ERRTR
 S TRTSA=NORES
 D CAR
 I C'=";" D M("Un "";"" etait attendu ...") G ERRTR
 
 D LEC,EMPIL^%ANGEPIL("TRSA4^%AN58") G EXPRESS^%AN4
TRSA4 I RESULT=0 G ERRTR
 S STO=NORES
 D CAR
 I C'=";" D M("Un "";"" etait attendu ...") G ERRTR
 
 D LEC,EMPIL^%ANGEPIL("TRSA5^%AN58") G EXPRESS^%AN4
TRSA5 I RESULT=0 G ERRTR
 S IMP=NORES
 D CAR
 I C'=")" D M("Une "")"" etait attendue ...") G ERRTR
TRSAF S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$TRANSFERER.SAISIE")
 D SET^%ANA(NORES,1,SAIS),SET^%ANA(NORES,2,CONT),SET^%ANA(NORES,3,ACTRT)
 D SET^%ANA(NORES,4,TRTSA),SET^%ANA(NORES,5,STO),SET^%ANA(NORES,6,IMP)
 D LEC
 G DEPIL^%ANGEPIL
 
ERRTR F I=SAIS,CONT,ACTRT,TRTSA,STO D KILL^%ANA(I)
 S RESULT=0
 G DEPIL^%ANGEPIL

