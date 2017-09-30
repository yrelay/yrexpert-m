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

;%AV22C^INT^1^59547,73867^0
%AV22C ;;11:25 AM  18 Oct 1993;
 
 
 
 
 
POLONAIS(FCANON,POLO) 
 N TYPEOP,TAB,VALOP,INFO,p,i,ipol,INFOTEM,TYPEITEM,VALITEM
 
 
 S TAB=$$TEMP^%SGUTIL D INIPILE^%AMRANAR(TAB)
 D INIPILE^%AMRANAR(POLO)
 S TYPEOP="",VALOP="",INFO=""
 S p=@FCANON,i=1,ipol=0
LOOPOL G:i>p FINPOL S TYPEITEM=@FCANON@(i) G:TYPEITEM="" kick
 S VALITEM=@FCANON@(i,"VAL"),INFOTEM=@FCANON@(i,"INFO")
 I TYPEITEM["ATTRIBUT" G OPRNDE
 I TYPEITEM="INDIVIDU.SYMBOLIQUE" G OPRNDE
 I TYPEITEM="CODE.EXPRESSION.ANTERIEURE" G OPRNDE
 I TYPEITEM["CONSTANTE.CHAINE" G OPRNDE
 G:TYPEITEM["CONSTANTE.NUMERIQUE" OPRNDE
 G:TYPEITEM="FIN.CONDITION" FINCOND
 G LOOPOP
 
OPRNDE D PUSH^%AMRANAR(POLO,TYPEITEM,VALITEM,INFOTEM) G kick
 
 
 
FINCOND 
 F zzz=1:1 Q:$$PILEVIDE^%AMRANAR(TAB)  D PULL^%AMRANAR(TAB,.TYPEOP,.VALOP,.INFO),PUSH^%AMRANAR(POLO,TYPEOP,VALOP,INFO)
 D PUSH^%AMRANAR(POLO,TYPEITEM,VALITEM,INFOTEM) G kick
 
LOOPOP 
 
 
 
 
loop2 G:$$PILEVIDE^%AMRANAR(TAB) ecr
 D PULL^%AMRANAR(TAB,.TYPEOP,.VALOP,.INFO)
 
 
 I (INFOTEM+0)'<(INFO+0) D PUSH^%AMRANAR(POLO,TYPEOP,VALOP,INFO) G loop2
 
 I TYPEOP="VERBE" S ARGVU=$P(INFO,"/",5),$P(INFO,"/",5)=ARGVU-1 I ARGVU<1 D PUSH^%AMRANAR(POLO,TYPEOP,VALOP,INFO) G loop2
 D PUSH^%AMRANAR(TAB,TYPEOP,VALOP,INFO)
ecr D PUSH^%AMRANAR(TAB,TYPEITEM,VALITEM,INFOTEM) G kick
kick S i=i+1 G LOOPOL
FINPOL 
 F zzz=1:1 Q:$$PILEVIDE^%AMRANAR(TAB)  D PULL^%AMRANAR(TAB,.TYPEOP,.VALOP,.INFO),PUSH^%AMRANAR(POLO,TYPEOP,VALOP,INFO)
 
 
 K @(TAB)
 Q

