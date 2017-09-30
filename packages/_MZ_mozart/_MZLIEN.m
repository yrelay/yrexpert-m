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

;%MZLIEN^INT^1^59573,41188^0
%MZLIEN(GAM) 
 
 
 
 
 
 
DEB I XOP'=2 D ^%VSQUEAK Q
 
 N LIEN,TEMP S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 
 N %,LC,NLI,TYP,NPH,OP,SOP,INTER,IDC,NLIS,SAVX,GLOST S GLOST=^%SCRE("MOZLN","GLOSTOC")_"("_$J_")" K @(GLOST)
 S NLI=EDCL,$P(^U($J,0,EDCL),"^",1)=XOP,$P(^U($J,0,EDCL),"^",2)=X,SAVX=X
 S LC=^U($J,0,NLI),TYP=$P(LC,"^",1),LC=$P(LC,"^",2)
 
 
 S OP=$$GETLBLAN^%VTLBLAN($P(LC,$C(1),1))
LOOP S NLI=$ZP(^U($J,0,NLI)) Q:NLI=""  S LC=^U($J,0,NLI),TYP=$P(LC,"^",1),LC=$P(LC,"^",2) G LOOP:TYP'=1
 
 
 S NPH=$$GETLBLAN^%VTLBLAN($P(LC,$C(1),1)),NLIS=NLI
LOOP2 S NLI=$O(^U($J,0,NLI)) G FIN:NLI="" S LC=^U($J,0,NLI),TYP=$P(LC,"^",1),LC=$P(LC,"^",2) G LOOP2:TYP'=2
 S SOP=$S($D(SOP(NPH)):SOP(NPH)+1,1:1),SOP(NPH)=SOP+1,INTER=NPH_"."_$TR($J("",3-$L(SOP))," ",0)_SOP
 G SUITE:NLI=EDCL
 G LOOP2
 
SUITE N REP,DEFETU,NUMET,TAB125
 S IDC=GAM_","_OP_"/"_INTER
 S REP=$$NOMLOG^%QSF($$OI^%MZQS)
 S DEFETU=$$^%QULELO2(REP_$C(0)_$C(0)_IDC)
 I DEFETU="" Q
 S NUMET=$$NOUVET^%QULELOE(DEFETU)
 D SETETAT^%QULELOE(NUMET,0)
 S TAB125=$$TEMP^%SGUTIL K @(TAB125)
 D MEMX^%QCAMEM
 F I="WHOIS","QUI","DEFETU","NUMET","TAB125" S @TAB125@(I)=""
 D KEXMEM^%QCAMEM(TAB125)
 D CURRENT^%IS,VARSYS^%QCSAP
 
 D ACTIET^%QULELOE(NUMET)
 D SUPET^%QULELOE(NUMET)
 
 K  D RMEMX^%QCAMEM
 D CLEPAG^%VVIDEO
 D STAT1^%MZWORD X XY D NORM^%VVIDEO,RF^%MZED,RST^%MZED
 K @(TAB125)
 Q
FIN 
 K ^MOZLIEN($J,EDCL)
 S LIEN="" F %U=0:0 S LIEN=$O(@GLOST@(LIEN)) Q:LIEN=""  S ORDRE="" F %U=0:0 S ORDRE=$O(@GLOST@(LIEN,ORDRE)) Q:ORDRE=""  S ^MOZLIEN($J,EDCL,LIEN,ORDRE)=""
 X ^MOZ("C",12,6)
 O 0
 
 I $$TABID^%INCOIN("ORDINATEUR")="PDP" D RESTOR^%MZOPER
 I $$TABID^%INCOIN("ORDINATEUR")="IBM-PC" D RESTOR^%MZOPER
 S X=SAVX
 K @(GLOST)
 D CLEPAG^%VVIDEO,NORM^%VVIDEO,STAT^%MZWORD,NORM^%VVIDEO,RF^%MZED,RST^%MZED
 
 K RESUL,AFRESU,PATOUCH,DEJALU,m,MS,MSG,NOMTAB,%NOMC,RF,%RF,ABENDSCR,TAB,C,%AJCMS,%AJM,%IGR,%REFS,%RS,%SCRN,%TREEF,%TREECF,AF,IN,INDLIEN,PARA,PCH,PCHCOMP,REFUSE,ROU,ROUTI,SCR,SCR1,Y1
 Q
UCONT 
 N GLO,ATT S RESUL(1)=$J Q:RESUL(IC)=""
 I RESUL(IC)="?" D CHOIX S:RESUL(IC)="" REFUSE=1 G END
 S GLO="^["""_QUI_"""]RQSQUAL("""_$$OI^%MZQS_""")",ATT="",REFUSE=1
 F %U=0:0 S ATT=$O(@GLO@(ATT)) Q:ATT=""  I ATT=RESUL(IC) S REFUSE=0
 I REFUSE D ^%VZEAVT(RESUL(IC)_" n'est pas un attribut lien...") Q
END Q
CHOIX 
 S GLO="^["""_QUI_"""]RQSQUAL("""_$$OI^%MZQS_""")"
 D INIT2^%QUCHOIP(GLO,1,"",50,7,28,11,80),AFF^%QUCHOIP
 S RESUL(IC)=$$UN^%QUCHOIP
 D CLFEN^%VVIDEO(50,7,13,28)
 
 S TAB(ICC)=RESUL(IC) D ^%VAFFICH S REFUSE=0
 Q
 
NET Q:(((INTER'["LIEN.")&(INTER'["INVERSE."))&(INTER'["SOURCE."))&(INTER'["DESTINATION.")
 K @GLO@(INTER)
 Q
 
AFFECT 
 I '($$AIR^%QSGE5($$OI^%MZQS,GAM_","_IDC,LIEN)) Q
 
 N TABLIEN,TYPE
 S TABLIEN=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TABLIEN") K @(TABLIEN)
 D MVG^%QSCALVA($$OI^%MZQS,GAM_","_IDC,LIEN,TABLIEN,.TYPE)
 I TYPE<3 G FAFF
 S ORDRE="" F %U=0:0 S ORDRE=$O(@TABLIEN@(ORDRE)) Q:ORDRE=""  S @GLOST@(LIEN,@TABLIEN@(ORDRE))=""
FAFF K @(TABLIEN) Q
 
REMPLIR 
 S LIEN="" F %U=0:0 S LIEN=$O(^MOZLIEN($J,EDCL,LIEN)) Q:LIEN=""  S ORDRE="" F %U=0:0 S ORDRE=$O(^MOZLIEN($J,EDCL,LIEN,ORDRE)) Q:ORDRE=""  S @GLOST@(LIEN,ORDRE)=""
 Q
STO 
 S RESUL(1)=$J G ^%VAUTOST

