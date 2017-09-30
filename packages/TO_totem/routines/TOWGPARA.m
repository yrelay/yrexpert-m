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

;TOWGPARA^INT^1^59547,74876^0
TOWGPARA ;
 
 K ^PARALAF($I),^PLAFVU($I),MRES,CCD,CD,CBLANC,CEXI,CG,CNULI,CNULS S OSCR=SCR,OTAB=NOMTAB,IC=1,RR="" F IT="NUFA","%ALL","%ETAT","%LARG","DP" G:'($D(@IT)) FINI S RR=RR_$S(RR="":"",1:",")_IT,RESUL(IC)=@IT,IC=IC+1
 S LIEN=$I,RESUL(1)="",TT="^PARALAF($I)",UN=1,NF=1,@TT@(NF)="",RSI=""
 S IC=-1,TB="^[QUI]AUTOPLAF(NUFA,0)" F %U=1:1 S IC=$N(@TB@(IC)) Q:IC=-1  S PI=$P(@TB@(IC),"^",1),%V=$P(@TB@(IC),"^",2) I PI'="" S ^PLAFVU($I,PI)=IC,RSI=RSI_PI_"^"_%V_"^",UN=UN+1 I UN>9 S @TT@(NF)=RSI,NF=NF+1,UN=1,RSI=""
 S TB="^[QUI]TVPAR(NUFA,0)",PI=-1 F %U=1:1 S PI=$N(@TB@(PI)) Q:PI=-1  I '($D(^PLAFVU($I,PI))) S RSI=RSI_PI_"^"_@TB@(PI)_"^",UN=UN+1 I UN>9 S @TT@(NF)=RSI,NF=NF+1,UN=1,RSI=""
 S $P(RSI,"^",19)="" I RSI'="" S @TT@(NF)=RSI,NF=NF+1,RSI=""
 S $P(RSI,"^",19)="",@TT@(NF)=RSI
 K RR,IT,IC,UN,NF,RSI S NOMTAB="^PARALAF",SCR="PARALAF",CMS=0 D ^TOWCMSPL G:ABENDSCR=1 FINI
 K @(TB),^NEWPLAF($I) S NF=-1 F %U=1:1 S NF=$N(@TT@(NF)) Q:NF=-1  S RSI=@TT@(NF) F %V=1:2:18 S PI=$P(RSI,"^",%V) I PI'="" S @TB@(PI)=$P(RSI,"^",%V+1),^NEWPLAF($I,PI)=$P(RSI,"^",%V+1)
 S TB="^[QUI]AUTOPLAF(NUFA,0)" K @(TB) S PI=-1 F %U=1:1 S PI=$N(^PLAFVU($I,PI)) Q:PI=-1  S ORLAF=^PLAFVU($I,PI) I $D(^NEWPLAF($I,PI)) S @TB@(ORLAF)=^NEWPLAF($I,PI)
FINI K RESUL S PI=-1 F %U=1:1 S PI=$N(^RESCRE($I,PI)) Q:PI=-1  S RESUL(PI)=^RESCRE($I,PI)
FIN S SCR=OSCR,NOMTAB=OTAB K IC,^NEWPLAF($I),^PLAFVU($I),^PARALAF($I),VALCLE,%RS,RR,%V,TT,RSI,UN,NF,IT,%U,PI,TB,OSCR Q

