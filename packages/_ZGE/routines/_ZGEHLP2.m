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

;%ZGEHLP2^INT^1^59547,74037^0
%ZGEHLP2 ;;09:46 PM  12 May 1992; ; 15 May 92 11:16 AM
PC W @(FF)
 F J="HPC1","HPC2","HPC3" D PC2 W !,"Hit any key to continue!" R *ED
 D STAT^%ZGEWORD S EDLL=EDSL,%=3
 Q
PC2 F I=0:1 Q:$E($T(@J+I))="Q"  W $P($T(@J+I),";;",2,999),!
 Q
HPC1 ;;C-Q^repeat
 ;;C-T^time
 ;;C-V^overstrike mode on/off
 ;;C-W^refresh screen
 ;;C-Z^command mode
 ;;F1 GOLD functions 
 ;;F2 help
 ;;F3 find next
 ;;F4 delete line
 ;;F6 command mode
 ;;F9 prendre un groupe de lignes
Q ;; 
HPC2 ;; GOLD FUNCTIONS (F1 + )
 ;;B bottom
 ;;T top
 ;;I insert lines
 ;;M mark beginning of paste buffer
 ;;L beg of line
 ;;C removed marked region
 ;;A reset
 ;;O open line at cursor position
 ;;P insert paste buffer at cursor
 ;;R replace
 ;;S section
 ;;F3 find string
 ;;F4 undelete line
 ;;F7 find and change string
 ;;7 character right
 ;;8 word move
 ;;9 end of line
 ;;4 delete character
 ;;5 delete word
 ;;6 delete line
 ;;1 undelete character
 ;;2 undelete word
 ;;3 undelete line
Q ;;
HPC3 ;; Commands mode (CTRL-Z)
 ;;E save file and exit
 ;;H help
 ;;Q exit without saving file
 ;;R read new file
 ;;W write file to selected new file
Q ;;

