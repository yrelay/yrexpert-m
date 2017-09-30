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

;%HXIHIT2^INT^1^59547,73869^0
HXIHIT2 ;
 
 
 
 
 
 
VISU(GL,HIS) 
 N TYPE,GH,L,AT,ATOT,FTOT,AR,AREG,FREG,NUM,PAS,ABC,GHS1,GHS2,OPTH,OPTH2,ABC2
 S GH=$$GSTO^%HXIHITU(GL,HIS)
 S TYPE=@GH@("TYPE")
 D VINIT(TYPE)
 G:TYPE=1 VIS1 G:TYPE=2 VIS2 G:TYPE=3 VIS3
 
VINIT(TYPE) 
 D MSG^%VZEATT($$^%QZCHW("Initialisations en cours"))
 S L=@GH@("PAR","LISTE")
 S AT=@GH@("PAR","TOT1"),AR=@GH@("PAR","REG1")
 S ATOT=@GH@("PARI","ATTOT1"),AREG=@GH@("PARI","ATREG1")
 S FTOT=@GH@("PARI","FTOT1"),FREG=@GH@("PARI","FREG1")
 I FTOT="" S FTOT="$$^%QSCALVA"
 I FREG="" S FREG="$$^%QSCALVA"
 S NUM=@GH@("PAR","NUM1"),ABC=@GH@("PAR","ABC"),PAS=@GH@("PAR","PAS1")
 S OPTH=$S($D(@GH@("PAR","OPT")):@GH@("PAR","OPT"),1:1)
 
 Q:TYPE=1
 S OPTH2=$S($D(@GH@("PAR","OPT2")):@GH@("PAR","OPT2"),1:OPTH)
 S ABC2=$S($D(@GH@("PAR","ABC2")):@GH@("PAR","ABC2"),1:ABC)
 
 Q
 
VISU1(GH) 
VIS1 S FTOT=$$CONCAT^%QZCHAD("A="_FTOT,"REP,IND,ATT")
 S FREG=$$CONCAT^%QZCHAD("A="_FREG,"REP,IND,ATT")
 S FSYN="$$ZSX^%HXYISTO"
 S FSYN=$$CONCAT^%QZCHAD("A="_FSYN,"APP,REP,ATT,VAL,.ER")
 S GH=$$GSTO^%HXIHITU(GH,"COL")
 K TYPE
 D VISU^%HXYISTO(L,AT,AR,NUM,PAS,"",FTOT,FREG,"",FSYN,"","","",ABC,OPTH,ATOT,AREG,GH,0,"","")
 Q
 
VISU3(GH) 
VIS3 N AT2,ATOT2,FTOT2
 S AT2=@GH@("PAR","TOT2"),ATOT2=@GH@("PARI","ATTOT2"),FTOT2=@GH@("PARI","FTOT2")
 S GH=$$GSTO^%HXIHITU(GH,"COL")
 S GHS1=$E(GH,1,$L(GH)-1)_",1)",GHS2=$E(GH,1,$L(GH)-1)_",2)"
 S FTOT=$$CONCAT^%QZCHAD("VALTOT="_FTOT,"REP,INDIV,ATOT")
 S FREG=$$CONCAT^%QZCHAD("VALREG="_FREG,"REP,INDIV,AREG")
 I FTOT2="" S FTOT2="$$^%QSCALVA"
 S FTOT2=$$CONCAT^%QZCHAD("VALTOT="_FTOT2,"REP,INDIV,ATOT2")
 K TYPE,GH
 D VISU^%HXIARSA(L,AT,AR,NUM,PAS,AT2,FTOT,FREG,FTOT2,ABC,OPTH,ATOT,AREG,ATOT2,ABC2,OPTH2,GHS1,GHS2,0,"","")
 Q
 
VISU2(GH) 
VIS2 N AR2,AREG2,NUM2,PAS2,FREG2
 S AR2=@GH@("PAR","REG2")
 S AREG2=@GH@("PARI","ATREG2"),FREG2=@GH@("PARI","FREG2")
 S NUM2=@GH@("PAR","NUM2"),PAS2=@GH@("PAR","PAS2")
 S FTOT=$$CONCAT^%QZCHAD("VALTOT="_FTOT,"REP,INDIVIDU,ATOT")
 S FREG=$$CONCAT^%QZCHAD("VALREG="_FREG,"REP,INDIVIDU,AREG")
 I FREG2="" S FREG2="$$^%QSCALVA"
 S FREG2=$$CONCAT^%QZCHAD("VALECL="_FREG2,"REP,INDIVIDU,AREG2")
 S GH=$$GSTO^%HXIHITU(GH,"COL")
 S GHS1=$E(GH,1,$L(GH)-1)_",1)",GHS2=$E(GH,1,$L(GH)-1)_",2)"
 K TYPE,GH
 D VISU^%HXISTOD(L,AT,AR,NUM,PAS,AR2,NUM2,PAS2,FTOT,FREG,FREG2,ATOT,AREG,AREG2,GHS1,GHS2,0,"",ABC,OPTH,ABC2,OPTH2,"")
 Q
 
