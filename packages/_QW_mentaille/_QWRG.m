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

;%QWRG^INT^1^59547,73886^0
QWRG ;
 
 
 
 
 
 
 
REGRET(REP,IND) 
 N TEMP,TABUT,TABRES
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"RG") K @(TEMP)
 S TABUT=$$CONCAS^%QZCHAD(TEMP,"TABUT")
 S TABRES=$$CONCAS^%QZCHAD(TEMP,"TABRES")
 D MKTAB3(TABUT)
 D EVALRG(TABUT,TABRES)
 D AFFRG(TABRES)
 K @(TEMP)
 Q
 
 
 
 
 
 
 
 
 
 
 
MKTAB3(TAB) 
 N PILE,LEVEL,GREL,DOMCOUR,PERCOUR
 S GREL="^[QUI]RQSDON(""QW"",""CD"")"
 S DOMCOUR=DOMEX,LEVEL=1
 
 
CONS 
 
 I '($$OKDOM(DOMCOUR)) G CONS05
 D TRTDOM(DOMCOUR)
 I $D(@GREL@(DOMCOUR,"FILS")) G CONS11
CONS05 
 S LEVEL=LEVEL-1
 I LEVEL<1 Q
 S PERCOUR=PILE(LEVEL)
 S DOMCOUR=$O(@GREL@(PERCOUR,"FILS",DOMCOUR))
 I DOMCOUR="" S DOMCOUR=PERCOUR G CONS05
 G CONS
CONS11 
 S PILE(LEVEL)=DOMCOUR
 S LEVEL=LEVEL+1
 S DOMCOUR=$O(@GREL@(DOMCOUR,"FILS",""))
 G CONS
 
 
OKDOM(DOM) 
 Q $$EVAL^%QWDMAC(REP,IND,DOM)>0
 
 
TRTDOM(DOM) 
 N TEMP,REG,ATT,PREM,%A,ICOND,IATT,ATTP,IACT,GCOMP,GDOM
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TD") K @(TEMP)
 S PREM=$$CONCAS^%QZCHAD(TEMP,"PREM")
 S GDOM=$$CONCAS^%QZCHAD("^[QUI]RQSDON(""QW"",""C3"")",DOM)
 S REG=""
NXREG S REG=$O(@GDOM@(REG)) I REG="" K @(TEMP) Q
 S GCOMP=$$CONCAS^%QZCHAD(GDOM,REG)
 K @(PREM)
 
 S ICOND=""
NXCOND S ICOND=$O(@GCOMP@("P",ICOND)) G:ICOND="" ACTI
 S ATT=""
NXCA S ATT=$O(@GCOMP@("P",ICOND,"A",ATT)) G:ATT="" NXCOND
 I $D(@GCOMP@("P",ICOND,"A",ATT))>9 G NXCA
 I '($$EXIRIA^%QWSTOL(REP,IND,ATT)) S @PREM@(ATT)=""
 G NXCA
 
ACTI S IACT=""
NXACT S IACT=$O(@GCOMP@("R",IACT)) G:IACT="" NXREG
 S IATT=$O(@GCOMP@("R",IACT,""))
 I $$EXIRIA^%QWSTOL(REP,IND,IATT) G NXACT
 S ATT="" F %A=0:0 S ATT=$O(@PREM@(ATT)) Q:ATT=""  D AFFEC(ATT,IATT)
 S ATT="" F %A=0:0 S ATT=$O(@GCOMP@("R",IACT,IATT,"A",ATT)) Q:ATT=""  D:$D(@GCOMP@("R",IACT,IATT,"A",ATT))<9 AFFEC(ATT,IATT)
 G NXACT
 
 
AFFEC(AT1,AT2) 
 I '($D(@TAB@("P",AT1))) S @TAB@("P",AT1)=0
 I '($D(@TAB@("U",AT2))) S @TAB@("U",AT2)=0
 S @TAB@("P",AT1)=@TAB@("P",AT1)+1,@TAB@("U",AT2)=@TAB@("U",AT2)+1
 S:'($D(@TAB@("P",AT1,AT2))) (@TAB@("P",AT1,AT2),@TAB@("U",AT2,AT1))=0
 S @TAB@("P",AT1,AT2)=@TAB@("P",AT1,AT2)+1
 S @TAB@("U",AT2,AT1)=@TAB@("U",AT2,AT1)+1
 Q
 
 
 
 
 
 
EVALRG(TABUT,TABRES) 
 N A1,%A,COEFF
 S A1="" F %A=0:0 S A1=$O(@TABUT@("P",A1)) Q:A1=""  S COEFF=$S('($D(@TABUT@("U",A1))):1,1:@TABUT@("P",A1)/(@TABUT@("U",A1)+@TABUT@("P",A1))),@TABRES@(COEFF,A1)=""
 S A1="" F %A=0:0 S A1=$O(@TABUT@("U",A1)) Q:A1=""  I '($D(@TABUT@("P",A1))) S @TABRES@(0,A1)=""
 Q
 
 
 
AFFRG(TABRES) 
 N %A,%C,CO,ATT,NOTUN,GLO,V
 S DX=0,DY=11 D CLEBAS^%VVIDEO
 S CO="",NOTUN=0
 S GLO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"REGRET") K @(GLO)
 F %C=0:0 S CO=$ZP(@TABRES@(CO)) Q:CO=""  I CO'=1 S ATT="" F %A=0:0 S ATT=$O(@TABRES@(CO,ATT)) Q:ATT=""  S IAF=IAF+1,V=$E(ATT,1,50)_$J("",50-$L(ATT)),V=V_"("_CO_")",@GLO@(V)=""
 I '($D(@GLO)) D ^%VZEAVT($$^%QZCHW("Aucun attribut n'est necessaire")) Q
 D INIT^%QUCHOIP(GLO,1,"",0,11,79,11)
 D AFF^%QUCHOIP
 S CO=$$UN^%QUCHOIP
 D END^%QUCHOIP
 K @(GLO) Q
 
 
 
DIA 
 N REP,IND,CTR
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Attributs interessants"),0)
 D CARSP^%VVIDEO(5,2,9,70,0)
REP D LIRE2^%VREAD($$^%QZCHW("Repertoire")_" : ","",10,70,3,3,"","",.CTR,.REP)
 I CTR'="" Q
 I REP="" G REP
IND D LIRE2^%VREAD($$^%QZCHW("Individu")_" : ","",10,70,5,5,"","",.CTR,.IND)
 I CTR'="" G REP
 I IND="" G IND
 I '($$EXIRI^%QWSTOL(REP,IND)) D ^%VZEAVT($$^%QZCHW("individu inexistant")) G IND
 I '($D(DOMEX)) D LIRE2^%VREAD($$^%QZCHW("Domaine")_" : ","",10,70,7,7,"","",.CTR,.DOMEX) I CTR'="" G IND
 S:DOMEX="" DOMEX="GENERAL"
 D REGRET(REP,IND)
 G REP

