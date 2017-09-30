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

;%QMCPAF^INT^1^59547,73876^0
QMCPAF ;
 
 
 
 
 
 
 
 
 
INDH(SAV,NSAV,LISTE,WHOIS1,QUI1,WHOIS2,QUI2) 
 N NO
 S NO=$ZP(@SAV@(NSAV,"INDH",""))+1
 S @SAV@(NSAV,"INDH",NO,"LISTE")=LISTE
 S @SAV@(NSAV,"INDH",NO,"WHOIS1")=WHOIS1
 S @SAV@(NSAV,"INDH",NO,"QUI1")=QUI1
 S @SAV@(NSAV,"INDH",NO,"WHOIS2")=WHOIS2
 S @SAV@(NSAV,"INDH",NO,"QUI2")=QUI2
 Q
 
 
 
 
TRT(SAV,NSAV,LTRT,WHOIS1,QUI1,WHOIS2,QUI2) 
 N NO,I,TRT1,TRT2
 S NO=$ZP(@SAV@(NSAV,"TRT",""))+1
 S @SAV@(NSAV,"TRT",NO,"WHOIS1")=WHOIS1
 S @SAV@(NSAV,"TRT",NO,"QUI1")=QUI1
 S @SAV@(NSAV,"TRT",NO,"WHOIS2")=WHOIS2
 S @SAV@(NSAV,"TRT",NO,"QUI2")=QUI2
 S TRT1=$O(@LTRT@(""))
 F I=0:0 Q:TRT1=""  D TRT1 S TRT1=$O(@LTRT@(TRT1))
 Q
TRT1 S TRT2=$S(($D(@LTRT@(TRT1))#10)=1:@LTRT@(TRT1),1:TRT1)
 I TRT2="" S TRT2=TRT1
 S @SAV@(NSAV,"TRT",NO,"LTRT",TRT1)=TRT2
 Q

