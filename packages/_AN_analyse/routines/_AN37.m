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

;%AN37^INT^1^59547,73865^0
AN37 ;
 
 
 
 
 
 
 
 
 
M(M) Q:'(ERRMES)  D ^%VZEAVT($$^%QZCHW(M)) Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
 
HISTO 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="NPA",@TEMPO@(3)="LPA",@TEMPO@(4)="TYP" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$HISTOGRAMME")) D LEC
 D CAR I C'="(" D M("Une ( etait attendue apres $HISTOGRAMME") S RESULT=0 G DEPIL^%ANGEPIL
 S NPA=0
 D LEC,EMPIL^%ANGEPIL("HIS1^%AN37") G ENTIER^%AN1
 
HIS1 G:RESULT=0 ERHIS
 S NPA=NPA+1,LPA(NPA)=NORES
 S TYP=$$RED^%ANA(NORES,"TEXTE")
 D CAR I C'=";" D M("Un ; etait attendu") G ERHIS
 D LEC,EMPIL^%ANGEPIL("HIS2^%AN37") G CHAINE^%AN1
 
HIS2 G:RESULT=0 ERHIS
 S NPA=NPA+1,LPA(NPA)=NORES
 D CAR I C'=";" D M("Un ; etait attendu") G ERHIS
 D LEC,EMPIL^%ANGEPIL("HIS3^%AN37") G EXPRESS^%AN4
 
HIS3 G:RESULT=0 ERHIS
 S NPA=NPA+1,LPA(NPA)=NORES
 D CAR I C'=";" D M("Un ; etait attendu") G ERHIS
 D LEC,EMPIL^%ANGEPIL("HIS4^%AN37") G ATTRIBUT^%AN3
 
HIS4 G:RESULT=0 ERHIS
 S NPA=NPA+1,LPA(NPA)=NORES
 D CAR I C'=";" D M("Un ; etait attendu") G ERHIS
 D LEC,EMPIL^%ANGEPIL("HIS5^%AN37") G ATTRIBUT^%AN3
 
HIS5 G:RESULT=0 ERHIS
 S NPA=NPA+1,LPA(NPA)=NORES
 D CAR I C'=";" D M("Un ; etait attendu") G ERHIS
 D LEC,EMPIL^%ANGEPIL("HIS6^%AN37") G BOOL^%AN20
 
HIS6 G:RESULT=0 ERHIS
 S NPA=NPA+1,LPA(NPA)=NORES
 D CAR I C'=";" D M("Un ; etait attendu") G ERHIS
 D LEC,EMPIL^%ANGEPIL("HIS62^%AN37") G NOMBRE^%AN1
 
HIS62 G:RESULT=0 ERHIS
 S NPA=NPA+1,LPA(NPA)=NORES
 D CAR I C'=";" D M("Un ; etait attendu") G ERHIS
 D LEC,EMPIL^%ANGEPIL("HIS7^%AN37") G BOOL^%AN20
 
HIS7 G:RESULT=0 ERHIS
 S NPA=NPA+1,LPA(NPA)=NORES
 D CAR I C'=";" D M("Un ; etait attendu") G ERHIS
 D LEC,EMPIL^%ANGEPIL("HIS8^%AN37") G BOOL^%AN20
 
HIS8 G:RESULT=0 ERHIS
 S NPA=NPA+1,LPA(NPA)=NORES
 D CAR I TYP=1 G FHIS
 
 I C'=";" D M("Un ; etait attendu") G ERHIS
 I TYP=2 G SHIS
 
 D LEC,EMPIL^%ANGEPIL("HIS9^%AN37") G ATTRIBUT^%AN3
 
HIS9 G:RESULT=0 ERHIS
 S NPA=NPA+1,LPA(NPA)=NORES
 G FHIS2
 
SHIS D LEC,EMPIL^%ANGEPIL("SHIS1^%AN37") G ATTRIBUT^%AN3
 
SHIS1 G:RESULT=0 ERHIS
 S NPA=NPA+1,LPA(NPA)=NORES
 D CAR I C'=";" D M("Un ; etait attendu") G ERHIS
 D LEC,EMPIL^%ANGEPIL("SHIS2^%AN37") G BOOL^%AN20
 
SHIS2 G:RESULT=0 ERHIS
 S NPA=NPA+1,LPA(NPA)=NORES
 D CAR I C'=";" D M("Un ; etait attendu") G ERHIS
 D LEC,EMPIL^%ANGEPIL("SHIS3^%AN37") G NOMBRE^%AN1
 
SHIS3 G:RESULT=0 ERHIS
 S NPA=NPA+1,LPA(NPA)=NORES
 
FHIS2 
 D CAR I C'=";" D M("Un ; etait attendu") G ERHIS
 D LEC,EMPIL^%ANGEPIL("SHIS4^%AN37") G BOOL^%AN20
 
SHIS4 G:RESULT=0 ERHIS
 S NPA=NPA+1,LPA(NPA)=NORES
 D CAR I C'=";" D M("Un ; etait attendu") G ERHIS
 D LEC,EMPIL^%ANGEPIL("SHIS5^%AN37") G BOOL^%AN20
 
SHIS5 G:RESULT=0 ERHIS
 S NPA=NPA+1,LPA(NPA)=NORES
 D CAR
 
FHIS I C'=")" D M("Une ) etait attendue a la fin de $HISTOGRAMME") G ERHIS
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$HISTOGRAMME")
 F I=1:1:NPA D SET^%ANA(NORES,I,LPA(I))
 G DEPIL^%ANGEPIL
ERHIS S RESULT=0
 F I=1:1:NPA D KILL^%ANA(LPA(I))
 G DEPIL^%ANGEPIL
 
 
IMPH 
 K @(TEMPO)
 S @TEMPO@(1)="I",@TEMPO@(2)="N",@TEMPO@(3)="S",@TEMPO@(4)="TIT" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$IMPRIMER.HISTO")) D LEC
 D CAR
 I C'="(" D M("Une ( etait attendue apres $IMPRIMER.HISTO") S RESULT=0 G DEPIL^%ANGEPIL
 S (N,S,TIT)=0
 D LEC,EMPIL^%ANGEPIL("IMH1^%AN37") G EXPRESS^%AN4
IMH1 
 G:RESULT=0 DEPIL^%ANGEPIL
 S N=NORES
 D CAR
 I C'=";" D M("Un ; etait attendu apres le nom de l'histogramme") G ERRI
 D LEC,EMPIL^%ANGEPIL("IMH2^%AN37") G CHAINE^%AN1
IMH2 
 I RESULT=0 G ERRI
 S S=NORES
 D CAR
 I C'=";" G IMPF
 D LEC,EMPIL^%ANGEPIL("IMH3^%AN37") G EXPRESS^%AN4
IMH3 
 I RESULT=0 G ERRI
 S TIT=NORES
 D CAR
 
IMPF I C'=")" D M("Une ) etait attendue a la fin de $IMPRIMER.HISTO") G ERRI
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$IMPRIMER.HISTO")
 D SET^%ANA(NORES,1,N),SET^%ANA(NORES,2,S),SET^%ANA(NORES,3,TIT)
 G DEPIL^%ANGEPIL
ERRI 
 D KILL^%ANA(N),KILL^%ANA(S),KILL^%ANA(TIT)
 S RESULT=0 G DEPIL^%ANGEPIL

