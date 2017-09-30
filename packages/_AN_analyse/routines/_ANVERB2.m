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

;%ANVERB2^INT^1^59547,73866^0
%ANVERB2 ;;10:00 AM  9 Jun 1992;
 
 
 
 
 
 
 
 
LIAISON 
 K @(TEMPO) S @TEMPO@(1)="VTET",@TEMPO@(2)="VORD"
 S @TEMPO@(4)="VLIE",@TEMPO@(5)="LIE"
 D EMPV^%ANGEPIL(TEMPO)
 S (VTET,NORES)=0 D CAR
 D EMPIL^%ANGEPIL("LIAIRET^%ANVERB2") G ATTRIBUT^%AN3
LIAIRET I RESULT=0 G LIAIERR
 S VTET=NORES
 S VORD=$$RED^%ANA(VTET,2)
 
 I VORD'=0 D M("Pas d'indice dans le chemin ... ") G LIAIERR
LIAI2 
 S VLIE=$$RED^%ANA(VTET,3) G:VLIE=0 LIAIFIN
 S LIE=$$RED^%ANA(VLIE,"TEXTE") G:LIE="" LIAIFIN
 I $E(LIE)'="%" D M("Le ""^"" doit etre suivi d'une variable ou ne pas exister ... ") G LIAIERR
 
LIAIFIN S NORES=VTET,RESULT=1 G DEPIL^%ANGEPIL
 
LIAIERR D KILL^%ANA(VTET) S RESULT=0 G DEPIL^%ANGEPIL
 
 
VARIND 
 K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="%COMP1"
 D EMPV^%ANGEPIL(TEMPO),CAR
 G:"%"=C VARI0
 I C="""",OKCHVID D LEC,CAR I C="""" D LEC G VARCHV
 I C=";",OKCHVID G VARCHV
 D M($$^%QZCHW("Une variable temporaire commence par ""%"" ...")) S RESULT=0 G DEPIL^%ANGEPIL
VARI0 D EMPIL^%ANGEPIL("VARI1^%ANVERB2") G IDF^%AN3
VARI1 G:RESULT=0 DEPIL^%ANGEPIL
 D SET^%ANA(NORES,"TYPE","VARIABLE")
 G DEPIL^%ANGEPIL
 
 
ADRESSE K @(TEMPO) S @TEMPO@(1)="VTET",@TEMPO@(2)="VORD"
 S @TEMPO@(4)="VLIE",@TEMPO@(5)="LIE"
 D EMPV^%ANGEPIL(TEMPO)
 S (VTET,NORES)=0 D CAR
 D EMPIL^%ANGEPIL("ADRESS2^%ANVERB2") G ATTRIBUT^%AN3
ADRESS2 I RESULT=0 G LIAIERR
 G DEPIL^%ANGEPIL
 
 
VARCHV S NORES=$$NEW^%ANA D SET^%ANA(NORES,"TYPE","VARIABLE"),SET^%ANA(NORES,"TEXTE","") G DEPIL^%ANGEPIL
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
LEC1 S P=P+1 D LEC^%AN7,CAR Q
 ;

