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

;%QXPETU^INT^1^59547,73887^0
%QXPETU ;;09:27 AM  31 Jul 1992; ; 02 Apr 93 10:46 AM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
AVANTI(ETU) 
 N NDP,NDF,ARBETU
 S NDP=WHOIS("NDCOUR"),NDF=$$POPND(ETU),ARBETU=$$ARBETU(ETU)
 D CRNO^%QARBCON(ARBETU,NDP,NDF,"")
 S (WHOIS("NDCOUR"),^[QUI]ETU(ETU,"NDCOUR"))=NDF
 Q
 
 
UP(ETU) 
 N ND,ARBETU,ARB
 S ARBETU=$$ARBETU(ETU),ND=WHOIS("NDCOUR")
 S ARB=$$STO(ETU)
 I $D(@ARBETU@("INV",ND)) S (^[QUI]ETU(ETU,"NDCOUR"),WHOIS("NDCOUR"))=@ARBETU@("INV",ND) D KILLND
 Q
 
 
DOWN(ETU) 
 N ND,ARBETU,ARB
 S ARB=$$STO(ETU)
 S ARBETU=$$ARBETU(ETU),ND=WHOIS("NDCOUR")
 I $D(@ARBETU@("ARB",ND))>9 S (^[QUI]ETU(ETU,"NDCOUR"),WHOIS("NDCOUR"),ND)=$O(@ARBETU@("ARB",ND,"")) D RESTND
 Q
 
 
MOVETO(ETU,NOEUD) 
 N NDC,TEMP,PS,PD,DD,ARB,ARBETU,ANC,%I,%J
 S ARB=$$STO(ETU)
 S ARBETU=$$ARBETU(ETU),NDC=WHOIS("NDCOUR")
 S TEMP=$$TEMP^%SGUTIL
 
 
 S PS=NDC,PD=NOEUD,DD=0
 Q:PS=PD
 S @TEMP@("ES",PS)="",@TEMP@("ED",PD)=DD,@TEMP@("DD",DD)=PD,DD=DD+1
MVTAG I PD'=0,$R(2) S PD=@ARBETU@("INV",PD),@TEMP@("DD",DD)=PD,@TEMP@("ED",PD)=DD,DD=DD+1 G:'($D(@TEMP@("ES",PD))) MVTAG S ANC=PD G MVT2
 I PS'=0 S PS=@ARBETU@("INV",PS),@TEMP@("ES",PS)="" G:'($D(@TEMP@("ED",PS))) MVTAG S ANC=PS G MVT2
 S PD=@ARBETU@("INV",PD),@TEMP@("DD",DD)=PD,@TEMP@("ED",PD)=DD,DD=DD+1 G:'($D(@TEMP@("ES",PD))) MVTAG S ANC=PD G MVT2
MVT2 S ND=NDC
 
 F %I=0:0 Q:ND=ANC  D KILLND S ND=@ARBETU@("INV",ND)
 S %I=@TEMP@("ED",ANC)
 S ND=@TEMP@("DD",%I)
 
 F %J=0:0 Q:ND=NOEUD  S %I=$ZP(@TEMP@("DD",%I)),ND=@TEMP@("DD",%I) D RESTND
 S (^[QUI]ETU(ETU,"NDCOUR"),WHOIS("NDCOUR"))=NOEUD
 Q
 
JOURN(MES) 
 N S
 S S=$S($D(^[QUI]ETU(WHOIS("ETUDE"),"ARB",WHOIS("NDCOUR"),"J")):^[QUI]ETU(WHOIS("ETUDE"),"ARB",WHOIS("NDCOUR"),"J"),1:0)
 S S=S+1
 S ^[QUI]ETU(WHOIS("ETUDE"),"ARB",WHOIS("NDCOUR"),"J",S)=MES
 S ^[QUI]ETU(WHOIS("ETUDE"),"ARB",WHOIS("NDCOUR"),"J")=S
 Q
 
COMMENT(ND) 
 N S
 S S=$S($D(^[QUI]ETU(WHOIS("ETUDE"),"ARB",ND,"J",1)):^[QUI]ETU(WHOIS("ETUDE"),"ARB",ND,"J",1),1:"")
 Q S
 
KILLND N G,%G
 S G="" F %G=0:0 S G=$O(@ARB@(ND,"G",G)) Q:G=""  K @G@(ND)
 Q
RESTND N G,%G
 S G="" F %G=0:0 S G=$O(@ARB@(ND,"G",G)) Q:G=""  S @G@(ND)=@ARB@(ND,"G",G)
 Q
 
SETNDC(ETU,NDC) S (^[QUI]ETU(ETU,"NDCOUR"),WHOIS("NDCOUR"))=NDC Q
 
POPND(ETU) N ND S (ND,^[QUI]ETU(ETU,"DERND"))=^[QUI]ETU(ETU,"DERND")+1 Q ND
 
STO(ETU) 
 Q "^[QUI]ETU("""_ETU_""",""ARB"")"
 
ARBETU(ETU) 
 Q "^[QUI]ETU("""_ETU_""",""ARBETU"")"
 
 
 
 
 
 
 
 
 
 
 
INIETU(ETU,MOTEUR,CHARGEMENT) 
 K ^[QUI]ETU(ETU)
 S ^[QUI]ETU(ETU,"DERND")=0
 S ^[QUI]ETU(ETU,"NDCOUR")=0
 S (WHOIS("MOTEUR"),^[QUI]ETU(ETU,"MOTEUR"))=MOTEUR
 S ^[QUI]ETU(ETU,"CHARGEMENT")=CHARGEMENT
 D INISTD(ETU)
 S WHOIS("ETUDE")=ETU,WHOIS("NDCOUR")=0
 S WHOIS("TABVAL")="^[QUI]ETU(WHOIS(""ETUDE""),""TABVAL"",NOMATTRI,INDICE)"
 Q
 
 
INISTD(ETU) 
 N R,%R,RI,GLOB
 S GLOB=$$TLIEN^%QSGES21
 S R="" F %R=0:0 S R=$O(@GLOB@(R)) Q:R=""  D PUSHVAL^%QXPPRI7(ETU,0,"NUMEROS.DE.LIENS",R,@GLOB@(R))
 Q
 
REPRISE(ETU) 
 S WHOIS("ETUDE")=ETU,WHOIS("NDCOUR")=^[QUI]ETU(ETU,"NDCOUR")
 S WHOIS("TABVAL")="^[QUI]ETU(WHOIS(""ETUDE""),""TABVAL"",NOMATTRI,INDICE)"
 S WHOIS("MOTEUR")=^[QUI]ETU(ETU,"MOTEUR")
 Q
 
 
SETVAL(NOMATTRI,INDICE,VALEUR) S @WHOIS("TABVAL")=VALEUR Q
 
 
GETVAL(NOMATTRI,INDICE) Q $S($D(@WHOIS("TABVAL")):@WHOIS("TABVAL"),1:"")
 ;

