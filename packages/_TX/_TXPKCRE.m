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

;%TXPKCRE^INT^1^59547,74032^0
%TXPKCRE ;;02:22 PM  21 Jan 1993; 08 Jan 93  4:47 PM ; 18 Feb 93  4:27 PM
 
 
 
 
 
CREERET(LISART,NBPERIOD,DATDEPAR) 
 N ETUDE,ARTICLE,ATELIER,AVORT
 N REPART,REPATE,REPDMD,ART,ATE,GLOATEL,IPERIO,DEM,%DEM
 N CORRESP,T,ATTm,ATTM
 N etu,CTG,ARB,ctglob,etuat,etuatg,etuatc,etuatcg,etuatag,etuata,SOL,PRD,prd,dmd,demd,QMINC,QMAXC,RMINC,RMAXC,QMINP,QMAXP,RMINP,RMAXP,QMINCO,QMAXCO,RMINCO,RMAXCO
 
 D INIVAR^%TXPETU
 
1 
 S CORRESP=$$TEMP^%SGUTIL
2 F T=1:1:NBPERIOD S @CORRESP@(T)=$$CALPERD(T,DATDEPAR)
 S AVORT=0,VALEUR=""
 S REPART=$$NOMINT^%QSF("ARTICLE")
 S REPATE=$$NOMINT^%QSF("STATION.DE.PRODUCTION")
 S REPDMD=$$NOMINT^%QSF("DEMANDE")
 S ETUDE=$$GEN^%QCAPOP("TXP")
 S PMAX=NBPERIOD
 D INIETU
 S GLOATEL=$$TEMP^%SGUTIL
 S REPART=$$NOMINT^%QSF("ARTICLE")
 S REPATE=$$NOMINT^%QSF("STATION.DE.PRODUCTION")
 S ART=""
NXART S ART=$$SUIVL^%QS0XG1(LISART,ART)
 G:ART="" TRTATE
 S ATE=$$^%QSCALVA(REPART,ART,"SE.FABRIQUE.A")
 
 G:ATE="" NXART
 S @GLOATEL@(ATE,ART)=""
 
 S DMD=""
NXDMD S DMD=$$NXTRIAO^%QSTRUC8(REPART,ART,"DEMANDE.DE.ARTICLE",DMD) G:DMD="" NXART
 
 
 S IPERIO=$$CALPERI($$^%QSCALIN("DEMANDE",DMD,"DATE.DEMANDEE",1),DATDEPAR,NBPERIOD)
 
 G:IPERIO=-1 NXDMD
 S @GLOATEL@(ATE,ART,IPERIO)=DMD G NXDMD
 
CALPERI(DATDMD,DATDEPAR,NBPERIO) 
 Q DATDMD
CALPERD(IPERIO,DATDEPAR) 
 Q IPERIO
 
 
TRTATE S ATELIER=""
ATEL2 S ATELIER=$O(@GLOATEL@(ATELIER)) Q:ATELIER="" ETUDE
 
 
 D INIATE
 S ARTICLE=""
ASUIV S ARTICLE=$O(@GLOATEL@(ATELIER,ARTICLE)) G:ARTICLE="" FINATE D CREERART
 G ASUIV
FINATE 
 
 
 D CONTATT^%TXPKCR1
 
 G ATEL2
 
 
 
CREERART 
 N REP,IND,DEM,%D
 D INIART
 S %D=0
BCLDMD S %D=%D+1 G:%D>NBPERIOD CT
 
 I '($D(@GLOATEL@(ATELIER,ARTICLE,%D))) S @dmd@("Periode "_%D)=0 G BCLDMD
 S @dmd@("Periode "_%D)=$$GET(REPDMD,@GLOATEL@(ATELIER,ARTICLE,%D),"QUANTITE.DEMANDEE",0)
 G BCLDMD
 
CT D CTSTO^%TXPKCR1
 D CTPRD^%TXPKCR1
 Q
 
 
 
GET(REP,IND,ATT,VDEF) 
 N VAL
 S VAL=$$^%QSCALIN(REP,IND,ATT,1)
 Q:VAL'="" VAL Q VDEF
 
 
 
INIETU 
 D INIETU^%TXPKNO2
 Q
 
 
INIATE 
 D INIATE^%TXPKNO2
 Q
 
 
INIART 
 D INIART^%TXPKNO2
 Q
 ;

