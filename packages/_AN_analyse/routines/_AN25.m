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

;%AN25^INT^1^59547,73865^0
AN25 ;
 
 
 
 
 
 
 
 
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
APPART K @(TEMPO) S @TEMPO@(1)="A1",@TEMPO@(2)="A2",@TEMPO@(3)="A3",@TEMPO@(4)="I",@TEMPO@(5)="%COMP1",@TEMPO@(6)="%COMP2",@TEMPO@(7)="ENUM",@TEMPO@(8)="IV",@TEMPO@(9)="%COMP3",@TEMPO@(10)="SAVP" D EMPV^%ANGEPIL(TEMPO)
 S %COMP3="",(NORES,A1,A2)=0
 F I=1:1:$L($$^%QZCHW("$APPARTIENT")) D LEC
 S ENUM=0 D CAR
 I C'="(" D M("Une ( est necessaire apres $APPARTIENT ...") S RESULT=0 G DEPIL^%ANGEPIL
 S %COMP1=%COMPIL_$S($$^%QCAZG("%NEG")="'":"'",1:"")_"$$^%EDCAPRT(",%COMPIL=""
 S %COMPIL=""
 D LEC
 I $E(CH,P,P+4)=$$^%QZCHW("$ENUM") S A1=0,%COMP2="OBJET" D EMPIL^%ANGEPIL("APPART3^%AN25") G ENUM
 D EMPIL^%ANGEPIL("APPART2^%AN25") G EXPRESS^%AN4
APPART2 G:RESULT=0 DEPIL^%ANGEPIL
 D CAR
 I C=")" S A1=0,A2=NORES,%COMP2="OBJET",%COMP3=%COMPIL G APPART4
 S A1=NORES
 S %COMP2=%COMPIL
 I C'=";" D M("Un ; etait attendu ...") S RESULT=0 D KILL^%ANA(NORES) G DEPIL^%ANGEPIL
 D LEC
 D EMPIL^%ANGEPIL("APPART3^%AN25") S %COMPIL=""
 G:$E(CH,P,P+4)=$$^%QZCHW("$ENUM") ENUM
 G EXPRESS^%AN4
APPART3 I RESULT=0 D KILL^%ANA(A1) G DEPIL^%ANGEPIL
 S A2=NORES,%COMP3=%COMPIL
 D CAR
 I C'=")" D M("Une "")"" etait attendue ..."),KILL^%ANA(A1),KILL^%ANA(NORES) S RESULT=0 G DEPIL^%ANGEPIL
APPART4 D LEC
 S NORES=$$NEW^%ANA D SET^%ANA(NORES,"TYPE","FONCTION.LOGIQUE"),SET^%ANA(NORES,"TEXTE","$APPARTIENT"),SET^%ANA(NORES,1,A1),SET^%ANA(NORES,2,A2)
 S %COMPIL=%COMP1_%COMP2_","_%COMP3_","_ENUM_")"
 K @(TEMPO)
 G DEPIL^%ANGEPIL
 
