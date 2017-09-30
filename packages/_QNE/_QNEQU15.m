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

;%QNEQU15^INT^1^59547,73879^0
QNEQU15 ;
 
AFFOBJ3(LISTIND,LMN,INDCOUR) 
 N ADR,INCOMP,O,II,OK,INDAF
 S INCOMP=@VT@("INCOMP"),ADR=$$ADRLIS^%QSGEST7(LMN),@INCOMP@(LMN)=ADR
 S INDAF=$$AFIN^%QFGRACT(LISTIND,INDCOUR)
 S (OK,O)=""
 F II=0:1 S O=$O(@ADR@(O)) Q:O=""  S OK=$$TES(@VT@("INSEP"),@VT@("INSEPI"),@VT@("INC"),INDCOUR,O) S:OK="" OK=$$AFF(@VT@("GRO"),INDCOUR,O) Q:OK'=""
 Q OK
 
TES(INSEP,INSEPI,INC,IND,O) 
 N GLS,GLI,CARD,TEMP
 
 S CARD=$$TESEP(IND,O,INSEPI)
 I CARD=0 Q INDAF_" "_$$^%QZCHW("inseparable de")_" "_$$AFIN^%QFGRACT(LISTIND,O)
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S GLI=$$CONCAS^%QZCHAD(TEMP,"GLOBAL.INTER")
 S GLS=$$CONCAS^%QZCHAD(TEMP,"GLOBAL")
 
 I '($D(@INSEPI@(IND))) G TES2
 D PARC(IND,GLS,GLI,.CARD) I CARD=0 G TES2
 G FTES
 
TES2 
 I '($D(@INSEPI@(O))) S CARD=0 G FTES
 
 D PARC(O,GLS,GLI,.CARD)
 
 G FTES
FTES K @(TEMP)
 Q $S(CARD=0:"",1:$$^%QZCHW("Vous ne pouvez pas inserer cet individu"))
 
PARC(IND,GLS,GLI,CARD) 
 
 
 
 
 
 N %I,%J,K,ADS,ADI,I,J,INCO
 K @(GLS),@(GLI)
 S ADS=$$ADR(IND),I=""
 
 F %I=0:0 S I=$O(@ADS@(I)) Q:I=""  S INCO="" F %J=0:0 S INCO=$O(@INC@(IND,INCO)) Q:INCO=""  D SEPLS(INCO)
 
 D INTER^%QCALIST(ADS,GLS,GLI,.CARD)
 
 Q
SEPLS(IND) 
 Q:'($D(@INSEPI@(IND)))
 S ADI=$$ADR(IND),J=""
 F K=0:0 S J=$O(@ADI@(J)) Q:J=""  S @GLS@(J)=""
 Q
 
ADR(IND) 
 S IND=@INSEP@(@INSEPI@(IND)) Q IND
 
TESEP(IND,O,INSEPI) 
 
 
 Q:'($D(@INSEPI@(IND))) 1
 Q:'($D(@INSEPI@(O))) 1
 
 I @INSEPI@(IND)=@INSEPI@(O) Q 0
 Q 1
 
 
 
AFF(GROAFF,INDCOUR,O) 
 N ADR1,ADR2,TEMP,INTER,CARD,INTER1
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"AFF")
 S INTER=$$CONCAS^%QZCHAD(TEMP,"AFF")
 K @(TEMP)
 I '($D(@GROAFF@(INDCOUR))) Q ""
 I '($D(@GROAFF@(O))) Q ""
 S ADR1=$$CONCAT^%QZCHAD(GROAFF,$$S1^%QZCHAD(INDCOUR))
 S ADR2=$$CONCAT^%QZCHAD(GROAFF,$$S1^%QZCHAD(O))
 D INTER^%QCALIST(ADR1,ADR2,INTER,.CARD)
 I CARD=0 K @(TEMP) Q ""
 S INTER1=$O(@INTER@(""))
 K @(TEMP)
 D ^%VZEAVT($$AFIN^%QFGRACT(LISTIND,O)_" "_$$^%QZCHW("et")_" "_INDAF_" "_$$^%QZCHW("sont affectes dans le meme groupe")_" "_$$AFGR^%QFGRACT(INTER1))
 Q:$$MES^%VZEOUI($$^%QZCHW("Confirmez vous cette nouvelle incompatibilite"),"N") ""
 Q $$^%QZCHW("affectation de")_" "_INDAF_" "_$$^%QZCHW("refusee")

