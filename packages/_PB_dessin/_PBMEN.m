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

;%PBMEN^INT^1^59547,73873^0
PBMEN ;
 
 
 
 
 
AFF(X,Y,%9STR) 
 Q:%9STR=""
 N %9MOD,%FONC,LG,CH2,SSCH,CH,I,%9X,%9Y
 S %9X=X,%9Y=Y
 S CH=$$GETLBLAN^%VTLBLAN(%9STR)
 S LG=$L(CH),PART=$L(CH,"  ")
 I LG<70 G AFF1
 I PART=1 Q
 S SSCH="",I=1
LOOPAF 
 I I>PART S %9STR=SSCH D AFF1 Q
 S CH2=$P(CH,"  ",I)
 I CH2="" S %9STR=SSCH D AFF1 Q
 S I=I+1
 I ($L(SSCH)+$L(CH2))<70 S SSCH=SSCH_CH2_"  " G LOOPAF
 S %9STR=SSCH,%9Y=100 D AFF1 S SSCH=CH2_"  "
 S %9X=0,%9Y=0
 G LOOPAF
 
AFF1 S %FONC="MOUV" D ^%PBPZ
 S %9MOD=1,%FONC="TAILLE" D ^%PBPZ
 S %FONC="TEXT" D ^%PBPZ
 S %9MOD=1,%FONC="TAILLE" D ^%PBPZ
 Q
EFF(X,Y) 
 S %9X=X,%9Y=Y
 S %FONC="MOUV" D ^%PBPZ
 S %9STR=$J("",73),%FONC="TEXT" D ^%PBPZ
 Q
EFFBAS 
 D EFF(0,100)
 D EFF(0,0)
 Q
 
LEC(CH,Y1) 
 Q:CH=""
 D ^%PBPZGRA,EFFBAS
 N %9Y,%9X,LG,%FONC,%9MOD
 D AFF(0,0,CH)
 S %FONC="PRENDRE" D ^%PBPZ
 S %9MOD=1,%FONC="TAILLE" D ^%PBPZ
 S LG=$L(CH),%9X=LG*45,%9Y=0,%FONC="MOUV" D ^%PBPZ
LEC0 R Y1
 S Y1=$$GETLBLAN^%VTLBLAN(Y1)
 S %FONC="POSER" D ^%PBPZ
 Q
CUROFF 
 N %FONC S %FONC="CUROFF" D ^%PBPZ Q
CURON 
 N %FONC S %FONC="CURON" D ^%PBPZ Q
 
CONFIRM(LIB) 
 D EFFBAS
 Q:%TERM="PT-100G" 1
 N AD
 D AFF(0,0,LIB),CUROFF
 R *AD:^TOZE($I,"ATTENTE")
 D CURON,EFFBAS
 I AD=79 Q 1
 Q 0