ENUM S @TEMPO@(1)="ATT",@TEMPO@(2)="C",@TEMPO@(3)="I",@TEMPO@(4)="L",@TEMPO@(5)="N",@TEMPO@(6)="NORES2",@TEMPO@(7)="BOUC",@TEMPO@(8)="%COMP3" D EMPV^%ANGEPIL(TEMPO)
 S NORES=0,BOUC=0,N=$$^%QZCHW("$ENUM"),L=$L(N)
 I $E(CH,P,P+L)'=(N_"(") D M("La fonction $ENUM etait attendue ...") S RESULT=0 G DEPIL^%ANGEPIL
 F I=1:1:L+1 D LEC
 S NORES2=$$NEW^%ANA D SET^%ANA(NORES2,"TYPE","FONCTION.SPECIALE"),SET^%ANA(NORES2,"TEXTE","$ENUM") S IV=1,%COMP3="""",%COMPIL=""
BOUC D EMPIL^%ANGEPIL("ENUM1^%AN25") G EXPRESS^%AN4
ENUM1 I RESULT=0 D KILL^%ANA(NORES2) G DEPIL^%ANGEPIL
 D SET^%ANA(NORES2,IV,NORES) S IV=IV+1
 S %COMPIL=$$ZSUBST^%QZCHSUB(%COMPIL,"""",""""""),%COMP3=%COMP3_%COMPIL,%COMPIL=""
 D CAR G:C=")" FINENUM
 I C'=";" D M("Un "";"" etait attendu ..."),KILL^%ANA(NORES2) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC S %COMP3=%COMP3_"#" G BOUC
FINENUM I IV=1 D M("Il faut au moins une chaine de caracteres ... "),KILL^%ANA(NORES2) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC S NORES=NORES2,ENUM=1,%COMPIL=%COMP3_"""" G DEPIL^%ANGEPIL
 
 
 
 
MOTRES K @(TEMPO) S @TEMPO@(1)="M",@TEMPO@(2)="N",@TEMPO@(3)="L",@TEMPO@(4)="K" D EMPV^%ANGEPIL(TEMPO)
 I $$^%QCAZG("^NAVARACT($J)")="" D M($$^%QZCHW("L'utilisation de mots reserves n'est pas permise ici ...")) S RESULT=0 G DEPIL^%ANGEPIL
 S M="$REPERTOIRE",N=$$^%QZCHW(M),L=$L(N) G:$E(CH,P,(P+L)-1)=N MOTRES1
 S M="$INDIVIDU",N=$$^%QZCHW(M),L=$L(N) G:$E(CH,P,(P+L)-1)=N MOTRES1
 S M="$ATTRIBUT",N=$$^%QZCHW(M),L=$L(N) G:$E(CH,P,(P+L)-1)=N MOTRES1
 S M="$TYPE.MAJ",N=$$^%QZCHW(M),L=$L(N) G:$E(CH,P,(P+L)-1)=N MOTRES1
 S M="$ANCIENNE.VALEUR",N=$$^%QZCHW(M),L=$L(N) G:$E(CH,P,(P+L)-1)=N MOTRES1
 S M="$NOUVELLE.VALEUR",N=$$^%QZCHW(M),L=$L(N) G:$E(CH,P,(P+L)-1)=N MOTRES1
 S M="$UTILISATEUR",N=$$^%QZCHW(M),L=$L(N) G:$E(CH,P,(P+L)-1)=N MOTRES1
 S M="$MAJ.BASE",N=$$^%QZCHW(M),L=$L(N) G:$E(CH,P,(P+L)-1)=N MOTRES1
 D M($$^%QZCHW("Mot reserve inconnu ... ")) S RESULT=0 G DEPIL^%ANGEPIL
MOTRES1 S NORES=$$NEW^%ANA
 F K=1:1:L D LEC
 D SET^%ANA(NORES,"TYPE","VALEUR.SPECIALE"),SET^%ANA(NORES,"TEXTE",M)
 S %COMPIL=%COMPIL_"^PILMOTRE($J,^PILMOTRE($J),"""_M_""")"
 G DEPIL^%ANGEPIL
 
 
FEXI K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="ATR",@TEMPO@(3)="CHA",@TEMPO@(4)="%COMP1",@TEMPO@(5)="%COMP2",@TEMPO@(6)="%COMP3",@TEMPO@(7)="%COMPF"
 D EMPV^%ANGEPIL(TEMPO)
 S NORES=0 F I=1:1:$L($$^%QZCHW("$EXISTE")) D LEC
 S (ATR,CHA)=0
 I C'="(" D M("Il faut une ( apres $EXISTE ...") S RESULT=0 G DEPIL^%ANGEPIL
 S %COMP1=%COMPIL,%COMPIL=""
 D LEC
 D EMPIL^%ANGEPIL("FEXI1^%AN25")
 G:(C="%")&(NOCOMPIL=0) VARTEMP^%AN3
 G ATTRIBUT^%AN3
FEXI1 G:RESULT=0 DEPIL^%ANGEPIL S ATR=NORES
 G:NOCOMPIL FEXI11
 S %COMPIL=$P(%COMPIL,"(",2,$L(%COMPIL,"(")),%COMPIL=$E(%COMPIL,1,$L(%COMPIL)-1)
 I $L(%COMPIL,",")>3 S %COMP2=%COMPIL,%COMPF="$$ATT^%EDEXI(" G FEXI11
 S %COMP2=%COMPIL,%COMPF="$$VAR^%EDEXI("
FEXI11 S %COMPIL=""
 D CAR I C'=";" S:NOCOMPIL=0 %COMPIL=%COMP1_%NEG_%COMPF_"1,"_%COMP2_","""")" G ENDEXI
 D LEC,EMPIL^%ANGEPIL("FEXI2^%AN25") G EXPRESS^%AN4
FEXI2 I RESULT=0 D KILL^%ANA(ATR) G DEPIL^%ANGEPIL
 S CHA=NORES G:NOCOMPIL ENDEXI
 S %COMP3=%COMPIL
 S %COMPIL=%COMP1_%NEG_%COMPF_"2,"_%COMP2_","_%COMP3_")"
ENDEXI D CAR I C'=")" D M("Une ) etait attendue a la fin de $EXISTE ..."),KILL^%ANA(ATR),KILL^%ANA(CHA) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC S NORES=$$NEW^%ANA D SET^%ANA(NORES,"TYPE","FONCTION.LOGIQUE"),SET^%ANA(NORES,"TEXTE","$EXISTE"),SET^%ANA(NORES,1,ATR),SET^%ANA(NORES,2,CHA) G DEPIL^%ANGEPIL

