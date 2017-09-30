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

;%TXPKNO3^INT^1^59547,74032^0
%TXPKNO3 ;;04:33 PM  17 Sep 1993; 08 Jan 93  4:47 PM ; 23 Sep 93  9:16 AM
 
 
 
 
CREERET() 
 N ETUDE,ARTICLE,ATELIER
 N REPDMD,ART,ATE,GLOATEL,IPERIO,DEM,%DEM
 N CORRESP,T,ATTm,ATTM
 N etu,CTG,ARB,ctglob,etuat,etuatg,etuatc,etuatcg,etuatag,etuata,SOL,PRD,prd,dmd,demd,QMINC,QMAXC,RMINC,RMAXC,QMINP,QMAXP,RMINP,RMAXP,QMINCO,QMAXCO,RMINCO,RMAXCO
 N REGICAL,TDEM
 
 S TDEM=$$TEMP^%SGUTIL
 S GLOATEL=$$TEMP^%SGUTIL
 
 
 D INIVAR^%TXPETU
 
 S VALEUR=""
 S REPDMD=$$NOMINT^%QSF("DEMANDE")
 S ETUDE=$$GEN^%QCAPOP("TXP")
 S REPART=$$NOMINT^%QSF("ARTICLE")
 S REPATE=$$NOMINT^%QSF("STATION.DE.PRODUCTION")
 S ART="" F %I=0:0 S ART=$$SUIVL^%QS0XG1(LISART,ART) Q:ART=""  S ATE=$$^%QSCALVA(REPART,ART,"SE.FABRIQUE.A") I ATE'="" S @GLOATEL@(ATE,ART)=""
 
 S ATELIER=""
ATEL2 S ATELIER=$O(@GLOATEL@(ATELIER)) G:ATELIER="" FINETU
 S REGICAL=$$^%QSCALIN(REPATE,ATELIER,"REGIME.CALENDAIRE",1)
 
 
 
 S NBPERIOD=0
 
 
 S PREMPERI=$$PERIODE^%QMDRUTP(REGICAL,DATREF,DATDEPI)
 S MAXPERI=PREMPERI+NBPERMAX
 S @PREMPERA@(ATELIER)=PREMPERI
 
 S ARTICLE=""
 
ASUIV S ARTICLE=$O(@GLOATEL@(ATELIER,ARTICLE)) G:ARTICLE="" ASUIV2 D DEMART G ASUIV
 
 
ASUIV2 S ARTICLE=$O(@GLOATEL@(ATELIER,ARTICLE)) G:ARTICLE="" FINAT2 D CREERART G ASUIV2
 
FINAT2 
 
 
 D INIATE^%TXPKNO2
 S @NBPTOT@(ATELIER)=NBPERIOD,@NBPATE@(ATELIER)=NBPERIOD
 I NBPERIOD>@NBPTOT S @NBPTOT=NBPERIOD,@NBPATE=NBPERIOD
 
 I NBPERIOD=0 K @(etuat) G ATEL2
 S @etuat@("Nombre de Periodes")=NBPERIOD
 
 D CONTATT^%TXPKCR1
 
 G ATEL2
 
FINETU 
 S PMAX=NBPERIOD
 D INIETU^%TXPKNO2
 Q ETUDE
 
 
CREERART 
 N REP,IND,DEM,%D,I
 D INIART^%TXPKNO2
 S @GETUPK@("racine",ARTICLE)=""
 S @GETUPK@("etudie",ARTICLE,ETUDE)=""
 F I=1:1:NBPERIOD I '($D(@dmd@("Periode "_I))) S @dmd@("Periode "_I)=0
 D CTSTO^%TXPKCR1
 D CTPRD^%TXPKCR1
 Q
 
 
 
 
 
 
DEMART K @(TDEM)
 
 
 
 
 
 S DATDEM=DATDEP
 S DEM=$$^%QSCALIN(REPART,ARTICLE,"QUANTITE.DEMANDEE",DATDEP)
 S:DEM="" DEM=0 D REP
NXX S DATDEM=$$NXTRIAO^%QSTRUC8(REPART,ARTICLE,"QUANTITE.DEMANDEE",DATDEM) G:DATDEM="" FREP1 G:DATDEM>DATFIN FREP1
 S DEM=$$^%QSCALIN(REPART,ARTICLE,"QUANTITE.DEMANDEE",DATDEM)
 D REP
 G NXX
 
 
FREP1 
 S IPER="" F %IPER=0:0 S IPER=$O(@TDEM@(IPER)) Q:IPER=""  S @demd@(IPER-PREMPERI)=@TDEM@(IPER),@dmd@("Periode "_(IPER-PREMPERI))=@TDEM@(IPER)
 S DERPERI=$ZP(@TDEM@("")) I (DERPERI-PREMPERI)>NBPERIOD S NBPERIOD=DERPERI-PREMPERI
 Q
 
 
 
 
REP 
 N PP
 
 S DINT=$P($$^%QMDAINT(DATDEM,3),",")_","_HECH
 
 S PERI=$$DERPERI^%QMDRUTP(REGICAL,DATREF,DINT)
 
 
 S NBPREPA=$$COMBIEN^%TXPKCO(REGICAL,DINT)
 
 
 D MKVREP^%TXPKCO(NBPREPA)
 
 S TOT=0
 F IBP=1:1:NBPREPA S VAL=$P(DEM*VREP(IBP),"."),PP=(PERI-NBPREPA)+IBP Q:PP>MAXPERI  S:PP<PREMPERI PP=PREMPERI S @TDEM@(PP)=$S('($D(@TDEM@(PP))):VAL,1:@TDEM@(PP)+VAL),TOT=TOT+VAL
 
 S:(TOT'=DEM)&(PERI'>MAXPERI) @TDEM@(PERI)=(@TDEM@(PERI)+DEM)-TOT
 
 
 
 Q
 ;

