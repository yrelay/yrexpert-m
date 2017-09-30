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

;%QUBKKAF^INT^1^59547,73884^0
%QUBKKAF ;;09:58 AM  3 Mar 1992;
 
 
 
 
 
 N %II,%IJ,CO,%CO,VAL,IND,FE,LIS2,ORD
 S %II="" F %IJ=1:1 S %II=$O(@LIS@(%II)) Q:%II=""  D STOIND
 Q
STOIND S IND=@CORR@(%II)
 S CO="" F %CO=1:1 S CO=$O(@GLODEF@("C",CO)) Q:CO=""  S VAL=$P(@LIS@(%II),"^",CO) D STO($P(@GLODEF@("C",CO),"^",2),$P(@GLODEF@("C",CO),"^",3),VAL)
 Q:@CONDIT@("NBCOND")=0
 S LIS2=@TEMP@("FCOND",%II,"ADLIS")
 F FE=1:1:@CONDIT@("NBCOND") D:@TEMP@("VALCOND",%II,FE) STOFC
 
 Q
 
STOFC F CO=@CONDIT@("DEF","FEN",FE,"D"):1:@CONDIT@("DEF","FEN",FE,"F") S VAL=$P(@LIS2@(1),"^",CO) D STO($P(@GLODEF@("CC",CO),"^",3),$P(@GLODEF@("CC",CO),"^",4),VAL)
 Q
 
KILLFC F CO=@CONDIT@("DEF","FEN",FE,"D"):1:@CONDIT@("DEF","FEN",FE,"F") D PSO^%QSGESTI(REP,IND,$P(@GLODEF@("CC",CO),"^",3),$P(@GLODEF@("CC",CO),"^",4))
 Q
STO(ATT,ORD,VAL) 
 N NORD S NORD=$S(ORD'="":ORD,1:"")
 I VAL'="" D PA^%QSGESTI(REP,IND,ATT,VAL,NORD) Q
 D PSO^%QSGESTI(REP,IND,ATT,NORD)
 Q

