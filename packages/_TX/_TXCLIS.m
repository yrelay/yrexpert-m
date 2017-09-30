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

;%TXCLIS^INT^1^59547,74031^0
%TXCLIS(SER) 
 
 
 
 
 N MENU3,SCR,ABENDSCR
 S MENU3=$$CONCAS^%QZCHAD("^TEMPORAI",$J_","_$P($ZPOS,"^",2)_",MENU") K @(MENU3)
 S @MENU3@(1)=$$^%QZCHW("Recommencer")_"^CONT"
 S @MENU3@(1,"COM")=$$^%QZCHW("Recommencer la recherche")
 S @MENU3@(2)=$$^%QZCHW("Nouveau patient")_"^NOUV"
 S @MENU3@(3)=$$^%QZCHW("Selection du patient")_"^SEL"
 S SER=1,NAISP=NAIS
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Patients de nom")_" "_NAME,0)
 D ^IFDAFFP("^IFDAFFC","TRAIT^%TXCLIS",NAME)
 K @(MENU3)
 Q
 
TRAIT(PAGE,LIG) 
 
 
 
 
 
 N %I,ADR,CTR
 S DOS=$P(^POSENR($J,PAGE,LIG),"^",4)
 D ^%VZEATT,RAM^IFDGRIN(DOS),^%VAFIGRI,^%VAFISCR
 
ACT 
 S DX=0,DY=22 D CLEBAS^%VVIDEO,^%VQUIKMN(10,80,22,MENU3,.ADR,.CTR)
 I (CTR="A")!(CTR="F") S SER=2 G FIN
 G:ADR'="" @ADR G ACT
 
NOUV 
 S SER=3 Q 0
 
SEL 
 S PRE=$$^%QSCALVA("PATIENT",DOS,"PRENOM")
 S NAIS=$$^%QSCALVA("PATIENT",DOS,"DATE.NAISSANCE")
 D MAJ^%TXCONS G FIN
 
FIN D CLEPAG^%VVIDEO Q 0
 
CONT 
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Patients de nom")_NAME,0)
 Q 1

