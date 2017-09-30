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

;%AN38^INT^1^59547,73865^0
AN38 ;
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
LEC1 S P=P+1 D LEC^%AN7,CAR Q
 
WAIT K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="I",@TEMPO@(3)="X1",@TEMPO@(4)="X2",@TEMPO@(5)="Y1",@TEMPO@(6)="Y2" D EMPV^%ANGEPIL(TEMPO) S (NORES,X1,X2,Y1,Y2)=0
 F I=1:1:$L($$^%QZCHW("$WAIT"))+1 D LEC
 D EMPIL^%ANGEPIL("WAIT1^%AN38") G NOMBRE^%AN1
WAIT1 G:RESULT=0 DEPIL^%ANGEPIL
 S X1=NORES,%COMPIL="H "_%COMPIL
 D CAR I C'=")" D M("Une ) a la fin S.V.P. ...") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$WAIT")
 D SET^%ANA(NORES,1,X1) G DEPIL^%ANGEPIL
 
ADRESSE K @(TEMPO) S @TEMPO@(1)="AD" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$ADRESSE"))+1 D LEC
 D EMPIL^%ANGEPIL("ADR1^%AN38") G CHAINE^%AN1
ADR1 G:RESULT=0 DEPIL^%ANGEPIL
 S AD=NORES
 D CAR I C'=")" D M("Une ) a la fin S.V.P. ...") S RESULT=0 D KILL^%ANA(AD) G DEPIL^%ANGEPIL
 D LEC S NORES=$$NEW^%ANA,%COMPIL=";ADRESSE"
 S %ETIQ=$$RED^%ANA(AD,"TEXTE")
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$ADRESSE")
 D SET^%ANA(NORES,1,AD) G DEPIL^%ANGEPIL
 
TOTEML K @(TEMPO) S @TEMPO@(1)="LI",@TEMPO@(2)="LAT" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$TOTEML"))+1 D LEC
 S (LAT,LI)=0
 D EMPIL^%ANGEPIL("TOTEM1^%AN38") G EXPRESS^%AN4
TOTEM1 G:RESULT=0 DEPIL^%ANGEPIL
 S LAT=NORES
 D CAR G:C=")" FTOTEM
 I C'=";" D M("Un "";"" etait attendu ...") S RESULT=0 D KILL^%ANA(LAT) G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("TOTEM2^%AN38") G EXPRESS^%AN4
TOTEM2 I RESULT=0 D KILL^%ANA(LAT) G DEPIL^%ANGEPIL
 S LI=NORES D CAR
FTOTEM I C'=")" D M("Une ) a la fin S.V.P. ...") S RESULT=0 D KILL^%ANA(LAT),KILL^%ANA(LI) G DEPIL^%ANGEPIL
 D LEC S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$TOTEML")
 D SET^%ANA(NORES,1,LAT),SET^%ANA(NORES,2,LI)
 G DEPIL^%ANGEPIL

