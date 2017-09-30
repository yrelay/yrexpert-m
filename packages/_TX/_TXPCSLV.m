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

;%TXPCSLV^INT^1^59547,74032^0
%TXPCSLV(duree) ;;12:21 PM  12 Jan 1993; ; 03 Sep 92 11:56 AM
 
 N Y,ATELAST,NATTEND,NBCYCM
 D INIVAR^%TXPETU
 S Y="2,2\RLWY\1\\\"
 S Y(1)=$E("    job  "_$J_"                                                        ",1,72)_"*"
 S Y(2)=$E("    en attente de probleme a resoudre                                   ",1,72)_"*"
 S NATTEND=0,NBCYCM=1000000
 
 
 D CLEPAG^%VVIDEO
 D ^%PKPOP
c1 
 
 S NATTEND=NATTEND+1 I NATTEND>NBCYCM Q
 I $$ISCTRLA^%SYSCLAV Q
 
 
 I '($D(^[QUI]etuslv("en cours"))) H duree G c1
 S ETUDE=^[QUI]etuslv("en cours")
 I ETUDE="" H duree G c1
 
 
 S PMAX=$S($D(@etu@("Nombre de Periodes")):@etu@("Nombre de Periodes"),1:"")
 
 
 L +^[QUI]SEMASOL(ETUDE):5 D lockexam E  G c1
 
 S ATELAST=""
 
 S ATELIER="" F z=0:0 S ATELIER=$O(^[QUI]etu(ETUDE,"AT",ATELIER)) Q:ATELIER=""  I $$libre(ETUDE,ATELIER) G travail
 
 L -^[QUI]SEMASOL(ETUDE)
 H duree
 G c1
 
travail 
 S ^[QUI]etuslv(ETUDE,ATELIER)="en cours chez "_$J
 L -^[QUI]SEMASOL(ETUDE)
 D CLEPAG^%VVIDEO
 D ATELIER^%TXPARB(ETUDE)
 D CLEPAG^%VVIDEO
 D ^%PKPOP
 S NATTEND=NATTEND-1
 G c1
 
 
libre(ETUDE,ATELIER) 
 
 I '($D(^[QUI]etuslv(ETUDE,ATELIER))) Q 1
 
 
 Q 0
lockexam 
 Q
 N i
 D ^%lockexam W !,!,!,!,!
 Q

