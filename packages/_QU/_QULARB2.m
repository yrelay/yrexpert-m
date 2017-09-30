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

;%QULARB2^INT^1^59547,73885^0
%QULARB2 ;;05:33 PM  25 Nov 1992; ; 01 Apr 93  1:55 PM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
PDPROF(CH) Q $L(CH,",")
 
PDFILS(CH) 
 N IPCOUR,RES,%I,CHX,LCH
 S RES=0,LCH=$L(CH,",")
 S IPCOUR="" F %I=1:1 S IPCOUR=$O(@PILE@(IPCOUR)) Q:IPCOUR=""  S CHX=@PILE@(IPCOUR) I ($L(CHX,",")-1)=LCH,$P(CHX,",",1,LCH)=CH S RES=RES+1
 Q RES
 
PDSUCC(CH) 
 N IPCOUR,RES,%I,CHX,LCH
 Q:CYCLE 0
 S RES=0,LCH=$L(CH,",")
 S IPCOUR="" F %I=1:1 S IPCOUR=$O(@PILE@(IPCOUR)) Q:IPCOUR=""  S CHX=@PILE@(IPCOUR) I $L(CHX,",")>LCH,$P(CHX,",",1,LCH)=CH S RES=RES+1
 Q RES
 
PDPERE(CH) 
 N X S X=$L(CH,",") Q:X=1 0 S X=$P(CH,",",1,X-1) Q X
 
 
 
 
 
TEST N TEMP,GRA,TRANS,XX,NUMS,XPO,XNEXT,XEVPDS,LONGUEUR,PDS
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TEST") K @(TEMP)
 S GRA=$$CONCAS^%QZCHAD(TEMP,"GRA"),TRANS=$$CONCAS^%QZCHAD(TEMP,"TR")
 S NUMS=$$GEN^%QCAPOP("STR")
 S @GRA@("a","b")=2
 
 S @GRA@("c","d")=1
 S @GRA@("a","c")=2
 
 
 
 S @GRA@("d","e")=""
 S @GRA@("b","c")=""
 S RAC="a",XNEXT="S NEX=$O(@GRA@(INDIV,NEX))"
 
 
 
 S XEVPDS="S POIDS=-$$PDPROF^%QULARB2(CHEM)"
TSTBC W !,"type d'exploration (0/1/2)" R TX I TX="" K @(TEMP) Q
 W !,"mode (NORMAL,PROFONDEUR,LARGEUR) " R MODE
 
 D INIT^%QULARBU(RAC,XNEXT,XEVPDS,TRANS,TX,MODE,NUMS,4)
 S CH=0 F I=0:0 S CH=$$NEXT^%QULARBU(NUMS,CH,.PDS) Q:CH=0  W !,"poids ",PDS,! F %J=1:1 S J=$P(CH,",",%J) Q:J=""  W @TRANS@(J)," "
 D NETTOIE^%QULARBU(NUMS)
 G TSTBC
 Q
 
 
 
TESTCMP 
 N TEMP,GRA,TRANS,XX,NUMS,XPO,XNEXT,XEVPDS,LONGUEUR,PDS,NBSOM,I
TTT2 W !,"nombre de sommets " R NBSOM
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TEST") K @(TEMP)
 S GRA=$$CONCAS^%QZCHAD(TEMP,"GRA"),TRANS=$$CONCAS^%QZCHAD(TEMP,"TR")
 S NUMS=$$GEN^%QCAPOP("STR")
 K @(GRA)
 F I=1:1:NBSOM-1 F J=I+1:1:NBSOM S @GRA@(I,J)=1
 S RAC=1,XNEXT="S NEX=$O(@GRA@(INDIV,NEX))"
 S XEVPDS="S POIDS=-$$PDSUCC(CHEM)"
 
 
 
 W !,"type d'exploration (0/1/2)" R TX I TX="" K @(TEMP) Q
 W !,"mode (NORMAL,PROFONDEUR,LARGEUR) " R MODE
 
 D INIT^%QULARBU(RAC,XNEXT,XEVPDS,TRANS,TX,MODE,NUMS,4)
 S CH=0 F I=0:0 S CH=$$NEXT^%QULARBU(NUMS,CH,.PDS) Q:CH=0  W ! F %J=1:1 S J=$P(CH,",",%J) Q:J=""  W @TRANS@(J)," "
 D NETTOIE^%QULARBU(NUMS)
 G TTT2
 Q
 
 
 
TESTCYC(NBSOM) 
 N TEMP,GRA,TRANS,XX,NUMS,XPO,XNEXT,XEVPDS,LONGUEUR,PDS,I
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TEST") K @(TEMP)
 S GRA=$$CONCAS^%QZCHAD(TEMP,"GRA"),TRANS=$$CONCAS^%QZCHAD(TEMP,"TR")
 S NUMS=$$GEN^%QCAPOP("STR")
 K @(GRA)
 F I=1:1:NBSOM F J=1:1:NBSOM S @GRA@(I,J)=1
 S RAC=1,XNEXT="S NEX=$O(@GRA@(INDIV,NEX))"
 S XEVPDS="S POIDS=-$$PDSUCC^%QULARB2(CHEM)"
 
 
 
 
 S TX=1,MODE="PROFONDEUR"
 
 
 D INIT^%QULARBU(RAC,XNEXT,XEVPDS,TRANS,TX,MODE,NUMS,4)
 S CH=0 F I=0:0 S CH=$$NEXT^%QULARBU(NUMS,CH,.PDS) Q:CH=0  W ! F %J=1:1 S J=$P(CH,",",%J) Q:J=""  W @TRANS@(J)," "
 D NETTOIE^%QULARBU(NUMS)
 Q
 
SATURE 
 F N=1:1 W !,N S ^MESURE($J,"QULARB",N,"DEBUT")=$H D TESTCYC(N) S ^MESURE($J,"QULARB",N,"FIN")=$H
 Q

