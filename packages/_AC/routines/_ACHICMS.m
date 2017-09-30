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

;%ACHICMS^INT^1^59547,73864^0
ACHICMS ;
 
 
 
 
 
 
 
 
 
SUP 
 N ADR,REPP,DEFP,SECT,REPI
 S ADR=$$ADR
 S DEFP=$S(($D(@ADR)#10)=1:$P(@ADR,"^",1),1:"")
 D TIT("Suppression")
PS S REPP=$$REP("secteur",0,9,DEFP)
 I REPP="" Q
 S REPI=$$NOMINT^%QSF(REPP)
SE S SECT=$$SECT(0,13,REPP,"AFF^%ACHICMS(""Suppression"")")
 G:SECT="" PS
 I '($$IR^%QSGEST5(REPI,SECT)) D ^%VZEAVT($$^%QZCHW("Ce secteur n'existe pas")) G SE
 D POCLEPA^%VVIDEO I $$CONFIRM^%VZEOUI($$^%QZCHW("Confirmez-vous la suppression du secteur et de ses modules")_" ?")'=1 G SE
 D MSG^%VZEATT($$^%QZCHW("Suppression en cours"))
 
 D SX^%QSGESTK(REPI,SECT)
 
 K @ADR@(REPI,SECT)
 G SE
 
AFF(MOD) 
 D TIT(MOD)
 S DX=9,DY=9 X XY W $$^%QZCHW("Nom du repertoire secteur")," : ",REPP
 Q
 
DUP 
 N ADR,REPP,DEFP,SECT,REPI,DUP,CTR,MSG
 S ADR=$$ADR
 S DEFP=$S(($D(@ADR)#10)=1:$P(@ADR,"^",1),1:"")
 D TIT("Duplication")
DS S REPP=$$REP("secteur",0,8,DEFP)
 I REPP="" Q
 S REPI=$$NOMINT^%QSF(REPP)
DE S SECT=$$SECT(0,12,REPP,"AFF^%ACHICMS(""Duplication"")")
 G:SECT="" DS
 I '($$IR^%QSGEST5(REPI,SECT)) D ^%VZEAVT($$^%QZCHW("Ce secteur n'existe pas")) G DE
DD S DX=0,DY=16 D CLEBAS^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW("Nom du secteur a creer")_" : ","",8,RM-4,DY+1,DY-1,"","",.CTR,.DUP)
 I CTR'="" G DE
 I DUP="" G DD
 
 S MSG=$$NOMOK^%QSGEIND(REPP,DUP) I MSG'="" D ^%VZEAVT(MSG) G DD
 I $$IR^%QSGEST5(REPI,DUP) D ^%VZEAVT($$^%QZCHW("Ce secteur existe deja")) G DD
 D POCLEPA^%VVIDEO I $$MES^%VZEOUI($$^%QZCHW("Confirmez-vous la duplication du secteur et de ses modules")_" ?","N")'=1 G DD
 D MSG^%VZEATT($$^%QZCHW("Duplication en cours"))
 
 D ^%QMCP9(WHOIS,QUI,REPI,SECT,WHOIS,QUI,DUP,"")
 
 D GLOCOP^%QCAGLC($$CONCAT^%QZCHAD(ADR,""""_REPI_""","""_SECT_""""),$$CONCAT^%QZCHAD(ADR,""""_REPI_""","""_DUP_""""))
 G DD
 
 
 
REP(TYPR,X,Y,DEF) 
 N CTR,REP
SP S DX=X,DY=Y D CLEBAS^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW("Nom du repertoire")_" "_$$^%QZCHW(TYPR)_$S(DEF="":"",1:" ["_DEF_"]")_" : ","",8,RM-4,DY+1,DY-1,"","",.CTR,.REP)
 I CTR'="" Q ""
 I REP="" G:DEF="" SP S REP=DEF,DX=40+$L(DEF) X XY W REP
 I $$REPM^%QSGEST9(REP)'=2 D ^%VZEAVT($$^%QZCHW("Ce repertoire n'est pas autorise")) G SP
 Q REP
 
SECT(X,Y,REP,RAFF) 
 N CTR,SECT,MSG
SS S DX=X,DY=Y D CLEBAS^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW("Nom du secteur")_" : ","",8,RM-4,DY+1,DY-1,"","",.CTR,.SECT)
 I CTR'="" Q ""
 I SECT="" G SS
 I SECT="?" S SECT=$$SELECT^%QSGEST6($$CONCAS^%QZCHAD($$ADR,$$NOMINT^%QSF(REP))) D:RAFF'="" @RAFF G:SECT="" SS
 
 S MSG=$$NOMOK^%QSGEIND(REP,SECT) I MSG'="" D ^%VZEAVT(MSG) G SS
 Q SECT
 
DIM(D,X,Y,DEF) 
 N CTR,Y1
DI S DX=X,DY=Y D CLEBAS^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW(D_" de la case")_" ["_DEF_"] : ","",8,RM-4,DY+1,DY-1,"","",.CTR,.Y1)
 I CTR'="" G DI
 I Y1="" S Y1=DEF
 I '($$ENTP^%QZNBN(Y1)) D ^%VZEAVT($$^%QZCHW("la dimension doit etre un entier positif")) G DI
 I D="Largeur" G:Y1>79 DI G:Y1<3 DI
 I D="Hauteur" G:Y1>21 DI G:Y1<3 DI
 Q Y1
 
DIA(STO) 
 N ADR,CTR,DIA,VD,LC,HC
 
 S ADR=$$ADR^%ACHICMS
 S VD=$S($D(@STO@("DIA")):@STO@("DIA"),1:$P(@ADR,"^",3))
SD S DX=0,DY=22 D CLEBAS^%VVIDEO
 S DY=23 X XY D LIRE2^%VREAD($$^%QZCHW("Par quel dialogue")_$S(VD="":"",1:" ["_VD_"]")_" ? ","",0,RM-4,DY+1,DY-1,"","",.CTR,.DIA)
 I CTR'="" Q ""
 S:DIA="" DIA=VD
 I DIA="?" D CHOIXD^%TLTRDIA(.DIA),CLEPAG^%VVIDEO G:DIA="" SD
 I '($D(^[QUI]TLDIAL(DIA))) D ^%VZEAVT($$^%QZCHW("Ce dialogue n'existe pas")) G SD
 S @STO@("DIA")=DIA
 S @ADR=$P(@ADR,"^",1,2)_"^"_DIA
 Q DIA
 
TRT() 
 N CTR,TRT,ENS
ST S DX=0,DY=22 D CLEBAS^%VVIDEO
 S DY=23 X XY D LIRE2^%VREAD($$^%QZCHW("Nom du traitement")_" ? ","",0,RM-4,DY+1,DY-1,"","",.CTR,.TRT)
 I CTR'="" Q ""
 I TRT="" Q ""
 I TRT="?" S DY=1,DX=0 D CLEBAS^%VVIDEO,AIDE2^%TLDIAL4("",1,0,"ENS"),AFF^%ACHIDEF S TRT=$O(ENS("")) G:TRT="" ST
 I '($$EXISTE^%TLGEST(TRT)) D ^%VZEAVT($$^%QZCHW("Ce traitement n'existe pas")) G ST
 Q TRT
 
 
TIT(MOD) 
 D CLEPAG^%VVIDEO
 D ^%VZCD(0,39,0,4,1,0,$$^%QZCHW(MOD)_" "_$$^%QZCHW("d'un secteur"))
 Q
 
ADR() 
 Q "^[QUI]RQSGLO(""ACHI"")"

