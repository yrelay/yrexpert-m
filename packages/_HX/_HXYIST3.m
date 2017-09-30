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

;%HXYIST3^INT^1^59547,73870^0
HXYIST3(GL,INVC,R,T,OPT,TEMP) 
 
 
 
 
 
 
 
 
 
 
 
 
 N COL,CS,IMOD,L,LS,SEL,%I
 S (CS,LS)=1
 S IMOD=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"IMOD") K @(IMOD)
ZMOV S SEL=$$^%VZEMOV(LMARG,(HFHA+HHIST)+1,NBCOL,HTEXT,ECART+LARG,1,TEXT,.CS,.LS)
 Q:'(SEL) 0
 S CS=(CS+NOCOL)-1
 I '($D(@GL@(CS))) D ^%VSQUEAK G ZMOV
 I @GL@(CS)=0 D ^%VSQUEAK G ZMOV
 I OPT'="" G GEST
 
 
 S OPT="SEL^%HXYIST3"
 
 D MEN2^%HXPARAM(MENU)
 S DY=LMENU,DX=0 D CLEBAS^%VVIDEO
SELECT 
 D ^%VQUIKMN(2,79,LMENU,MENU,.ADR,.CTR) G:ADR'="" @ADR
 I "AF"[CTR G FIN
 D ^%VSQUEAK G SELECT
 
FIN D ^%VZEATT
 K @(IMOD),^DESC($J)
 Q 1
 
MEN D MEN^%HXPARC2,MAJ
 G FIN
 
DEPL 
 I '($$EX^%QSGEST7(@TEMP@("LISTE"))) D ^%VZEAVT($$^%QZCHW("La liste qui a servi a definir l'histogramme n'existe plus; vous ne pouvez pas le modifier")) G SELECT
 D DEPL^%HXPARC2(GL,R,REPR,CS,IMOD),MAJ
 G FIN
 
GEST 
 N VT,VR,IND
 D SELINDI(OPT),^%QUKOLO,MAJ
 G FIN
 
SEL 
 I '($$EX^%QSGEST7(@TEMP@("LISTE"))) D ^%VZEAVT($$^%QZCHW("La liste qui a servi a definir l'histogramme n'existe plus; vous ne pouvez pas le modifier")) Q
 S IND=^DESC($J,%L,"INDIVIDU"),@IMOD@(IND)=""
 D CLEPAG^%VVIDEO,MODE^%QSATTRI(IND,REPI,0,0,79,23,0)
 S VT=$$VAL^%HXYISTO(FTOT,REPI,IND,T)
 S VR=$$AFFI^%QMDAUC(REPR,R,$$VAL^%HXYISTO(FREG,REPI,IND,R))
 S ^DESC($J,%L,T)=VT
 S ^DESC($J,%L,R)=$$SYN^%HXYISTO(FSYN,"ZHYZCO",REPR,R,VR)
 S REAFF=1,SORTIE=0
 Q
 
ECL 
 N IND,NOM,LL,VR,VT
 D SELINDI("ECLAT^%HXYIST3"),^%QUKOLO
 D MAJ
 I $D(@IMOD) D MAJ^%HXPARCO(IMOD,@TEMP@("LISTE"),.CARD)
 G FIN
 
ECLAT 
 I '($$EX^%QSGEST7(@TEMP@("LISTE"))) D ^%VZEAVT($$^%QZCHW("La liste qui a servi a definir l'histogramme n'existe plus; vous ne pourrez pas le modifier")) Q
 S IND=^DESC($J,%L,"INDIVIDU")
 Q:^DESC($J,%L,T)=""
 S @IMOD@(IND)=2,NOM=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"NOM") K @(NOM)
 D ^%HXECLAT(T,REPER,IND,NOM,$$VAL^%HXYISTO(FTOT,REPI,IND,T))
 I '($D(@NOM)) S REAFF=1,SORTIE=0 Q
 S LOLD=L+1
 D MAJGLO^%HXPARCO(R,T,NOM,IMOD,%L,.L)
 
 S I=$O(@IMOD@(""))
 
 I I'="" F LL=LOLD:1 S I=$O(@IMOD@(I)) Q:I=""  D CHDES
 S REAFF=1,SORTIE=0
 Q
