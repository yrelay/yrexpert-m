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

;%TLIACPP^INT^1^59547,74029^0
%TLIACPP ;;05:03 PM  16 Jun 1993; 17 Feb 93 11:22 AM ; 21 Sep 93  2:34 PM
 
 
 
 
PPAL(LISTRT) 
 N LISTEPB,CARGEN,LPBCOUR,NBPB,IPB,TIMOUT,TVD,NOTHG,TYPEPB,IGEN,ASSIST,NATPB
 N TRT,%T,T,A,%A,O,%O,IGEN,B,I,%I,LLI,NT,R
 
 S ^[QUI]VERSION("DATE")=$H
 
 S TOTAL=0
 
 S NBPB=$$NBPB
 
 I NBPB=0 G FINTOT
 I NBPB=1 D UNSEUL G FINTOT
 S NATPB="TRAITEMENT"
 
 S LISTEPB="^[QUI]TEMPORAI(""LPB"")"
 S CARGEN="^[QUI]TEMPORAI(""CARGEN"")"
 
 S LISTATT="^[QUI]TEMPORAI(""ATT"")"
 S LISTRES="^[QUI]TEMPORAI(""RES"")"
 S LPBCOUR=$$TEMP^%SGUTIL
 
 S TIMOUT=60*60
 
 
 S WAITOTH=1E-1
 
 D DEBCRIT S:'($D(@CARGEN)) @CARGEN=0 S (IGEN,@CARGEN)=@CARGEN+1 D FINCRIT
 D STOGEN
 
 
 D DEBCRIT
 S:($D(@LISTEPB)#10)=0 @LISTEPB=0
 S T="" F %T=0:0 S T=$$SUIVL^%QS0XG1(LISTRT,T) Q:T=""  S LLI=$$^%QSCALIN("TRAITEMENT",T,"LISTE",1) I LLI'="" S B=$$BASE^%QSGEST7(LLI),I="" F %I=0:0 S I=$$SUIVL^%QS0XG1(LLI,I) Q:I=""  D STOPB
 D FINCRIT
 
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
 
 
 
NBPB() Q 2
 
UNSEUL Q
 
 
STOPB 
 S (@LISTEPB,IPB)=@LISTEPB+1
 D M^%SGCOSLV("construction du pb "_IPB)
 S @LISTEPB@(IPB,"TYPE")=NATPB
 S @LISTEPB@(IPB,"CARGEN")=IGEN
 S @LPBCOUR@(IPB)=""
 
 S NT=$E(T,3,$L(T))
 S @LISTEPB@(IPB,"CARSPE","TRT")=NT
 S @LISTEPB@(IPB,"CARSPE","REP")=B
 S @LISTEPB@(IPB,"CARSPE","IND")=I
 
 S @LISTATT@(IGEN,IPB)=""
 Q
 
 
SOLVEPB 
 N NT,R,I,RES
 
 S ^[QUI]cptpb(NATPB)=$S('($D(^[QUI]cptpb(NATPB))):1,1:^[QUI]cptpb(NATPB)+1)
 S ^[QUI]cptpb(NATPB,$J)=$S('($D(^[QUI]cptpb(NATPB,$J))):1,1:^[QUI]cptpb(NATPB,$J)+1)
 
 S NT=@LISTEPB@(IPB,"CARSPE","TRT")
 S R=@LISTEPB@(IPB,"CARSPE","REP")
 S I=@LISTEPB@(IPB,"CARSPE","IND")
 D M^%SGCOSLV(NT_" sur "_I)
 S RES=$$CONTEXT^%TLIACUN(NT,R,I,0,0,0,.CXT,.ABAND)
 
 S @LISTRES@(IGEN,IPB)=""
 Q
 
 
EPIPB 
 
 
 
 K @LISTEPB@(IPB),@LPBCOUR@(IPB),@LISTRES@(IGEN,IPB)
 Q
 
STOGEN 
 
 
 
 S A="" F %A=0:0 S A=$$NXTRIA^%QSTRUC8("%",$J,A) Q:A=""  S O="" F %O=0:0 S O=$$NXTRIAO^%QSTRUC8("%",$J,A,O) Q:O=""  S @CARGEN@(IGEN,"VARTEMP",A,O)=$$VALEUR^%QSTRUC8("%",$J,A,O)
 S A="" F %A=0:0 S A=$O(CXT(A)) Q:A=""  S O="" F %O=0:0 S O=$O(CXT(A,O)) Q:O=""  S @CARGEN@(IGEN,"CXT",A,O)=CXT(A,O)
 
 Q
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
 ;
 ;
 ;

