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

;%ACHINDI^INT^1^59547,73864^0
ACHINDI ;
 
 
 
 
 
 
 N ADR,DEFF,DEFP,GLOSTO,LIEN,MOD,REPP,REPPI,REPF,REPFI,RES,SECT,TEMP,MSG,LC,HC
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"FILS") K @(TEMP)
 
 S ADR=$$ADR^%ACHICMS
 I ($D(@ADR)#10)'=1 S (DEFF,DEFP)="" G AFF
 
 S DEFP=$P(@ADR,"^",1),DEFF=$P(@ADR,"^",2)
AFF 
 D TIT^%ACHICMS("Definition")
PERE 
 S REPP=$$REP^%ACHICMS("secteur",0,7,DEFP)
 I REPP="" Q
 S REPPI=$$NOMINT^%QSF(REPP)
 
 S GLOSTO=$$CONCAS^%QZCHAD(ADR,REPPI)
 
FILS 
 S REPF=$$REP^%ACHICMS("module",0,11,DEFF)
 I REPF="" G PERE
 S REPFI=$$NOMINT^%QSF(REPF)
 
 S LIEN=$$LIEN1^%QSGEL2(REPPI,REPFI,2) I LIEN="" D ^%VZEAVT($$^%QZCHW("Ces 2 repertoires ne sont pas relies par un lien hierarchique")) G FILS
 
 S @ADR=REPP_"^"_REPF_"^"_$S(($D(@ADR)#10)'=1:"",1:$P(@ADR,"^",3))
 S DEFP=REPP,DEFF=REPF
 
NOM 
 S SECT=$$SECT^%ACHICMS(0,15,REPP,"REAFF^%ACHINDI")
 I SECT="" G FILS
 
 I '($$IR^%QSGEST5(REPPI,SECT)) G CRE
 
 S MOD=0
 D RECAR
 G DEF
 
CRE 
 D POCLEPA^%VVIDEO I $$MES^%VZEOUI($$^%QZCHW("Ce secteur n'existe pas, voulez-vous le creer")_" ? ","O")'=1 G NOM
 
 I $$CREPER^%QSGEIND(REPPI,SECT,$$NOMEX^%QSGES10(REPPI,SECT),.MSG)=1 D ^%VZEAVT(MSG) G NOM
 S MOD=1
 
 S LC=$$DIM^%ACHICMS("Largeur",0,18,5)
 S HC=$$DIM^%ACHICMS("Hauteur",0,20,3)
 G DEF
 
DEF 
 S RES=$$DEF^%ACHIDEF(SECT,GLOSTO,LC,HC,MOD)
 I RES=0 G RET
 I MOD=1 S @GLOSTO@(SECT,"DISTANCE")=0
 
 D CREFILS(GLOSTO,SECT,REPPI,REPFI,LIEN,TEMP)
RET K @(TEMP),@GLOSTO@(SECT,"CAR"),@GLOSTO@(SECT,"ATR")
 D REAFF
 G NOM
 
REAFF 
 D TIT^%ACHICMS("Definition")
 S DX=9,DY=8 X XY W $$^%QZCHW("Nom du repertoire secteur")," : ",REPP
 S DX=9,DY=12 X XY W $$^%QZCHW("Nom du repertoire module"),"  : ",REPF
 Q
 
RECAR 
 
 N %O,A,NA,OA,ATR,DIA,O,GLO,TYP,IND,N,TAB
 
 I '($D(@GLOSTO@(SECT,"POS","LC"))) S @GLOSTO@(SECT,"POS","LC")=5
 I '($D(@GLOSTO@(SECT,"POS","HC"))) S @GLOSTO@(SECT,"POS","HC")=3
 S LC=@GLOSTO@(SECT,"POS","LC"),HC=@GLOSTO@(SECT,"POS","HC")
 S GLO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GLO") K @(GLO)
 S TAB=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB") K @(TAB)
 
 S DIA=$S($D(@GLOSTO@(SECT,"DIA")):@GLOSTO@(SECT,"DIA"),1:"")
 D MSG^%VZEATT($$^%QZCHW("Recuperation des caracteristiques"))
 
 D MVG^%QSCALVA(REPPI,SECT,LIEN,GLO,.TYP)
 S O="" F %O=0:0 S O=$O(@GLO@(O)) Q:O=""  S IND=@GLO@(O),@TEMP@(IND)="" D RECAT
 S @GLOSTO@(SECT,"ATR","NOM")=""
 K @(GLO),@(TAB) Q
 
RECAT 
 S N=$S($D(@GLOSTO@(SECT,"NUM",IND)):@GLOSTO@(SECT,"NUM",IND),1:IND)
 S @GLOSTO@(SECT,"CAR",N,"NOM")=IND
 Q:DIA=""
 D INIT^%ACHIDE2(N,DIA,TAB)
 F NA=1:1 Q:'($D(@TAB@(NA)))  S A=$O(@TAB@(NA,"")),OA=$P($P(A,"(",2),")",1),@GLOSTO@(SECT,"CAR",N,A)=$$^%QSCALIN(REPFI,SECT_","_IND,$P(A," (",1),OA),@GLOSTO@(SECT,"ATR",A)=""
 Q
 
 
CREFILS(GLO,SECT,REPP,REPF,LIEN,GLF) 
 N %I,A,ATD,ATR,D,I,IND,INDI,NOM,O,TAB
 S DX=0,DY=22 D CLEBAS^%VVIDEO
 S TAB=$$CONCAT^%QZCHAD(GLO,""""_SECT_"""")
 S ATD=$$ATDIST
 
 S IND=""
 F %I=0:0 S IND=$O(@TAB@("PLNUM",IND)) Q:IND=""  D STO
 
 S IND="" F %I=0:0 S IND=$O(@GLF@(IND)) Q:IND=""  D SUP
 
 I @TAB@("DISTANCE")=0 D CALC^%ACHIDIS(GLO,SECT,REPF)
 Q
 
STO 
 S INDI=$$NAME(IND)
 S NOM=SECT_","_INDI
 D MSG^%VZEATT($$^%QZCHW("Mise a jour des attributs de l'individu")_" "_NOM)
 I '($D(@GLF@(INDI))) D PA^%QSGESTI(REPF,NOM,"NOM",INDI,1),ADDO^%QSGEST3(REPP,SECT,INDI,LIEN,REPF,INDI)
 
 S A=""
 
ATR S A=$O(@TAB@("CAR",IND,A)) I A="" K @GLF@(INDI) Q
 S ATR=$P(A,"(",1) I ATR'="NOM" S O=$P($P(A,"(",2),")",1) S:O="" O=1 D PA^%QSGESTI(REPF,NOM,ATR,@TAB@("CAR",IND,A),O)
 G ATR
 
SUP N TABD
 S TABD=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"DIST") K @(TABD)
 S NOM=SECT_","_IND
 D MSG^%VZEATT($$^%QZCHW("Suppression de l'individu")_" "_NOM)
 
 D MVG^%QSCALVA(REPF,NOM,ATD,TABD,.TYP)
 S I=""
SD S I=$O(@TABD@(I)) G:I="" SU
 D PS^%QSGESTI(REPF,SECT_","_I,ATD,@TABD@(I),IND)
 G SD
SU 
 D SX^%QSGESTK(REPF,NOM)
 
 D OSUPS^%QSGEST3(REPP,SECT,IND,LIEN,REPF,IND)
 K @(TABD),@GLOSTO@(SECT,"NUM",IND) Q
 
ATDIST() Q "DISTANCE"
 
NAME(I) 
 Q $S($D(@TAB@("CAR",I,"NOM")):@TAB@("CAR",I,"NOM"),1:I)

