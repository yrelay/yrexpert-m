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

;%PBIZLEX^INT^1^59547,73873^0
PTILEXIQ(LEX) 
 N I,R,S S S="+" S:"+-"[$E(LEX,1) S=$E(LEX,1),LEX=$E(LEX,2,$L(LEX))
 S PCH=LEX D TO^%QZNBN1 Q:ISNUM 1
 S PCH=LEX D ^%LXABR
 I CONCUR=0 D ERR(LEX_" est inconnu au lexique") G L0
 I CONCUR=1 D MES(LEX_" --> "_PCHCOMP) Q 1
 I CONCUR>1 D ERR(LEX_" est ambigu au lexique") Q 0
 D ERR(LEX_" est inconnu au lexique")
L0 D POCLEPA^%VVIDEO W "Persistez-vous (O/N) ? [O] : "
 D ECHOFF^%VVIDEO R *R:^TOZE($I,"ATTENTE") D ECHON^%VVIDEO S:R=-1 R=1
 F I=1,6,13,78,79 G:I=R @R
 D ^%VSQUEAK G L0
1 G 78
6 G 78
13 G 79
78 D POCLEPA^%VVIDEO Q 0
79 D POCLEPA^%VVIDEO Q 1
ERR(M) D POCLEPA^%VVIDEO,^%VSQUEAK W M," ... [RETURN]" R *R:^TOZE($I,"ATTENTE") D POCLEPA^%VVIDEO Q
MES(M) D POCLEPA^%VVIDEO W M," ... [RETURN]" R *R:^TOZE($I,"ATTENTE") D POCLEPA^%VVIDEO Q

