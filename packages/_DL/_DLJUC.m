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

;%DLJUC^INT^1^59547,73868^0
DLJUC ;
 
 
 
 
NUPAPLJ 
 S REFUSE=0 I RESUL(1)="" S REFUSE=1 G FIN
 I RESUL(IC)="SINON" G FIN
 G:(%AJM="S")!(%AJM="C") FIN
 I RESUL(IC)'="",'($$ADR^%QZNBN1(RESUL(IC))) D ^%VZEAVT($$^%QZCHW("No de condition : numerique ou SINON")) S REFUSE=1 G FIN
 S:'($D(^[QUI]CPTEUR("NUPAPLJ",RESUL(1)))) ^[QUI]CPTEUR("NUPAPLJ",RESUL(1))=0
 L ^[QUI]CPTEUR("NUPAPLJ",RESUL(1))
 S PN=^[QUI]CPTEUR("NUPAPLJ",RESUL(1))
 S PN=$S(RESUL(IC)="":PN+1,RESUL(IC)>PN:RESUL(IC),1:PN)
 S ^[QUI]CPTEUR("NUPAPLJ",RESUL(1))=PN
 L
 S:RESUL(IC)="" RESUL(IC)=PN
 S TAB(IC)=RESUL(IC),ICC=IC D AFFICHE
FIN K TAB
 Q
 
AFFICHE 
 S DEJALU(ICC)=1,DX=^%SCRE(SCR,ICC,2),DY=^%SCRE(SCR,ICC,3) X XY S RESUL(ICC)=TAB(ICC) W ^%SCRE(SCR,ICC,1),TAB(ICC)
 Q
 
STO 
 N I,ERREUR,MESERR,VISU
 F I=1:1:4 S RESUL(I)=$$GETLBLAN^%VTLBLAN(RESUL(I))
 D ^%VAUTOST Q:ABENDSCR=1
 N ARTI,WB1,WB2,WB3,WB4,TBA,ERREUR,MESERR
 S ERREUR=0
 D ^%VZEATT
 W " "_$$^%QZCHW("Compilation valeur")
 S (ARTI,WB1)=RESUL(1),TBA="^[QUI]FLPLJ(WB1)"
 S WB2=RESUL(2),WB3=RESUL(3),WB4=RESUL(4)
 S VISU=1
 D INIT^%DLJANAL
 D VAL^%DLJCPTI
 D END^%DLJANAL
 I ERREUR S ABENBSCR=1 D ^%VZEAVT(MESERR)
 D POCLEPA^%VVIDEO
 Q
 
STO2 
 N I,ERREUR,MESERR,VISU
 F I=1:1:5 S RESUL(I)=$$GETLBLAN^%VTLBLAN(RESUL(I))
 D ^%VAUTOST Q:ABENDSCR=1
 N ARTI,WB1,WB2,WB3,WB4,WB5,TBA,ERREUR,MESERR
 S ERREUR=0
 S (ARTI,WB1)=RESUL(1),TBA="^[QUI]FLPLJ(WB1)",WB2=RESUL(2),WB3=RESUL(3),WB4=RESUL(4),WB5=RESUL(5)
 D ^%VZEATT
 W " "_$$^%QZCHW("Compilation conditions, fiche no")_" "_WB5
 S VISU=1
 D INIT^%DLJANAL
 D COND^%DLJCPTI
 D END^%DLJANAL
 I ERREUR S ABENBSCR=1 D ^%VZEAVT($$^%QZCHW("Page")_" "_WB5_" : "_MESERR)
 D POCLEPA^%VVIDEO
 Q
 
DUPL() 
 N %I,WB1,WB2,WB3,WB4,WB5
 
 I $D(OR) F %I=1:1:5 S @("WB"_%I_"=$$GETLBLAN^%VTLBLAN(OR("_%I_"))")
 I '($D(OR)) F %I=1:1:5 S @("WB"_%I_"=$$GETLBLAN^%VTLBLAN(AFRESU("_%I_"))")
 D STO
 I ABENDSCR=1 G FDUP
 
 D ^%VZEATT
 W " "_$$^%QZCHW("duplication des conditions")
 D COPIE
 D:$D(NOM) NEWOLD^%VCMSCOR
 Q 0
FDUP 
 F %I=1:1:5 S @("RESUL("_%I_")="_"WB"_%I),@("AFRESU("_%I_")="_"WB"_%I)
 D ^%VAFIGRI,^%VAFISCR
 Q 0
 
SUPP() 
 N WB1,WB2,WB3,WB4,%I
 F %I=1:1:4 S @("WB"_%I_"=$$GETLBLAN^%VTLBLAN(RESUL("_%I_"))")
 I (((WB1="")!(WB2=""))!(WB3=""))!(WB4="") D ^%VSQUEAK Q 0
 K ^[QUI]DLJ(WB1,WB2,WB3,WB4)
 K ^[QUI]ADLJ(WB1,WB2,WB3,WB4)
 K ^[QUI]DLJCOND(WB1,WB2,WB3,WB4)
 K ^[QUI]CDLJ(WB1,WB2,WB3,WB4)
 F %I=1:1:5 S RESUL(%I)=""
 D ^%VAFIGRI,^%VAFISCR
 Q 0
 
