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

;%TXPKNO1^INT^1^59547,74032^0
%TXPKNO1 ;;08:47 AM  23 Sep 1993; 09 Feb 93 10:26 AM ; 23 Sep 93  9:15 AM
 
 
PLANIF(LISART,DATDEP,DATFIN,DATREF,NIVMAX) 
 D DEB^%SGMESU("TXP: plannification sur nomenclature")
 N INTERAC,NOMLIEN,GPRODG,GPRODL,GSTOCK,STOCKENC,VPROD,PRDPROPA
 N STOCKI,REPART,REPLIEN,REPATE,NBPERIOD,ETUDE,ATELIER,ARTICLE
 N BB,%BB,JJ,S,%S,GETUPK,OKPLAN
 N DATDEPI,PREMPERI,PREMPERA,NBPATE,NBPA,NBPTOT,HECH
 N NIVCOUR,NBPERMAX
 S PREMPERA=$$TEMP^%SGUTIL,NBPATE=$$TEMP^%SGUTIL,NBPTOT=$$TEMP^%SGUTIL
 S @NBPTOT=0
 S DATDEPI=$P($$^%QMDAINT(DATDEP,3),"/")
 S OKPLAN=1,INTERAC=0
 
 S HECH=((18*60)*60)+1
 
 
 S NBPERMAX=99999
 
 
 S GETUPK="^[QUI]RQSDON(""TPK"","""_$$GEN^%QCAPOP("TPK")_""")"
 S @GETUPK@("Date debut")=$$DATE^%QMDATE
 S @GETUPK@("Heure debut")=$$HEURE^%QMDATE
 S NOMLIEN="COMPOSE.FABRICATION"
 S GPRODG=$$TEMP^%SGUTIL,GPRODL=$$TEMP^%SGUTIL,GSTOCK=$$TEMP^%SGUTIL
 S REPLIEN=$$LIENI^%QSGEL3
 S REPART=$$NOMINT^%QSF("ARTICLE"),REPATE=$$NOMINT^%QSF("STATION.DE.PRODUCTION")
 S NIVCOUR=1
 
 S NBPERIOD=0
 D INIVAR^%TXPETU
 G:NIVMAX<1 FIN
 
 S ETUDE=$$CREERET^%TXPKNO3
 
 
BCLETU 
 D DEB^%SGMESU("TXP: activation TXP")
 D ACTIV^%TXPACTI(ETUDE)
 D FIN^%SGMESU("TXP: activation TXP")
 
 
 
 
 G:'($$RECUP^%TXPKNO4) IMPOSSI
 
 D SUPET^%TXPETU(ETUDE)
 
 
 S NIVCOUR=NIVCOUR+1 G:NIVCOUR>NIVMAX FIN
 
 
 
 S S=""
BCS1 S S=$O(@GPRODL@(S)) G:S="" NXNIV2 S A=""
BCS2 S A=$O(@GPRODL@(S,A)) G:A="" BCS1 S TOTDEM=0,t=""
BCS3 S t=$O(@GPRODL@(S,A,t)) I t="" K:TOTDEM=0 @GPRODL@(S,A) G BCS2
 S TOTDEM=TOTDEM+@GPRODL@(S,A,t,"PROD") G BCS3
 
 
 
 
NXNIV2 S NBPERIOD=0
 
 K @(NBPATE) S @NBPATE=0
 S ETUDE=$$GEN^%QCAPOP("TXP")
 S ARTIVU=0,S=""
NXS S S=$O(@GPRODL@(S)) I S="" G:ARTIVU=0 FIN G ETU
 S A=""
NXA S A=$O(@GPRODL@(S,A)) G:A="" NXS
 S ATX=$$^%QSCALVA(REPART,A,"SE.FABRIQUE.A")
 S REGI1=$$^%QSCALIN(REPATE,ATX,"REGIME.CALENDAIRE",1)
 S:REGI1="" REGI1="STANDARD"
 S:'($D(PREMPERI(REGI1))) PREMPERI(REGI1)=$$PERIODE^%QMDRUTP(REGI1,DATREF,DATDEPI)
 S:'($D(@PREMPERA@(ATX))) @PREMPERA@(ATX)=PREMPERI(REGI1)
 
 S JALON=0
 S BB="" F %BB=0:0 S BB=$$NXTRIAO^%QSTRUC8("ARTICLE",A,NOMLIEN,BB) Q:BB=""  S NOML=$$NOML1^%QSGES20(A,BB,NOMLIEN,BB),JJ=$$^%QSCALIN(REPLIEN,NOML,"JALON",1) S:JJ>JALON JALON=JJ
 S ARTICLE=""
DEART1 S ARTICLE=$$NXTRIAO^%QSTRUC8("ARTICLE",A,NOMLIEN,ARTICLE) G:ARTICLE="" NXA
 S ARTIVU=1
 S @GETUPK@("graphe",A,ARTICLE)="",@GETUPK@("etudie",ARTICLE,ETUDE)=""
 S ATELIER=$$^%QSCALVA("ARTICLE",ARTICLE,"SE.FABRIQUE.A")
 G:ATELIER="" DEART1
 S REGI2=$$^%QSCALIN(REPATE,ATELIER,"REGIME.CALENDAIRE",1)
 S:REGI2="" REGI2="STANDARD"
 S:'($D(PREMPERI(REGI2))) PREMPERI(REGI2)=$$PERIODE^%QMDRUTP(REGI2,DATREF,DATDEPI)
 S:'($D(@PREMPERA@(ATELIER))) @PREMPERA@(ATELIER)=PREMPERI(REGI2)
 S NOML=$$NOML1^%QSGES20(A,ARTICLE,NOMLIEN,ARTICLE),QUANTITE=$$^%QSCALIN(REPLIEN,NOML,"QUANTITE",1),NBPA=0
 S t=""
DEPER1 S t=$O(@GPRODL@(S,A,t))
 I t="" S:'($D(@NBPATE@(ATELIER))) @NBPATE@(ATELIER)=0 S:NBPA>@NBPATE@(ATELIER) @NBPATE@(ATELIER)=NBPA S:NBPA>@NBPATE @NBPATE=NBPA G DEART1
 S val=@GPRODL@(S,A,t,"PROD") G:val=0 DEPER1
 S DD=$$DATEDEB^%QMDRUTP(REGI1,DATREF,(t+PREMPERI(REGI1))-1)
 S PERI=$$PERIODE^%QMDRUTP(REGI2,DATREF,DD)
 
 
 
 S nxt=(PERI-PREMPERI(REGI2))-JALON
 I nxt<1 S nxt=1,OKPLAN=0
 S:nxt>NBPA NBPA=nxt
 S val=QUANTITE*val,pnxt="Periode "_nxt
 S @dmd@(pnxt)=$S('($D(@dmd@(pnxt))):val,1:@dmd@(pnxt)+val)
 G DEPER1
 
ETU D INIETU^%TXPKNO2
 S ATELIER=""
TRETU1 S ATELIER=$O(@etu@("AT",ATELIER)) G:ATELIER="" CNTETU
 D INIATE^%TXPKNO2
 S (NBPERIOD,@etuat@("Nombre de Periodes"))=@NBPATE@(ATELIER)
 S:'($D(@NBPTOT@(ATELIER))) @NBPTOT@(ATELIER)=NBPERIOD
 S:@NBPTOT@(ATELIER)<NBPERIOD @NBPTOT@(ATELIER)=NBPERIOD
 S:@NBPTOT<NBPERIOD @NBPTOT=NBPERIOD
 
 S ARTICLE=""
TRETU2 S ARTICLE=$O(@etu@("AT",ATELIER,"AR",ARTICLE)) G:ARTICLE="" TRETU1
 D INIART^%TXPKNO2
 
 S:$D(@GSTOCK@(ARTICLE,ATELIER,"INITIAL")) @etuata@("Stock Initial")=@etuata@("Stock initial")-@GSTOCK@(ARTICLE,ATELIER,"INITIAL")
 F t=1:1:NBPERIOD S:'($D(@dmd@("Periode "_t))) @dmd@("Periode "_t)=0
 G TRETU2
CNTETU 
 S ATELIER=""
QUCNT1 S ATELIER=$O(@etu@("AT",ATELIER)) G:ATELIER="" ACTETU
 S CONTRAINTE="CONTRAINTE"
 S ISCONT=1
 
 D:ISCONT CONTATT^%TXPKCR1
 S ARTICLE=""
QUCNT2 S ARTICLE=$O(@etu@("AT",ATELIER,"AR",ARTICLE)) G:ARTICLE="" QUCNT3
 D CTSTO^%TXPKCR1,CTPRD^%TXPKCR1
 
 
 S em="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""qm"")"
 S eM="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""qM"")"
 F %ii=1:1:NBPERIOD I $D(@GPRODG@(ATELIER,ARTICLE,%ii,"PROD")) S planif=@GPRODG@(ATELIER,ARTICLE,%ii,"PROD") I planif'=0 S @em@(%ii)=$S(@em@(%ii)<planif:0,1:@em@(%ii)-planif),@eM@(%ii)=@eM@(%ii)-planif
 
 S em="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""stm"")"
 S eM="^[QUI]etu(ETUDE,""AT"",ATELIER,""AR"",ARTICLE,""stM"")"
 F %ii=1:1:NBPERIOD I $D(@GSTOCK@(ATELIER,ARTICLE,"SORTIE",%ii)) S planif=@GSTOCK@(ATELIER,ARTICLE,"SORTIE",%ii) I planif'=0 S @em@(%ii)=$S(@em@(%ii)<planif:0,1:@em@(%ii)-planif),@eM@(%ii)=@eM@(%ii)-planif
 G QUCNT2
QUCNT3 
 
 G:'(ISCONT) QUCNT1
 S A="" F %A=0:0 S A=$O(@GPRODG@(ATELIER,A)) Q:A=""  F i=1:1:NBPERIOD S %ii=$S($D(@GPRODG@(ATELIER,A,i,"PRODH")):@GPRODG@(ATELIER,A,i,"PRODH"),1:0),@etuatc@("Periode "_i)=@etuatc@("Periode "_i)-$$SUP(%ii)
 G QUCNT1
SUP(x) Q (x\1)+((x#1)'=0)
 
ACTETU G BCLETU
 
FIN D ^%TXPKSTO
 D MARKFIN
 K @(GPRODG),@(GPRODL),@(GSTOCK)
 D FIN^%SGMESU("TXP: plannification sur nomenclature")
 Q OKPLAN
 
IMPOSSI 
 D MARKFIN
 K @(GPRODG),@(GPRODL),@(GSTOCK)
 D FIN^%SGMESU("TXP: plannification sur nomenclature")
 K @(GETUPK)
 Q 0
MARKFIN 
 S @GETUPK@("date fin")=$$DATE^%QMDATE,@GETUPK@("heure fin")=$$HEURE^%QMDATE Q

