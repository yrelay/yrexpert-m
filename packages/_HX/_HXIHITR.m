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

;%HXIHITR^INT^1^59547,73869^0
HXIHITR ;
 
 
 
 
 
 
HSIM(GL,HIS,TYP,LISTE,TOT,REG,NUM,ABC,OPTH,PAS,INTER,TIT,REP) 
 
 
 
 
 
 N MES,ERR,TAB1,GH,ATOT,AREG,FTOT,FREG,AR,AT,FSYN
 S REP=0,MES=$$VERIF^%HXIHITU(TYP,LISTE,.ERR)
 I ERR S REP=ERR Q MES
 S MES=$$PAS^%HXIHITU(NUM,PAS,.ERR) I ERR S REP=ERR Q MES
 
 S MES=$$CALCP^%HXIHITU(TYP,TOT,REG,"","","TAB1",.ERR)
 I ERR S REP=ERR Q MES
 S GH=$$GSTO^%HXIHITU(GL,HIS) K @(GH)
 D STO^%HXIHITU(GH,"TAB1",TYP,NUM,"",ABC,OPTH,PAS,"","","")
 D VINIT(TYP)
 I FTOT="" S FTOT="$$^%QSCALVA"
 S FTOT=$$CONCAT^%QZCHAD("A="_FTOT,"REP,IND,ATT")
 I FREG="" S FREG="$$^%QSCALVA"
 S FREG=$$CONCAT^%QZCHAD("A="_FREG,"REP,IND,ATT")
 S FSYN="$$ZSX^%HXYISTO"
 S FSYN=$$CONCAT^%QZCHAD("A="_FSYN,"APP,REP,ATT,VAL,.ER")
 S GH=$$GSTO^%HXIHITU(GH,"COL")
 D ^%HXYCAL(LISTE,ATOT,AREG,NUM,PAS,GH,"","","",ABC,OPTH,FTOT,FREG,"",AR)
 I INTER D VISU^%HXYISTO(LISTE,TOT,REG,NUM,PAS,"",FTOT,FREG,"",FSYN,"","","",ABC,OPTH,ATOT,AREG,GH,0,"",TIT)
 Q ""
 
HPAR(GL,HIS,TYP,LISTE,TOT,REG,NUM,ABC,OPTH,PAS,TOT2,ABC2,OPTH2,INTER,TIT,REP) 
 
 
 
 N MES,ERR,TAB1,GH,ATOT,AREG,FTOT,FREG,AR,AT,FSYN,AT2,ATOT2,FTOT2,GHS1,GHS2
 S REP=0,MES=$$VERIF^%HXIHITU(TYP,LISTE,.ERR)
 I ERR S REP=ERR Q MES
 S MES=$$PAS^%HXIHITU(NUM,PAS,.ERR) I ERR S REP=ERR Q MES
 
 S MES=$$CALCP^%HXIHITU(TYP,TOT,REG,TOT2,"","TAB1",.ERR)
 I ERR S REP=ERR Q MES
 S GH=$$GSTO^%HXIHITU(GL,HIS) K @(GH)
 D STO^%HXIHITU(GH,"TAB1",TYP,NUM,"",ABC,OPTH,PAS,"",ABC2,OPTH2)
 D VINIT(TYP)
 S AT2=@GH@("PAR","TOT2")
 S ATOT2=@GH@("PARI","ATTOT2"),FTOT2=@GH@("PARI","FTOT2")
 S GH=$$GSTO^%HXIHITU(GH,"COL")
 S GHS1=$E(GH,1,$L(GH)-1)_",1)",GHS2=$E(GH,1,$L(GH)-1)_",2)"
 I FTOT="" S FTOT="$$^%QSCALVA"
 S FTOT=$$CONCAT^%QZCHAD("VALTOT="_FTOT,"REP,INDIV,ATOT")
 I FREG="" S FREG="$$^%QSCALVA"
 S FREG=$$CONCAT^%QZCHAD("VALREG="_FREG,"REP,INDIV,AREG")
 I FTOT2="" S FTOT2="$$^%QSCALVA"
 S FTOT2=$$CONCAT^%QZCHAD("VALTOT="_FTOT2,"REP,INDIV,ATOT2")
 D ^%HXICAL(LISTE,ATOT,AREG,FTOT,FREG,NUM,PAS,GHS1,AR,ABC,OPTH)
 D ^%HXICAL(LISTE,ATOT2,AREG,FTOT2,FREG,NUM,PAS,GHS2,AR,ABC2,OPTH2)
 I INTER D VISU^%HXIARSA(LISTE,AT,AR,NUM,PAS,AT2,FTOT,FREG,FTOT2,ABC,OPTH,ATOT,AREG,ATOT2,ABC2,OPTH2,GHS1,GHS2,0,"",TIT)
 Q ""
 
