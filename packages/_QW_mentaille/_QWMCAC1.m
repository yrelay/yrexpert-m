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
;! HL001 ! HL     ! 01/01/01 ! Erreur %GTM-E-INVCMD -> $ZT="G ..."            !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%QWMCAC1^INT^1^59547,73886^0
QWMCAC1 ;
 
 
 
 
 
 
 
 
 
PRODUC(ADRET) 
 N %REP,%IND,REGMC,GCOMP,ICOND,TYPDIA,ERR,PILE,LEVEL,TEMP,ASC,%ASC
 N GREL,IBUT,OKB
 
 S $ZT="G PROD2^%QWMCAC1"
 S OKB=1 F IBUT=1:1:@WWBUT I @(@WWBUT@(IBUT,"E")_"=0")  S OKB=0 Q
 S $ZT="" I OKB&(@WWBUT'=0) G BUTROUV^%QWMCACS
PROD2 S $ZT="G ERREF^%QWMCAC1"
 I @(REFUSMNP)  S $ZT="" G AFREFUS^%QWMCACS
ERREF S $ZT=""
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T")
 S ASC=$$CONCAS^%QZCHAD(TEMP,"ASC")
 S GREL="^[QUI]RQSDON(""QW"",""CD"")"
 
 
 S @WWSTEP@(ISTP,"CYCLE")=0
 I '($$TSTBCL^%QWCYCLE(ISTP,IH)) G U
 I '($$BOUCLE^%QWCYCLE(ISTP-1,"BADSTEP")) G U
 F %STP=0:0 Q:ISTP=BADSTEP  D RECUSE^%QWMCACS
 S @WWSTEP@(ISTP,"CYCLE")=1
 S @ADRET="NEXREG^%QWAC" Q
 
 
 
U S DOMCOUR=DOMEX,%ASC=0
UBCDOM S GDOM="^[QUI]RQSDON(""QW"",""CMC"","""_DOMCOUR_""")"
 S REGMC=""
UNXREG S REGMC=$O(@GDOM@(REGMC)) G:REGMC="" UNXDOM
 S GCOMP=$$CONCAS^%QZCHAD(GDOM,REGMC)
 G:$D(@GCOMP@("P"))>9 UNXREG
 
 G:$D(@GCOMP@("PM"))<10 @$$ACTION(DOMCOUR,REGMC)
 S ICOND=""
UNXCD S ICOND=$O(@GCOMP@("PM",ICOND)) G:ICOND="" UNXREG
 S ERR="",$ZT="G UERR^%QWMCAC1"
UTRAP I @(@GCOMP@("PM",ICOND,"E"))  S $ZT="" G @$$ACTION(DOMCOUR,REGMC)
UERR S ERR=$ZE,$ZT="" G:(ERR="")!($E(ERR,1,6)="<UNDEF") UNXCD G UTRAP
UNXDOM I DOMCOUR'="GENERAL" S DOMCOUR=^[QUI]RQSDON("QW","CD",DOMCOUR,"PERE"),@ASC@(%ASC)=DOMCOUR,%ASC=%ASC-1 G UBCDOM
 
 
 S %REP=""
DNXREP S %REP=$O(@WWSTOCK@(%REP)) G:%REP="" CONT^%QWMCACS
 S %IND=""
DNXIND S %IND=$O(@WWSTOCK@(%REP,%IND)) G:%IND="" DNXREP
 S %ASC=""
D1 S %ASC=$O(@ASC@(%ASC)) G:%ASC="" D2
 S DOMCOUR=@ASC@(%ASC)
 I $$EVAL^%QWDMAC(%REP,%IND,DOMCOUR)<1 G DNXIND
 S RES=$$EVALMC(%REP,%IND,DOMCOUR) G:RES'="" @RES
 G D1
D2 
 
 
 S DOMCOUR=DOMEX,LEVEL=1
CONS 
 
 I $$EVAL^%QWDMAC(%REP,%IND,DOMCOUR)<1 G CONS05
 S RES=$$EVALMC(%REP,%IND,DOMCOUR) G:RES'="" @RES
 I $D(^[QUI]RQSDON("QW","CD",DOMCOUR,"FILS")) G CONS11
CONS05 S LEVEL=LEVEL-1
 
 I LEVEL<1 G DNXIND
 S PERCOUR=PILE(LEVEL)
 S DOMCOUR=$O(@GREL@(PERCOUR,"FILS",DOMCOUR))
 I DOMCOUR="" S DOMCOUR=PERCOUR G CONS05
 G CONS
CONS11 
 S PILE(LEVEL)=DOMCOUR
 S LEVEL=LEVEL+1
 S DOMCOUR=$O(@GREL@(DOMCOUR,"FILS",""))
 G CONS
 
 
 
 
EVALMC(REP,IND,DOMCOUR) 
 S GDOM="^[QUI]RQSDON(""QW"",""CMC"","""_DOMCOUR_""")"
 S REGMC=""
PNXREG S REGMC=$O(@GDOM@(REGMC)) Q:REGMC="" ""
 S GCOMP=$$CONCAS^%QZCHAD(GDOM,REGMC)
 
 
PCDS G:$D(@GCOMP@("P"))<10 PNXREG
 S ICOND=""
PNXCDS S ICOND=$O(@GCOMP@("P",ICOND)) G:ICOND="" PNXREG
 S ERR="",$ZT="G PCDSE^%QWMCAC1"
PCDSF I @(@GCOMP@("P",ICOND,"E"))  S $ZT="" G PCDM
PCDSE S ERR=$ZE,$ZT="" G:(ERR="")!($E(ERR,1,6)="<UNDEF") PNXCDS G PCDSF
 
 
PCDM I $D(@GCOMP@("PM"))<10 Q $$ACTION(DOMCOUR,REGMC)
 S ICOND=""
PNXCDM S ICOND=$O(@GCOMP@("PM",ICOND)) G:ICOND="" PNXREG
 S ERR="",$ZT="G PCDME^%QWMCAC1"
PCDMF I @(@GCOMP@("PM",ICOND,"E"))  S $ZT="" Q $$ACTION(DOMCOUR,REGMC)
PCDME S ERR=$ZE,$ZT="" G:ERR="" PNXCDM G PCDMF
 
 
ACTION(DOM,REG) 
 N IACT,VERBE,%V,RES
 S IACT=""
 S IACT=$O(^[QUI]RQSGLO("QW","MC",DOM,REG,3,IACT))
 S VERBE=^[QUI]RQSDON("QW","CMC",DOM,REG,"R",^[QUI]RQSGLO("QW","MC",DOM,REG,3,IACT,"LCODE"))
 F %V="SAVRETRY","RETRY","SAVSTOP","STOP","CONT","SAVCONT" I %V=VERBE S RES=%V_"^%QWMCACS"
 I VERBE="DIALO" S TYPDIA="PROD",RES="DIALO^%QWMCACS"
 Q RES

