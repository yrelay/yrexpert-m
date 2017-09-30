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

;%PBELLIP^INT^1^59547,73873^0
PTELLIPS ;
 
 
 
 N %9END S %9END=40
GO N %9C1,%9C2,%9C3,%FONC,%9M,%9OOX,%9OOY,%9S1,%9S2,%9S3,SX,SY,%9T1,%9XX1,%9YY1 S SX=%9X,SY=%9Y
 G:$$NEWELLI FGO
 S %9S1=^SIN(%9I),%9C1=^COS(%9I),%9C2=9877E-4,%9S2=1564E-4,%9S3=0,%9C3=1
LOOP F %9M=1:1:%9END+1 D TRAIT
FGO S %9X=SX,%9Y=SY
 Q
TRAIT S %9XX1=%9PR*%9C3,%9YY1=%9DR*%9S3,%9X1=(%9X+(%9XX1*%9C1))-(%9YY1*%9S1),%9Y1=(%9Y+(%9XX1*%9S1))+(%9YY1*%9C1),%9T1=(%9C3*%9C2)-(%9S3*%9S2),%9S3=(%9S3*%9C2)+(%9C3*%9S2),%9C3=%9T1
 I %9M'=1 S %FONC="SEGMENT",%9X2=%9OOX,%9Y2=%9OOY D ^%PBPZ
 S %9OOX=%9X1,%9OOY=%9Y1 Q
 
DEMIE N %9END S %9END=20 G GO
NEWELLI() 
 Q:'($$^%PBELLI1) 0 N %8,%81,%8CH,%FONC,%8I,%8IT
 S %81=$S(%9END=40:4,1:3) F %8=1:1:%81 S %8CH=%8ELIPS("E",%8),%8I=1 D T1
 Q 1
T1 F %8IT="%9X","%9Y","%9AD","%9AF","%9R" S @%8IT=$P(%8CH,"^",%8I),%8I=%8I+1
 S %FONC="ARC" D ^%PBPZ Q
 
TEST N %9DR,%9I,%9PR,%9X,%9Y D CLEPAG^%VVIDEO
L0 W !,"X= " R %9X Q:%9X=""
L1 W !,"Y= " R %9Y G:%9Y="" L0
L2 W !,"PR= " R %9PR G:%9PR="" L1
L3 W !,"DR= " R %9DR G:%9DR="" L2
L4 W !,"I= " R %9I G:%9I="" L3
 D ^%PBPZGRA,^%PBELLIP,^%PBPZALF,CLEPAG^%VVIDEO G L4

