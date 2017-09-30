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

;TOSITUCP^INT^1^59547,74875^0
TOSITUCP ;
 K ^COMPND($J),^COMPTW($J),SIT S SIT("TB1")="^PHASADM($I,NUFA,""COMP"",""OK"")",SIT("TB2")="^PHASADM($I,NUFA,""COMP"",""NOK"")",SIT("TB")="^PHASADM($I,NUFA,""COMPOS"")",SIT("TB3")="^PHASADM($I,NUFA,""COMP"",""ART"")",SIT("CP")=-1
 F SIT("%U")=1:1 S SIT("CP")=$N(@SIT("TB")@(SIT("CP"))) Q:SIT("CP")=-1  I ('($D(@SIT("TB1")@(SIT("CP")))))&('($D(@SIT("TB2")@(SIT("CP"))))) S ^COMPND($J,SIT("CP"))=1
 G:'($D(^COMPND($J))) FIN S SIT("EVOL")=0
INCP S SIT("CP")=-1
LCP S SIT("CP")=$N(^COMPND($J,SIT("CP"))) G:SIT("CP")=-1 FLCP S SIT("DEFCP")=-1
DEFCP S SIT("DEFCP")=$N(^PHASADM($I,NUFA,"DEFCOMP",SIT("CP"),SIT("DEFCP"))) G TSDCP:SIT("DEFCP")=-1,LCP:$D(^COMPND($J,SIT("DEFCP"))) S SIT("TWREF")=-1
LTWREF S SIT("TWREF")=$N(@SIT("TB3")@(SIT("DEFCP"),SIT("TWREF"))) G:SIT("TWREF")=-1 DEFCP S ^COMPTW($J,SIT("CP"),SIT("TWREF"))=SIT("DEFCP") G LTWREF
TSDCP S SIT("EVOL")=1 K ^COMPND($J,SIT("CP")) S SIT("TWREF")=-1
LTW S SIT("TWREF")=$N(^COMPTW($J,SIT("CP"),SIT("TWREF"))) G:SIT("TWREF")=-1 FLTW S SIT("DEFCP")=^COMPTW($J,SIT("CP"),SIT("TWREF")),SIT("FICH")=-1
LFIC S SIT("FICH")=$N(^[QUI]SENSFICH(SIT("DEFCP"),1,"NOMENC",SIT("CP"),SIT("FICH"))) G:SIT("FICH")=-1 LTW G:'($D(^PHASADM($I,NUFA,SIT("TWREF"),"ANCOMP",SIT("CP"),SIT("FICH")))) LCP G LFIC
FLTW S ^PHASADM($I,NUFA,"COMP","NOK",SIT("CP"))=1 G LCP
FLCP G:'(SIT("EVOL")) FIN S SIT("EVOL")=0 G INCP
FIN K SIT Q

