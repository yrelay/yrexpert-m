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

;TOTBSARG^INT^1^59547,74876^0
TOTBSARG ;
 
 
 
 K ^L($J)
 S A=-1 F %A=0:0 S A=$N(@TAB@(A)) Q:A=-1  D:A["$ARG" TARG
 S A=-1 F %A=0:0 S A=$N(^L($J,A)) Q:A=-1  D TA
 K A,AA,AAA,%A,%AA,%AAA,F,%F,FILS,^L($J),P,%P,PERE Q
TA D PERE,FILS S P=-1 F %P=0:0 S P=$N(PERE(P)) Q:P=-1  D TP
 K @TAB@(A) Q
TP S F=-1 F %F=0:0 S F=$N(FILS(F)) Q:F=-1  S @TAB@(P,F)=""
 K @TAB@(P,A) Q
PERE K PERE S AA=-1 F %AA=0:0 S AA=$N(@TAB@(AA)) Q:AA=-1  S:$D(@TAB@(AA,A)) PERE(AA)=""
 Q
FILS K FILS S F=-1 F %F=0:0 S F=$N(@TAB@(A,F)) Q:F=-1  S FILS(F)=""
 Q
TARG S ^L($J,A)="",AAA=-1 F %AAA=0:0 S AAA=$N(@TAB@(A,AAA)) Q:AAA=-1  S ^L($J,AAA)=""
 Q

