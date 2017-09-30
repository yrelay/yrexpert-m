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

;%QWAC^INT^1^59547,73886^0
%QWAC ;
 
 
 
 
EXEC(DOMEX,SWITCHAF,ESPATT,ORIEN) 
 N CREMA,REP,IND,KTCONF,RF,IF,AF,OF,SF,VF,MNAPP
 N ISTP,CHTP,RETRY,IH,BADSTEP,CPTISTP,ADRT
 
 N TYPAC,REGAC,DOMAC
 N BIDON,REPIND,RESACT,SELEC,NORULE,ADRET
 D CLEPAG^%VVIDEO
 D SIGNAL^%QWAFFI,ETUDE^%QWAFFI,DOM^%QWAFFI,EXEC^%QWAFFI,MODE^%QWAFFI
 I SWITCHAF D FOND^%QWAFFI
 S NORULE=0
 S ISTP=0,IH=0 D AFFI^%QWAFFI(IH,3),AFFI^%QWAFFI(ISTP,5)
 S @WWSTEP@(0,"RETRY")=0
 S @WWSTEP@(0,"SOURCE")="0^0^0^0^0"
 S @WWSTEP@(0,"CYCLE")=0
 S (REP,IND)="?"
 
 
 
NEWSTP 
 
 S SELEC=$$CONCAT^%QZCHAD($$CONCAT^%QZCHAD(WWSTEP,ISTP),"""SEL""")
 D ^%QWSELEC(SELEC)
 
NEXREG 
 
 I $D(@WWSTEP@(ISTP,"SEL"))=10 G ACTI
 
 
 
 S NORULE=1
 D SATURE^%QWMCAC2("ADRT") G @ADRT
 
ACTI 
 
 S NORULE=0
 D ^%VZATOU(.T,.F,0,0) I T=1 D CTRLA^%QWMCAC3("ADRT") G @ADRT
 
 
S1M3R S REPIND=REP_"^"_IND I $D(@WWSTEP@(ISTP,"SEL",REPIND)) G S1SUIT
 S REPIND=$O(@WWSTEP@(ISTP,"SEL",""))
 S REP=$P(REPIND,"^",1),IND=$P(REPIND,"^",2)
S1SUIT S IL=$O(@WWSTEP@(ISTP,"SEL",REPIND,""))
 S CHTP=$O(@WWSTEP@(ISTP,"SEL",REPIND,IL,""))
 S TYPAC=$P(CHTP,"^",1),REGAC=$P(CHTP,"^",3),DOMAC=$P(CHTP,"^",2)
 S @WWSTEP@(ISTP,"CHOIX")=REPIND_"^"_CHTP
 K @WWSTEP@(ISTP,"SEL",REPIND,IL,CHTP)
 
 D:SWITCHAF AFFI^%QWAFFI("activation",6),AFFI^%QWAFFI(REGAC,8),AFFI^%QWAFFI(IND,10),AFFI^%QWAFFI(DOMAC,23)
 S ^[QUI]RQSDON("QW","REM",TYPAC,DOMAC,REGAC,"MALUS")=^[QUI]RQSDON("QW","REM",TYPAC,DOMAC,REGAC,"MALUS")+1
 S RESACT=$S(TYPAC=1:$$^%QWACR1(REP,IND,REGAC,DOMAC),TYPAC=2:$$ACTIV^%QWACR2(REGAC,REP,IND),TYPAC=3:$$^%QWACR3(REP,IND,REGAC,DOMAC),TYPAC=4:$$^%QWACR4(REP,IND,REGAC,DOMAC))
 I RESACT'=0 G REGOK
 
 D ECHEC^%QWMCAC3("ADRT") G @ADRT
REGOK 
 S ISTP=ISTP+1
 S @WWSTEP@(ISTP,"SOURCE")=@WWSTEP@(ISTP-1,"CHOIX")
 S @WWSTEP@(ISTP,"RETRY")=0
 
 D PRODUC^%QWMCAC1("ADRT")
 G @ADRT
 
FIN Q

