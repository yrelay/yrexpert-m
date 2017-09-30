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

;%SYSING1^INT^1^59547,73892^0
SYSING1 ;; ; 14 Nov 90  2:52 PM
 ;;               LISTE DE GLOBALS DE BASE
 ;;^ABDEJEV("z")="z"
 ;;^ADLJ("z")="z"
 ;;^ANSA("z")="z"
 ;;^BAPLAN("z")="z"
 ;;^CAPA("z")="z"
 ;;^CDLJ("z")="Z"
 ;;^CPTEUR("z")="z"
 ;;^CROSREF("z")="z"
 ;;^CYCLE("z")="z"
 ;;^DEFGROUP("z")="z"
 ;;^DESMACH("z")="z"
 ;;^DESMACHI("z")="z"
 ;;^DESOUT("z")="z"
 ;;^DLJ("z")="z"
 ;;^DLJCOND("z")="z"
 ;;^DLMACAP("z")="z"
 ;;^DLFLUX("z")="z"
 ;;^EDMOD("z")="z"
 ;;^EDFORMAT("z")="z"
 ;;^EDVERSI("z")="z"
 ;;^EVALGRIL("z")="z"
 ;;^FPLJ("z")="z"
 ;;^FLPLJ("z")="z"
 ;;^GRAPHE2("z")="z"
 ;;^GRILEROR("z")="z"
 ;;^GRILRESU("z")="z"
 ;;^GROUGRIL("z")="z"
 ;;^GRTYPN("z")="z"
 ;;^GRUPLET("z")="z"
 ;;^HISTOGR("z")="z"
 ;;^INTERGRI("z")="z"
 ;;^LXRAP("z")="z"
 ;;^MACAP("z")="z"
 ;;^MACAPD("z")="z"
 ;;^MACOP("z")="z"
 ;;^MOZ("z")="z"
 ;;^MOZART("z")="z"
 ;;^MOZGARDE("z")="z"
 ;;^MOZITEM("z")="z"
 ;;^MOZPARA("z")="z"
 ;;^OCGRIL("z")="z"
 ;;^OCUNIT("z")="z"
 ;;^PARAGRIL("z")="z"
 ;;^PART("z")="z"
 ;;^PBMANF("z")="z"
 ;;^PBMANM("z")="z"
 ;;^PBMANA("z")="z"
 ;;^PEXPMACH("z")="z"
 ;;^PLEX("z")="z"
 ;;^PLEXI("z")="z"
 ;;^PLEXP("z")="z"
 ;;^PLJALDEF("z")="z"
 ;;^PLCAHOJO("z")="z"
 ;;^PLCAJOFE("z")="z"
 ;;^PLCAREGI("z")="z"
 ;;^PLJSF("z")="z"
 ;;^PLPLACAL("z")="z"
 ;;^PRONUM("z")="z"
 ;;^PTPOSIT("z")="z"
 ;;^PTVERSI("z")="z"
 ;;^QSETAT("z")="z"
 ;;^QSETATP("z")="z"
 ;;^QSETATS("z")="z"
 ;;^ETAT("z")="z"
 ;;^QSLIENI("z")="z"
 ;;^QSVARACT("z")="z"
 ;;^QUERY1("z")="z"
 ;;^QUERY2("z")="z"
 ;;^QUERY3("z")="z"
 ;;^QUERY4("z")="z"
 ;;^QUERYH("z")="z"
 ;;^QUERYT("z")="z"
 ;;^QUERYY("z")="z"
 ;;^QX("z")="z"
 ;;^REFABAC("z")="z"
 ;;^RESUGRIL("z")="z"
 ;;^RQS1("z")="z"
 ;;^RQS2("z")="z"
 ;;^RQS3("z")="z"
 ;;^RQS4("z")="z"
 ;;^RQSATPR("z")="z"
 ;;^RQSAUTOR("z")="z"
 ;;^RQSDEFAU("z")="z"
 ;;^RQSDROIT("z")="z"
 ;;^RQSFILS("z")="z"
 ;;^RQSGLO("z")="z"
 ;;^RQSDON("z")="z"
 ;;^RQSILIEN("z")="z"
 ;;^RQSLIEN2("z")="z"
 ;;^RQSLIEN("z")="z"
 ;;^RQSMDL1("z")="z"
 ;;^RQSMDL2("z")="z"
 ;;^RQSMDL3("z")="z"
 ;;^RQSMDL4("z")="z"
 ;;^RQSMDL5("z")="z"
 ;;^RQSMOD("z")="z"
 ;;^RQSMOD1("z")="z"
 ;;^RQSMOD2("z")="z"
 ;;^RQSMOD3("z")="z"
 ;;^RQSMOD4("z")="z"
 ;;^RQSMOD5("z")="z"
 ;;^RQSMOD4L("z")="z"
 ;;^RQSMODIN("z")="z"
 ;;^RQSMODL1("z")="z"
 ;;^RQSMODL2("z")="z"
 ;;^RQSMODL3("z")="z"
 ;;^RQSMODL4("z")="z"
 ;;^RQSMODL5("z")="z"
 ;;^RQSNCLES("z")="z"
 ;;^RQSNOINT("z")="z"
 ;;^RQSNOLOG("z")="z"
 ;;^RQSPERE("z")="z"
 ;;^RQSQUAL("z")="z"
 ;;^TOLEX("z")="z"
 ;;^TOLEXS("z")="z"
 ;;^TOSYNONY("z")="z"
 ;;^TOLEXU("z")="z"
 ;;^TOUNIT("z")="z"
 ;;^TTL("z")="z"
 ;;^TLDIAL("z")="z"
 ;;^TLDIALF("z")="z"
 ;;^TLDIALI("z")="z"
 ;;^SCOMDOM("z")="z"
 ;;^SCOMPREG("z")="z"
 ;;^SCRC("z")="z"
 ;;^SDCOL("z")="z"
 ;;^SDCOND("z")="z"
 ;;^SDOBJ("z")="z"
 ;;^SDTEXT("z")="z"
 ;;^SDCOMP("z")="z"
 ;;^SDSYMBC("z")="z"
 ;;^SDSYMBO("z")="z"
 ;;^SDSYMBT("z")="z"
 ;;^SRTOK("z")="z"
 ;;^SRTNOK("z")="z"
 ;;^SSGRGRI("z")="z"
 ;;^SSGROUP("z")="z"
 ;;^STRUCT("z")="z"
 ;;^TORQYC("z")="z"
 ;;^ZLIGCALC("z")="z"
 ;;^ZLIGCOMP("z")="z"
 ;;^ZLIGDUPL("z")="z"
 ;;^ZLIGTRAP("z")="z"
 ;;^ZLIGTRAI("z")="z"
 ;;^ZLIGTRIE("z")="z"
 ;;^ZLIGVAL("z")="z"
 ;;^ZSYNINV("z")="z"
 ;;^ZSYNONY("z")="z"
 ;;^ZSYSMORE("z")="z"

