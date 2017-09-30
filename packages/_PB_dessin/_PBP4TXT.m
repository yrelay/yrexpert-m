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

;%PBP4TXT^INT^1^59547,73874^0
%PBP4TXT ;
 N %FONC
 N ORIENT,POLI
 D XY
 I $D(%ARBRE) S:$D(ENVL(%TERM,"X")) %9X=ENVL(%TERM,"X") S:$D(ENVL(%TERM,"Y")) %9Y=ENVL(%TERM,"Y")
MOUV S %FONC="MOUV" D ^%PBPZ
 
 S ORIENT=^V($J,"%","%ORIENTATION",1)
 S POLI=$S((ORIENT="HORIZONTALE")&(%9T<18):%9T+17,(ORIENT="VERTICALE")&(%9T>17):%9T-17,1:%9T)
 U %PORT W "FONT ",POLI,"; "
 
 G:$$^%QCAZG("VALPLA")="D" D
 G GUIL1
P U %PORT W "TEXT ",""""_%9STR_"""","; " G FIN
D U %PORT W "RTXT ",""""_%9STR_"""","; " G FIN
FIN Q
GUIL1 
 N LG S LG=$L(%9STR,"""")
 F %U=1:1:LG-1 U %PORT W "TEXT ",""""_$P(%9STR,"""",%U)_""""," E; " U %PORT W "TEXT '""', E; "
 U %PORT W "TEXT ",""""_$P(%9STR,"""",LG)_""""," E; "
 G FIN
 
REPOS 
 N %9X,%9Y,%FONC S (%9X,%9Y)=0,%FONC="MOUV" D ^%PBPZ U %PORT W ! Q
XY I $$^%QCAZG("%DESSIN")=1 N %FONC S %FONC="CONVERSION.X" D ^%PBPZ S %FONC="CONVERSION.Y" D ^%PBPZ
 Q

