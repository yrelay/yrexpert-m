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

;LKMMTX0^INT^1^59547,74867^0
LKMMTX0 ;
 
 
BQS(M) N ER,X,SEL,TEMP,APP,H,MSG,DATA,EXTERNE,CTR,FIC,BASE
 S TEMP=$$CONCAT^LKZ("^TEMPORAI",$J_","""_$P($ZPOS,"^",2)_"""")
 S SEL=$$CONCAS^LKZ(TEMP,"SEL")
 S DATA=$$CONCAS^LKZ(TEMP,"DATA")
 S EXTERNE=$$CONCAS^LKZ(TEMP,"EXTERNE")
 K @(TEMP)
 S MSG=""
 S APP=$$APP,H=$H
 D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("lecture du fichier"),0)
 
BQS2 D LIRE1^%VREAD($$^%QZCHW("Fichier")_" : ","",0,23,.CTR,.FIC)
 I (CTR="A")!(FIC="") K @(TEMP) Q
 
 I MSG'="" D ^%VZEAVT(MSG) G BQS2
 
BQS1 D LIRE1^%VREAD($$^%QZCHW("Repertoire")_" : ","",0,23,.CTR,.REP)
 I REP="?" S REP=$$REP^%QSGES14
 I (CTR="A")!(REP="") K @(TEMP) Q
 I $$NOMINT^%QSF(REP)="" D ^%VZEAVT(REP_" "_$$^%QZCHW("n'est pas un nom de repertoire")) G BQS1
 
 S BASE=$$NOMINT^%QSF(REP)
 
 S MSG=$$^LKYINIT(DATA,BASE)
 I MSG'="" D ^%VZEAVT(MSG) K @(TEMP) Q
 
 S MSG=$$INT^LKMMCV("^[QUI]LKY",REP,EXTERNE)
 I MSG'="" D ^%VZEAVT(MSG) K @(TEMP) Q
 D ^LKFIC(APP,"A1",H,FIC)
 D ^%VZCDB($$^%QZCHW("extraction du fichier"),0)
 S ER=$$LKLO1^LKLO(APP,"A1",H,APP,"A2",H,"LOST","MM1^LKMMTX1","","",1,EXTERNE)
 S @EXTERNE@("BASE")=BASE
 D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("stockage dans DKBMS"),0)
 S ER=$$LKRQS1^LKRQS(APP,"A2",H,H,"RQST1","MM2^LKMMTX1","","",EXTERNE)
 D:M="S" INT^LKLDES(APP,"LNODE^LKMMTX1",H)
 K @(TEMP)
 Q
APP() Q "GENERAL.1"
 
TESTFIC(FIC) 
 N MSG
 S MSG=""
 S MSG=$$TESTF1
 S MSG=$$TESTF2
 Q MSG
TESTF1() 
 N X
 S $ZE=""
 S $ZT="$$TESTF"
 O FIC U FIC R X
 C FIC
 Q ""
TESTF2() 
 S $ZT="$$TESTF"
 C FIC
 Q ""
TESTF() 
 N MSG1
 S MSG1=$ZE,$ZT="" W !,"GFDGFHD"
 I (MSG1'["NOTOPEN")&(MSG1'["ENDOF") Q ""
 S MSG=$$^%QZCHW("fichier inexistant ou vide")
 Q MSG

