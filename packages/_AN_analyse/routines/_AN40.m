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

;%AN40^INT^1^59547,73865^0
AN40 ;
 
 
 
 
 
 
 
 
 
 
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
LEC1 S P=P+1 D LEC^%AN7,CAR Q
 
 
 
BOUCLER 
 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="V1",@TEMPO@(3)="%COMP1",@TEMPO@(4)="%COMP2",@TEMPO@(4)="%COMP6",@TEMPO@(5)="%COMP4",@TEMPO@(6)="PROV"
 D EMPV^%ANGEPIL(TEMPO)
 S (%COMP1,%COMP2,%COMP6,%COMP4)=""
 S PROV=$$^%QCAZG("%PROVEN"),PROV=(PROV'="TRT")&(PROV'="RQS")
 S:'(PROV) %COMPIL=""
 
 F I=1:1:$L($$^%QZCHW("$REPETER"))+1 D LEC
 
 S %COMP1=%COMPIL,%COMPIL="" D EMPIL^%ANGEPIL("BOUCLE0^%AN40") G CHAINE^%AN1
BOUCLE0 
 
 I RESULT=0 G DEPIL^%ANGEPIL
 S V1=$$NEW^%ANA D SET^%ANA(V1,1,NORES)
 D CAR
 
 I C'=";" D M(""";"" "_$$^%QZCHW("manquant apres l'etiquette")),KILL^%ANA(V1) S RESULT=0 G DEPIL^%ANGEPIL
 
 D LEC
 S:PROV %COMP2=%COMPIL,%COMPIL="I ("
 S:'(PROV) %COMPIL=""
 D EMPIL^%ANGEPIL("BOUCLE1^%AN40") G COND^%AN4
BOUCLE1 
 
 I RESULT=0 D KILL^%ANA(V1) G DEPIL^%ANGEPIL
 D SET^%ANA(V1,2,NORES)
 S I=3
 S:PROV %COMP6=%COMPIL_") S STOP=1",%COMP6=$$ZSUBST^%QZCHSUB(%COMP6,"""","""""")
 S %COMPIL=""
BINIT 
 D CAR
 I (C'=")")&(C'=";") D M(""";"" "_$$^%QZCHW("ou")_" "")"" "_$$^%QZCHW("manquant")),KILL^%ANA(V1) S RESULT=0 G DEPIL^%ANGEPIL
 I C=")" G FBINIT
 D LEC
 D EMPIL^%ANGEPIL("BINIT1^%AN40") G AFF^%AN22
BINIT1 
 I RESULT=0 D KILL^%ANA(V1) G DEPIL^%ANGEPIL
 D SET^%ANA(V1,I,NORES) S I=I+1
 S:PROV %COMP4=%COMP4_"|"_%COMPIL
 S %COMPIL=""
 G BINIT
FBINIT 
 S:PROV %COMP4=$$ZSUBST^%QZCHSUB(%COMP4,"""","""""") D LEC
 S NORES=V1 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$REPETER")
 
 S:PROV %COMPIL=%COMP1_"D REPETER^%EDCETIQ("_%COMP2_","""_%COMP6_""","""_%COMP4_""")"
 G DEPIL^%ANGEPIL
 
 
PROLOG 
 K @(TEMPO) S @TEMPO@(1)="I" D EMPV^%ANGEPIL(TEMPO)
 S NORES=0
 F I=1:1:$L($$^%QZCHW("$PROLOGUE")) D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$PROLOGUE")
 G DEPIL^%ANGEPIL
 
 
CORPS 
 K @(TEMPO) S @TEMPO@(1)="I" D EMPV^%ANGEPIL(TEMPO)
 S NORES=0
 F I=1:1:$L($$^%QZCHW("$CORPS")) D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$CORPS")
 G DEPIL^%ANGEPIL
 
 
EPILOG 
 K @(TEMPO) S @TEMPO@(1)="I" D EMPV^%ANGEPIL(TEMPO)
 S NORES=0
 F I=1:1:$L($$^%QZCHW("$EPILOGUE")) D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$EPILOGUE")
 G DEPIL^%ANGEPIL
 
 
TRANSTD K @(TEMPO) S @TEMPO@(1)="LI",@TEMPO@(2)="LAT" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$TRANSFERT.TODKBMS"))+1 D LEC
 S (LAT,LI)=0
 D EMPIL^%ANGEPIL("TRANSTD1^%AN40") G EXPRESS^%AN4
TRANSTD1 G:RESULT=0 DEPIL^%ANGEPIL
 S LAT=NORES
 D CAR
 I C'=";" D M("Un "";"" etait attendu ...") S RESULT=0 D KILL^%ANA(LAT) G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("TRANSDT2^%AN40") G EXPRESS^%AN4
TRANSDT2 I RESULT=0 D KILL^%ANA(LAT) G DEPIL^%ANGEPIL
 S LI=NORES D CAR
FTRANSDT I C'=")" D M("Une ) a la fin S.V.P. ...") S RESULT=0 D KILL^%ANA(LAT),KILL^%ANA(LI) G DEPIL^%ANGEPIL
 D LEC S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$TRANSFERT.TODKBMS")
 D SET^%ANA(NORES,1,LAT),SET^%ANA(NORES,2,LI)
 G DEPIL^%ANGEPIL
 
 
DMD K @(TEMPO) S @TEMPO@(1)="A1",@TEMPO@(2)="A2",@TEMPO@(3)="I",@TEMPO@(4)="LPA",@TEMPO@(5)="NPA",@TEMPO@(6)="T" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$DEMANDER")) D LEC
 S NPA=0
 D CAR I C'="(" D M("Une ( apres $DEMANDER") G EDMD
 D LEC
BDMD D EMPIL^%ANGEPIL("BDMD1^%AN40") G ATTRIBUT^%AN3
BDMD1 G:RESULT=0 EDMD
 S NPA=NPA+1,LPA(NPA)=NORES
 D CAR G:C=")" FDMD
 I C'=";" D M("Un ; entre deux parametres") G EDMD
 D LEC G BDMD
FDMD D CAR
 I C'=")" D M("Une ) apres la liste d'attributs") G EDMD
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TEXTE","$DEMANDER")
 D SET^%ANA(NORES,"TYPE","ACTION")
 F I=1:1:NPA D SET^%ANA(NORES,I,LPA(I))
 G DEPIL^%ANGEPIL
EDMD F I=1:1:NPA D KILL^%ANA(LPA(I))
 S RESULT=0 G DEPIL^%ANGEPIL

