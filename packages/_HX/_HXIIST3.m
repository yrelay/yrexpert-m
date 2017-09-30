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

;%HXIIST3^INT^1^59547,73869^0
HXIIST3(GL,INVC,HIS,R,ATR,REPS,TEMP) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N %I,COL,CS,IMOD,L,LS,SEL
 S (CS,LS)=1
 S IMOD=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"IMOD") K @(IMOD)
ZMOV 
 S SEL=$$^%VZEMOV(LMARG(HIS),(HFHA+HHIST)+1,NBCOL,HTEXT,ECART+LARG,1,$$CONCAS^%QZCHAD(TEXT,HIS),.CS,.LS)
 Q:'(SEL) 0
 S CS=(CS+NOCOL)-1
 I $D(@GL@(CS))=0 G ZMOV
 I @GL@(CS)=0 G ZMOV
 
 D MEN2^%HXPARAM(MENU)
 S DY=LMENU,DX=0 D CLEBAS^%VVIDEO
SELECT 
 D ^%VQUIKMN(2,79,LMENU,MENU,.ADR,.CTR) G:ADR'="" @ADR
 I "AF"[CTR G FIN
 D ^%VSQUEAK G SELECT
 
FIN D ^%VZEATT
 K ^DESC($J),@(IMOD)
 Q 1
 
MEN D MEN^%HXPARC2
 G MAJH
 
DEPL 
 I '($$EX^%QSGEST7(@TEMP@("LISTE"))) D ^%VZEAVT($$^%QZCHW("La liste qui a servi a definir l'histogramme n'existe plus; vous ne pouvez pas le modifier")) G SELECT
 D DEPL^%HXPARC2(GL,R,REPS,CS,IMOD)
 G MAJH
 
ECL 
 D SELINDI^%HXPARAM(R,ATR,"ECLAT^%HXIIST3",.COL,.L)
 D ^%QUKOLO
 I $D(@IMOD) D MAJ^%HXPARCO(IMOD,@TEMP@("LISTE"),.CARD)
 G MAJH
 
GEST 
 D SELINDI^%HXPARAM(R,ATR,"SEL^%HXIIST3",.COL,.L)
 D ^%QUKOLO
 G MAJH
 
MAJH 
 D MAJ(2,HISTO2,INVC2,@TEMP@("T2"),@TEMP@("OPTH2"),@TEMP@("ABC2"),FTOT1)
 D MAJ(1,HISTO1,INVC1,@TEMP@("T"),@TEMP@("OPTH"),@TEMP@("ABC"),FTOT2)
 G FIN
 
ECLAT 
 I '($$EX^%QSGEST7(@TEMP@("LISTE"))) D ^%VZEAVT($$^%QZCHW("La liste qui a servi a definir l'histogramme n'existe plus; vous ne pourrez pas le modifier")) Q
 N IND,NOM,LL
 S IND=^DESC($J,%L,"INDIVIDU")
 Q:^DESC($J,%L,ATR)=""
 S @IMOD@(IND)=2,NOM=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"NOM") K @(NOM)
 D ^%HXECLAT(ATR,REPER,IND,NOM,$$VATR^%HXIARSA(REPI,IND,ATR,HIS))
 I '($D(@NOM)) S REAFF=1,SORTIE=0 Q
 S LOLD=L+1
 D MAJGLO^%HXPARCO(R,ATR,NOM,IMOD,%L,.L)
 
 S I=$O(@IMOD@(""))
 
 I I'="" F LL=LOLD:1 S I=$O(@IMOD@(I)) Q:I=""  D CHDES
 S REAFF=1,SORTIE=0
 K @(NOM) Q
CHDES 
 S ^DESC($J,LL,"INDIVIDU")=I
 S ^DESC($J,LL,ATR)=$$VATR^%HXIARSA(REPI,I,ATR,HIS)
 S ^DESC($J,LL,R)=$$AFFI^%QMDAUC(REPS,R,$$VREG^%HXIARSA(FREG,REPI,I,R))
 Q
 
SEL 
 I '($$EX^%QSGEST7(@TEMP@("LISTE"))) D ^%VZEAVT($$^%QZCHW("La liste qui a servi a definir l'histogramme n'existe plus; vous ne pouvez pas le modifier")) Q
 N IND
 S IND=^DESC($J,%L,"INDIVIDU"),@IMOD@(IND)=""
 D CLEPAG^%VVIDEO,MODE^%QSATTRI(IND,REPI,0,0,79,23,0)
 S ^DESC($J,%L,ATR)=$$VATR^%HXIARSA(REPI,IND,ATR,HIS)
 S ^DESC($J,%L,R)=$$AFFI^%QMDAUC(REPS,R,$$VREG^%HXIARSA(FREG,REPI,IND,R))
 S REAFF=1,SORTIE=0
 Q
 
MAJ(HIS,GL,INVC,ATR,OPTH,ABC,FTOT) 
 Q:'($D(@IMOD))
 I ABC D POCLEPA^%VVIDEO I $$CONFIRM^%VZEOUI($$^%QZCHW("L'histogramme ne sera plus ABC, voulez-vous le reconstruire")_" ?")=1 D ^%HXICAL(@TEMP@("LISTE"),ATR,R,FTOT,FREG,N,P,GL,GR,ABC,OPTH),INV^%HXPARAM(GL,INVC) Q
 N %J,%I,I,VT,VR,CS1,CS2
 D MSG^%VZEATT($$^%QZCHW("Mise a jour de l'histogramme")_" "_$$^%QZCHW("de")_" "_$$^%QZCHW($S(HIS=1:"gauche",1:"droite")))
 S I="" F %I=0:0 S I=$O(@IMOD@(I)) Q:I=""  D MOD
 Q
MOD 
 I $D(@GL@(CS,"IND",I)) S CS2=CS G SM
 F CS2=1:1:@GL Q:$D(@GL@(CS2,"IND",I))
 I CS2=(@GL+1) G SM+1
SM I @IMOD@(I)'=1 D DEL^%HXPARCO(GL,I,CS2,OPTH,.CARD)
 Q:@IMOD@(I)=2
 
 S VT=$$VATR^%HXIARSA(REPI,I,ATR,HIS) Q:VT=""
 S VR=$$AFFI^%QMDAUC(REPS,R,$$VREG^%HXIARSA(FREG,REPI,I,R)) Q:VR=""
 S CS1=$$NOCOL^%HXPARCO(GL,INVC,ABC,VR,N,P,"",0,.NOCOL)
 D INS^%HXPARCO(GL,I,CS1,OPTH,VR,VT,.CARD)
 Q

