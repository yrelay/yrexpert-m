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

;%PBSRM^INT^1^59547,73874^0
PTRM ;
 
 
 
INIT K ^PTRMX($J)
 D ^%PBPZGRA S %FONC="INIT",%PORT=0,%TERM=$S($D(^TABIDENT(WHOIS,"TYPECR")):^TABIDENT(WHOIS,"TYPECR"),1:"PT-100G") D ^%PBPZ S %FONC="PRENDRE" D ^%PBPZ,^%PBPZALF Q
 
 
 
FIN K ^PTRMX($J) Q
 
 
 
 
 
 
FENETRE(X,Y,L,H) N R1,R2
 N MODE S MODE=132 G FEN
 
 
 
CLEAR D ^%PBPZGRA,^%PBPZCLR,^%PBPZALF Q
 
 
 
INTER(O,V) D INIT2^%PBMFN(O,V,(^PTRMX($J,"ECHELLE")*$$LEC^%PBSOV(O,V,"XO"))+^PTRMX($J,"XO"),(^PTRMX($J,"ECHELLE")*$$LEC^%PBSOV(O,V,"YO"))+^PTRMX($J,"YO"))
 D ^%PBPZGRA,^%PBPZCLR,SOFT^%PBIMINT("","",O,V,0,0,0,^PTRMX($J,"ECHELLE")),^%PBPZALF
 Q
 
 
 
DESSIN(O,V) D INIT2^%PBMFN(O,V,(^PTRMX($J,"ECHELLE")*$$LEC^%PBSOV(O,V,"XO"))+^PTRMX($J,"XO"),(^PTRMX($J,"ECHELLE")*$$LEC^%PBSOV(O,V,"YO"))+^PTRMX($J,"YO"))
 D ^%PBPZGRA,^%PBPZCLR,^%PBISAGE(O,V,0,0,0,^PTRMX($J,"ECHELLE"),0,0),^%PBPZALF
 Q
 N %9AR,%FONC,%9VISIN,%9XTR,%9YTR,%9ECH
 S %9VISIN=0,%9AR=0,%9XTR=0,%9YTR=0,%9ECH=1 D ^%PBPZGRA,^%PBPZCLR,RM^TOPTVIEW,^%PBPZALF Q
 
 
 
EXIST(O,V) Q $D(^[QUI]GRAPH(O,V))'=0
 
 
FEN N R1,R2 S L=L-2,H=H-2
 S ^PTRMX($J,"XO")=(4096\MODE)*(X+5),^PTRMX($J,"YO")=3120-((3120\24)*(Y+H))
 S R1=L/H,R2=4096/3120
 I R1>R2 S ^PTRMX($J,"L")=(4096\MODE)*L,^PTRMX($J,"H")=^PTRMX($J,"L")\R1
 E  S ^PTRMX($J,"H")=(3120\24)*H,^PTRMX($J,"L")=^PTRMX($J,"H")*R1
 S ^PTRMX($J,"ECHELLE")=^PTRMX($J,"L")/4000 Q
TEST D CLEPAG^%VVIDEO,POCLEPA^%VVIDEO W "Objet : " R O I O="" D FIN Q
LT0 D POCLEPA^%VVIDEO W "Version : " R V G:V="" TEST
LT1 D POCLEPA^%VVIDEO W "X=" R X G:X="" LT0
LT2 D POCLEPA^%VVIDEO W "Y=" R Y G:Y="" LT1
LT3 D POCLEPA^%VVIDEO W "L=" R L G:L="" LT2
LT4 D POCLEPA^%VVIDEO W "H=" R H G:H="" LT3
 D 132^%VVIDEO,CLEPAG^%VVIDEO S DXG=X,DYH=Y,LH=L,LV=H,BLD=1 D CARS^%VVIDEO
 D INIT,FENETRE(X,Y,L,H),INTER(O,V),^%PBPZALF
 R *X D ^%PBPZGRA,^%PBPZCLR,^%PBPZALF,80^%VVIDEO G TEST

