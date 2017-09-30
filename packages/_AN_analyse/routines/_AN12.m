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

;%AN12^INT^1^59547,73865^0
AN12 ;
 
 
 
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
LEC1 S P=P+1 D LEC^%AN7,CAR Q
EQU K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="CO",@TEMPO@(3)="L",@TEMPO@(4)="N",@TEMPO@(5)="RE",@TEMPO@(6)="%COMP1",@TEMPO@(7)="%COMP2",@TEMPO@(8)="%COMP3",@TEMPO@(9)="%COMP4",@TEMPO@(10)="%COMP5" D EMPV^%ANGEPIL(TEMPO)
 S (NORES,CO,RE)=0,N=$$^%QZCHW("$EQUIVALENT"),L=$L(N)
 I $E(CH,P,(P+L)-1)'=N D M("Fonction $EQUIVALENT attendue ...") S RESULT=0 G DEPIL^%ANGEPIL
 F I=1:1:L D LEC
 D CAR I C'="(" D M("Une ( etait attendue apres $EQUIVALENT ...") S RESULT=0 G DEPIL^%ANGEPIL
 S %COMP1=%COMPIL,%COMPIL=""
 D LEC,EMPIL^%ANGEPIL("EQU1^%AN12")
 D CAR I C="%" D M("Le nom d'un attribut etait attendu ....") S RESULT=0
 G ATTRIBUT^%AN3
EQU1 G:RESULT=0 DEPIL^%ANGEPIL S RE=NORES
 D CAR I C'=";" D M("Un ; est necessaire pour separer les parametres ..."),KILL^%ANA(RE) S RESULT=0 G DEPIL^%ANGEPIL
 S %COMP2=%COMPIL,%COMPIL="" D LEC,EMPIL^%ANGEPIL("EQU2^%AN12") G EXPRESS^%AN4
EQU2 I RESULT=0 D KILL^%ANA(RE) G DEPIL^%ANGEPIL
 S CO=NORES
 D CAR I C'=")" D M("Une ) etait attendue a la fin  de $EQUIVALENT ..."),KILL^%ANA(RE),KILL^%ANA(CO) S RESULT=0 G DEPIL^%ANGEPIL
 S %COMP4=$P(%COMP2,",",4),%COMP4=$P(%COMP4,",",1)
 S %COMP5=$P(%COMP2,",",1),%COMP5=$P(%COMP5,"(",2)
 S %COMPIL=%COMP1_"$$^%EDCEQUI("_%COMP5_","_%COMP4_","_%COMP2_","_%COMPIL_")"
 K %COMP1,%COMP2,%COMP3,%COMP4
 D LEC S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$EQUIVALENT")
 D SET^%ANA(NORES,1,RE),SET^%ANA(NORES,2,CO) G DEPIL^%ANGEPIL

