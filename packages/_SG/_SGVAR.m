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
;! HL002 ! HL     ! 24/10/17 ! %GTM-E-INVCMD, Invalid command keyword encountered!
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%SGVAR^INT^1^59749,17579^0
%SGVAR ;;08:36 AM  6 Oct 1993; 03 Feb 93  5:15 PM ; 06 Oct 93  8:41 AM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
INIT K ^GLOEXEC($J)
 S ^GLOEXEC($J,"CLAV")=0,^GLOEXEC($J,"CLAV",0)=1,^GLOEXEC($J,"CLAV","DEF")=1
 S ^GLOEXEC($J,"ECR")=0,^GLOEXEC($J,"ECR",0)=1,^GLOEXEC($J,"ECR","DEF")=1
 S ^GLOEXEC($J,"MAP")=0,^GLOEXEC($J,"MAP",0)=0,^GLOEXEC($J,"MAP","DEF")=0
 S ^GLOEXEC($J,"NIVEDL")=0,^GLOEXEC($J,"NIVEDL",0)=0,^GLOEXEC($J,"NIVEDL","DEF")=0
 S ^GLOEXEC($J,"NIVEDC")=0,^GLOEXEC($J,"NIVEDC",0)=0,^GLOEXEC($J,"NIVEDC","DEF")=0
 S ^GLOEXEC($J,"NIVGRA")=0,^GLOEXEC($J,"NIVGRA",0)=0,^GLOEXEC($J,"NIVGRA","DEF")=0
 S ^GLOEXEC($J,"MODPK")=0,^GLOEXEC($J,"MODPK",0)=0,^GLOEXEC($J,"MODPK","DEF")=0
 S ^GLOEXEC($J,"VISUOPT")=0,^GLOEXEC($J,"VISUOPT",0)=-1,^GLOEXEC($J,"VISUOPT","DEF")=0
 S ^GLOEXEC($J,"JRN")=0,^GLOEXEC($J,"JRN",0)="",^GLOEXEC($J,"JRN","DEF")=""
 S ^GLOEXEC($J,"CTRLATRT")=0,^GLOEXEC($J,"CTRLATRT",0)="$$ABAND^%TLIACT0",^GLOEXEC($J,"CTRLATRT","DEF")="$$ABAND^%TLIACT0"
 S ^GLOEXEC($J,"RESEAU")=0,^GLOEXEC($J,"RESEAU",0)="",^GLOEXEC($J,"RESEAU","DEF")=""
 S ^GLOEXEC($J,"ETAT")=0,^GLOEXEC($J,"ETAT",0)="",^GLOEXEC($J,"ETAT","DEF")=""
 S ^GLOEXEC($J,"COMCXT")=0,^GLOEXEC($J,"COMCXT",0)="",^GLOEXEC($J,"COMCXT","DEF")=""
 S ^GLOEXEC($J,"FOREGROUND")=0,^GLOEXEC($J,"FOREGROUND",0)="",^GLOEXEC($J,"FOREGROUND","DEF")=""
 S ^GLOEXEC($J,"BACKGROUND")=0,^GLOEXEC($J,"BACKGROUND",0)="",^GLOEXEC($J,"BACKGROUND","DEF")=""
 Q
 
KILL K ^GLOEXEC($J)
 Q
 
 
GET(VAR) N VAL
 ;HL002 S $ZT="GETERR",VAL=^GLOEXEC($J,VAR,^GLOEXEC($J,VAR))
 S $ZT="G GETERR",VAL=^GLOEXEC($J,VAR,^GLOEXEC($J,VAR))
 S $ZT="" Q VAL
GETERR S $ZT="",VAL=$S($D(^GLOEXEC($J,VAR,"DEF")):^GLOEXEC($J,VAR,"DEF"),1:"") Q VAL
 
 
SET(VAR,VAL) 
 N CP
 S (^GLOEXEC($J,VAR),CP)=^GLOEXEC($J,VAR)+1,^GLOEXEC($J,VAR,CP)=VAL
 Q
 
 
DEP(VAR) N CP S (^GLOEXEC($J,VAR),CP)=^GLOEXEC($J,VAR)-1 K ^GLOEXEC($J,VAR,CP+1) Q

