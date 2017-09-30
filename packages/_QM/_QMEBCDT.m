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

;%QMEBCDT^INT^1^59547,73878^0
QMEBCDT(ACT,XG,YH,LA,HA,BASE,INDI,ATT,VAL,ORD,GLO,AFF) 
 
 I ACT="S" G SUPP
 I ACT="C" G AFFI
 I (ACT="M")!(ACT="A") G MOD
 D ^%VSQUEAK S AFF=1
 Q
 
 
 
MOD 
 N TY,ROUTREAF,I,J,TEMPL,TEMPE,NL,GLOTET
 S ROUTREAF="REAFLX^%QMEBCDT"
 S GLOTET=$$ADRESSE
 S TEMPL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S TEMPE=$$CONCAS^%QZCHAD(TEMPL,"ECRITURE") K @(TEMPE)
 S TEMPL=$$CONCAS^%QZCHAD(TEMPL,"LECTURE") K @(TEMPL)
 D MVG^%QSCALVA(BASE,INDI,ATT,TEMPL,.TY)
 S NL=1
 S J=""
 F I=1:1 S J=$O(@TEMPL@(J)) Q:J=""  S @TEMPE@(I)=@TEMPL@(J),@TEMPE@(I,"TETE")=@GLOTET@(INDI,ATT,J)
 D REAF
 D ^%QULIMO(XG,YH,LA,HA,TEMPE,.NL,"UCAS^%QMEBCDT","UCSS^%QMEBCDT")
 S J=""
 F I=1:1 S J=$O(@TEMPE@(J)) Q:J=""  S TY="AJ" S:$D(@TEMPL@(I)) TY="MOD" S GLO(TY,ATT,I)=@TEMPE@(J),@GLOTET@(INDI,ATT,I)=@TEMPE@(J,"TETE")
 S J=I-1
 F I=0:0 S J=$O(@TEMPL@(J)) Q:J=""  S GLO("SUP",ATT,J)=@TEMPL@(J) K @GLOTET@(INDI,ATT,J)
 K @(TEMPL),@(TEMPE)
 S AFF=2
 Q
 
REAF 
 D CARSP^%VVIDEO(XG,YH,HA,LA,1)
 S DX=XG+20,DY=YH X XY
 D NORM^%VVIDEO W " "
 D REV^%VVIDEO W INDI
 D NORM^%VVIDEO W " : "
 D REV^%VVIDEO,BLD^%VVIDEO W ATT
 D NORM^%VVIDEO W " "
 D REAFF^%QULIMO3(1,1,TEMPE,XG,YH,LA,HA)
 Q
REAFLX 
 D REAF,REAFF^%AN7
 Q
 
UCAS 
 N POSIT,RA,SAVY1,SX,SY,CH,RESULT,NORES,TEMPO,P,ATTD,APPD,APPEX
 N %COMPIL,%COMP1,%COMP2,%COMP3,%COMP4,%COMP5,NOCOMPIL,%PROVEN
 K ^SANAREQ($J),^NAVARACT($J)
 S SAVY1=Y1,SX=DX,SY=DY,(POSIT,P)=1,%COMPIL="",(APPEX,ATTD,APPD)=0
 S NOCOMPIL=0,%PROVEN="HEV"
 D INIT^%AN7(SX,SY)
 S RA=$$VAL^%QULIMO("TETE") D:RA'="" KILL^%ANA(RA)
SUIT 
 D INIT^%ANGEPIL
 S CH=Y1,RESULT=1,NORES=0
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"PILE")
 K @(TEMPO)
 D EMPIL^%ANGEPIL("SUIT0^%QMEBCDT")
 G COND^%AN4
SUIT0 
 D END^%AN7
 D EPIL^%ANGEPIL
 K @(TEMPO)
SUIT2 
 S OK=RESULT
 I '(OK) G FIN
 D AFF^%QULIMO("TETE",NORES)
FIN 
 S Y1=SAVY1,DX=SX,DY=SY X XY
 Q
 
UCSS 
 N RA
 S RA=$$VAL^%QULIMO("TETE") D:RA'="" KILL^%ANA(RA)
 S OK=1
 Q
 
AFFI 
 
 
 N TEMPL,I,J
 S TEMPL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMPL)
 D MVG^%QSCALVA(BASE,INDI,ATT,TEMPL,.TY)
 S J=""
 F I=1:1 S J=$O(@TEMPL@(J)) Q:J=""  S @TEMPL@(I)=@TEMPL@(J)
 S J=I-1
 F I=0:0 S J=$O(@TEMPL@(J)) Q:J=""  K @TEMPL@(J)
 D CARSP^%VVIDEO(XG,YH,HA,LA,1)
 S DX=XG+20,DY=YH X XY
 D NORM^%VVIDEO W " "
 D REV^%VVIDEO W INDI
 D NORM^%VVIDEO W " : "
 D REV^%VVIDEO,BLD^%VVIDEO W ATT
 D NORM^%VVIDEO W " "
 D REAFF^%QULIMO3(1,1,TEMPL,XG,YH,LA,HA)
 D VISU^%QULIMO(XG,YH,LA,HA,TEMPL,1)
 K @(TEMPL)
 S AFF=2 Q
 
SUPP 
 
 
 N TETE,GLOTET
 S AFF=1,GLOTET=$$ADRESSE
 D POCLEPA^%VVIDEO
 S DX=XG,DY=23 X XY
 G:$$CONFIRM^%VZEOUI($$^%QZCHW("Suppression de")_" "_ATT_"("_ORD_") ?")'=1 FINS
 S TETE=@GLOTET@(INDI,ATT,ORD) D KILL^%ANA(TETE)
 S GLO("SUP",ATT,ORD)=VAL
FINS 
 Q
 
ADRESSE() 
 Q "^["""_QUI_"""]RQSGLO(""QMEB"")"
ADR(QUI) 
 Q "^["""_QUI_"""]RQSGLO(""QMEB"")"
 
 
COPY(WHOIS1,QUI1,BASE1,IND1,ATT1,VAL1,OR1,WHOIS2,QUI2,BASE2,IND2,ATT2,VAL2,OR2,MODE) 
 N ADR1,ADR2
 S ADR1=$$ADR(QUI1)
 S ADR2=$$ADR(QUI2)
 D PA^%QMCPOZ(QUI,WHOIS2,QUI2,BASE2,IND2,ATT2,VAL2,OR2,MODE)
 
 I MODE=3 Q
 S @ADR2@(IND2,ATT2,OR2)=$$COPY^%ANA(QUI1,@ADR1@(IND1,ATT1,OR1),QUI2)
 
 Q
 
COPIE(WHOIS1,QUI1,BASE1,IND1,ATT1,WHOIS2,QUI2,BASE2,IND2,ATT2,MODE) 
 N I,TEMP,VAL,TYPE1,OR1
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"COPIE")
 S VAL=$$CONCAS^%QZCHAD(TEMP,"VAL")
 K @(TEMP)
 D MVG^%QMCPZ(WHOIS1,QUI1,BASE1,IND1,ATT1,VAL,.TYPE1)
 S OR1=$O(@VAL@(""))
 F I=0:0 Q:OR1=""  D COPY(WHOIS1,QUI1,BASE1,IND1,ATT1,@VAL@(OR1),OR1,WHOIS2,QUI2,BASE2,IND2,ATT2,@VAL@(OR1),OR1,MODE) S OR1=$O(@VAL@(OR1))
 K @(TEMP)
 Q

