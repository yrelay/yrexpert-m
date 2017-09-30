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
;! Nomprog     : %SGPXOU1                                                     !
;! Module      : SG (Schema de données)                                       !
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

;%SGPXOU1^INT^1^59547,73891^0
%SGPXOU1 ;; ; 16 Jul 92 11:22 AM
 
 
 
SCHEMA(SCHEM)
 N VAL,KEY,KEY2,%KEY,%KEY2
 D WRITE^%SYSUTI1(IOFI,"SCHEMA DE DONNEES")
 D WRITE^%SYSUTI1(IOFI,SCHEM)
 S KEY="" F %KEY=0:0 S KEY=$O(^RQSMDL1(SCHEM,KEY)) Q:KEY=""  D WRITE^%SYSUTI1(IOFI,KEY),WRITE^%SYSUTI1(IOFI,^RQSMDL1(SCHEM,KEY))
 D WRITE^%SYSUTI1(IOFI,"")
 S KEY="" F %KEY=0:0 S KEY=$O(^RQSMDL2(SCHEM,KEY)) Q:KEY=""  S KEY2="" F %KEY2=0:0 S KEY2=$O(^RQSMDL2(SCHEM,KEY,KEY2)) Q:KEY2=""  D WRITE^%SYSUTI1(IOFI,KEY),WRITE^%SYSUTI1(IOFI,KEY2),WRITE^%SYSUTI1(IOFI,^RQSMDL2(SCHEM,KEY,KEY2))
 D WRITE^%SYSUTI1(IOFI,"")
 S KEY="" F %KEY=0:0 S KEY=$O(^RQSMDL3(SCHEM,KEY)) Q:KEY=""  S KEY2="" F %KEY2=0:0 S KEY2=$O(^RQSMDL3(SCHEM,KEY,KEY2)) Q:KEY2=""  D WRITE^%SYSUTI1(IOFI,KEY),WRITE^%SYSUTI1(IOFI,KEY2),WRITE^%SYSUTI1(IOFI,^RQSMDL3(SCHEM,KEY,KEY2))
 D WRITE^%SYSUTI1(IOFI,"")
 S KEY="" F %KEY=0:0 S KEY=$O(^RQSMDL4(SCHEM,KEY)) Q:KEY=""  S KEY2="" F %KEY2=0:0 S KEY2=$O(^RQSMDL4(SCHEM,KEY,KEY2)) Q:KEY2=""  D WRITE^%SYSUTI1(IOFI,KEY),WRITE^%SYSUTI1(IOFI,KEY2),WRITE^%SYSUTI1(IOFI,^RQSMDL4(SCHEM,KEY,KEY2))
 D WRITE^%SYSUTI1(IOFI,"")
 S KEY="" F %KEY=0:0 S KEY=$O(^RQSMDL5(SCHEM,KEY)) Q:KEY=""  D WRITE^%SYSUTI1(IOFI,KEY),WRITE^%SYSUTI1(IOFI,^RQSMDL5(SCHEM,KEY))
 D WRITE^%SYSUTI1(IOFI,"")
 S VAL=$S($D(^RQSMOD2(SCHEM)):^RQSMOD2(SCHEM),1:"")
 D WRITE^%SYSUTI1(IOFI,VAL)
 S KEY="" F %KEY=0:0 S KEY=$O(^RQSMOD3(SCHEM,KEY)) Q:KEY=""  D WRITE^%SYSUTI1(IOFI,KEY)
 D WRITE^%SYSUTI1(IOFI,"")
 S KEY="" F %KEY=0:0 S KEY=$O(^RQSMOD5(SCHEM,KEY)) Q:KEY=""  D WRITE^%SYSUTI1(IOFI,KEY),WRITE^%SYSUTI1(IOFI,^RQSMOD5(SCHEM,KEY))
 D WRITE^%SYSUTI1(IOFI,"")
 S KEY="" F %KEY=0:0 S KEY=$O(^RQSMOD8(SCHEM,KEY)) Q:KEY=""  S KEY2="" F %KEY2=0:0 S KEY2=$O(^RQSMOD8(SCHEM,KEY,KEY2)) Q:KEY2=""  D WRITE^%SYSUTI1(IOFI,KEY),WRITE^%SYSUTI1(IOFI,KEY2),WRITE^%SYSUTI1(IOFI,^RQSMOD8(SCHEM,KEY,KEY2))
 D WRITE^%SYSUTI1(IOFI,"")
 Q

