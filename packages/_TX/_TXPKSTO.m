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

;%TXPKSTO^INT^1^59547,74032^0
%TXPKSTO ;;04:52 PM  22 Sep 1993; 09 Feb 93  3:11 PM ; 23 Sep 93  9:16 AM
 
 
 
 
 
 
 N NOLEAF,OLDVAL,ECPROD,MODIPROD,MODIATT,OLDPRD
 S NBP=@NBPTOT
 S OLDPRD=$$TEMP^%SGUTIL
 
 D COPETDEL
 S AT=""
N2 S AT=$O(@OLDPRD@(AT)) Q:AT=""
 S REGI2=$$^%QSCALIN(REPATE,AT,"REGIME.CALENDAIRE",1)
 S:REGI2="" REGI2="STANDARD"
 S:'($D(PREMPERI(REGI2))) PREMPERI(REGI2)=$$PERIODE^%QMDRUTP(REGI2,DATREF,DATDEPI)
 S:'($D(@PREMPERA@(AT))) @PREMPERA@(AT)=PREMPERI(REGI2)
 S IPD=@PREMPERA@(AT)
 S MODIATT=0
 S AR="" F %R=0:0 S AR=$O(@OLDPRD@(AT,AR)) Q:AR=""  D ST2
 D PA^%QSGESTI("STATION.DE.PRODUCTION",AT,"PLAN.DE.PRODUCTION.MIS.A.JOUR",$S(MODIATT:"OUI",1:"NON"),1)
 G N2
 
 
ST2 S JALON=0
 S NOLEAF=$$AIR^%QSGE5("ARTICLE",AR,NOMLIEN)
 S BB="" F %BB=0:0 S BB=$$NXTRIAO^%QSTRUC8("ARTICLE",AR,NOMLIEN,BB) Q:BB=""  S NOML=$$NOML1^%QSGES20(AR,BB,NOMLIEN,BB),JJ=$$^%QSCALIN(REPLIEN,NOML,"JALON",1) S:JJ>JALON JALON=JJ
 S JALON=$S(JALON=0:0,1:JALON-1)
 
 
 S qc=$$^%QSCALIN(REPART,AR,"CAPACITE.D.UN.CONTENEUR",1)
 S:qc="" qc=250
 
 S STOCKENC=($$^%QSCALIN(REPATE,AT,"STOCK.EN.COURS",AR)\qc)*qc
 S:STOCKENC<0 STOCKENC=0
 
 
 
 
 
 
 S MODIPROD=0
 S T=0
STX2 S T=T+1 G:T>NBP STXFIN
 S ECPROD=$D(@GPRODG@(AT,AR,T))
 S OLDVAL=@OLDPRD@(AT,AR,T)
 I '(ECPROD) S:(OLDVAL'=0)&(OLDVAL'="") MODIPROD=1 G STX2
 S VPROD=@GPRODG@(AT,AR,T,"PROD")
 I VPROD'=(OLDVAL+0) S MODIPROD=1
 S PRDPROPA=$S(STOCKENC>VPROD:0,1:VPROD-STOCKENC)
 D PA^%QSGESTI(REPART,AR,"PRODUCTION",VPROD,(T+IPD)-1)
 D PA^%QSGESTI(REPART,AR,"STOCK.FIN.DE.PRODUCTION",@GSTOCK@(AT,AR,"SORTIE",T),(T+IPD)-1)
 I NOLEAF D PA^%QSGESTI(REPART,AR,"MISE.EN.PRODUCTION",PRDPROPA,((T+IPD)-1)-JALON)
 S STOCKENC=STOCKENC-PRDPROPA
 S:STOCKENC<0 STOCKENC=0
 G STX2
 
STXFIN 
 D PA^%QSGESTI(REPART,AR,"PLAN.DE.PRODUCTION.MIS.A.JOUR",$S(MODIPROD:"OUI",1:"NON"),1)
 S:MODIPROD MODIATT=1
 Q
 
COPETDEL 
 N FILE,AR,%A,VU
 S FILE=$$TEMP^%SGUTIL
 S VU=$$TEMP^%SGUTIL
 S @FILE=0
 S AR="" F %A=0:0 S AR=$$SUIVL^%QS0XG1(LISART,AR) Q:AR=""  I $$IR^%QSGE5(REPART,AR),'($D(@VU@(AR))) S @FILE=@FILE+1,@FILE@(@FILE)=AR,@VU@(AR)="",STAT=$$^%QSCALVA("ARTICLE",AR,"SE.FABRIQUE.A") D CD
 S IFIL=""
NXI S IFIL=$O(@FILE@(IFIL)) G:IFIL="" COPFIN
 S ARTI=@FILE@(IFIL)
 S AR="" F %A=0:0 S AR=$$NXTRIAO^%QSTRUC8(REPART,ARTI,"COMPOSE.FABRICATION",AR) Q:AR=""  I '($D(@VU@(AR))) S @FILE=@FILE+1,@FILE@(@FILE)=AR,@VU@(AR)="",STAT=$$^%QSCALVA("ARTICLE",AR,"SE.FABRIQUE.A") D:STAT'="" CD
 G NXI
COPFIN K @(FILE),@(VU)
 Q
 
CD 
 S REGI2=$$^%QSCALIN(REPATE,STAT,"REGIME.CALENDAIRE",1)
 S:REGI2="" REGI2="STANDARD"
 S:'($D(PREMPERI(REGI2))) PREMPERI(REGI2)=$$PERIODE^%QMDRUTP(REGI2,DATREF,DATDEPI)
 S:'($D(@PREMPERA@(STAT))) @PREMPERA@(STAT)=PREMPERI(REGI2)
 S IPD=@PREMPERA@(STAT)
 F I=1:1:NBP S VAL=$$^%QSCALIN(REPART,AR,"PRODUCTION",(I+IPD)-1),@OLDPRD@(STAT,AR,I)=$S(VAL="":0,1:VAL)
 D PSV^%QSGESTI(REPART,AR,"PRODUCTION")
 D PSV^%QSGESTI(REPART,AR,"STOCK.FIN.DE.PRODUCTION")
 D PSV^%QSGESTI(REPART,AR,"MISE.EN.PRODUCTION")
 Q

