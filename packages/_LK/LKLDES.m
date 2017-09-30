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

;LKLDES^INT^1^59547,74867^0
LKLDES(APP,TXNODE,NODE,MODE) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N ER,X,SEL,LNODE,I,J,K,SDE,H,NODECOUR,REP,TEMP
 S TEMP=$$CONCAS^LKZ("^TEMPORAI($J)",$P($ZPOS,"^",2))
 S SEL=$$CONCAS^LKZ(TEMP,"SEL")
 S LNODE=$$CONCAS^LKZ(TEMP,"LNODE")
 K @(TEMP)
 D ^LKTXTN(TXNODE,LNODE)
 I MODE'=1 D T0
 I MODE=1 D S0
 K @(TEMP)
 Q
 
S0 S NODE=$O(@LNODE@(""))
 F K=1:0 Q:NODE=""  D T0 S NODE=$O(@LNODE@(NODE))
 Q
 
T0 K @(SEL)
 D ^LKLSEL(APP,NODE,SEL)
 D POCLEPA^%VVIDEO S REP=$$CONFIRM^%VZEOUI($$^%QZCHW("Ok pour la destruction ?"))
 D:REP T
 Q
T S SDE=$O(@SEL@(""))
 F I=1:0 Q:SDE=""  D T1 S SDE=$O(@SEL@(SDE))
 Q
T1 S H=@SEL@(SDE)
T3 S NODECOUR=$O(@LNODE@(""))
 F J=1:0 Q:NODECOUR=""  D T2 S NODECOUR=$O(@LNODE@(NODECOUR))
 Q
T2 K ^[QUI]LK(APP,NODECOUR,H)
 Q
 
INT(APP,TXNODE,H) 
 N ER,X,LNODE,I,J,K,SDE,NODECOUR,REP,TEMP
 S TEMP=$$CONCAS^LKZ("^TEMPORAI($J)",$P($ZPOS,"^",2))
 S LNODE=$$CONCAS^LKZ(TEMP,"LNODE")
 K @(TEMP)
 D ^LKTXTN(TXNODE,LNODE)
 D T3
 K @(TEMP)
 Q
 
TEST D ^LKLDES("NSC","LNODE^LKTXNSC1","A1","")
 Q
TEST2 D ^LKLDES("NSC","LNODE^LKTXNSC1","A1",1)
 Q
TEST3 D ^LKLDES("AVEX","LNODE^LKTXNSC1","A1",1)
 Q

