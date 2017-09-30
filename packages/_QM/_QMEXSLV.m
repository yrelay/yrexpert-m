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

;%QMEXSLV^INT^1^59547,73878^0
%QMEXSLV ;;05:45 PM  7 Sep 1993; 17 Feb 93 11:22 AM ; 21 Sep 93  2:30 PM
 
 
 
 
EXECNODE(NIV) 
 N LISTEPB,CARGEN,LPBCOUR,NBPB,IPB,TIMOUT,TVD,NOTHG,TYPEPB,IGEN,ASSIST,NATPB
 
 N SUIVANT,NOEUD,STO,ACCESREP,ACCESIND,REP,IND
 N TRT,%T,T,A,%A,O,%O,IGEN,B,I,%I,LLI,NT,R,INDX
 N COMCXT,NUMCXT,CARDCXT,JRN,ETUEVA
 S ^[QUI]VERSION("DATE")=$H
 S (MODAF,MODEX)=0
 S NOEUD=^PARAENT($J,NIV,"NOEUD")
 S STO=^PARAENT($J,NIV,"STO")
 S SUIVANT=^PARAENT($J,NIV,"SUIVANT")
 S ACCESREP=^PARAENT($J,NIV,"ACCESREP")
 S ACCESIND=^PARAENT($J,NIV,"ACCESIND")
 S ETUEVA=$E(^TOZE($J,"JRN"),$L(^TOZE($J,"JRN"))-1)+0
 S JRN="" I ETUEVA S JRN=$$GET^%SGVAR("JRN") S:JRN="" ETUEVA=0
 I ETUEVA S COMCXT=$$GET^%SGVAR("COMCXT") D DEP^%SGVAR("COMCXT") S NUMCXT=$$GEN^%QCAPOP("CXT")
 S %A=$$^%QSCALIN("ETAT.RESEAU",NOEUD,"CONTEXTE.D.ACTIVATION","PARALLELISABLE")
 I %A="NON" D ALONE G FINTOT
 
 S NBPB=$$NBPB
 
 I NBPB=0 G FINTOT
 I NBPB=1 D UNSEUL G FINTOT
 S NATPB="SX"
 
 S LISTEPB="^[QUI]TEMPORAI(""LPB"")"
 S CARGEN="^[QUI]TEMPORAI(""CARGEN"")"
 
 S LISTATT="^[QUI]TEMPORAI(""ATT"")"
 S LISTRES="^[QUI]TEMPORAI(""RES"")"
 S LPBCOUR=$$TEMP^%SGUTIL
 
 S TIMOUT=(12*60)*60
 
 
 S WAITOTH=1E-1
 
 D DEBCRIT S:'($D(@CARGEN)) @CARGEN=0 S (IGEN,@CARGEN)=@CARGEN+1 D FINCRIT
 D STOGEN
 I $E(^TOZE($J,"JRN"),$L(^TOZE($J,"JRN"))-1) G PARJOURN
 
 
 D DEBCRIT
 S:($D(@LISTEPB)#10)=0 @LISTEPB=0
 
 S INDX="" F %I=0:1 S @("INDX="_SUIVANT_"(STO,INDX)") Q:INDX=""  S @("REP="_ACCESREP_"(STO,INDX)"),@("IND="_ACCESIND_"(STO,INDX)") D STOPB
 D FINCRIT
 G EPIPAR
 
PARJOURN 
 
 
 D DEBCRIT
 S:($D(@LISTEPB)#10)=0 @LISTEPB=0
 
 S INDX="" F %I=1:1 S @("INDX="_SUIVANT_"(STO,INDX)") Q:INDX=""  S @("REP="_ACCESREP_"(STO,INDX)"),@("IND="_ACCESIND_"(STO,INDX)"),^[QUI]RQSDON("SAVCXT",JRN,NUMCXT,%I)=REP_$C(0)_IND D STOPB
 D FINCRIT
 D NOUVINST^%AMJAJ(JRN,"changement de contexte",$$GET^%SGVAR("RESEAU")_$C(0)_$$GET^%SGVAR("ETAT"))
 D ADDEXEC^%AMJAJ(JRN,"CONTEXTE",NUMCXT,COMCXT,%I-1)
EPIPAR 
 S MORATT=1
 
RES I '($D(@LISTRES@(IGEN))) G:MORATT SUITE G NOMORATT
RESOLU S IPB=""
NXRESO S IPB=$O(@LISTRES@(IGEN,IPB)) G:IPB="" SUITE D EPIPB G NXRESO
 
SUITE 
 
GET S IPB=$ZP(@LISTATT@(IGEN,"")) I IPB="" S MORATT=0 G RES
 S %R=$$DEBCRITB(IPB) G:'(%R) GET K:IPB'="" @LISTATT@(IGEN,IPB) D FINCRITB(IPB)
 D SOLVEPB
 D EPIPB
 G:$D(@LISTRES@(IGEN)) RESOLU
 G SUITE
 
 
 
 
NOMORATT 
 I $D(@LPBCOUR) H WAITOTH G RES
 
FIN 
 K @CARGEN@(IGEN)
 
FINTOT 
 
 Q
 
 
 
TIMEOUT 
 I '($D(@LISTEPB@(IPB))) S @LISTEPB@(IPB)="ATTENTE" Q
 S H=$H,J=$P(H,","),M=$P(H,",",2),H2=@LISTEPB@(IPB,"DEBUT"),J2=$P(H2,","),M2=$P(H2,",",2),D=(((J-J2)*86400)+M)-M2
 I D>TIMOUT S @LISTEPB@(IPB)="ATTENTE"
 Q
 
 
 
NBPB() 
 S STO=^PARAENT($J,NIV,"STO"),SUIVANT=^PARAENT($J,NIV,"SUIVANT")
 S ACCESREP=^PARAENT($J,NIV,"ACCESREP"),ACCESIND=^PARAENT($J,NIV,"ACCESIND")
 S INDX="",@("INDX="_SUIVANT_"(STO,INDX)") Q:INDX="" 0
 S @("INDX="_SUIVANT_"(STO,INDX)") Q:INDX="" 1
 Q 2
 
UNSEUL 
 S NOEUD=^PARAENT($J,NIV,"NOEUD")
 S INDX=""
 S @("INDX="_SUIVANT_"(STO,INDX)"),@("REP="_ACCESREP_"(STO,INDX)"),@("IND="_ACCESIND_"(STO,INDX)")
 I ETUEVA S ^[QUI]RQSDON("SAVCXT",JRN,NUMCXT,1)=REP_$C(0)_IND D NOUVINST^%AMJAJ(JRN,"changement de contexte",$$GET^%SGVAR("RESEAU")_$C(0)_$$GET^%SGVAR("ETAT")),ADDEXEC^%AMJAJ(JRN,"CONTEXTE",NUMCXT,COMCXT,1)
 D SOLVEPB^%QMEXAT6(REP,IND,NOEUD,%VNI(%VNGA,7),%VNE(%VNGA,3))
 Q
 
 
STOPB 
 S (@LISTEPB,IPB)=@LISTEPB+1
 D M^%SGCOSLV("construction du pb "_IPB)
 S @LISTEPB@(IPB,"TYPE")=NATPB
 S @LISTEPB@(IPB,"CARGEN")=IGEN
 S @LPBCOUR@(IPB)=""
 
 S @LISTEPB@(@LISTEPB,"CARGEN")=IGEN
 S @LISTEPB@(@LISTEPB,"CARSPE","REP")=REP
 S @LISTEPB@(@LISTEPB,"CARSPE","IND")=IND
 S @LISTEPB@(@LISTEPB,"CARSPE","TMP1")=%VNI(%VNGA,7)
 S @LISTEPB@(@LISTEPB,"CARSPE","TMP2")=%VNE(%VNGA,3)
 
 S @LISTATT@(IGEN,IPB)=""
 Q
 
 
SOLVEPB 
 
 S ^[QUI]cptpb(NATPB)=$S('($D(^[QUI]cptpb(NATPB))):1,1:^[QUI]cptpb(NATPB)+1)
 S ^[QUI]cptpb(NATPB,$J)=$S('($D(^[QUI]cptpb(NATPB,$J))):1,1:^[QUI]cptpb(NATPB,$J)+1)
 
 
 S REP=@LISTEPB@(IPB,"CARSPE","REP")
 S IND=@LISTEPB@(IPB,"CARSPE","IND")
 S TMP1=@LISTEPB@(IPB,"CARSPE","TMP1")
 S TMP2=@LISTEPB@(IPB,"CARSPE","TMP2")
 D M^%SGCOSLV("etat "_NOEUD_" sur l'individu "_IND)
 D SOLVEPB^%QMEXAT6(REP,IND,NOEUD,TMP1,TMP2)
 
 S @LISTRES@(IGEN,IPB)=""
 Q
 
 
EPIPB 
 
 
 
 K @LISTEPB@(IPB),@LPBCOUR@(IPB),@LISTRES@(IGEN,IPB)
 Q
 
STOGEN 
 S A="" F %A=0:0 S A=$$NXTRIA^%QSTRUC8("%",$J,A) Q:A=""  S O="" F %O=0:0 S O=$$NXTRIAO^%QSTRUC8("%",$J,A,O) Q:O=""  S @CARGEN@(IGEN,"VARTEMP",A,O)=$$VALEUR^%QSTRUC8("%",$J,A,O)
 S A="" F %A=0:0 S A=$O(CXT(A)) Q:A=""  S O="" F %O=0:0 S O=$O(CXT(A,O)) Q:O=""  S @CARGEN@(IGEN,"CXT",A,O)=CXT(A,O)
 S @CARGEN@(IGEN,"NOEUD")=^PARAENT($J,NIV,"NOEUD")
 Q
 
DEBCRIT 
 L +^[QUI]SEMASOL("FILEPB"):2 E  W !,"PROBLEME POUR PRENDRE LE SEMAPHORE" G DEBCRIT
 Q
FINCRIT 
 L -^[QUI]SEMASOL("FILEPB")
 Q
 
DEBCRITB(IPB) 
 L +^[QUI]SEMASOL("FILEATTB",IPB):0 Q $T Q
FINCRITB(IPB) 
 L -^[QUI]SEMASOL("FILEATTB",IPB)
 Q
 
 
ALONE N REP,IND,%I,IQMEX,TMPX,VALI1,VALI2
 S TMPX=$$TEMP^%SGUTIL
 S INDX=""
 F %I=1:1 S @("INDX="_SUIVANT_"(STO,INDX)") Q:INDX=""  S @("REP="_ACCESREP_"(STO,INDX)"),@("IND="_ACCESIND_"(STO,INDX)"),@TMPX@(%I,"REP")=REP,@TMPX@(%I,"IND")=IND I ETUEVA S ^[QUI]RQSDON("SAVCXT",JRN,NUMCXT,%I)=REP_$C(0)_IND
 I ETUEVA D NOUVINST^%AMJAJ(JRN,"changement de contexte",$$GET^%SGVAR("RESEAU")_$C(0)_$$GET^%SGVAR("ETAT")),ADDEXEC^%AMJAJ(JRN,"CONTEXTE",NUMCXT,COMCXT,%I-1)
 S VALI1=%VNI(%VNGA,7),VALI2=%VNE(%VNGA,3)
 S IQMEX="" F %I=0:0 S IQMEX=$O(@TMPX@(IQMEX)) Q:IQMEX=""  S REP=@TMPX@(IQMEX,"REP"),IND=@TMPX@(IQMEX,"IND") D SOLVEPB^%QMEXAT6(REP,IND,NOEUD,VALI1,VALI2)
 K @(TMPX)
 Q

