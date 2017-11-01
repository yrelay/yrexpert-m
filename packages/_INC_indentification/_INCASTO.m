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

;%INCASTO^INT^1^59752,40943^0
INCASTO ;; ; 13 Sep 90  6:10 PM
 
 
PCONF(PARAM) 
 I PARAM="" Q ""
 I '($D(^INCONNE("INCA3",PARAM))) Q ""
 Q ^INCONNE("INCA3",PARAM)
 
 
 
 
 
 
 
 
 
STO(RESUL) 
 N ADR
 S ADR="^INCONNE(""INCA3"")"
 K @(ADR)
 S @ADR@("CONF")=RESUL(2)
 S @ADR@("NOMHOST")=RESUL(3)
 S @ADR@("PSYS")=RESUL(4)
 S @ADR@("PROG")=RESUL(5)
 S @ADR@("TYPHOST")=RESUL(6)
 S @ADR@("TYPECR")=RESUL(7)
 Q
STO1(CONF,CH) 
 N I,RESUL
 S RESUL(2)=CONF
 F I=3:1:7 S RESUL(I)=$P(CH,"^",I-2)
 D STO(.RESUL)
 Q
STO2 
 I RESUL(2)="" D STAND Q
 I '($D(^INCONNE("INCA1",RESUL(2)))) Q
 D STO(^INCONNE("INCA1",RESUL(2)))
 Q
 
STOCONF(CONF) 
 I CONF="" D STAND Q
 I '($D(^INCONNE("INCA1",CONF))) Q
 D STO1(CONF,^INCONNE("INCA1",CONF))
 Q
 
EXCONF(CONF) 
 I CONF="" Q 1
 Q $D(^INCONNE("INCA1",CONF))'=0
 
 
STAND 
 N ADR
 S ADR="^INCONNE(""INCA3"")"
 S @ADR@("CONF")=""
 G:DTM STANDDTM
 S @ADR@("NOMHOST")="UC1"
 S @ADR@("PSYS")="SYS$M"
 S @ADR@("PROG")="DUB1:[TOT]"
 S @ADR@("TYPHOST")="VAX"
 S @ADR@("TYPECR")="VT200"
 Q
 
STANDDTM 
 S @ADR@("NOMHOST")="YREXPERT"
 S @ADR@("PSYS")="YXP"
 S @ADR@("PROG")="YXP"
 S @ADR@("TYPHOST")="C-IBM PC"
 S @ADR@("TYPECR")="C-DTM"
 Q
 
 ;HL --------------------- 
 S @ADR@("NOMHOST")="PC"
 S @ADR@("PSYS")="SYS"
 S @ADR@("PROG")="MOZ"
 S @ADR@("TYPHOST")="C-IBM PC"
 S @ADR@("TYPECR")="C-DTM"
 Q
 
CCONF 
 S (REFUSE,STOPUC)=0
 I RESUL(ICC)="" D ^%VZEAVT($$^%QZCHW("vous selectionnez la configuration par defaut")) Q
 I $D(^INCONNE("INCA1",RESUL(ICC))) Q
 D ^%VZEAVT($$^%QZCHW("cette configuration n'existe pas"))
 S (REFUSE,STOPUC)=1
 Q
CCONF1 I RESUL(ICC)="?" D AFF^%VYREP("^INCONNE(""INCA1"")") Q
 Q
 
 
 
 
 
 
 
 
 
DEF(CONF,NOMHOST,PSYS,PROG,TYPHOST,TYPECR) 
 S ADR="^INCONNE(""INCA1"")"
 I CONF="" Q
 S @ADR@(CONF)=NOMHOST_"^"_PSYS_"^"_PROG_"^"_TYPHOST_"^"_TYPECR
 D STO1(CONF,@ADR@(CONF))
 Q
 
MVX() Q $$PCONF("TYPHOST")="VAX"
DTM() Q $$PCONF("TYPHOST")="C-IBM PC"
M11() Q $$PCONF("TYPHOST")="PDP"
MVM() Q $$PCONF("TYPHOST")="IBM"

