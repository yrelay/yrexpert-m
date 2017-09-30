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

;%QWMCACS^INT^1^59547,73886^0
%QWMCACS ;
 
 
 
 
 
SAVRETRY 
 D SVGDE^%QWSIT
RETRY 
 D RECUSE
 S @ADRET="NEXREG^%QWAC"
 Q
 
SAVSTOP 
 D SVGDE^%QWSIT
STOP 
 S @ADRET="FIN^%QWAC"
 Q
 
SAVCONT 
 D SVGDE^%QWSIT
CONT 
 S NETTOYE=0
 I '($$REAPPLI^%QWSELEC(TYPAC,REGAC,DOMAC)) S @RSAC@(REP,IND,TYPAC,DOMAC,REGAC)=""
 S @ADRET="NEWSTP^%QWAC"
 Q
 
DIALO 
 
 
 
 
 
 
 
ITRT I TYPDIA'="SATU" D ^%VQUIKMN(0,80,22,MNITC,.AD,.CTR)
 I TYPDIA="SATU" D ^%VQUIKMN(0,80,22,MNITP,.AD,.CTR)
 G:AD'="" @AD
 G:TYPDIA="SATU" IRETRY G IREPRI
 
ISPACE D SHOWGLO^%QWUT1(WWSTOCK)
 D CLEPAG^%VVIDEO,SIGNAL^%QWAFFI,ALL^%QWAFFI
 G ITRT
 
ISAUV D SVGDE^%QWSIT G ITRT
 
REGRET D DIA^%QWRG
 D CLEPAG^%VVIDEO,SIGNAL^%QWAFFI,ALL^%QWAFFI
 G ITRT
 
IABAND F CPTISTP=0:0 Q:ISTP=0  D RECUSE
 S @ADRET="FIN^%QWAC" Q
 
IREFUS S SF=$$FORCE^%QWREFUS G:SF>ISTP ITRT
 
 F CPTISTP=0:0 Q:ISTP=SF  D RECUSE
 D CLEPAG^%VVIDEO,ALL^%QWAFFI
 S @ADRET="NEXREG^%QWAC" Q
 
IREPRI I TYPDIA="PROD" S @ADRET="NEWSTP^%QWAC" Q
 I TYPDIA="CTRL" S @ADRET="S1M3R^%QWAC" Q
 
IRETRY D RECUSE
 S @ADRET="NEXREG^%QWAC" Q
 
BUTROUV 
 D COLR^%VZEAVT("But atteint",0,79,0),SVGDE^%QWSIT
 D CLEPAG^%VVIDEO
 D MAJREM^%QWSIT
 
 
 F CPTISTP=0:0 Q:ISTP=0  D RECUSE
 S @ADRET="FIN^%QWAC"
 Q
 
AFREFUS 
 D RECUSE
 S @ADRET="NEXREG^%QWAC" Q
 
 
 
RECUSE 
 N REPR,INDR,DOMR,TYRG,REGC,SOURCE,PAR,%P,IAFF
 S @WWSTEP@(ISTP-1,"RETRY")=1
 S SOURCE=@WWSTEP@(ISTP,"SOURCE")
 S %P=1 F PAR="REPR","INDR","TYRG","DOMR","REGC" S @(PAR_"=$P(SOURCE,""^"",%P)"),%P=%P+1
 K @WWSTEP@(ISTP)
 D:SWITCHAF AFFI^%QWAFFI("recusation",6),AFFI^%QWAFFI(REGC,8)
 I SWITCHAF F IAFF=10,12,14,16,18,20,23 D CLR^%QWAFFI(IAFF)
 S ISTP=ISTP-1
 K @RSAC@(REPR,INDR,TYRG,DOMR,REGC)
 D RECUSE^%QWSTOE
 Q

