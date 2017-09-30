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

;%QMCPZ1^INT^1^59547,73877^0
QMCPZ1 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
MORESTR(WHOIS,QUI,STRUCT) 
 N TEMP,VAL,I,ATT
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"MORESTR")
 S VAL=$$CONCAS^%QZCHAD(TEMP,"VAL")
 K @(TEMP)
 D ATTLIEN^%QSGESPE(VAL)
 S ATT=$O(@VAL@(""))
 F I=0:0 Q:ATT=""  D MORE(STRUCT,VAL,ATT) S ATT=$O(@VAL@(ATT))
 K @(TEMP)
 Q
MORE(STRUCT,VAL,ATT) 
 N I,BASE1
 S BASE1=$O(@VAL@(ATT,""))
 F I=0:0 Q:BASE1=""  D MORE1(STRUCT,BASE1) S BASE1=$O(@VAL@(ATT,BASE1))
 Q
MORE1(STRUCT,BASE1) 
 N I,BASE2
 S BASE2=$O(@VAL@(ATT,BASE1,""))
 F I=0:0 Q:BASE2=""  D MORE2(STRUCT,BASE1,BASE2) S BASE2=$O(@VAL@(ATT,BASE1,BASE2))
 Q
MORE2(STRUCT,BASE1,BASE2) 
 
 I $$NOMLOG^%QSF(BASE2)="" Q
 I BASE1'="*",$$NOMLOG^%QSF(BASE1)="" Q
 S @STRUCT@("SPECIAL",BASE1,"ATTLIEN")=BASE2
 I $D(@STRUCT@("S",BASE2)) Q
 S @STRUCT@("S",BASE2,"BDI")=BASE2
 Q

