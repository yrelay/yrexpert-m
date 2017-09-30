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

;%ATNGENA^INT^1^59547,73866^0
%ATNGENA ;;11:57 AM  4 Dec 1992 ; 04 Dec 92  7:15 PM
 
 
 
 
 
 D GENER($$GEN^%QCAPOP("AUT"),10,1,0,5,100,50,1)
 Q
 
 
 
 
 
 
 
 
 
GENER(NOMATN,NBNODE,NBTERM,TXPETRI,NBARCMOY,TXOKNODE,TXOKARC,NOCYCLE) 
 B
 N GLOB,INO,OK,NBARC,AIEULS
 S GLOB="^[QUI]RQSGLO(""ATN"","""_NOMATN_""")"
 S AIEULS=$$TEMP^%SGUTIL
 S INO=0
BLINO 
 S @GLOB@("O",INO)=0
 
 S OK=$R(100),@GLOB@("O",INO,1)="X|S OK="_(OK<TXOKNODE)
 S OK=$R(100) I OK<TXPETRI S @GLOB@("PETRI",INO)=""
 S NBARC=$R(NBARCMOY*2)
 S INEX=0
BL10 G:INEX=NBARC BL20
 S NEX=$R(NBNODE-1)+1
 S NEXI=NEX
BL15 S PROB=$R(100)
 I $D(@GLOB@("T",INO,NEXI))!((NOCYCLE&(PROB<TXOKARC))&((NEXI=INO)!$D(@AIEULS@(INO,NEXI)))) S NEXI=NEXI+1 S:NEXI=NBNODE NEXI=1 G:NEXI=NEX BL20 G BL15
 I NOCYCLE S @AIEULS@(NEXI,INO)="",J="" F %J=0:0 S J=$O(@AIEULS@(INO,J)) Q:J=""  S @AIEULS@(NEXI,J)=""
 S INEX=INEX+1,@GLOB@("T",INO,NEXI,1)="I|"_PROB_"<"_TXOKARC
 G BL10
 
BL20 S INO=INO+1 G:INO<NBNODE BLINO
 S INO=0
 F %I=0:0 Q:INO=NBTERM  S TERM=$R(NBNODE-1)+1 I @GLOB@("O",TERM)=0 S @GLOB@("O",TERM)=1,INO=INO+1
 I NOCYCLE K @(AIEULS)
 Q
 
 
 
LABY 
 N TEMP
 S AIEULS=$$TEMP^%SGUTIL
 W !,"nom du labyrinthe"
 R LABY
 W !,"nom de l'atn"
 R NOMATN
 W !,"acceptation des cycles (0/1)"
 R NOCYCLE
 S NOCYCLE=1-NOCYCLE
 
 K ^[QUI]RQSGLO("ATN",NOMATN)
 S CASE="^[QUI]RQSGLO(""ATN"","""_NOMATN_""",""O"")"
 S LIEN="^[QUI]RQSGLO(""ATN"","""_NOMATN_""",""T"")"
 S A=$A("A")
 F L=0:1:9 S LIG=2+(L*2) F COL=1:1:19 I '($D(^[QUI]SOURJEUX(LABY,COL*4,LIG))) S @CASE@($C(A+L)_COL)=0
 S @CASE@(0)=0
 S @CASE@("J19")=1
 S @LIEN@(0,"A1")=""
 G:NOCYCLE ARBO
 S ICASE=""
BCLP S ICASE=$O(@CASE@(ICASE)) G:ICASE="" FIN
 S L=$A($E(ICASE)),C=$E(ICASE,2,$L(ICASE))
 D GG(L-1,C),GG(L+1,C),GG(L,C-1),GG(L,C+1)
 G BCLP
FIN 
 S @CASE@(0)=0
 S @CASE@("J19")=1
 S @LIEN@(0,"A1")=""
 Q
GG(X,Y) 
 S PRO=$C(X)_Y
 Q:'($D(@CASE@(PRO)))
 S @LIEN@(ICASE,PRO)="" Q
 Q
 
ARBO 
 B
 N AIEUL,FILE,VU
 S AIEUL=$$TEMP^%SGUTIL,FILE=$$TEMP^%SGUTIL,VU=$$TEMP^%SGUTIL
 S @FILE=0,IFILE=1
 
 S ICA=""
BCLA S ICA=$O(@CASE@(ICA)) G:ICA="" FIN
 I $D(@VU@(ICA)) G BCLA
 S @FILE=@FILE+1
 S @FILE@(@FILE)=ICA,IFILE=IFILE-1
BCLF S IFILE=IFILE+1
 G:'($D(@FILE@(IFILE))) BCLA
 S ICASE=@FILE@(IFILE),@VU@(ICASE)=""
 S L=$A($E(ICASE)),C=$E(ICASE,2,$L(ICASE))
 D GG2(L-1,C),GG2(L+1,C),GG2(L,C-1),GG2(L,C+1)
 G BCLF
GG2(X,Y) 
 S PRO=$C(X)_Y
 Q:'($D(@CASE@(PRO)))
 I $D(@AIEULS@(ICASE,PRO)) Q
 S J="" F %J=0:0 S J=$O(@AIEULS@(ICASE,J)) Q:J=""  S @AIEULS@(PRO,J)=""
 S @AIEULS@(PRO,ICASE)=""
 S @LIEN@(ICASE,PRO)=""
 Q:$D(@VU@(PRO))
 S @FILE=@FILE+1,@FILE@(@FILE)=PRO
 Q
 ;
 ;
 ;
 ;
 ;
 ;

