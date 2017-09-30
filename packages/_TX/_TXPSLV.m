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

;%TXPSLV^INT^1^59547,74033^0
%TXPSLV(duree) 
 
 D INIVAR^%TXPETU
 N ATELAST,NATTEND
 S NATTEND=0
 
 
c1 
 S NATTEND=NATTEND+1 I NATTEND>110 Q
 D POCLEPA^%VVIDEO W $J," solveur attend"
 H duree
 
 I '($D(^[QUI]etuslv("en cours"))) G c1
 
 
 S ETUDE=^[QUI]etuslv("en cours") G c1:ETUDE=""
 S PMAX=$S($D(@etu@("Nombre de Periodes")):@etu@("Nombre de Periodes"),1:"")
 S ^[QUI]etuslv(ETUDE,"slv")=$J
 D POCLEPA^%VVIDEO W $J," solveur s'inscrit"
c2 
 L +^[QUI]SEMASOL(ETUDE):5 D lockexam E  G c1
 D POCLEPA^%VVIDEO W $J," solveur possede le semaphore"
 S ATELAST=""
 
 S ATELIER="" F z=0:0 S ATELIER=$O(^[QUI]etu(ETUDE,"AT",ATELIER)) G:ATELIER="" c3 I $$libre(ETUDE,ATELIER) S ^[QUI]etuslv(ETUDE,ATELIER)="en cours chez "_$J L  D lockexam S DX=9,DY=9 X XY W ATELIER_"en cours chez "_$J S ATELAST=ATELIER D ATELIER^%TXPARB(ETUDE) Q
 
 I ATELAST="" Q
 G c2
c3 D POCLEPA^%VVIDEO W $J," solveur relache le semaphore"
 I ATELAST="" Q
 S ATELAST="" L -^[QUI]SEMASOL(ETUDE) G c1
 
libre(ETUDE,ATELIER) 
 
 I '($D(^[QUI]etuslv(ETUDE,ATELIER))) Q 1
 
 
 Q 0
lockexam 
 Q
 N i
 D ^%lockexam W !,!,!,!,!
 Q

