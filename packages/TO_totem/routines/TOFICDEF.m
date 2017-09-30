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

;TOFICDEF^INT^1^59547,74872^0
TOFICDEF ;
 N %IETU
 F %IETU="CONS","PHAS","MATIERE","SELMAT","SELMAC","DIM","NOME" G:%IETU=ETUD @%IETU
 Q
 
CONS S BES("PHASE",WB2)=1,BES("OPERATION",WB3)=1,BES($$^%QZCHW("MACHINE"),WB4)=1 G FIN
PHAS S DEF("PHASE",WB2)=1,DEF("OPERATION",WB4)=1,DD=$$^%QZCHW("MACHINE") F %U=17:1:24 S IT=$P(CONTAB,"^",%U) D:IT'="" T0
 G FIN
T0 F OP="%","*","+",$$^%QZCHW("-"),"/","\","#","_","(",")" G:IT[OP END
 I '($D(^[QUI]FULL(ARTI,IT))) S DEF(DD,IT)=1
END Q
MATIERE S DD=$$^%QZCHW("MATIERE") F %U=17:1:22 S IT=$P(CONTAB,"^",%U) D:IT'="" T0
 G FIN
SELMAT S DEF("SELMAT",WB3)=1,BES($$^%QZCHW("MATIERE"),WB2)=1 Q
SELMAC S DEF("MACSEL",WB3)=1,BES($$^%QZCHW("MACHINE"),WB1)=1 Q
DIM S DEF(%DOM,WB5)=1,BES("PHASE",WB2)=1,BES("OPERATION",WB3)=1,BES($$^%QZCHW("MACHINE"),WB4)=1 G FIN
NOME S DEF(%DOM,WB2)=1 G FIN
FIN K OP,IT,DD Q

