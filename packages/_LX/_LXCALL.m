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

;%LXCALL^INT^1^59547,73870^0
%LXCALL ;;10:20 AM  22 Apr 1991;
 
 
 
 
 
 
 
 
 
LEX(PCH,ROUTAFF,VISU,PCHCOMP) 
 N CONCUR,REP,TEMP,I,%I,TLEX,TEMPLEX
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GLOB") K @(TEMP)
 S TEMPLEX=$$CONCAS^%QZCHAD(TEMP,"LX")
 
LEXBCL S CONCUR=$$LEX^%LXSTOCK(PCH,.PCHCOMP)
 G:CONCUR=1 OKLEX
 G:'(VISU) ERRLEX
 I CONCUR>1 D ^%VZEAVT(PCH_$$^%QZCHW(" est ambigu au lexique")) G LEXI
 D ^%VZEAVT(PCH_$$^%QZCHW(" est inconnu au lexique"))
LEXI D POCLEPA^%VVIDEO W $$^%QZCHW(" (L)exique/(C)onsultation breve/[RETURN] ") R *REP:^TOZE($I,"ATTENTE") S:REP=-1 REP=13
 S REP=$C(REP) G:REP=$$^%QZCHW("C") BREV
 G:REP=$$^%QZCHW("L") AJLEX
 D POCLEPA^%VVIDEO
ERRLEX K @(TEMP)
 Q 0
 
OKLEX K @(TEMP)
 I VISU D POCLEPA^%VVIDEO W PCH_" --> "_PCHCOMP H 1 D POCLEPA^%VVIDEO
 Q 1
 
BREV 
 D CLEPAG^%VVIDEO,80^%VVIDEO
 D ^%LXCONS
 G RETLEX
 
AJLEX 
 F I="MOD","Y1","P1","LI","PL","P" I $D(@I) S @TEMPLEX@(I)=@I
 S TLEX(1)=PCH
 D CLEPAG^%VVIDEO,POINT^%VAJOUT("LEXIQUE","TLEX")
 S I="" F %I=0:0 S I=$O(@TEMPLEX@(I)) Q:I=""  S @I=@TEMPLEX@(I)
 
RETLEX 
 D:ROUTAFF'="" @ROUTAFF
 D POCLEPA^%VVIDEO
 G LEXBCL
 
 
TEST N MOT
TB W ! R MOT Q:MOT=""
 I $$LEX(MOT,"",1,.MOTEX) W !,!,!,MOT,"  -> ",MOTEX G TB
 W !,!,!,MOT," est  inconnu" G TB

