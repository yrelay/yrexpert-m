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

;%AN10^INT^1^59547,73865^0
AN10 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
LEC1 S P=P+1 D LEC^%AN7,CAR Q
 
 
DATE 
 K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="FOR",@TEMPO@(3)="L",@TEMPO@(4)="DAT",@TEMPO@(5)="FORD"
 S @TEMPO@(6)="%COMP1",@TEMPO@(7)="%COMP2",@TEMPO@(8)="%COMP3",@TEMPO@(9)="%COMP4"
 D EMPV^%ANGEPIL(TEMPO)
 S (NORES,FOR,DAT,FORD)=0,L=$L($$^%QZCHW("$DATE"))
 F I=1:1:L D LEC
 S %COMP1=%COMPIL,I=0
 S (%COMP2,%COMP3,%COMP4)=""""""
 D CAR
 I C'="(" G DEND2
 S %COMPIL=""
 
 D LEC,EMPIL^%ANGEPIL("DATE1^%AN10") G EXPRESS^%AN4
DATE1 G:RESULT=0 DEPIL^%ANGEPIL
 S FOR=NORES
 D CAR
 S %COMP2=%COMPIL
 G:C=")" DEND
 I C'=";" D M("Un "";"" ou une "")"" etait attendu") G ERRDAT
 S %COMPIL=""
 
 D LEC,EMPIL^%ANGEPIL("DATE2^%AN10") G EXPRESS^%AN4
DATE2 I RESULT=0 G ERRDAT
 S DAT=NORES
 S %COMP3=%COMPIL
 D CAR
 G:C=")" DEND
 I C'=";" D M("Un "";"" ou une "")"" etait attendu") G ERRDAT
 S %COMPIL=""
 
 D LEC,EMPIL^%ANGEPIL("DATE3^%AN10") G EXPRESS^%AN4
DATE3 I RESULT=0 G ERRDAT
 S FORD=NORES
 S %COMP4=%COMPIL
 D CAR
 I C'=")" D M("Une ) etait attendue a la fin de $DATE ...") G ERRDAT
DEND D LEC
DEND2 S NORES=$$NEW^%ANA
 S %COMPIL=%COMP1_"$$DATET^%QMDATE2("_%COMP2_","_%COMP3_","_%COMP4_")"
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$DATE")
 D SET^%ANA(NORES,1,FOR),SET^%ANA(NORES,2,DAT),SET^%ANA(NORES,3,FORD)
 G DEPIL^%ANGEPIL
 
ERRDAT 
 D KILL^%ANA(FOR),KILL^%ANA(FORD),KILL^%ANA(DAT)
 S RESULT=0 G DEPIL^%ANGEPIL
 
 
HEURE 
 K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="I",@TEMPO@(3)="L",@TEMPO@(4)="N" D EMPV^%ANGEPIL(TEMPO)
 S NORES=0,N=$$^%QZCHW("$HEURE"),L=$L(N)
 I $E(CH,P,(P+L)-1)'=N D M("$HEURE etait attendue ...") S RESULT=0 G DEPIL^%ANGEPIL
 F I=1:1:L D LEC
 S NORES=$$NEW^%ANA,%COMPIL=%COMPIL_"$$^%ANHEURE"
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$HEURE")
 G DEPIL^%ANGEPIL

