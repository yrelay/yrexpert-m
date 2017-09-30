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

;%UTSTCDT^INT^1^59547,74033^0
%UTSTCDT ;;09:43 AM  12 Oct 1993; ; 08 Oct 93  9:08 AM
 
 
 
 S LSELABA=$$TEMP^%SGUTIL,LSELART=$$TEMP^%SGUTIL
 
 D LIRE2^%VREAD("partition ","TXP",10,70,3,4,"","",.CTR,.YY1)
 Q:YY1=""
 S PKERN=YY1,PSAT=YY1
 I '($$OKPAR^%UTSTCD2(PKERN)) D ^%VZEAVT("partition ("_PKERN_") non montee") Q
 D INIQUI^%UTSTCD2(PKERN)
 S TRTECHNO=0
 
 
 
 
 S (QUI,WHOIS)=PSAT
 S NOMCLI=$$^%QSCALIN("CONSTANTE","DGI.CONSTANTES","PREFIXE.UTILISATEUR",1)
 S:NOMCLI="" NOMCLI=WHOIS
 D LIRE2^%VREAD("prefixe utilisateur ",NOMCLI,10,70,5,6,"","",.CTR,.YY1)
 S NOMCLI=YY1,LNOMCLI=$L(NOMCLI)
 
 S PATH="c:\LIVRTXP\"
 
 S EMOD=$$TEMP^%SGUTIL,EFOR=$$TEMP^%SGUTIL,EPSV=$$TEMP^%SGUTIL
 S EPRD=$$TEMP^%SGUTIL,ERQS=$$TEMP^%SGUTIL,EMSQ=$$TEMP^%SGUTIL
 S ETTL=$$TEMP^%SGUTIL,LISGLO=$$TEMP^%SGUTIL
 K @(EMOD),@(EFOR),@(EPSV),@(EPRD),@(ERQS),@(EMSQ),@(ETTL)
 
 
 D POCLEPA^%VVIDEO
 S AVECTRT=$$CONFIRM^%VZEOUI("svgde des traitements "_NOMCLI_".* ?")=1
 D POCLEPA^%VVIDEO
 S AVECREQ=$$CONFIRM^%VZEOUI("svgde des requetes "_NOMCLI_".* ?")=1
 D POCLEPA^%VVIDEO
 S AVECQUBK=$$CONFIRM^%VZEOUI("svgde des saisies multiples "_NOMCLI_".* ?")=1
 D POCLEPA^%VVIDEO
 S TRTECHNO=0
 
 
 S (QUI,WHOIS)=PKERN
 D OUT^%QMEXARC("TXP",PATH_"TXP.ard",PATH_"TXP.arc",PATH_"TXP.ar2")
 K @(EMOD),@(EFOR),@(EPSV),@(EPRD),@(ERQS),@(EMSQ),@(ETTL)
 
 
 G:'(AVECTRT) DEUXBIS
 S (QUI,WHOIS)=PKERN
 S TRT=NOMCLI I $D(^[QUI]TTL(TRT)) S @ETTL@(TRT)=""
 F %T=0:0 S TRT=$O(^[QUI]TTL(TRT)) Q:TRT=""  Q:$E(TRT,1,LNOMCLI)'=NOMCLI  S @ETTL@(TRT)=""
 
DEUXBIS 
 G:'(AVECREQ) DEUXTER
 S (QUI,WHOIS)=PKERN
 S TRT=NOMCLI I $D(^[QUI]RQS1(TRT)) S @ERQS@(TRT)=""
 F %T=0:0 S TRT=$O(^[QUI]RQS1(TRT)) Q:TRT=""  Q:$E(TRT,1,LNOMCLI)'=NOMCLI  S @ERQS@(TRT)=""
 