SUPP2() 
 N WB1,WB2,WB3,WB4,WB5,%I
 F %I=1:1:5 S @("WB"_%I_"=$$GETLBLAN^%VTLBLAN(OR("_%I_"))")
 I ((((WB1="")!(WB2=""))!(WB3=""))!(WB4=""))!(WB5="") D ^%VSQUEAK Q 0
 K ^[QUI]DLJCOND(WB1,WB2,WB3,WB4,WB5)
 K ^[QUI]CDLJ(WB1,WB2,WB3,WB4,WB5)
 F %I=5:1:^%SCRE("DLJCOND") S RESUL(%I)=""
 D ^%VAFIGRI,^%VAFISCR
 Q 0
 
MOD() 
 N WB1,WB2,WB3,WB4,%I
 I $D(OR) F %I=1:1:4 S @("WB"_%I_"=$$GETLBLAN^%VTLBLAN(OR("_%I_"))")
 I '($D(OR)) F %I=1:1:4 S @("WB"_%I_"=$$GETLBLAN^%VTLBLAN(RESUL("_%I_"))")
 I (((WB1="")!(WB2=""))!(WB3=""))!(WB4="") D ^%VSQUEAK Q 0
 G:(((WB1=RESUL(1))&(WB2=RESUL(2)))&(WB3=RESUL(3)))&(WB4=RESUL(4)) MVAL
 G:'($D(^[QUI]DLJ(RESUL(1),RESUL(2),RESUL(3),RESUL(4)))) MOD1
 D ^%VZEAVT($$^%QZCHW("Regle deja existante"))
 F %I=1:1:5 S RESUL(%I)=""
 D ^%VAFIGRI,^%VAFISCR
 Q 0
MOD1 D COPIE
 K ^[QUI]ADLJ(WB1,WB2,WB3,WB4)
 K ^[QUI]DLJCOND(WB1,WB2,WB3,WB4)
 K ^[QUI]CDLJ(WB1,WB2,WB3,WB4)
 
MVAL 
 K ^[QUI]DLJ(WB1,WB2,WB3,WB4)
 D STO
 Q 0
 
MOD2() 
 N WB1,WB2,WB3,WB4,WB5,%I
 F %I=1:1:5 S @("WB"_%I_"=$$GETLBLAN^%VTLBLAN(OR("_%I_"))")
 I ((((WB1="")!(WB2=""))!(WB3=""))!(WB4=""))!(WB5="") D ^%VSQUEAK Q 0
 G:RESUL(5)=WB5 MCOND
 G:'($D(^[QUI]DLJCOND(RESUL(1),RESUL(2),RESUL(3),RESUL(4),RESUL(5)))) MOD21
 D ^%VZEAVT($$^%QZCHW("Fiche deja existante..."))
 F %I=5:1:^%SCRE("DLJCOND") S RESUL(%I)=""
 D ^%VAFIGRI,^%VAFISCR
 Q 0
MOD21 K ^[QUI]DLJCOND(WB1,WB2,WB3,WB4,WB5)
 K ^[QUI]CDLJ(WB1,WB2,WB3,WB4,WB5)
 
MCOND N ARTI,TBA,ERREUR,MESERR,VISU
 K ^[QUI]DLJCOND(RESUL(1),RESUL(2),RESUL(3),RESUL(4),RESUL(5))
 D ^%VAUTOST
 S ERREUR=0
 S (ARTI,WB1)=RESUL(1),TBA="^[QUI]FLPLJ(WB1)",WB2=RESUL(2),WB3=RESUL(3),WB4=RESUL(4),WB5=RESUL(5)
 D ^%VZEATT
 W " "_$$^%QZCHW("Compilation conditions, fiche no")_" "_WB5
 S VISU=1
 D INIT^%DLJANAL
 D COND^%DLJCPTI
 D END^%DLJANAL
 I ERREUR S ABENBSCR=1 D ^%VZEAVT($$^%QZCHW("Page")_" "_WB5_" : "_MESERR)
 D POCLEPA^%VVIDEO
 Q 0
 
COPIE 
 N TAB,VAL,%I
 F %I="WB1","WB2","WB3","WB4" S @("VAL="_%I) S:'($$ADR^%QZNBN1(VAL)) VAL=""""_VAL_"""" S @("TAB("""_%I_""")=VAL")
 F %I="RESUL(1)","RESUL(2)","RESUL(3)","RESUL(4)" S @("VAL="_%I) S:'($$ADR^%QZNBN1(VAL)) VAL=""""_VAL_"""" S @("TAB("""_%I_""")=VAL")
 D ADR^%QCAGLC("^["""_QUI_"""]DLJCOND("_TAB("WB1")_","_TAB("WB2")_","_TAB("WB3")_","_TAB("WB4"),"^["""_QUI_"""]DLJCOND("_TAB("RESUL(1)")_","_TAB("RESUL(2)")_","_TAB("RESUL(3)")_","_TAB("RESUL(4)"))
 D ADR^%QCAGLC("^["""_QUI_"""]CDLJ("_TAB("WB1")_","_TAB("WB2")_","_TAB("WB3")_","_TAB("WB4"),"^["""_QUI_"""]CDLJ("_TAB("RESUL(1)")_","_TAB("RESUL(2)")_","_TAB("RESUL(3)")_","_TAB("RESUL(4)"))
 Q

