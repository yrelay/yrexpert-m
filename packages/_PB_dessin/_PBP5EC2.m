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

;%PBP5EC2^INT^1^59547,73874^0
PTEC2 ;
 
 
ORIG(X,Y) S PTEC("XO")=X,PTEC("YO")=Y Q
 
LECORIG(X,Y) S X=PTEC("XO"),Y=PTEC("YO") Q
 
CADRE N %FONC,%9MOD,%9X,%9X1,%9X2,%9Y,%9Y1,%9Y2,%DESSIN,SAVXX,SAVYY
 S %DESSIN=0
 D EFF^%PBP5EC(0),LIG^%PBP5EC("F",0)
 S %FONC="SEGMENT",%9X1=200,%9Y1=200,%9X2=3900,%9Y2=200 D ^%PBPZ
 S %FONC="SEGMENT",%9X1=3900,%9Y1=200,%9X2=3900,%9Y2=2900 D ^%PBPZ
 S %FONC="SEGMENT",%9X1=3900,%9Y1=2900,%9X2=200,%9Y2=2900 D ^%PBPZ
 S %FONC="SEGMENT",%9X1=200,%9Y1=2900,%9X2=200,%9Y2=200 D ^%PBPZ
 S %9Y=2900 F %9X=PTEC("XO"):500:3900 S %FONC="SEGMENT",(%9X1,%9X2)=%9X,%9Y1=%9Y,%9Y2=%9Y1+30 D ^%PBPZ
 S %9Y=2900 F %9X=PTEC("XO"):-500:200 S %FONC="SEGMENT",(%9X1,%9X2)=%9X,%9Y1=%9Y,%9Y2=%9Y1+30 D ^%PBPZ
 S %9X=200 F %9Y=PTEC("YO"):500:2900 S %FONC="SEGMENT",%9X1=%9X,%9X2=%9X1-30,(%9Y1,%9Y2)=%9Y D ^%PBPZ
 S %9X=200 F %9Y=PTEC("YO"):-500:200 S %FONC="SEGMENT",%9X1=%9X,%9X2=%9X1-30,(%9Y1,%9Y2)=%9Y D ^%PBPZ
 S %9MOD=5E-1,%FONC="TAILLE" D ^%PBPZ
 
 S %9Y=2950,%FONC="CONVERSION.Y" D ^%PBPZ
 F %9X=PTEC("XO"):500:3900 D S S %FONC="CONVERSION.X" D ^%PBPZ S %FONC="MOUV" D ^%PBPZ S %FONC="TEXT",%9STR=SAVXX-PTEC("XO") D ^%PBPZ,R
 
 S %9Y=2950,%FONC="CONVERSION.Y" D ^%PBPZ
 F %9X=PTEC("XO"):-500:200 D S S %FONC="CONVERSION.X" D ^%PBPZ S %FONC="MOUV" D ^%PBPZ S %FONC="TEXT",%9STR=SAVXX-PTEC("XO") D ^%PBPZ,R
 
 S %9X=0,%FONC="CONVERSION.X" D ^%PBPZ
 F %9Y=PTEC("YO"):500:2900 D S S %FONC="CONVERSION.Y" D ^%PBPZ S %FONC="MOUV" D ^%PBPZ S %FONC="TEXT",%9STR=SAVYY-PTEC("YO") D ^%PBPZ,R
 
 S %9X=0,%FONC="CONVERSION.X" D ^%PBPZ
 F %9Y=PTEC("YO"):-500:200 D S S %FONC="CONVERSION.Y" D ^%PBPZ S %FONC="MOUV" D ^%PBPZ S %FONC="TEXT",%9STR=SAVYY-PTEC("YO") D ^%PBPZ,R
 D LIG^%PBP5EC("M",0) S %FONC="TAILLE",%9MOD=2 D ^%PBPZ S %FONC="SEGMENT",%9X1=PTEC("XO")+50,(%9Y1,%9Y2)=PTEC("YO"),%9X2=%9X1-100 D ^%PBPZ S %FONC="SEGMENT",(%9X1,%9X2)=PTEC("XO"),%9Y1=PTEC("YO")+50,%9Y2=%9Y1-100 D ^%PBPZ,LIG^%PBP5EC("F",0)
 
 
 Q
MESUR(D) N %FONC,%9MOD,%9STR,%9X,%9Y,%DESSIN
 S %DESSIN=0
 S %FONC="MOUV",%9X=550,%9Y=2825 D CONV S %FONC="MOUV" D ^%PBPZ
 S %FONC="TAILLE",%9MOD=5E-1 D ^%PBPZ
 S %FONC="TEXT",%9STR=D_" MM" D ^%PBPZ
 S %FONC="TAILLE",%9MOD=2 D ^%PBPZ Q
CONV 
 N %FONC S %FONC="CONVERSION.X" D ^%PBPZ S %FONC="CONVERSION.Y" D ^%PBPZ Q
S 
 S SAVXX=%9X,SAVYY=%9Y Q
R 
 S %9X=SAVXX,%9Y=SAVYY Q