DEUXTER 
 
 S (QUI,WHOIS)=PKERN
 S TRT="" F %T=0:0 S TRT=$O(^[QUI]RQSGLO("SR","DEF",TRT)) Q:TRT=""  S @EMSQ@(TRT)=""
 S (QUI,WHOIS)=PKERN
 S TRT="" F %T=0:0 S TRT=$O(^[QUI]LKY2(TRT)) Q:TRT=""  S @EPSV@(TRT)=""
 
 
 S NFIC=PATH_"trtcompl.arc"
 S COM="sauvegarde auto pour txp "_$H
 S MES=""
 S (QUI,WHOIS)=PKERN
 W $$FILE^%SGPKOUT(NFIC,ETTL,EMOD,EFOR,ERQS,EPSV,EMSQ,EPRD,1,COM,0,.MES) K @(EMOD),@(EFOR),@(EPSV),@(EPRD),@(ERQS),@(EMSQ),@(ETTL)
 
 
 
 
 
 D CONST^%UTSTCD2(PSAT,PSAT,PATH)
 
 
 
 D SAISIE^%UTSTCD2(PKERN,PKERN,PATH)
 
 
 D ATTDATE^%UTSTCD2(PKERN,PKERN,PATH)
 
 
 
 
 S (QUI,WHOIS)=PKERN
 S LIS=$$CRELIS^%UTSTCD2("TRAITEMENT")
 S IND="c." F %I=0:0 S IND=$$NXTRI^%QSTRUC8("TRAITEMENT",IND) Q:IND=""  Q:$E(IND,1,2)'="c."  D AJOUT^%QS0XG1(LIS,IND)
 S OK=$$ARCHIDON^%SGPDOU(LIS,"",1,"C:\LIVRTXP\CONFIG.IND","sauvegarde automatique (config)")
 D ELIML^%QS0XG1(LIS)
 
 
 
 S (QUI,WHOIS)=PKERN
 S ESCHEM=$$TEMP^%SGUTIL
 S @ESCHEM@("TXP")=""
 D ARCHISCH^%SGPXOU(ESCHEM,"C:\LIVRTXP\sdd.arc","schema TXP")
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 S (QUI,WHOIS)=PKERN
 S @LISGLO@("QUERYT(""SAISIE.I""")="""SAISIE.I"""
 S @LISGLO@("ZLILA(""ATTRIBUT.EPR""")="""ATTRIBUT.EPR"""
 S @LISGLO@("ZLILA(""ATTRIBUT.FICHE""")="""ATTRIBUT.FICHE"""
 S @LISGLO@("ZLILA(""ATTRIBUT.ARTICLE""")="""ATTRIBUT.ARTICLE"""
 S @LISGLO@("ZLILA(""ATTRIBUT.FICHE.MANUELLE""")="""ATTRIBUT.FICHE.MANUELLE"""
 
 
 G:'(AVECQUBK) NEUFBIS
 S NOMSAIS=NOMCLI I $D(^[QUI]RQSGLO("QUBKGR",NOMSAIS)) S @LISGLO@("RQSGLO(""QUBKGR"","""_NOMSAIS_"""")="""QUBKGR"""_$C(22)_""""_NOMSAIS_""""
 F %N=0:0 S NOMSAIS=$O(^[QUI]RQSGLO("QUBKGR",NOMSAIS)) Q:NOMSAIS=""  Q:$E(NOMSAIS,1,LNOMCLI)'=NOMCLI  S @LISGLO@("RQSGLO(""QUBKGR"","""_NOMSAIS_"""")="""QUBKGR"""_$C(22)_""""_NOMSAIS_""""
 
NEUFBIS 
 S @LISGLO@("RQSGLO(""QUBKGR""")="""QUBKGR"""
 S @LISGLO@("RQSGLO(""QULEL""")="""QULEL"""
 S @LISGLO@("RQSGLO(""QMCP4""")="""QMCP4"""
 S @LISGLO@("RQSGLO(""TLDIAL""")="""TLDIAL"""
 S OK=$$GO^%SYSSAVE(LISGLO,"C:\LIVRTXP\TXP.GBL",PSAT,"globals de TXP")
 
 
 
 G:'(TRTECHNO) PT11
 K @(EMOD),@(EFOR),@(EPSV),@(EPRD),@(ERQS),@(EMSQ),@(ETTL)
 S (QUI,WHOIS)=PSAT
 S IND="" F %I=0:0 S IND=$$NXTRI^%QSTRUC8("TECHNOLOGIE",IND) Q:IND=""  S TRT=$$^%QSCALIN("TECHNOLOGIE",IND,"POCHE.DE.CONNAISSANCE",1) I TRT'="" S (QUI,WHOIS)=PKERN D TRT^%QULELT1("t."_TRT,ETTL,EMOD,EFOR,ERQS,EPSV) S @ETTL@(TRT)="",(QUI,WHOIS)=PSAT
 S (QUI,WHOIS)=PKERN
 S MES="",NFIC="C:\LIVRXP\TRTECHNO.ARC",COM="connaissance associee aux technologies"
 S OK=$$FILE^%SGPKOUT(NFIC,ETTL,EMOD,EFOR,ERQS,EPSV,EMSQ,EPRD,1,COM,0,.MES)
 
PT11 
 
 
 S (QUI,WHOIS)=PSAT
 S LIS=$$GEN^%QCAPOP("TMP"),ADRESSE="^[QUI]RQS2("""_LIS_""",""OBJET"")"
 D CREERL^%QS0XG1(LIS,"TECHNOLOGIE",ADRESSE,"TEMPORAIRE","TEMPORAIRE")
 S IND="" F %I=0:0 S IND=$$NXTRI^%QSTRUC8("TECHNOLOGIE",IND) Q:IND=""  D AJOUT^%QS0XG1(LIS,IND)
 S OK=$$ARCHIDON^%SGPDOU(LIS,"",4,"C:\LIVRTXP\techno.IND","sauvegarde automatique (technologies)")
 D ELIML^%QS0XG1(LIS)
 
PT12 
 
 
 
 G:('($D(@LSELABA)))&('($D(@LSELART))) PT13
 K @(LISGLO)
 S LMOT=$$TEMP^%SGUTIL
 S (QUI,WHOIS)=PSAT
 
 D GLOABA^TOGSSFO2(LSELABA,LISGLO)
 D GLOART^TOGSSFO2(LSELART,LISGLO)
 
 D MOTABA^TOGSSFO2(LSELABA,LMOT)
 D QUELQUES^%LXRAPTO(LSELART,LMOT)
 
 D AJMOTS^TOGSSFO2(LMOT,LISGLO)
 S OK=$$GO^%SYSSAVE(LISGLO,PATH_"TOTEM.GBL",QUI,"svgde de totem et des abaques")
 K @(LISGLO)
PT13 
 K @(EMOD),@(EFOR),@(EPSV),@(EPRD),@(ERQS),@(EMSQ),@(ETTL)
 Q
 ;

