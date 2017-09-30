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

;%PBP5CI3^INT^1^59547,73874^0
PTCI3500 ;
 
 
 
 
 
DEB 
 I (%9T>16)&(%9T<36) D @%9T Q
 I %9T="CLEAR" D @%9T
 Q
 
17 D LETTRE,ITALIC2,BOLD2,DOUBLE2 W *27,*91," 0 w"
 Q
18 D LETTRE,ITALIC,BOLD2,DOUBLE2 W *27,*91," 0 w"
 Q
19 D LETTRE2,ITALIC2,BOLD2,DOUBLE2 W *27,*91," 0 w"
 Q
20 D LETTRE2,ITALIC,BOLD2,DOUBLE2 W *27,*91," 0 w"
 Q
21 D LETTRE,ITALIC2,BOLD,DOUBLE2 W *27,*91," 0 w"
 Q
22 D LETTRE2,ITALIC2,BOLD2,DOUBLE2 W *27,*91," 3 w"
 Q
23 D LETTRE2,ITALIC2,BOLD,DOUBLE2 W *27,*91," 3 w"
 Q
24 D LETTRE2,ITALIC,BOLD,DOUBLE2 W *27,*91," 3 w"
 Q
25 Q
26 D LETTRE2,ITALIC2,BOLD2,DOUBLE2 W *27,*91," 2 w"
 Q
27 D LETTRE2,ITALIC,BOLD2,DOUBLE2 W *27,*91," 2 w"
 Q
28 D LETTRE2,ITALIC2,BOLD,DOUBLE2 W *27,*91," 2 w"
 Q
29 D LETTRE2,ITALIC2,BOLD,DOUBLE W *27,*91," 8 w"
 Q
30 D LETTRE2,ITALIC2,BOLD,DOUBLE2 W *27,*91," 8 w"
 Q
31 D LETTRE2,ITALIC2,BOLD2,DOUBLE W *27,*91," 8 w"
 Q
32 D LETTRE2,ITALIC2,BOLD2,DOUBLE2 W *27,*91," 4 w"
 Q
33 D LETTRE2,ITALIC,BOLD2,DOUBLE2 W *27,*91," 4 w"
 Q
34 D LETTRE2,ITALIC2,BOLD,DOUBLE2 W *27,*91," 4 w"
 Q
35 D LETTRE2,ITALIC,BOLD,DOUBLE2 W *27,*91," 4 w"
 Q
 
ITALIC 
 W *27,*91," 9 5 h"
 Q
ITALIC2 
 W *27,*91," 9 5 l"
 Q
BOLD 
 W *27,*91," 9 3 h"
 Q
BOLD2 
 W *27,*91," 9 3 l"
 Q
LETTRE 
 W *27,*91," 2"_" """_" z"
 Q
LETTRE2 
 W *27,*91," 0"_" """_" z"
 Q
DOUBLE 
 W *27,*91," 9 1 h"
 Q
DOUBLE2 
 W *27,*91," 9 1 l"
 Q
CLEAR 
 U %PORT D LETTRE2,ITALIC2,BOLD2,DOUBLE2 W *27,*91," 0 w"
 
 Q
 
 
 
PLACER 
 
 N INTER1,INTER2
 S INTER1="^PAGE("_$J_","_%PAGE_","_%9Y_","_%9X_")"
 S INTER2="S %9X="_(%9X\1)_",%FONC="_"""MOUV.TEXTE"" D ^%PBPZ S %9T="_%9T_",%FONC="_"""TAILLE.TEXTE"" D ^%PBPZ S %9STR="_""""_%9STR_""""_",%FONC="_"""TEXTE"" D ^%PBPZ"
 S @INTER1=INTER2
 Q
GRAPH 
 
 I %9X1=%9X2 D VERT(%9Y1,%9Y2,%9X1)
 I %9Y1=%9Y2 D HORI(%9X1,%9X2,%9Y1)
 
 Q
VERT(%Y1,%Y2,%X1) 
 S %Y1=%Y1\1,%Y2=%Y2\1,%X1=%X1\1
 
 
 F %U=%Y1:1:%Y2-1 S INTER1="^PAGE("_$J_","_%PAGE_","_%U_","_%X1_")" D VERT2
 Q
VERT2 S INTER2="S %9X="_(%X1\1)_",%FONC="_"""MOUV.TEXTE"" D ^%PBPZ S %9T="_"""CLEAR"""_",%FONC="_"""TAILLE.TEXTE"" D ^%PBPZ S %9STR=""|"""_",%FONC="_"""TEXTE"" D ^%PBPZ"
 
 S @INTER1=INTER2
 Q
HORI(%X1,%X2,%Y1) 
 S %X1=%X1\1,%X2=%X2\1,%Y1=%Y1\1
 S %LG=(%X2-%X1)+1 I %LG<0 S %LG=%LG*-1
 S %LG=%LG*72E-1
 S INTER1="^PAGE("_$J_","_%PAGE_","_%Y1_","_%X1_")"
 S INTER2="S %9X="_%X1_",%FONC="_"""MOUV.TEXTE"" D ^%PBPZ S %9STR="""",%FONC=""TEXTE"" D ^%PBPZ S %9EPA="_(%9EPA*10)_",%LG="_$J(%LG,1,0)_",%FONC="_"""TRAIT.HORIZONTAL"" D ^%PBPZ"
 S @INTER1=INTER2
 Q
CADRE 
 N INTER1,INTER2
 
 D HORI(%9X1,(%9X1+%9X2)-1,%9Y1)
 
 D VERT(%9Y1+1,(%9Y1+%9Y2)-1,%9X1)
 
 D VERT(%9Y1+1,(%9Y1+%9Y2)-1,%9X2)
 
 D HORI(%9X1,(%9X1+%9X2)-1,(%9Y1+%9Y2)-1)
 Q

