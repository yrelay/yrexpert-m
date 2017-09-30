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

;%ANVERB^INT^1^59547,73866^0
%ANVERB ;;10:02 AM  9 Jun 1992; ; 25 Jun 93 12:21 PM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
ANAL 
 K @(TEMPO)
 
 S @TEMPO@(1)="I",@TEMPO@(2)="VERBAN",@TEMPO@(3)="IPAR",@TEMPO@(4)="PARLIS"
 F IPAR=1:1:$L(PARLIS,"/") S @TEMPO@(IPAR+5)="PAR"_IPAR
 D EMPV^%ANGEPIL(TEMPO)
 F IPAR=1:1:$L(PARLIS,"/") S @("PAR"_IPAR_"=0")
 
 F I=1:1:$L($$^%QZCHW(VERBAN)) D LEC
 D CAR
 I C="(" G SUI0
 G:PARLIS="" FIN
 I $E($P(PARLIS,"/"))'="~" D M("Une ""("" etait attendue") G ERREUR
 G FIN
SUI0 D LEC
 S IPAR=1
 
 S OKCHVID=$E($P(PARLIS,"/",IPAR))="~"
 S TYPAR=$TR($P(PARLIS,"/",IPAR),"~","")
 D EMPIL^%ANGEPIL("RETPREM^%ANVERB")
 G:TYPAR="EXPR" EXPRESS^%AN4 G:TYPAR="VARTEMP" VARIND^%ANVERB2 G:TYPAR="LIAISON" LIAISON^%ANVERB2
 G:TYPAR="ADRESSE" ADRESSE^%ANVERB2
 
RETPREM 
 
 I RESULT=0 G DEPIL^%ANGEPIL
 S PAR1=NORES
 S IPAR=2
BOUCLE 
 D CAR
 
 G:C=";" SUI1
 I C'=")" D M("Un "";"" etait attendu") G ERREUR
 G:$P(PARLIS,"/",IPAR)="" FIN
 F IIPAR=IPAR:1 Q:$P(PARLIS,"/",IIPAR)=""  I $E($P(PARLIS,"/",IIPAR))'="~" D M("Un "";"" etait attendu") G ERREUR
 G FIN
SUI1 I $P(PARLIS,"/",IPAR)="" D M("Une "")"" etait attendue") G ERREUR
 D LEC
 S OKCHVID=$E($P(PARLIS,"/",IPAR))="~"
 S TYPAR=$TR($P(PARLIS,"/",IPAR),"~","")
 D EMPIL^%ANGEPIL("RETOUR^%ANVERB")
 G:TYPAR="EXPR" EXPRESS^%AN4 G:TYPAR="VARTEMP" VARIND^%ANVERB2 G:TYPAR="LIAISON" LIAISON^%ANVERB2
 G:TYPAR="ADRESSE" ADRESSE^%ANVERB2
RETOUR 
 
 G:RESULT=0 ERREUR
 S @("PAR"_IPAR_"=NORES")
 S IPAR=IPAR+1
 G BOUCLE
 
FIN 
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE",TYPVER),SET^%ANA(NORES,"TEXTE",VERBAN)
 F IPAR=1:1:$L(PARLIS,"/") D SET^%ANA(NORES,IPAR,@("PAR"_IPAR))
 G DEPIL^%ANGEPIL
 
ERREUR 
 F IPAR=1:1:$L(PARLIS,"/") D KILL^%ANA(@("PAR"_IPAR))
 S RESULT=0
 G DEPIL^%ANGEPIL
 
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
LEC1 S P=P+1 D LEC^%AN7,CAR Q
 ;

