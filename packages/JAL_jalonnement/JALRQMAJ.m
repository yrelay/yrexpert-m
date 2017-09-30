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

;JALRQMAJ^INT^1^59547,74867^0
JALRQMAJ ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
JAL(OP,MOP) 
 N TEMP,MEN,MEN1,ADR,CTR,ARC,OR,DATEJ,GL,REP,OR1,GLO,ER,CTRL
 N %L,OOP,NBCOL
 N T,LI
 S TEMP=$$CONCAS^%QZCHAD("^TEMPORAI($J)",$P($ZPOS,"^",2))
 S REP=$$OP^JALRPJ
 K @(TEMP)
 S MEN=$$CONCAS^%QZCHAD(TEMP,"MEN")
 S MEN1=$$CONCAS^%QZCHAD(TEMP,"MEN1")
 S @MEN1@(1)=$$^%QZCHW("abandon")_"^AB"
 
 S @MEN1@(3)=$$^%QZCHW("Jalonnement partiel")_"^JAP"
 S @MEN1@(4)=$$^%QZCHW("Pousser")_"^PAP"
 S @MEN@("ALIGN")=0
 S @MEN@("MES")=MEN1
 S @MEN@("PG")=$P($ZPOS,"^",2)
 S @MEN@("NUM")=0
 S @MEN@("DL")=2
 S @MEN@("YH")=22
 S OOP=OP D ^%VMENUPG(MEN,.ADR,.CTRL) S OP=OOP
 I (((CTRL="F")!(CTRL="A"))!(ADR=""))!(ADR="AB") D AB Q
 I $$DATEJ(.DATEJ)="AB" D AB Q
 S ARC=$$GRANDPERE(OP) D ON^%VZEATT
 D MV^%QSCALVA($$GAMME^JALRPJ,$$PERE(OP),$$GO^JALRPJ,.GL)
 S OR=$$NXTRIAVO^%QSTRUC8($$GAMME^JALRPJ,$$PERE(OP),$$GO^JALRPJ,$$NOM(OP),"")
 S ADR=$$CHOIX(OR,$O(GL("")),$ZP(GL("")),ADR,DATEJ,$$ODATEJ(REP,OP),GL)
 S DATEJ=$$DH31^%QMDATE(DATEJ) D:(ADR'="")&(ADR'="AB") @ADR
 D AB
 Q
JAVT D MSG("Jalonnement aval total"),JAVT^JALACT(ARC,DATEJ,.MOP,.ER),ERR($$^%QCAZG("ER")+0) Q
JAMT D MSG("Jalonnement amont total"),JAMT^JALACT(ARC,DATEJ,.MOP,.ER),ERR($$^%QCAZG("ER")+0) Q
JAV D MSG("Jalonnement aval partiel"),JAV^JALACT(ARC,OR,DATEJ,.MOP,.ER),ERR($$^%QCAZG("ER")+0) Q
JAM D MSG("Jalonnement amont partiel"),JAM^JALACT(ARC,OR,DATEJ,.MOP,.ER),ERR($$^%QCAZG("ER")+0) Q
PAM D MSG("pousse amont partiel"),PAM^JALACT(ARC,OR,DATEJ,.MOP,.ER),ERR($$^%QCAZG("ER")+0) Q
PAV D MSG("pousse aval partiel"),PAV^JALACT(ARC,OR,DATEJ,.MOP,.ER),ERR($$^%QCAZG("ER")+0) Q
AB K @(TEMP) D OFF^%VZEATT Q
ERR(ERR) 
 I ERR=0 Q
 D ^%VZEAVT($$^%QZCHW("Erreur")_" : "_$$NOMLOG^%QSF($$ART^JALRPJ)_" "_$$^%QZCHW("sans")_" "_$S((0<ERR)<3:$$NOMLOG^%QSF($S(ERR=1:$$GAMME^JALRPJ,ERR=2:$$OP^JALRPJ)),ERR=3:"MACHINE",1:"")) Q
 
MSG(X) D POCLEPA^%VVIDEO W $$^%QZCHW(X),"  ",$$ODATEJ(REP,OP)," --> ",$$DATENO3^%QMDATE(DATEJ) Q
GRANDPERE(OP) Q $P(OP,",",1)
PERE(OP) Q $P(OP,",",1)_","_$P(OP,",",2)
NOM(OP) Q $P(OP,",",3)
ODATEJ(REP,OP) Q $$DAT3^JALZ($$^%QSCALVA(REP,OP,"DATE.JALON"))
 
CHOIX(OR,OR1,ORN,ADR,DATEJ,ODATEJ,CARD) 
 N X,DELTA Q:CARD=0 "AB"
 Q:ADR="JA" "JA"
 S DELTA=DATEJ-ODATEJ S:ODATEJ="" DELTA=0
 I ADR="JAP" Q $$C1
 I ADR="PAP" Q $$C2
 Q ""
C1() Q:(DELTA>0)!(OR=OR1) "JAV"
 Q:(DELTA<0)!(OR=ORN) "JAM"
 Q "AB"
C2() Q:(DELTA>0)!(OR=OR1) "PAV"
 Q:(DELTA<0)!(OR=ORN) "PAM"
 Q "AB"
DATEJ(DATE) 
 N A,I,OK,CTRL
 S A="DATE.JALON de cette operation : ",OK=0,CTRL=""
 F I=1:0 Q:((CTRL="A")!(CTRL="F"))!OK  D S
 Q:OK 0 Q "AB"
S D POCLEPA^%VVIDEO W $$^%QZCHW(A)
 D GET^%VLECFL2("",$X,$Y,30,50,.CTRL,.DATE)
 Q:(CTRL="A")!(CTRL="F")
 S DATE=$$CORRECT^%VYDAT(DATE)
 I DATE="" S OK=0 Q
 W " --> "_DATE
 S OK=1 D POCLEPA^%VVIDEO S DATE=$$DATENO3^%QMDATE($$10^%QMDATE1(DATE))
 Q
 
 
 
TEST D JAL^JALRQMAJ("ARC155,TOLE,OPE3",.OPA) Q
TEST3 W $$DATEJ(.DATE) Q
TEST2 F I=1:0 D TR
 Q
TR F J="OR","OR1","ORN","ADR","DATEJ","ODATEJ","CARD" W !,J,"  " R @(J)
 W !,"CHOIX --> ",$$CHOIX(OR,OR1,ORN,ADR,DATEJ,ODATEJ,CARD)
 Q

