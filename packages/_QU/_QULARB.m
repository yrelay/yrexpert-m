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

;%QULARB^INT^1^59547,73885^0
%QULARB ;;02:53 PM  6 May 1992; ; 02 Sep 92  4:38 PM
 
 
 
FEXTER(FONC,VAL1,VAL2,VAL3,VAL4,ADR1,ADR2,ADR3,ADR4) 
 I FONC="INIT" D INITDK Q
 I FONC="SUIVANT" D NEXTDK Q
 I FONC="FIN" D FINDK Q
 Q
 
 
 
 
 
 
 
 
 
 
 
 
INITDK N XNEXT,XEVPDS,TEMP,TRS,TPD,TPDV,NUMSTR,TOT,XXN,ATTTRI,TXPLO,MXPLO
 N LARGEUR,LONGUEUR,ATSTRI,PSTRI,PRFMAX
 S TPD=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"IK"),LARGEUR=0,LONGUEUR=0
 S NUMSTR=$$GEN^%QCAPOP("STR")
 S TEMP=$$CONCAS^%QZCHAD(TPD,NUMSTR) K @(TEMP)
 S TRSDK=$$CONCAS^%QZCHAD(TEMP,"T")
 S MOX=$$SUBST^%ANARBR2(ADR3,.CXT,"ATT^%TLIACT3",.POS)
 S TXPLO=$P(MOX,",",2)
 I (TXPLO'=0)&(TXPLO'=1) S TXPLO=2
 S MXPLO=$P(MOX,",")
 I (MXPLO'="PROFONDEUR")&(MXPLO'="LARGEUR") S MXPLO="NORMAL"
 S PRFMAX=$P(MOX,",",3)
 S:'($$ENT^%QZNBN(PRFMAX)) PRFMAX=9999
 S PSTRI=1,XEVPDS=""
BCLAT S ATSTRI=$P(VAL4,",",PSTRI) G:ATSTRI="" BCLFIN
 S ATTTRI=$E(ATSTRI,2,$L(ATSTRI))
 S VALPDS=$S(ATTTRI="DEGRE.EXTERIEUR":"$$PDFILS^%QULARB2(CHEM)",ATTTRI="NOMBRE.SUCCESSEURS":"$$PDSUCC^%QULARB2(CHEM)",ATTTRI="PROFONDEUR.DANS.GRAPHE":"$$PDPROF^%QULARB2(CHEM)",1:"$$PDATT^%QULARB("""_$$NOMINT^%QSF(VAL1)_""",NEX,"""_ATTTRI_""",1)")
 S XEVPDS=XEVPDS_$S($E(ATSTRI)=">":"-",1:"")_VALPDS_"_"",""_"
 S PSTRI=PSTRI+1
 G BCLAT
BCLFIN S XEVPDS="S POIDS="_XEVPDS_"1"
 S XNEXT="S NEX=$$NXTRIAV^%QSTRUC8("""_$$NOMINT^%QSF(VAL1)_""",INDIV,"""_VAL3_""",NEX)"
 D INIT^%QULARBU(VAL2,XNEXT,XEVPDS,TRSDK,TXPLO,MXPLO,NUMSTR,PRFMAX)
 
 D AFF^%TLIACTS(ADR1,NUMSTR)
 S MAXL=0,XXN=0 F TOT=0:1 S XXN=$$NEXT^%QULARBU(NUMSTR,XXN) Q:XXN=0  I $L(XXN,",")>MAXL S MAXL=$L(XXN,",")
 S TOT=TOT_","_MAXL
 ;; au nombre de chemins on concatene la largeur maxi des successeurs et la longueur maxi
 D AFF^%TLIACTS(ADR2,TOT)
 Q
 
PDATT(REP,IND,ATT,ORD) 
 N VAL
 S VAL=$$^%QSCALIN(REP,IND,ATT,ORD) Q:VAL="" 99999
 I '($$NUM^%QZNBN(VAL)) Q """"_VAL_""""
 Q VAL+0
 
 
 
 
 
 
 
 
 
 
NEXTDK N IND,TPD,TRSDK,NEXT,PDS
 S TPD=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"IK")
 S TEMP=$$CONCAS^%QZCHAD(TPD,VAL1)
 S TRSDK=$$CONCAS^%QZCHAD(TEMP,"T")
 S NEXT=$$NEXT^%QULARBU(VAL1,VAL2,.PDS)
 D AFF^%TLIACTS(ADR1,NEXT)
 I $L(NEXT,",")>1 D AFF^%TLIACTS(ADR2,@TRSDK@($P(NEXT,",",$L(NEXT,",")-1)))
 I NEXT'=0 D AFF^%TLIACTS(ADR3,@TRSDK@($P(NEXT,",",$L(NEXT,","))))
 I NEXT'=0 D AFF^%TLIACTS(ADR4,PDS)
 Q
 
 
 
 
 
 
FINDK N TPD,TEMP
 S TPD=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"IK") Q:'($D(@TPD))
 S TEMP=$$CONCAS^%QZCHAD(TPD,VAL1) K @(TEMP)
 D NETTOIE^%QULARBU(VAL1)
 Q
 
 
TESTDK(IND) 
 N TEMP,TRANS,ID,LARGEUR,LONGUEUR,PDS
 S LARGEUR=0,LONGUEUR=0
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"DKB") K @(TEMP)
 S TRANS=$$CONCAS^%QZCHAD(TEMP,"T")
 S XNEXT="S NEX=$$NXTRIAV^%QSTRUC8(""ARTICLE"",INDIV,""COMPOSE.DE"",NEX)"
 
 S XEVPDS="S POIDS=-$$PDSUCC^%QULARB2(CHEM)_"",""_$$PDFILS^%QULARB2(CHEM)"
 
 D INIT^%QULARBU(IND,XNEXT,XEVPDS,TRANS,1,"NORMAL",0)
 S CH=0,ID=0 F I=0:0 S CH=$$NEXT^%QULARBU(ID,CH,.PDS) Q:CH=0  W !,"poids  ",PDS,"  " F %J=1:1 S J=$P(CH,",",%J) Q:J=""  W @TRANS@(J)," "
 Q
 ;