HSER(GL,HIS,TYP,LISTE,TOT,REG,NUM,ABC,OPTH,PAS,REG2,NUM2,PAS2,ABC2,OPTH2,INTER,TIT,REP) 
 
 
 
 N MES,ERR,TAB1,GH,ATOT,AREG,FTOT,FREG,AR,AT,FSYN,AR2,AREG2,FREG2,GHS1,GHS2
 S REP=0,MES=$$VERIF^%HXIHITU(TYP,LISTE,.ERR)
 I ERR S REP=ERR Q MES
 S MES=$$PAS^%HXIHITU(NUM,PAS,.ERR) I ERR S REP=ERR Q MES
 
 S MES=$$PAS^%HXIHITU(NUM2,PAS2,.ERR) I ERR S REP=ERR Q MES
 S MES=$$CALCP^%HXIHITU(TYP,TOT,REG,"",REG2,"TAB1",.ERR)
 I ERR S REP=ERR Q MES
 S GH=$$GSTO^%HXIHITU(GL,HIS) K @(GH)
 D STO^%HXIHITU(GH,"TAB1",TYP,NUM,NUM2,ABC,OPTH,PAS,PAS2,ABC2,OPTH2)
 D VINIT(TYP)
 S AR2=@GH@("PAR","REG2")
 S AREG2=@GH@("PARI","ATREG2"),FREG2=@GH@("PARI","FREG2")
 S NUM2=@GH@("PAR","NUM2"),PAS2=@GH@("PAR","PAS2")
 S GH=$$GSTO^%HXIHITU(GH,"COL")
 S GHS1=$E(GH,1,$L(GH)-1)_",1)",GHS2=$E(GH,1,$L(GH)-1)_",2)"
 I FTOT="" S FTOT="$$^%QSCALVA"
 S FTOT=$$CONCAT^%QZCHAD("VALTOT="_FTOT,"REP,INDIVIDU,ATOT")
 I FREG="" S FREG="$$^%QSCALVA"
 S FREG=$$CONCAT^%QZCHAD("VALREG="_FREG,"REP,INDIVIDU,AREG")
 I FREG2="" S FREG2="$$^%QSCALVA"
 S FREG2=$$CONCAT^%QZCHAD("VALECL="_FREG2,"REP,INDIVIDU,AREG2")
 D ^%HXICALC(LISTE,ATOT,AREG,NUM,PAS,AREG2,NUM2,PAS2,FTOT,FREG,FREG2,GHS1,GHS2,ABC,OPTH,ABC2,OPTH2,AR,AR2)
 I INTER D VISU^%HXISTOD(LISTE,AT,AR,NUM,PAS,AR2,NUM2,PAS2,FTOT,FREG,FREG2,ATOT,AREG,AREG2,GHS1,GHS2,0,"",ABC,OPTH,ABC2,OPTH2,TIT)
 Q ""
 
VINIT(TYP) 
 S LISTE=@GH@("PAR","LISTE")
 S AT=@GH@("PAR","TOT1"),AR=@GH@("PAR","REG1")
 S ATOT=@GH@("PARI","ATTOT1"),AREG=@GH@("PARI","ATREG1")
 S FTOT=@GH@("PARI","FTOT1"),FREG=@GH@("PARI","FREG1")
 S NUM=@GH@("PAR","NUM1"),ABC=@GH@("PAR","ABC"),PAS=@GH@("PAR","PAS1")
 S OPTH=$S($D(@GH@("PAR","OPT")):@GH@("PAR","OPT"),1:1)
 
 K INTERV,INTERV1,INTERV2,RESUL,TAB1,ERR,MES
 Q:TYP=1
 S ABC2=$S($D(@GH@("PAR","ABC2")):@GH@("PAR","ABC2"),1:ABC)
 S OPTH2=$S($D(@GH@("PAR","OPT2")):@GH@("PAR","OPT2"),1:OPTH)
 
 Q

