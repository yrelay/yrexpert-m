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

;%QMCPOR1^INT^1^59547,73876^0
QMCPOR1 ;
 
 
 
VERIF(WHOIS2,QUI2,COOR,ERR,ECRASE,MODE) 
 N I,J,BASE,IND
 S ECRASE=0
 S BASE=$O(@COOR@(""))
 F I=0:0 Q:BASE=""  D VERIF1 S BASE=$O(@COOR@(BASE))
 Q
VERIF1 I '(MODE) D SAUT^%VPRIN1(ERR,2)
 I '(MODE) D ADD^%VPRIN1(ERR,"***** "_$$NOMLOG^%QMCPZ(WHOIS2,QUI2,BASE)_" *****")
 I '(MODE) D SAUT^%VPRIN1(ERR,1)
 S IND=$O(@COOR@(BASE,""))
 F I=0:0 Q:IND=""  D VERIF2 S IND=$O(@COOR@(BASE,IND))
 Q
VERIF2 I '($$IR^%QMCPZ(WHOIS2,QUI2,BASE,IND)) Q
 S ECRASE=1
 I '(MODE) D ADD^%VPRIN1(ERR,$$NOMLOG^%QMCPZ(WHOIS2,QUI2,BASE)_" "_IND_" "_$$^%QZCHW("existe deja")) Q
 I MODE D SX^%QMCPZ(WHOIS2,QUI2,BASE,IND)
 Q
 
 
 
 
 
 
 
 
ECRTRT(WHOIS2,QUI2,TRTL,ERR,ECRASE,MODE) 
 N I,TRT
 S ECRASE=0
 I '(MODE) D SAUT^%VPRIN1(ERR,2)
 I '(MODE) D ADD^%VPRIN1(ERR,"***** "_$$^%QZCHW("TRAITEMENT")_" *****")
 I '(MODE) D SAUT^%VPRIN1(ERR,1)
 S TRT=$O(@TRTL@(""))
 F I=0:0 Q:TRT=""  D ECRTRT1 S TRT=$O(@TRTL@(TRT))
 Q
ECRTRT1 
 I '($$EXTRT^%QMCPZ(WHOIS2,QUI2,TRT)) Q
 I '(MODE) D ADD^%VPRIN1(ERR,TRT_" "_$$^%QZCHW("existe deja")) Q
 I MODE D KTRT^%QMCPZ(WHOIS2,QUI2,TRT)
 Q

