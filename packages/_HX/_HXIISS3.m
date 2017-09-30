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

;%HXIISS3^INT^1^59547,73869^0
HXIISS3(GL,INVC,HIS,ATR,T,REPS,TEMP) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N %I,COL,CS,IMOD,L,LS,SEL
 S (CS,LS)=1
 S IMOD=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"IMOD") K @(IMOD)
ZMOV 
 S SEL=$$^%HXIMOVD(LMARG(HIS),(HFHA+HHIST)+1,NBCOL(HIS),HTEXT,ECART+LARG(HIS),1,$$CONCAS^%QZCHAD(TEXT,HIS),.CS,.LS)
 I ('(SEL))&(HIS=1) S INDCOCOU=1
 Q:'(SEL) 0
 S CS=(CS+NOCOL(HIS))-1 I $D(@GL@(CS))=0 G ZMOV
 I @GL@(CS)=0 G ZMOV
PREP 
 D MEN2^%HXPARAM(MENU)
 S @MENU@(5)=$$^%QZCHW($S(HIS=1:"Histo.droit",1:"Histo.gauche"))_"^DEUX"
 S DY=LMENU,DX=0 D CLEBAS^%VVIDEO
 
SELECT 
 D ^%VQUIKMN(2,79,LMENU,MENU,.ADR,.CTR) G:ADR'="" @ADR
 I "AF"[CTR S:HIS=1 INDCOCOU=1 G FIN
 D ^%VSQUEAK G SELECT
 
FIN D ^%VZEATT
 K ^DESC($J),@(IMOD)
 Q 1
 
MEN D MEN^%HXPARC2,MAJ
 G FIN
 
DEUX 
 I HIS=2 Q 2
 Q 3
 
ECL 
 N IND,NOM,LL
 D SELINDI^%HXPARAM(ATR,T,"ECLAT^%HXIISS3",.COL,.L)
 D ^%QUKOLO,MAJ
 I $D(@IMOD) D MAJ^%HXPARCO(IMOD,@TEMP@("LISTE"),.CARD)
 G FIN
 
DEPL 
 I '($$EX^%QSGEST7(@TEMP@("LISTE"))) D ^%VZEAVT($$^%QZCHW("La liste qui a servi a definir l'histogramme n'existe plus; vous ne pouvez pas le modifier")) G SELECT
 D DEPL^%HXPARC2(GL,ATR,REPS,CS,IMOD),MAJ
 I HIS=1 S (CS,INDCOCOU)=1
 G FIN
 
GEST 
 N IND
 D SELINDI^%HXPARAM(ATR,T,"SEL^%HXIISS3",.COL,.L)
 D ^%QUKOLO,MAJ
 G FIN
 
ECLAT 
 I '($$EX^%QSGEST7(@TEMP@("LISTE"))) D ^%VZEAVT($$^%QZCHW("La liste qui a servi a definir l'histogramme n'existe plus; vous ne pouvez pas le modifier")) Q
 S IND=^DESC($J,%L,"INDIVIDU")
 Q:^DESC($J,%L,T)=""
 S @IMOD@(IND)=2,NOM=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"NOM") K @(NOM)
 D ^%HXECLAT(T,REPER,IND,NOM,$$VAL^%HXISTOD(FT,REPI,IND,T))
 I '($D(@NOM)) G FECL
 S LOLD=L+1
 D MAJGLO^%HXPARCO(ATR,T,NOM,IMOD,%L,.L)
 
 S I=$O(@IMOD@(""))
 I I'="" F LL=LOLD:1 S I=$O(@IMOD@(I)) Q:I=""  D CHDES
FECL S REAFF=1,SORTIE=0
 K @(NOM) Q
CHDES 
 S ^DESC($J,LL,"INDIVIDU")=I
 S ^DESC($J,LL,T)=$$VAL^%HXISTOD(FT,REPI,I,T)
 S ^DESC($J,LL,ATR)=$$AFFI^%QMDAUC(REPS,ATR,$$VATR^%HXISTOD(REPI,I,ATR,HIS))
 Q
 
SEL 
 I '($$EX^%QSGEST7(@TEMP@("LISTE"))) D ^%VZEAVT($$^%QZCHW("La liste qui a servi a definir l'histogramme n'existe plus; vous ne pouvez pas le modifier")) Q
 S IND=^DESC($J,%L,"INDIVIDU"),@IMOD@(IND)=""
 D CLEPAG^%VVIDEO,MODE^%QSATTRI(IND,REPI,0,0,79,23,0)
 S ^DESC($J,%L,T)=$$VAL^%HXISTOD(FT,REPI,IND,T)
 S ^DESC($J,%L,ATR)=$$AFFI^%QMDAUC(REPS,ATR,$$VATR^%HXISTOD(REPI,IND,ATR,HIS))
 S REAFF=1,SORTIE=0
 Q
 
 
MAJ 
 Q:'($D(@IMOD))
 N ABC,ABC2,L
 S ABC=@TEMP@("ABC"),ABC2=@TEMP@("ABC2"),L=@TEMP@("LISTE")
 I ABC!ABC2 D POCLEPA^%VVIDEO I $$CONFIRM^%VZEOUI($$^%QZCHW("L' histogramme ne sera plus ABC, voulez-vous le reconstruire")_" ?")=1 D ^%HXICALC(L,T,ATR,NUM,PAS,ECL,NUM2,PAS2,FT,FGR,FECL,PARGL,PARGLC,ABC,OPTH,ABC2,OPTH2,ATGROUP,ATECL) Q
 N GL1,GL,INVC,I,%I,VT,VR,CS1,CS2,NO,CA
 
 D MSG^%VZEATT($$^%QZCHW("Mise a jour de l'histogramme de gauche"))
 S GL=PARGLS_",1)",INVC=PARGLCS_",1)"
 S I="",NO=NOCOL(1)
 F %I=0:0 S I=$O(@IMOD@(I)) Q:I=""  S CS=INDCOCOU D:@IMOD@(I)'=1 TIIR D:@IMOD@(I)'=2 TIIA
 S NOCOL(1)=NO
 
 D MSG^%VZEATT($$^%QZCHW("Mise a jour de l'histogramme de droite"))
 S GL1=PARGLS_",1)",INVC=PARGLCS_",2,"_INDCOCOU_")"
 S I="",NO=NOCOL(2)
 F %I=0:0 S I=$O(@IMOD@(I)) Q:I=""  S GL=PARGLS_",2)" D:@IMOD@(I)'=1 TII2R D:@IMOD@(I)'=2 TII2A
 S NOCOL(2)=NO
 Q
 
TIIR 
 D DEL^%HXPARCO(GL,I,CS,@TEMP@("OPTH"),.CARD)
 Q
TIIA 
 S VT=$$VAL^%HXISTOD(FT,REPI,I,T) Q:VT=""
 S VR=$$AFFI^%QMDAUC(REPR,@TEMP@("R"),$$VREG^%HXISTOD(FGR,REPI,I,@TEMP@("R"))) Q:VR=""
 S CS=$$NOCOL^%HXPARCO(GL,INVC,ABC,VR,NUM,PAS,"",0,.NO)
 D INS^%HXPARCO(GL,I,CS,@TEMP@("OPTH"),VR,VT,.CARD)
 Q
 
TII2R 
 S (CS1,CS2)=1
BOUC G:$D(@GL@(CS1,CS2,"IND",I)) TII2F
 I CS1=(@GL1+1) D ^%VZEAVT($$^%QZCHW("Individu inexistant dans histogramme d'eclatement ")_I) Q
 I '($D(@GL@(CS1))) S CS1=CS1+1,CS2=1 G BOUC
 I CS2=(@GL@(CS1)+1) S CS2=1,CS1=CS1+1 G BOUC
 S CS2=CS2+1 G BOUC
TII2F S GL=PARGLS_",2,"_CS1_")"
 S INVC=PARGLCS_",2,"_CS1_")"
 
 S CA=@GL1@(CS1,"IND")+1
 D DEL^%HXPARCO(GL,I,CS2,@TEMP@("OPTH2"),.CA)
 I @GL@("TOTAL")=0 S @GL@("MAX")=0
 Q
TII2A 
 S VT=$$VAL^%HXISTOD(FT,REPI,I,T) Q:VT=""
 S VR=$$AFFI^%QMDAUC(REPR,@TEMP@("R"),$$VREG^%HXISTOD(FGR,REPI,I,@TEMP@("R"))) Q:VR=""
 S GL=PARGLS_",1)"
 S INVC=PARGLCS_",1)"
 S CS1=$$NOCOL^%HXPARCO(GL,INVC,ABC,VR,NUM,PAS,"",0,.NO)
 S GL=PARGLS_",2,"_CS1_")"
 S INVC=PARGLCS_",2,"_CS1_")"
 S VR=$$AFFI^%QMDAUC(REPE,@TEMP@("ECL"),$$VECL^%HXISTOD(FECL,REPI,I,@TEMP@("ECL"))) Q:VR=""
 S CS2=$$NOCOL^%HXPARCO(GL,INVC,ABC2,VR,NUM2,PAS2,"",0,.NO)
 S CA=@GL1@(CS1,"IND")-1
 D INS^%HXPARCO(GL,I,CS2,@TEMP@("OPTH2"),VR,VT,.CA)
 Q

