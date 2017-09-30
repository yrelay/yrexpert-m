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

;%HXYCALB^INT^1^59547,73870^0
HXYCALB ;
 
 
 
 
INIT 
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S GLO1=$$CONCAS^%QZCHAD(TEMP,"GLO1")
 S GLO2=$$CONCAS^%QZCHAD(TEMP,"GLO2")
 S ADLIST=$$^%QSCALVA("L0",L,"ADRESSE")
 S REP=$$NOMINT^%QSF($$^%QSCALVA("L0",L,"OBJET")),REPR=$P(AR,"^",2)
 S:REPR="" REPR=REP
 D MSG^%VZEATT($$^%QZCHW("Preparation de l'histogramme en cours"))
 S (CARDNOCU,BASE,FIRST,IND,MAX,TOTAL)=0,INDIV=""
 Q
 
TRANS 
 N NB,TOT,SOM
 S VALREG=""
 F I=1:1 S VALREG=$O(@GLO1@(VALREG)) Q:VALREG=""  D CONS I (I#10)=0 W "."
 Q
CONS 
 S TOT=$P(@GLO1@(VALREG),"^"),NB=$O(@GLO1@(VALREG,"")),SOM=TOT
 I OPTH=0 S TOT=TOT/$ZP(@GLO1@(VALREG,"")) D NORMALIS^%QZNBN1(.TOT)
 S:NB'="" @GLO2@(TOT,VALREG)=$P(@GLO1@(VALREG),"^",2)_"^"_SOM
 F II=1:1 Q:NB=""  S @GLO2@(TOT,VALREG,NB)=@GLO1@(VALREG,NB),NB=$O(@GLO1@(VALREG,NB)) I (II#10)=0 W "."
 Q
 
PARC 
 F I=1:1 S INDIV=$O(@ADLIST@(INDIV)) Q:INDIV=""  D CALC I (I#10)=0 W "."
 Q
CALC 
 S VALTOT=$$VAL^%HXYISTO(FTOT,REP,INDIV,T)
 S VALREG=$$VAL^%HXYISTO(FREG,REP,INDIV,R)
 I (VALREG="")!(VALTOT="") G NOCUMUL
 
 I (BI="")&(BS="") G CUMUL
 I N,((VALREG<BI)&(BI'=""))!((VALREG>BS)&(BS'="")) G NOCUMUL
 I '(N),((BI]VALREG)&(BI'=""))!((VALREG]BS)&(BS'="")) G NOCUMUL
 
CUMUL 
 
 
 S VALINT=VALREG
 I N S VALINT=(((VALINT-BO)\P)*P)+BO
 
 
 S VALREG=$$AFFI^%QMDAUC(REPR,R,VALREG)
 S VALINT=$$INTF^%QMDAUC(REPR,R,VALREG)
 Q:VALINT=""
 S @GLO1@(VALINT)=($S($D(@GLO1@(VALINT)):$P(@GLO1@(VALINT),"^"),1:0)+VALTOT)_"^"_VALREG
 S @GLO1@(VALINT,$ZP(@GLO1@(VALINT,""))+1)=INDIV_"^"_VALREG
 Q
NOCUMUL 
 
 S CARDNOCU=CARDNOCU+1,@HISTO@(0,INDIV)=""
 Q

