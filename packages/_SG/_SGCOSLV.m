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

;%SGCOSLV^INT^1^59547,73890^0
%SGCOSLV ;;07:45 PM  28 May 1993; ; 28 May 93 11:42 AM
 
 
 
 
 
 
 
 
 N MN,CONTR,ADRES,NBEX
 L
 F I="TRAITEMENT","TXP2RB","SX","ATELIER" S:'($D(^[QUI]cptpb(I))) ^[QUI]cptpb(I)=0 S:'($D(^[QUI]cptpb(I,$J))) ^[QUI]cptpb(I,$J)=0
 D CLEPAG^%VVIDEO
 S libres=$$CONCAS^%QZCHAD("^[QUI]TEMPORAI","processeurs libres")
 S RESOLUS=$$CONCAS^%QZCHAD("^[QUI]TEMPORAI","resolus")
 S MN=$$TEMP^%SGUTIL
 S @MN="20^10^79"
 S @MN@(1)=$$^%QZCHW("Activation")_"^RUN"
 S @MN@(1,"COM")=$$^%QZCHW("Lancement de la tache de scrutation et d'execution")
 S @MN@(2)=$$^%QZCHW("Statistiques")_"^STA"
 S @MN@(2,"COM")=$$^%QZCHW("Nombre de resolution de problemes par job")
 S @MN@(3)=$$^%QZCHW("Initialisations")_"^INI"
 S @MN@(3,"COM")=$$^%QZCHW("Reinitialisation des tables de problemes et de statistiques")
MEN 
 S DX=1,DY=20 X XY D CLEBAS^%VVIDEO
 D ^%VQUIKMN(0,80,21,MN,.ADRES,.CONTR) G:ADRES'="" @ADRES
 I (CONTR="A")!(CONTR="F") K @(MN) Q
 G MEN
RUN S NBEX=$$EXEC^%SGCOSLE("",1)
 D CLEPAG^%VVIDEO
 G MEN
STA D ^%SGCOSTA G MEN
INI D REINIT G MEN
 
 
 
 
INITGTRT 
 S A="" F %A=0:0 S A=$O(@CARGEN@(IGEN,"VARTEMP",A)) Q:A=""  S O="" F %O=0:0 S O=$O(@CARGEN@(IGEN,"VARTEMP",A,O)) Q:O=""  S V=@CARGEN@(IGEN,"VARTEMP",A,O) D PA^%QSGESTI("%",$J,A,V,O)
 S A="" F %A=0:0 S A=$O(@CARGEN@(IGEN,"CXT",A)) Q:A=""  S O="" F %O=0:0 S O=$O(@CARGEN@(IGEN,"CXT",A,O)) Q:O=""  S V=@CARGEN@(IGEN,"CXT",A,O),CXT(A,O)=V
 Q
 
INITTXP 
 D INIVAR^%TXPETU
 S ARB="^[QUI]arb(ETUDE)",tapb="^[QUI]apb(ETUDE,ATELIER)",valpb="^[QUI]valpb(ETUDE,ATELIER)",tmax="^[QUI]tmax(ETUDE,ATELIER)"
 
 S VAR="" F %V=0:0 S VAR=$O(@CARGEN@(IGEN,"VAR",VAR)) Q:VAR=""  S @VAR=@CARGEN@(IGEN,"VAR",VAR)
 S VAR="" F %V=0:0 S VAR=$O(@CARGEN@(IGEN,"TAB",VAR)) Q:VAR=""  S INDX="" F %I=0:0 S INDX=$O(@CARGEN@(IGEN,"TAB",VAR,INDX)) Q:INDX=""  S @VAR@(INDX)=@CARGEN@(IGEN,"TAB",VAR,INDX)
 Q
 
INITSX 
 S A="" F %A=0:0 S A=$O(@CARGEN@(IGEN,"VARTEMP",A)) Q:A=""  S O="" F %O=0:0 S O=$O(@CARGEN@(IGEN,"VARTEMP",A,O)) Q:O=""  S V=@CARGEN@(IGEN,"VARTEMP",A,O) D PA^%QSGESTI("%",$J,A,V,O)
 S A="" F %A=0:0 S A=$O(@CARGEN@(IGEN,"CXT",A)) Q:A=""  S O="" F %O=0:0 S O=$O(@CARGEN@(IGEN,"CXT",A,O)) Q:O=""  S V=@CARGEN@(IGEN,"CXT",A,O),CXT(A,O)=V
 S NOEUD=@CARGEN@(IGEN,"NOEUD")
 Q
 
