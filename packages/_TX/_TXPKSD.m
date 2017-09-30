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

;%TXPKSD^INT^1^59547,74032^0
%TXPKSD ;;04:01 PM  26 Jan 1993; 08 Jan 93  4:47 PM ; 11 Jan 93  4:43 PM
 
 
 
 
 
SAISDEM(LISART,NBPERIOD) 
 N ART,%ART
 S ART=""
 F %ART=0:0 S ART=$$SUIVL^%QS0XG1(LISART,ART) Q:ART=""  D DEM(ART,NBPERIOD)
 Q
 
 
 
 
 
 
DEM(ART,NBPERIOD) 
 N REPART,REPATE,REPDMD,ATE,IPERIO,DEM
 N EXIDEM,ALLDEM,PMAX,I,PER,RCR,MSG
 
 S EXIDEM=$$TEMP^%SGUTIL
 
 S ALLDEM=$$TEMP^%SGUTIL
 
 S PMAX=NBPERIOD
 S REPART=$$NOMINT^%QSF("ARTICLE"),REPDMD=$$NOMINT^%QSF("DEMANDE")
 S REPATE=$$NOMINT^%QSF("STATION.DE.PRODUCTION")
 F I=1:1:NBPERIOD S @ALLDEM@(I)=0
 
 S DMD=""
NXDMD S DMD=$$NXTRIAO^%QSTRUC8(REPART,ART,"DEMANDE.DE.ARTICLE",DMD) G:DMD="" SAISIE
 
 
 S IPERIO=$$^%QSCALIN("DEMANDE",DMD,"DATE.DEMANDEE",1)
 
 G:IPERIO="" NXDMD G:IPERIO>NBPERIOD NXDMD
 S @ALLDEM@(IPERIO)=$$^%QSCALIN(REPDMD,DMD,"QUANTITE.DEMANDEE",1)
 S @EXIDEM@(IPERIO)=DMD
 G NXDMD
 
 
SAISIE 
 D DEMART
STOCK 
 
 S ATEL=$$^%QSCALVA(REPART,ART,"SE.FABRIQUE.A")
 S PER=""
STOPER S PER=$O(@ALLDEM@(PER)) G:PER="" FIN
 I '($D(@EXIDEM@(PER))) G STOPER2
 S DMD=@EXIDEM@(PER) D PA^%QSGESTI(REPDMD,DMD,"QUANTITE.DEMANDEE",@ALLDEM@(PER),1)
 G STOPER
STOPER2 I @ALLDEM@(PER)=0 G STOPER
 
 
 S DMD=$$GEN^%QCAPOP("DMD")
 S RCR=$$CREER^%QSGEIND(REPDMD,DMD,"",1,.MSG)
 D PA^%QSGESTI(REPDMD,DMD,"DATE.DEMANDEE",PER,1)
 D PA^%QSGESTI(REPDMD,DMD,"QUANTITE.DEMANDEE",@ALLDEM@(PER),1)
 D ADDS^%QSGES26(REPDMD,DMD,"REQUIS.PAR",REPATE,ATEL)
 D ADDS^%QSGES26(REPART,ART,"DEMANDE.DE.ARTICLE",REPDMD,DMD)
 G STOPER
 
FIN 
 K @(EXIDEM),@(ALLDEM)
 Q
 
 
 
 
DEMART N GLOB,GLODEFA,NBC,NBFIXH,NBFIXB
 S GLOB=ALLDEM
 S @GLOB@("Valeur Standard")=0
 S GLODEFA=$$TEMP^%SGUTIL
 S TITRE=" demandes de "_ART
 
 S NBC=10,NBFIXH=0,NBFIXB=0
 
 S @GLODEFA@("ROULIB")="$$vstodar^%TXPKSD"
 S @GLODEFA@("ROUDEF")="$$vdefdar^%TXPKSD"
 S @GLODEFA@("ROUAFF")="$$vaffdar^%TXPKSD"
 D SAISVAL^%TXPSUT2(GLOB,GLODEFA,TITRE,NBC,NBFIXH,NBFIXB,PMAX)
 Q
 
 
vstodar(i) Q i
vdefdar(I) N V
 I I=1 S V=@GSUIV@("Valeur Standard") Q V
 I $D(VAR(I-1)),$D(@GSUIV@(VAR(I-1))) S V=@GSUIV@(VAR(I-1)) Q V
 S V=@GSUIV@("Valeur Standard") Q V
 
vaffdar(i) Q "Periode "_i
 ;

