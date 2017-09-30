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

;%QMCPSF1^INT^1^59547,73877^0
QMCPSF1 ;
 
RQS(WHOIS1,QUI1,ENS,WHOIS2,QUI2,XMODE,PASSE) 
 N I,OB1,OB2
 S OB1=$O(@ENS@(""))
 F I=0:0 Q:OB1=""  D RQS1 S OB1=$O(@ENS@(OB1))
 Q
RQS1 S OB2=$S(($D(@ENS@(OB1))#10)=1:@ENS@(OB1),1:OB1)
 I ((XMODE'=3)&(QUI1=QUI2))&(OB1=OB2) D MSG^%VZEATT(WHOIS1_" "_OB1_" : "_$$^%QZCHW("on ne copie pas un objet sur lui meme")) H 1 Q
 D MSG^%VZEATT(WHOIS1_" "_OB1_" --> "_WHOIS2_" "_OB2)
 I XMODE'=3 D KREQ^%QMCPZ(WHOIS2,QUI2,OB2)
 D:OB1'="z" COPIE^%QS6(WHOIS1,QUI1,OB1,WHOIS2,QUI2,OB2)
 Q
 
TTL(WHOIS1,QUI1,ENS,WHOIS2,QUI2,XMODE,PASSE) 
 N I,OB1,OB2,T
 S T=$C(9)
 S OB1=$O(@ENS@(""))
 F I=0:0 Q:OB1=""  D TTL1 S OB1=$O(@ENS@(OB1))
 Q
TTL1 S OB2=$S(($D(@ENS@(OB1))#10)=1:@ENS@(OB1),1:OB1)
 I ((XMODE'=3)&(QUI1=QUI2))&(OB1=OB2) D MSG^%VZEATT(WHOIS1_" "_OB1_" : "_$$^%QZCHW("on ne copie pas un objet sur lui meme")) H 1 Q
 D MSG^%VZEATT(WHOIS1_" "_OB1_" --> "_WHOIS2_" "_OB2)
 I XMODE=3,PASSE=1 D STOLK^%QMCPOZ(QUI,"TRTL"_T_OB2) Q
 I XMODE'=3 D KTRT^%QMCPZ(WHOIS2,QUI2,OB2)
 D:OB1'="z" RECTRT^%TLGEST(WHOIS1,QUI1,OB1,WHOIS2,QUI2,OB2,1,XMODE)
 Q
 
EDF(WHOIS1,QUI1,ENS,WHOIS2,QUI2,XMODE,PASSE) 
 N I,OB1,OB2
 S OB1=$O(@ENS@(""))
 F I=0:0 Q:OB1=""  D EDF1 S OB1=$O(@ENS@(OB1))
 Q
EDF1 S OB2=$S(($D(@ENS@(OB1))#10)=1:@ENS@(OB1),1:OB1)
 I ((XMODE'=3)&(QUI1=QUI2))&(OB1=OB2) D MSG^%VZEATT(WHOIS1_" "_OB1_" : "_$$^%QZCHW("on ne copie pas un objet sur lui meme")) H 1 Q
 D MSG^%VZEATT(WHOIS1_" "_OB1_" --> "_WHOIS2_" "_OB2)
 I XMODE'=3 D KEDF^%QMCPZ(WHOIS2,QUI2,OB2)
 D:OB1'="z" DUPL^%EDFGEST(WHOIS1,QUI1,OB1,WHOIS2,QUI2,OB2)
 Q
 
EDM(WHOIS1,QUI1,ENS,WHOIS2,QUI2,XMODE,PASSE) 
 N I,OB1,OB2
 S OB1=$O(@ENS@(""))
 F I=0:0 Q:OB1=""  D EDM1 S OB1=$O(@ENS@(OB1))
 Q
EDM1 S OB2=$S(($D(@ENS@(OB1))#10)=1:@ENS@(OB1),1:OB1)
 I ((XMODE'=3)&(QUI1=QUI2))&(OB1=OB2) D MSG^%VZEATT(WHOIS1_" "_OB1_" : "_$$^%QZCHW("on ne copie pas un objet sur lui meme")) H 1 Q
 D MSG^%VZEATT(WHOIS1_" "_OB1_" --> "_WHOIS2_" "_OB2)
 I XMODE'=3 D KEDM^%QMCPZ(WHOIS2,QUI2,OB2)
 D:OB1'="z" DUPL^%EDDGEST(WHOIS1,QUI1,OB1,WHOIS2,QUI2,OB2)
 Q
 
SCX(WHOIS1,QUI1,ENS,WHOIS2,QUI2,XMODE,PASSE) 
 N I,OB1,OB2,QUI
 S QUI=QUI2
 S OB1=$O(@ENS@(""))
 F I=0:0 Q:(OB1="")!(OB1="z")  D SCX1 S OB1=$O(@ENS@(OB1))
 Q
SCX1 S OB2=$S(($D(@ENS@(OB1))#10)=1:@ENS@(OB1),1:OB1)
 I ((XMODE'=3)&(QUI1=QUI2))&(OB1=OB2) D MSG^%VZEATT(WHOIS1_" "_OB1_" : "_$$^%QZCHW("on ne copie pas un objet sur lui meme")) H 1 Q
 D MSG^%VZEATT(WHOIS1_" "_OB1_" --> "_WHOIS2_" "_OB2)
 I XMODE'=3 K ^[QUI2]SCOMDOM(OB2),^[QUI2]SCOMPREG(OB2)
 S LOB1=$S((OB1+0)=OB1:OB1,1:""""_OB1_"""")
 S LOB2=$S((OB2+0)=OB2:OB2,1:""""_OB2_"""")
 D ADR^%QCAGLC("^[QUI1]SCOMDOM("_LOB1,"^[QUI2]SCOMDOM("_LOB2)
 D ADR^%QCAGLC("^[QUI1]SCOMPREG("_LOB1,"^[QUI2]SCOMPREG("_LOB2)
 D DOMAINE^%SCOREAN(OB2)
 Q
 
QSETAT(WHOIS1,QUI1,ENS,WHOIS2,QUI2,XMODE,PASSE) 
 N I,OB1,OB2
 S OB1=$O(@ENS@(""))
 F I=0:0 Q:OB1=""  D QSETAT1 S OB1=$O(@ENS@(OB1))
 Q
QSETAT1 S OB2=$S(($D(@ENS@(OB1))#10)=1:@ENS@(OB1),1:OB1)
 I ((XMODE'=3)&(QUI1=QUI2))&(OB1=OB2) D MSG^%VZEATT(WHOIS1_" "_OB1_" : "_$$^%QZCHW("on ne copie pas un objet sur lui meme")) H 1 Q
 D MSG^%VZEATT(WHOIS1_" "_OB1_" --> "_WHOIS2_" "_OB2)
 I XMODE'=3 D KETAT^%QMCPZ(WHOIS2,QUI2,OB2)
 D:OB1'="z" COPIE^%QSETINI(WHOIS1,QUI1,OB1,WHOIS2,QUI2,OB2)
 Q
 
ABA(WHOIS1,QUI1,ENS,WHOIS2,QUI2,XMODE,PASSE) 
 N I,OB1,OB2
 S OB1=$O(@ENS@(""))
 F I=0:0 Q:OB1=""  D ABA1 S OB1=$O(@ENS@(OB1))
 Q
ABA1 S OB2=$S(($D(@ENS@(OB1))#10)=1:@ENS@(OB1),1:OB1)
 I ((XMODE'=3)&(QUI1=QUI2))&(OB1=OB2) D MSG^%VZEATT(WHOIS1_" "_OB1_" : "_$$^%QZCHW("on ne copie pas un objet sur lui meme")) H 1 Q
 D MSG^%VZEATT(WHOIS1_" "_OB1_" --> "_WHOIS2_" "_OB2)
 D:OB1'="z" ABA2
 Q
ABA2 S NOMTREE="^[QUI1]SCRC("""_OB1_"""",%TREECOP="^[QUI2]SCRC("""_OB2_"""" D ^%QCAGLC
 S NOMTREE="^[QUI1]STRUCT("""_OB1_"""",%TREECOP="^[QUI2]STRUCT("""_OB2_"""" D ^%QCAGLC
 S NOMTREE="^[QUI1]PRONUM("""_OB1_"""",%TREECOP="^[QUI2]PRONUM("""_OB2_"""" D ^%QCAGLC
 S NOMTREE="^[QUI1]OCGRIL("""_OB1_"""",%TREECOP="^[QUI2]OCGRIL("""_OB2_"""" D ^%QCAGLC
 Q
 
JAL(WHOIS1,QUI1,ENS,WHOIS2,QUI2,XMODE,PASSE) 
 N I,OB1,OB2
 S OB1=$O(@ENS@(""))
 F I=0:0 Q:OB1=""  D JAL1 S OB1=$O(@ENS@(OB1))
 Q
JAL1 S OB2=$S(($D(@ENS@(OB1))#10)=1:@ENS@(OB1),1:OB1)
 I ((XMODE'=3)&(QUI1=QUI2))&(OB1=OB2) D MSG^%VZEATT(WHOIS1_" "_OB1_" : "_$$^%QZCHW("on ne copie pas un objet sur lui meme")) H 1 Q
 D MSG^%VZEATT(WHOIS1_" "_OB1_" --> "_WHOIS2_" "_OB2)
 D:OB1'="z" JAL2
 Q
JAL2 K ^[QUI2]ADLJ(OB2)
 K ^[QUI2]CDLJ(OB2)
 S NOMTREE="^[QUI1]ADLJ("""_OB1_"""",%TREECOP="^[QUI2]ADLJ("""_OB2_"""" D ^%QCAGLC
 S NOMTREE="^[QUI1]CDLJ("""_OB1_"""",%TREECOP="^[QUI2]CDLJ("""_OB2_"""" D ^%QCAGLC
 Q
 
QAX(WHOIS1,QUI1,ENS,WHOIS2,QUI2,XMODE,PASSE) 
 N I,OB1
 S OB1=$O(@ENS@(""))
 F I=0:0 Q:OB1=""  D QAX1 S OB1=$O(@ENS@(OB1))
 Q
QAX1 S OB2=$S(($D(@ENS@(OB1))#10)=1:@ENS@(OB1),1:OB1)
 I ((XMODE'=3)&(QUI1=QUI2))&(OB1=OB2) D MSG^%VZEATT(WHOIS1_" "_OB1_" : "_$$^%QZCHW("on ne copie pas un objet sur lui meme")) H 1 Q
 D MSG^%VZEATT(WHOIS1_" "_OB1_" --> "_WHOIS2_" "_OB2)
 D:OB1'="z" COPY^%QAX(WHOIS1,QUI1,OB1,WHOIS2,QUI2,OB2)
 Q
 
LEX(WHOIS1,QUI1,ENS,WHOIS2,QUI2,XMODE,PASSE) 
 N I,OB1
 S OB1=$O(@ENS@(""))
 F I=0:0 Q:OB1=""  D LEX1 S OB1=$O(@ENS@(OB1))
 Q
LEX1 S OB2=$S(($D(@ENS@(OB1))#10)=1:@ENS@(OB1),1:OB1)
 I ((XMODE'=3)&(QUI1=QUI2))&(OB1=OB2) D MSG^%VZEATT(WHOIS1_" "_OB1_" : "_$$^%QZCHW("on ne copie pas un objet sur lui meme")) H 1 Q
 D MSG^%VZEATT(WHOIS1_" "_OB1_" --> "_WHOIS2_" "_OB2)
 D:OB1'="z" COPY^%LXSTOCK(WHOIS1,QUI1,OB1,WHOIS2,QUI2,OB2)
 Q

