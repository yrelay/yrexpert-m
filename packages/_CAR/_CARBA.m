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
;! HL001 ! HL     ! 01/01/01 ! Erreur %GTM-E-INVCMD -> $ZT="G ..."            !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%CARBA^INT^1^59547,73867^0
%CARBA ;
 
 
 
 N ACTI,I,TABLE,HEURE,JOUR,TIME,GLOECH,GLOPAR,GLOBAT,GLOERR,GLOETA
 
 S GLOBAT="^CARGBA"
 S @GLOBAT@("JOBSCHED")=$J
 
 S $ZT="G ERR^%CARBA"
 S GLOECH="^CARGECH",GLOETA="^CARGETA"
 S GLOPAR=$$CONCAS^%QZCHAD(GLOBAT,"PARAM")
 
 
LOOP S HEURE=$P($H,",",2),JOUR=$P($H,",",1)
 S TIME=$$DATE3^%QMDATE_$$HEURE^%QMDATE
 S TIME=$P(TIME,"H")_$P(TIME,"H",2),TIMAX=TIME_".999"
 
 
 G:'($D(@GLOETA@("PLANIFIE"))) SUIT1
 S TACTI="" F I=1:1 S TACTI=$O(@GLOETA@("PLANIFIE",TACTI)) Q:TACTI=""  Q:TACTI>TIMAX  S @GLOETA@("ATTENTE",TACTI)="" K @GLOETA@("PLANIFIE",TACTI)
 
SUIT1 
 G:'($D(@GLOETA@("ATTENTE"))) SUIT2
 S TACTI="" F I=1:1 S TACTI=$O(@GLOETA@("ATTENTE",TACTI)) Q:TACTI=""  Q:TACTI>TIMAX  S ACTI=@GLOECH@("ECH",TACTI,"ACT") I $$OKFORK D FORK
 
SUIT2 H @GLOBAT@("SLEEP")
 G LOOP
 
 
 
OKFORK() 
 N SWI,ISWI
 Q:'($D(@GLOECH@("ACT",ACTI,"SWITCH"))) 1
 S SWI="" F ISWI=0:0 S SWI=$O(@GLOECH@("ACT",ACTI,"SWITCH",SWI)) Q:SWI=""  G:'($D(@GLOBAT@("SWITCH",SWI))) NOKFO G:@GLOBAT@("SWITCH",SWI)=0 NOKFO
 Q 1
NOKFO Q 0
 
 
 
 
 
FORK 
 N RESF
 S @GLOPAR@("NUMECH")=TACTI,@GLOPAR@("ACTI")=ACTI,@GLOPAR@("DATE")=TIME
 S RESF=$$FORK^%SYSCARU("^%CARJOB",0,"NL:","NL:",2)
 H 1
 Q
 
ERR 
 S $ZT=""
 S @GLOBAT@("CR")=$ZE_$$^%QZCHW(" LORS DE L'EXECUTION DU SCHEDULER")
 Q