CHDES 
 S ^DESC($J,LL,"INDIVIDU")=I
 S VT=$$VAL^%HXYISTO(FTOT,REPI,I,T)
 S VR=$$AFFI^%QMDAUC(REPR,R,$$VAL^%HXYISTO(FREG,REPI,I,R))
 S ^DESC($J,LL,T)=VT
 S ^DESC($J,LL,R)=$$SYN^%HXYISTO(FSYN,"ZHYZCO",REPR,R,VR)
 Q
 
SELINDI(PROG) 
 N LO,LCOLS,I,%I
 D ^%VZEATT
 K ^DESC($J)
 S LO=0,COL="^DESC($J)"
 S ^DESC($J,"MSG")=$$^%QZCHW("Colonne : ")_$$SYN^%HXYISTO(FSYN,"ZHY",REPR,R,@GL@(CS,"TEXT"))
 S ^DESC($J,"TITC")=$$^%QZCHW("Individu")
 S ^DESC($J,"INTER")=1,^DESC($J,"MODI")=1
 S ^DESC($J,"PROG")=PROG
 S L=0,I=""
 F %I=0:0 S I=$O(@GL@(CS,"IND",I)) Q:I=""  D TI
 S LO=LO\1,LCOLS=((80-LO)-10)\2
 S ^DESC($J,"LGC")=LO
 S ^DESC($J,"COL",1)=$$^%QZCHW(T)_"^"_LCOLS_"^"_T
 S ^DESC($J,"COL",2)=$$^%QZCHW(R)_"^"_LCOLS_"^"_R
 S ^DESC($J,"COL",3)=$$^%QZCHW("INDIVIDU")_"^"_LCOLS_"^"_"INDIVIDU"
 Q
TI S CH=@GL@(CS,"IND",I),L=L+1,^DESC($J,L)=$$S^%QAX(I)
 S LO=((LO*(L-1))+$L(^DESC($J,L)))/L
 S ^DESC($J,L,T)=$P(CH,"^",1)
 S ^DESC($J,L,R)=$$SYN^%HXYISTO(FSYN,"ZHYZCO",REPR,R,$P(CH,"^",2))
 S ^DESC($J,L,"INDIVIDU")=I
 Q
 
MAJ 
 Q:'($D(@IMOD))
 I ABC D POCLEPA^%VVIDEO I $$CONFIRM^%VZEOUI($$^%QZCHW("L'histogramme ne sera plus ABC, voulez-vous le reconstruire")_" ?")=1 D ^%HXYCAL(@TEMP@("LISTE"),T,R,N,P,GL,BI,BS,BO,ABC,OPTH,FTOT,FREG,FCOL,ATCUM),INV^%HXPARAM(GL,INVC) Q
 N %I,I,CS1,CS2,VT,VR
 D MSG^%VZEATT($$^%QZCHW("Mise a jour de l'histogramme"))
 S I="" F %I=0:0 S I=$O(@IMOD@(I)) Q:I=""  D MOD
 S CUMUL=@GL@("TOTAL")
 Q
MOD 
 I $D(@GL@(CS,"IND",I)) S CS2=CS G SM
 F CS2=1:1:@GL Q:$D(@GL@(CS2,"IND",I))
 I CS2=(@GL+1) G SM+1
SM I @IMOD@(I)'=1 D DEL^%HXPARCO(GL,I,CS2,OPTH,.CARD)
 Q:@IMOD@(I)=2
 
 S VT=$$VAL^%HXYISTO(FTOT,REPI,I,T) Q:VT=""
 S VR=$$AFFI^%QMDAUC(REPR,R,$$VAL^%HXYISTO(FREG,REPI,I,R)) Q:VR=""
 I (BI="")&(BS="") G STO
 I N,((VR<BI)&(BI'=""))!((VR>BS)&(BS'="")) Q
 I '(N),((BI]VR)&(BI'=""))!((VR]BS)&(BS'="")) Q
 G STO
 
STO S CS1=$$NOCOL^%HXPARCO(GL,INVC,ABC,VR,N,P,FCOL,BO,.NOCOL)
 D INS^%HXPARCO(GL,I,CS1,OPTH,VR,VT,.CARD)
 Q

