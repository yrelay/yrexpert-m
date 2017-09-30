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

;%QS2CALC^INT^1^59547,73880^0
%QS2CALC(OBJ,FC,AT,IAT,OK) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N U,OCC,VAL,IIND,%VAL,NCH,FC2,L,LF,IS,STOP,UN,ATS
 
 S IAT=$O(^TATINDB($J,AT,IAT)) G:IAT'="" SUIT1
 S AT=$O(^TATINDB($J,AT)) G:AT'="" SUIT2
 
 S @("OK="_FC) Q
SUIT2 S IAT=$O(^TATINDB($J,AT,""))
SUIT1 S L=$L(AT),LF=$L(FC),STOP=0
 G:IAT=0 SUIT3
 
 S VAL=$O(^[QUI]QUERY3(BASE,OBJ,IAT,AT,""))
 S ATS=AT_"/"_$$NOMLOG^%QSF(BASE)
 S:$$TYPE^%QSGESPE(ATS)="DATE" VAL=$$AFFI^%QMDAUC(BASE,AT,VAL)
 D SUBSTTS Q:STOP=1
 D ^%QS2CALC(OBJ,FC2,AT,IAT,.OK) Q
SUIT3 
 S UN=0
 S ATS=AT_"/"_$$NOMLOG^%QSF(BASE)
 S VAL="" F %VAL=0:0 S VAL=$$NXTRIAV^%QSTRUC8(BASE,OBJ,AT,VAL) Q:VAL=""  S:$$TYPE^%QSGESPE(ATS)="DATE" VAL=$$AFFI^%QMDAUC(BASE,AT,VAL) D SUBSTTS Q:STOP=1  D ^%QS2CALC(OBJ,FC2,AT,IAT,.OK) Q:OK=1
 Q:UN  Q:VAL=""
 D SUBSTTS
 Q:STOP=1
 D ^%QS2CALC(OBJ,FC2,AT,IAT,.OK)
 Q
SUBSTTS S NCH=""""_$$ZSUBST^%QZCHSUB(VAL,"""","""""")_"""",OCC="",FC2=FC
 F U=0:0 S OCC=$O(^TATINDB($J,AT,IAT,OCC)) Q:OCC=""  D SUBST
 Q
SUBST S IS=1,LF=$L(FC2)
BOUC S IS=$F(FC2,AT,IS) I IS=0 S STOP=1 Q
 G:$$MAUVAIS BOUC
 
 S FC2=$S((IS-L)>1:$E(FC2,1,(IS-L)-1),1:"")_NCH_$S(IS>LF:"",1:$E(FC2,IS,LF))
 Q
MAUVAIS() Q:"<>'!#()_-+=*[]&/\"[$E(FC2,IS) 0
 Q 1

