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

;%QNEQUI9^INT^1^59547,73879^0
QNEQUI9 ;
 
 
 
 
 
 
 
AJINCOMP(INDCOUR,INSEPI,INCOMP,INCOMPG,INCOMPL,LMN) 
 N A,I,LISTE
 I $D(@INSEPI@(INDCOUR)) G AJINCOM1
 
 S A=$O(@INCOMP@(INDCOUR,""))
 F I=0:0 Q:A=""  S @INCOMPL@(LMN,A,"O",INDCOUR)="",A=$O(@INCOMP@(INDCOUR,A))
 Q
AJINCOM1 
 S LISTE=@INSEPI@(INDCOUR)
 S A=$O(@INCOMPG@(LISTE,""))
 F I=0:0 Q:A=""  S @INCOMPL@(LMN,A,"L",LISTE)="",A=$O(@INCOMPG@(LISTE,A))
 Q
 
SUINCOMP(INDCOUR,INSEPI,INCOMP,INCOMPG,INCOMPL,LMN) 
 N A,I,LISTE
 I $D(@INSEPI@(INDCOUR)) G SUINCOM1
 
 S A=$O(@INCOMP@(INDCOUR,""))
 F I=0:0 Q:A=""  K @INCOMPL@(LMN,A,"O",INDCOUR) S A=$O(@INCOMP@(INDCOUR,A))
 Q
SUINCOM1 
 S LISTE=@INSEPI@(INDCOUR)
 S A=$O(@INCOMPG@(LISTE,""))
 F I=0:0 Q:A=""  K @INCOMPL@(LMN,A,"L",LISTE) S A=$O(@INCOMPG@(LISTE,A))
 Q
 
 
 
 
 
 
 
PLUSINC(LLISTEN,INSEPI,INCOMP,INCOMPG,INCOMPL,MSG) 
 N ADR,I,LMN
 S MSG=""
 S ADR=$$ADRLIS^%QSGEST7(LLISTEN)
 I (ADR=0)!(ADR="") S MSG=$$^%QZCHW("impossible de retrouver les individus de")_" "_LLISTEN Q
 S LMN=$O(@ADR@(""))
 F I=0:0 Q:LMN=""  Q:MSG'=""  D PLUSINC1(INSEPI,INCOMP,INCOMPG,INCOMPL,LMN,.MSG) S LMN=$O(@ADR@(LMN))
 Q
PLUSINC1(INSEPI,INCOMP,INCOMPG,INCOMPL,LMN,MSG) 
 N I,INDCOUR,ADR1
 S MSG=""
 S ADR1=$$ADRLIS^%QSGEST7(LMN)
 I (ADR1=0)!(ADR1="") S MSG=$$^%QZCHW("impossible de retrouver les individus de")_" "_LMN Q
 S INDCOUR=$O(@ADR1@(""))
 F I=0:0 Q:INDCOUR=""  D AJINCOMP(INDCOUR,INSEPI,INCOMP,INCOMPG,INCOMPL,LMN) S INDCOUR=$O(@ADR1@(INDCOUR))
 Q
 
 
 
CINSIND(INFO,TEMPS,INDCOUR,INSEPI,INSEP) 
 N ADRI,I,A,%Z
 S CINSIND=0
 F %Z=2:1:NCOADDI S CINSIND(%Z)=0
 I $D(@INSEPI@(INDCOUR)) G CINSIND1
 
 F %Z=2:1:NCOADDI S CINSIND(%Z)=$$VAL^%QNEQUI(INFO,INDCOUR,TEMPS(%Z))
 Q $$VAL^%QNEQUI(INFO,INDCOUR,TEMPS)
CINSIND1 
 S ADRI=@INSEP@(@INSEPI@(INDCOUR))
 S A=$O(@ADRI@(""))
 F I=0:0 Q:A=""  S CINSIND=CINSIND+$$VAL^%QNEQUI(INFO,A,TEMPS) D LOOPAD S A=$O(@ADRI@(A))
 Q CINSIND
LOOPAD 
 F %Z=2:1:NCOADDI S CINSIND(%Z)=CINSIND(%Z)+$$VAL^%QNEQUI(INFO,INDCOUR,TEMPS(%Z))
 Q
 
AJINC(INDCOUR,INSEPI,INCOMP,INCOMPG,INCOMPL) 
 N A,I,LISTE
 I $D(@INSEPI@(INDCOUR)) G AJINC1
 
 S A=$O(@INCOMP@(INDCOUR,""))
 F I=0:0 Q:A=""  S @INCOMPL@(A)="",A=$O(@INCOMP@(INDCOUR,A))
 Q
AJINC1 
 S LISTE=@INSEPI@(INDCOUR)
 S A=$O(@INCOMPG@(LISTE,""))
 F I=0:0 Q:A=""  S @INCOMPL@(A)="",A=$O(@INCOMPG@(LISTE,A))
 Q
