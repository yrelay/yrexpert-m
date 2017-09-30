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

;%QWRES^INT^1^59547,73886^0
%QWRES ;;11:20 AM  24 Sep 1991;
 
 
 
 
 N TEMP,CTR,NOMETUDE,LSV
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S LSV=$$CONCAS^%QZCHAD(TEMP,"LR")
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Etudes MENTAILLE"),0)
 D TIT
 S DX=10,DY=5 X XY D LIRE2^%VREAD($$^%QZCHW("Etude")_" : ","",9,RM-1,DY+1,DY-1,"TIT^%QWACTI","$$UC^%QWETUD2",.CTR,.NOMETUDE) I (CTR'="")!(NOMETUDE="") K @(TEMP) Q
 D TIT S DX=10,DY=5 X XY W $$^%QZCHW("Etude")_" : "_NOMETUDE
 D CONS(NOMETUDE)
 Q
 
 
 
CONS(NOMETUDE) 
 N ADR,IETUDE,TEMP,MNSITG
 N GLOSAVE,WWINIT
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"CR") K @(TEMP)
 S MNSITG=$$CONCAS^%QZCHAD(TEMP,"MN")
 D MENURES(MNSITG)
 S ADR="^[QUI]RQSGLO(""QW"",""ET"")"
 S IETUDE=@ADR@(NOMETUDE)
 S GLOSAVE=$$CONCAS^%QZCHAD("^[QUI]RQSDON(""QW"",""SVG"")",IETUDE)
 S WWINIT=$$CONCAT^%QZCHAD(ADR,""""_NOMETUDE_""",""I""")
 D DEBUT^%QWSIT
 K @(TEMP)
 Q
 
TIT 
 D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("Resultats d'une etude MENTAILLE"),0)
 Q
 
 
 
 
 
 
MENURES(MNSTIG) 
 S @MNSITG="21^10^79"
 S @MNSITG@(1)=$$^%QZCHW("Consultation")_"^CONS"
 S @MNSITG@(1,"COM")=$$^%QZCHW("Consultation d'un resultat")
 S @MNSITG@(2)=$$^%QZCHW("Suppression")_"^SUPP"
 S @MNSITG@(2,"COM")=$$^%QZCHW("Suppression d'un resultat")
 S @MNSITG@(3)=$$^%QZCHW("Etat.initial")_"^INIT"
 S @MNSITG@(3,"COM")=$$^%QZCHW("Consultation de l'etat initial")
 Q