IMPR(GL,HIS,SOR) 
 N TIT
 S TIT=""
 G IMPE
 
IMPRT(GL,HIS,SOR,TIT) 
IMPE N TYPE,GH,L,AT,ATOT,FTOT,AR,AREG,FREG,NUM,PAS,ABC,GHS1,GHS2,OPTH,ABC2,OPTH2
 S GH=$$GSTO^%HXIHITU(GL,HIS)
 S TYPE=@GH@("TYPE")
 D VINIT(TYPE)
 G:TYPE=1 IMP1 G:TYPE=2 IMP2 G:TYPE=3 IMP3
 
IMPR1(GH,SOR) 
IMP1 S FTOT=$$CONCAT^%QZCHAD("A="_FTOT,"REP,IND,ATT")
 S FREG=$$CONCAT^%QZCHAD("A="_FREG,"REP,IND,ATT")
 S FSYN="$$ZSX"
 S FSYN=$$CONCAT^%QZCHAD("A="_FSYN,"APP,REP,ATT,VAL,.ER")
 S GH=$$GSTO^%HXIHITU(GH,"COL")
 D VISU^%HXYISTO(L,AT,AR,NUM,PAS,"",FTOT,FREG,"",FSYN,"","","",ABC,OPTH,ATOT,AREG,GH,1,SOR,TIT)
 Q
 
IMPR3(GH,SOR) 
IMP3 N AT2,ATOT2,FTOT2
 S AT2=@GH@("PAR","TOT2"),ATOT2=@GH@("PARI","ATTOT2"),FTOT2=@GH@("PARI","FTOT2")
 S GH=$$GSTO^%HXIHITU(GH,"COL")
 S GHS1=$E(GH,1,$L(GH)-1)_",1)",GHS2=$E(GH,1,$L(GH)-1)_",2)"
 S FTOT=$$CONCAT^%QZCHAD("VALTOT="_FTOT,"REP,INDIV,ATOT")
 S FREG=$$CONCAT^%QZCHAD("VALREG="_FREG,"REP,INDIV,AREG")
 I FTOT2="" S FTOT2="$$^%QSCALVA"
 S FTOT2=$$CONCAT^%QZCHAD("VALTOT="_FTOT2,"REP,INDIV,ATOT2")
 D VISU^%HXIARSA(L,AT,AR,NUM,PAS,AT2,FTOT,FREG,FTOT2,ABC,OPTH,ATOT,AREG,ATOT2,ABC2,OPTH2,GHS1,GHS2,1,SOR,TIT)
 Q
 
IMPR2(GH,SOR) 
IMP2 N AR2,AREG2,NUM2,PAS2,FREG2
 S AR2=@GH@("PAR","REG2")
 S AREG2=@GH@("PARI","ATREG2"),FREG2=@GH@("PARI","FREG2")
 S NUM2=@GH@("PAR","NUM2"),PAS2=@GH@("PAR","PAS2")
 S FTOT=$$CONCAT^%QZCHAD("VALTOT="_FTOT,"REP,INDIVIDU,ATOT")
 S FREG=$$CONCAT^%QZCHAD("VALREG="_FREG,"REP,INDIVIDU,AREG")
 I FREG2="" S FREG2="$$^%QSCALVA"
 S FREG2=$$CONCAT^%QZCHAD("VALECL="_FREG2,"REP,INDIVIDU,AREG2")
 S GH=$$GSTO^%HXIHITU(GH,"COL")
 S GHS1=$E(GH,1,$L(GH)-1)_",1)",GHS2=$E(GH,1,$L(GH)-1)_",2)"
 D VISU^%HXISTOD(L,AT,AR,NUM,PAS,AR2,NUM2,PAS2,FTOT,FREG,FREG2,ATOT,AREG,AREG2,GHS1,GHS2,1,SOR,ABC,OPTH,ABC2,OPTH2,TIT)
 Q

