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
;! HL002 ! HL     ! 26/08/12 ! ZN n'existe par pour GTM                       !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%UTSTCD2^INT^1^59547,74033^0
%UTSTCD2 ;;08:49 PM  18 Jan 1996; ; 08 Oct 93  9:08 AM
 
CONST(QUI,WHOIS,PATH) 
 
 
 
 
 S WHOIS("ETUDE")=0
 S LIS=$$CRELIS^%UTSTCD2("CONSTANTES")
 S IND="" F %I=0:0 S IND=$$NXTRI^%QSTRUC8("CONSTANTES",IND) Q:IND=""  D AJOUT^%QS0XG1(LIS,IND)
 S OK=$$ARCHIDON^%SGPDOU(LIS,"",1,PATH_"CONST.IND","sauvegarde automatique (constantes)")
 D ELIML^%QS0XG1(LIS)
 Q
 
 
SAISIE(QUI,WHOIS,PATH) 
 
 
 S WHOIS("ETUDE")=0
 S LIS=$$CRELIS^%UTSTCD2("SAISIE.I")
 S IND="" F %I=0:0 S IND=$$NXTRI^%QSTRUC8("SAISIE.I",IND) Q:IND=""  D AJOUT^%QS0XG1(LIS,IND)
 S OK=$$ARCHIDON^%SGPDOU(LIS,"",1,PATH_"SAISIE.IND","sauvegarde automatique (saisies interactives)")
 D ELIML^%QS0XG1(LIS)
 Q
 
 
CONFIG(QUI,WHOIS,PATH) 
 
 
 S WHOIS("ETUDE")=0
 S LIS=$$CRELIS^%UTSTCD2("TRAITEMENT")
 S IND="c." F %I=0:0 S IND=$$NXTRI^%QSTRUC8("TRAITEMENT",IND) Q:IND=""  Q:$E(IND,1,2)'="c."  D AJOUT^%QS0XG1(LIS,IND)
 S OK=$$ARCHIDON^%SGPDOU(LIS,"",1,PATH_"CONFIG.IND","sauvegarde automatique (config)")
 D ELIML^%QS0XG1(LIS)
 Q
 
ATTDATE(QUI,WHOIS,PATH) 
 
 
 
 S WHOIS("ETUDE")=0
 S LIS=$$CRELIS^%UTSTCD2("ATTRIBUT")
 S IND="" F %I=0:0 S IND=$$NXTRI^%QSTRUC8("ATTRIBUT",IND) Q:IND=""  I $$^%QSCALIN("ATTRIBUT",IND,"TYPE",1)="DATE" D AJOUT^%QS0XG1(LIS,IND)
 S OK=$$ARCHIDON^%SGPDOU(LIS,"",1,PATH_"attdate.IND","sauvegarde automatique (attribut date)")
 D ELIML^%QS0XG1(LIS)
 Q
 
 
 
 
DEMO 
 
 S WHOIS("ETUDE")=0
 S (QUI,WHOIS)=PSAT
 D OUT^%QMEXARC("DEMO.INJECTION","c:\livrdgi\DEMO.ard","c:\livrdgi\DEMO.arc","c:\livrdgi\DEMO.ar2")
 K @(EMOD),@(EFOR),@(EPSV),@(EPRD),@(ERQS),@(EMSQ),@(ETTL)
 
 
 S (QUI,WHOIS)=PKERN
 S TRT="DEMO."
 F %T=0:0 S TRT=$O(^[QUI]RQSDON("PRED",TRT)) Q:TRT=""  Q:$E(TRT,1,5)'="DEMO."  S @EPRD@(TRT)=""
 S NFIC="c:\livrdgi\preddemo.arc"
 S COM="sauvegarde auto pour dgi "_$H
 S MES=""
 S (QUI,WHOIS)=PKERN
 W $$FILE^%SGPKOUT(NFIC,ETTL,EMOD,EFOR,ERQS,EPSV,EMSQ,EPRD,1,COM,0,.MES) K @(EMOD),@(EFOR),@(EPSV),@(EPRD),@(ERQS),@(EMSQ),@(ETTL)
 
 
 
 
 
 
 S (QUI,WHOIS)=PSAT
 S LIS=$$CRELIS^%UTSTCD2("ARTICLE")
 S IND="DEMO." F %I=0:0 S IND=$$NXTRI^%QSTRUC8("ARTICLE",IND) Q:IND=""  Q:$E(IND,1,5)'="DEMO."  D AJOUT^%QS0XG1(LIS,IND)
 S OK=$$ARCHIDON^%SGPDOU(LIS,"*",3,"C:\LIVRDGI\ARTDEMO.IND","sauvegarde automatique (articles)")
 D ELIML^%QS0XG1(LIS)
 
 
 
 
 
 S (QUI,WHOIS)=PSAT
 S LIS=$$CRELIS^%UTSTCD2("SOUS.ENSEMBLE")
 S IND="DEMO." F %I=0:0 S IND=$$NXTRI^%QSTRUC8("SOUS.ENSEMBLE",IND) Q:IND=""  Q:$E(IND,1,5)'="DEMO."  D AJOUT^%QS0XG1(LIS,IND)
 S OK=$$ARCHIDON^%SGPDOU(LIS,"*",3,"C:\LIVRDGI\SSDEMO.IND","sauvegarde automatique (sous ensembles)")
 D ELIML^%QS0XG1(LIS)
 
 Q
 
 
CRELIS(BASE) 
 N LIS,ADRESSE
 S LIS=$$GEN^%QCAPOP("TMP")
 S ADRESSE="^[QUI]RQS2("""_LIS_""",""OBJET"")"
 D CREERL^%QS0XG1(LIS,BASE,ADRESSE,"TEMPORAIRE","TEMPORAIRE")
 Q LIS
 
OKPAR(PAR) 
 S $ZT="NOKPAR^%UTSTCD2"
 ;HL002 ZN PAR
 S ZN=$$ZGBLDIR^%GTM(PCOUR)
 ;HL002 S $ZT="" ZN $$PCONF^%INCASTS("PROG") Q 1
 S $ZT="" S ZN=$$ZGBLDIR^%GTM($$PCONF^%INCASTS("PROG")) Q 1
;HL002 NOKPAR S $ZT="" ZN $$PCONF^%INCASTS("PROG") Q 0
NOKPAR S $ZT="" S ZN=$$ZGBLDIR^%GTM($$PCONF^%INCASTS("PROG")) Q 0
 
 
INIQUI(QUI) 
 L
 D INT^%DIR,CURRENT^%IS,VARSYS^%QCSAP
 D INITSESS^%SYSUTI1
 D STANDONE^%VTOZE("ATTENTE")
 D ^%SGGLOB
 D NETJOB^%SGNETMZ($J),CLEAR^%SYSUTI1
 D INIT^%SGVAR,INITREM^%QZCHW,REMCTR^%SYSCLAV
 D INIT^%SYSSEMA(QUI)
 Q
 ;

