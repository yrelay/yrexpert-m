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

;%TXPACTI^INT^1^59547,74032^0
%TXPACTI ;;11:33 AM  28 May 1993; 17 Feb 93 11:22 AM ; 21 Sep 93  2:32 PM
 
 
 
 
ACTIV(ETUDE) 
 
 
 N LISTEPB,CARGEN,LPBCOUR,NBPB,IPB,TIMOUT,TVD,NOTHG,TYPEPB,IGEN,ASSIST,NATPB
 
 N ATELIER,A,%A,PMAX
 N etu,CTG,ARB,ctglob,etuat,etuatg,etuatc,etuatcg,etuatag,etuata,SOL,PRD,prd,dmd,demd,QMINC,QMAXC,RMINC,RMAXC,QMINP,QMAXP,RMINP,RMAXP,QMINCO,QMAXCO,RMINCO,RMAXCO
 S ^[QUI]VERSION("DATE")=$H
 D INIVAR^%TXPETU
 S PMAX=$S($D(@etu@("Nombre de Periodes")):@etu@("Nombre de Periodes"),1:"")
 D NETTOIE^%TXPETU(ETUDE)
 
 
 S NBPB=$$NBPB
 
 I NBPB=0 G FINTOT
 I NBPB=1 D UNSEUL G FINTOT
 S NATPB="ATELIER"
 
 S LISTEPB="^[QUI]TEMPORAI(""LPB"")"
 S CARGEN="^[QUI]TEMPORAI(""CARGEN"")"
 
 S LISTATT="^[QUI]TEMPORAI(""ATT"")"
 S LISTRES="^[QUI]TEMPORAI(""RES"")"
 S LPBCOUR=$$TEMP^%SGUTIL
 
 S TIMOUT=(5*60)*60
 
 
 S WAITOTH=1E-1
 
 D DEBCRIT S:'($D(@CARGEN)) @CARGEN=0 S (IGEN,@CARGEN)=@CARGEN+1 D FINCRIT
 D STOGEN
 
 
 D DEBCRIT
 S:($D(@LISTEPB)#10)=0 @LISTEPB=0
 
 S A="" F %A=0:0 S A=$O(@etuatg@(A)) Q:A=""  D STOPB
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
 
 D VALETU^%TXPSUTI(ETUDE)
 D NETTOIE^%TXPETU(ETUDE)
 Q
 
 
 
 
TIMEOUT 
 I '($D(@LISTEPB@(IPB))) S @LISTEPB@(IPB)="ATTENTE" Q
 S H=$H,J=$P(H,","),M=$P(H,",",2),H2=@LISTEPB@(IPB,"DEBUT"),J2=$P(H2,","),M2=$P(H2,",",2),D=(((J-J2)*86400)+M)-M2
 I D>TIMOUT S @LISTEPB@(IPB)="ATTENTE"
 Q
 
 
 
NBPB() N A
 S A=$O(@etuatg@("")) Q:A="" 0
 S A=$O(@etuatg@(A)) Q:A="" 1
 Q 2
 
 
UNSEUL N ATELIER
 S ATELIER=$O(@etuatg@(""))
 D DEB^%SGMESU("TXP: atelier complet")
 D ATELIER^%TXPARB(ETUDE)
 D FIN^%SGMESU("TXP: atelier complet")
 Q
 
 
STOPB 
 S (@LISTEPB,IPB)=@LISTEPB+1
 D M^%SGCOSLV("construction du pb "_IPB)
 S @LISTEPB@(IPB,"TYPE")=NATPB
 S @LISTEPB@(IPB,"CARGEN")=IGEN
 S @LPBCOUR@(IPB)=""
 
 S @LISTEPB@(IPB,"CARSPE","ATELIER")=A
 
 S @LISTATT@(IGEN,IPB)=""
 Q
 
 
SOLVEPB 
 
 S ^[QUI]cptpb(NATPB)=$S('($D(^[QUI]cptpb(NATPB))):1,1:^[QUI]cptpb(NATPB)+1)
 S ^[QUI]cptpb(NATPB,$J)=$S('($D(^[QUI]cptpb(NATPB,$J))):1,1:^[QUI]cptpb(NATPB,$J)+1)
 D M^%SGCOSLV("resolution du pb "_IPB)
 
 S ATELIER=@LISTEPB@(IPB,"CARSPE","ATELIER")
 D DEB^%SGMESU("TXP: atelier complet")
 D ATELIER^%TXPARB(ETUDE)
 D FIN^%SGMESU("TXP: atelier complet")
 
 S @LISTRES@(IGEN,IPB)=""
 Q
 
 
EPIPB 
 
 
 
 K @LISTEPB@(IPB),@LPBCOUR@(IPB),@LISTRES@(IGEN,IPB)
 Q
 
STOGEN 
 S @CARGEN@(IGEN,"VAR","ETUDE")=ETUDE
 S @CARGEN@(IGEN,"VAR","PMAX")=PMAX
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