INITATE 
 D INIVAR^%TXPETU
 S ETUDE=@CARGEN@(IGEN,"VAR","ETUDE")
 S PMAX=@CARGEN@(IGEN,"VAR","PMAX")
 Q
 
TRT 
 K @libres@($J)
 S NT=@LISTEPB@(IPB,"CARSPE","TRT")
 S R=@LISTEPB@(IPB,"CARSPE","REP")
 S I=@LISTEPB@(IPB,"CARSPE","IND")
 S RES=$$CONTEXT^%TLIACUN(NT,R,I,0,0,0,.CXT,.ABAND)
 D WAIT
 Q
 
TXP 
 N tplus1,r1
 K @libres@($J)
 S TMAX=@LISTEPB@(IPB,"CARSPE","TMAX")
 S PB=@LISTEPB@(IPB,"CARSPE","PB")
 S apb=@LISTEPB@(IPB,"CARSPE","apb")
 S tplus1=@LISTEPB@(IPB,"CARSPE","t")
 S r1=@LISTEPB@(IPB,"CARSPE","r1")
LOOPZA L +@PRD@(tplus1,r1):1 E  D M^%TXP1RD("tentative de prise sur @PRD@("_tplus1_","_r1_")") G LOOPZA
 S @LISTEPB@(IPB,"CARSPE","fmi")=$$^%TXP3RD(tplus1,@LISTEPB@(IPB,"CARSPE","r"),@LISTEPB@(IPB,"CARSPE","PB"))
 L -@PRD@(tplus1,r1)
 D DEBCRIT
 S @LISTEPB@(IPB)="RESOLU"
 D FINCRIT
 
WAIT 
 D DEB^%SGMESU("WAIT")
 S @libres@($J)=""
WAIT2 D ^%SGCOSTA1 I V($J,NATPB)>30 D M^%SGCOSLV(" boucle de repartition "_$H) I '($$FRAPPEL(NATPB)) G WAIT2
 D FIN^%SGMESU("WAIT")
 Q
 
 
SX 
 K @libres@($J)
 D SOLVEPB^%QMEXSLV,WAIT
 Q
 
ATELIER 
 K @libres@($J)
 S ATELIER=@LISTEPB@(IPB,"CARSPE","ATELIER")
 D ATELIER^%TXPARB(ETUDE),WAIT
 Q
 
DEBCRIT 
 L +^[QUI]SEMASOL("FILEPB")
 Q
FINCRIT 
 L -^[QUI]SEMASOL("FILEPB")
 Q
 
REINIT 
 K ^[QUI]cptpb,^[QUI]TEMPORAI
 Q
 
 
 
 
 
ASSIST() 
 N GNBPBT,NBPBT,TOUJOURS,EXPIRE,TIMEXPI
 S GNBPBT=$$TEMP^%SGUTIL
 S TOUJOURS=0,EXPIRE=0,TIMEXPI=""
 D MEMX^%QCAMEM
 S @GNBPBT=$$EXEC^%SGCOSLE(TIMEXPI,TOUJOURS)
 K
 D RMEMX^%QCAMEM
 S NBPBT=@GNBPBT
 Q NBPBT
 
M(M) N Y S Y="20,20\RLWY\1\\\",Y(1)=$E(M_"                                                                        ",1,72)_"*" D ^%PKPOP Q
 
 Q
M2(M,M2) N Y S Y="20,20\RLWY\1\\\",Y(1)=$E(M_"                                                                          ",1,60)_$E(M2_"                       ",1,12)_"*" D ^%PKPOP Q
FRAPPEL(NATPB) 
 S VMAX=-10000,JMAX=0
 S J="" F %J=1:1 S J=$O(V(J)) Q:J=""  I $$libre(J),(30-V(J,NATPB))>VMAX S VMAX=30-V(J,NATPB),JMAX=J
 
 I $J=JMAX Q 1
 Q 0
libre(J) 
 Q $D(@libres@(J))
 
tt 
 S LISTRES="^[QUI]TEMPORAI(""RES"")"
 S @LISTRES@(1)="",I=2
 F  I '($D(@LISTRES@(I-1))) H 5E-1 S @LISTRES@(I)="" D M^%SGCOSLV(I_" fini") S I=I+1

