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

;%HXIHITU^INT^1^59547,73869^0
HXIHITU ;
 
 
 
 
PAS(NUM,PAS,REP) 
 
 
 S REP=0
 I (PAS=0)&(NUM=1) S REP=1 Q $$^%QZCHW("Le pas ne doit pas avoir une valeur nulle")
 Q ""
 
EXHIS(GL,HIS) 
 
 
 I $D(@GL@(HIS)) Q 1
 Q 0
 
EXHIS2(HIS) 
 N GHL
 S GHL=$$ADRHIS
 Q $$EXHIS(GHL,HIS)
 
GSTO(GL,CLE) 
 
 Q $$CONCAS^%QZCHAD(GL,CLE)
 
VERIF(TYP,L,REP) 
 
 
 
 S BASI=$$^%QSCALVA("L0",L,"OBJET")
 I BASI="" S REP=1 Q $$^%QZCHW("Pas de repertoire connecte a cette liste")
 S BASI=$$NOMINT^%QSF(BASI)
 I BASI="" S REP=1 Q $$^%QZCHW("Pas de repertoire connecte a cette liste")
 I '($$REP^%QSGEST5(BASI)) S REP=1 Q $$^%QZCHW("Repertoire inexistant")
 I $$REPVID^%QSGEST5(BASI) S REP=1 Q $$^%QZCHW("Repertoire vide")
 S REP=0
 Q ""
 
CALCP(TYP,TOT1,REG1,TOT2,REG2,TAB,REP) 
 
 
 
 N T,I,U,M,R
 S @TAB@("TOT",1)=TOT1,@TAB@("REG",1)=REG1 I TYP=1 G SUIT
 I TYP=2 S @TAB@("REG",2)=REG2 G SUIT
 I TYP=3 S @TAB@("TOT",2)=TOT2
SUIT F T="TOT","REG" S I="" F U=1:1 S I=$O(@TAB@(T,I)) Q:I=""  S M=$$CALCUL(T,I,.TAB,.R) Q:R=1
 S REP=R Q M
 
CALCUL(T,I,TAB,R) 
 N AT,FONC,MSG,ET
 S:T="TOT" MSG="totalisation",ET=1 S:T="REG" MSG="regroupement",ET=0
 I '($$FONC^%QS0G3(@TAB@(T,I),ET,.AT,.FONC)) S R=1 Q $$^%QZCHW("Probleme sur l'attribut de "_MSG)
 S @TAB@(T,I,"AT")=AT,@TAB@(T,I,"FONC")=FONC
 S R=0 Q ""
 
STO(GH,TAB,TYP,NUM,NUM2,ABC,OPTH,PAS,PAS2,ABC2,OPTH2) 
 
 S @GH@("TYPE")=TYP
 S @GH@("PAR","LISTE")=LISTE
 S @GH@("PAR","ABC")=ABC
 S @GH@("PAR","OPT")=OPTH
 S @GH@("PAR","TOT1")=@TAB@("TOT",1)
 S @GH@("PARI","ATTOT1")=@TAB@("TOT",1,"AT")
 S @GH@("PARI","FTOT1")=@TAB@("TOT",1,"FONC")
 S @GH@("PAR","REG1")=@TAB@("REG",1)
 S @GH@("PARI","ATREG1")=@TAB@("REG",1,"AT")
 S @GH@("PARI","FREG1")=@TAB@("REG",1,"FONC")
 S @GH@("PAR","NUM1")=NUM
 S @GH@("PAR","PAS1")=PAS
 I TYP=1 Q
 I TYP=2 G SSTO
 
 S @GH@("PAR","ABC2")=ABC2
 S @GH@("PAR","OPT2")=OPTH2
 S @GH@("PAR","TOT2")=@TAB@("TOT",2)
 S @GH@("PARI","ATTOT2")=@TAB@("TOT",2,"AT")
 S @GH@("PARI","FTOT2")=@TAB@("TOT",2,"FONC")
 Q
SSTO 
 S @GH@("PAR","ABC2")=ABC2
 S @GH@("PAR","OPT2")=OPTH2
 S @GH@("PAR","REG2")=@TAB@("REG",2)
 S @GH@("PARI","ATREG2")=@TAB@("REG",2,"AT")
 S @GH@("PARI","FREG2")=@TAB@("REG",2,"FONC")
 S @GH@("PAR","NUM2")=NUM2
 S @GH@("PAR","PAS2")=PAS2
 Q
 
MODPAR(NHIS,PAR,VAL) 
 
 N GH
 S GH=$$GSTO($$ADRHIS,NHIS)
 
 S GH=$$GSTO(GH,"PAR")
 S @GH@(PAR)=VAL
 Q
 
MPAS(NHIS,VAL,TYP) 
 I TYP=1 D MODPAR(NHIS,"PAS1",VAL)
 I TYP=2 D MODPAR(NHIS,"PAS2",VAL)
 Q
 
ADRHIS() 
 Q "^[QUI]HISTOGR(""DATA"")"
 
NOMHIS(HIS) 
 D POCLEPA^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW("Nom histogramme a creer")_" ? ","",1,RM-4,DY+1,DY-1,"","$$UCH^%HXIHITU",.CTR,.HIS)
 D ^%VZEATT
 I CTR'="" S HIS="" Q
 I HIS="" S HIS=$$GEN^%QCAPOP("HIS")
 Q
UCH(YY1,REAF) 
 N GL
 S GL=$$ADRHIS,REAF=0
 I YY1="" Q 1
 I '($$EXHIS(GL,YY1)) Q 1
 D POCLEPA^%VVIDEO
 I $$CONFIRM^%VZEOUI($$^%QZCHW("Histogramme deja existant ! Voulez-vous le supprimer")_" ? ")=1 K @GL@(HIS) Q 1
 Q 0
 
SUP(HIS) 
 N GL
 S GL=$$ADRHIS
 K @GL@(HIS)
 Q

