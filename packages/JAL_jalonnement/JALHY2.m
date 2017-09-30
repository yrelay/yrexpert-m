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

;JALHY2^INT^1^59547,74867^0
JALHY2 ;
 
 
 
 
 N I,TD,TF,MA,TOT,RTOT,J,MACHINE,TEMP
 N LISTES,LISTE,FIN,A,DEB,FIN,TD1,TF1
 N REG,NUM,INTERV,OPT,GSTO,FTOT,FREG,FSYN,FCOL,BI,BS,A,BO
 D CLEPAG^%VVIDEO
 I $$CONF^JALRPJ1 Q
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S GSTO=$$CONCAS^%QZCHAD(TEMP,"GSTO")
 K @(TEMP)
 
 
 S A=$$PARAM(.LISTES,.MA,.TD,.TF,.TOT,.RTOT)
 I A=1 K @(TEMP) Q
 I LISTES=$$GO^JALRPJ S LISTES=""
 D NORM^%VVIDEO,CURON^%VVIDEO
 
 S DEB=$$50^%QMDATE1(TD)
 S FIN=$$50^%QMDATE1(TF)+6
 
 S TD1=$$DATENO3^%QMDATE(DEB)
 S TF1=$$DATENO3^%QMDATE(FIN)
 S BI=DEB,BS=FIN,BO=$$50^%QMDATE1(TD)
 S LISTE=$$MD^%QSRQJAL($$OP^JALRPJ,LISTES,"MACHINE",MA,"DATE.JALON",TD1,TF1)
 I LISTE="" K @(TEMP) Q
 S MACHINE=MA
 S REG="DATE.JALON"
 S NUM=1
 S INTERV=7
 S OPT=$$CONCAS^%QZCHAD("^JALHYSEL",MA)
 S FTOT="$$TOT1^JALHY2"
 S:RTOT=$$GAMME^JALRPJ FTOT="$$TOT^JALHY2"
 S:RTOT=$$OP^JALRPJ FTOT=""
 S FREG="$$REG^JALHY2",FSYN="$$SYN2^JALHY2"
 S FCOL=$$CONCAS^%QZCHAD("$$FCOL^JALHY2",MACHINE)
 S FCOL("LIB")=$$^%QZCHW("Capacite")
 S FCOL=""
 D ^%HXYISTO(LISTE,TOT,REG,NUM,INTERV,OPT,GSTO,FTOT,FREG,.FCOL,FSYN,BI,BS,BO,0,1)
 Q
FCOL(MACHINE,R,U,V) 
 B  Q $$^JALCAP(MACHINE,U,V)
 
PARAM(LIS,MACHINE,TDE,TFE,ATOT,RTOT) 
 N RESUL,CMS,SCR,NOMTAB,ABENDSCR,TEST
 N %AJM,%A,%B,%DIFL,%IGR,%LIXD,%LIXG,%LIYB,%LIYH,%MC,%U,%V,%VINV
 N %W,%X,%Y,ADX,ADY,AFF,A,AX,AY,C,CH,CP,CTRLA,CTRLB,CTRLC,CTRLD,CTRLE
 N CTRLF,CTRLG,CTRLH,CTRLI,CTRLJ,CTRLK
 N D,DEP,ECR,ESCMV,IC,ICC,I,IK,IL,IV,LGC,LIB,LL,LPG,LXD,LXG,MOD
 N NVLEG,ODX,ODY,PCX,PCY,PD,PG,PL,PS,PX,PY,REFUSE,REP,REVID,SCR1,STOPUC
 N TAB,TBMOV,I,TREETUD,UCONT,UYI,VID,VLEG,Z,UYT,XX,Y1,YY
 N T1,T2,T3,T4,T5,T6,T7,T8
 D CLEPAG^%VVIDEO
 S %AJM="A",CMS=0,SCR="JALHY",NOMTAB="" D ^%VACTISC(SCR)
 S TEST=1 F I=1:1:^%SCRE(SCR) S TEST=TEST&($$^%QCAZG("RESUL(I)")'="")
 Q:TEST=0 1
 S LIS=RESUL(1),MACHINE=RESUL(2)
 S TDE=$$MIN(RESUL(3),RESUL(4)),TFE=$$MAX(RESUL(4),RESUL(3))
 S RTOT=$$NOMINT^%QSF(RESUL(5)),ATOT=RESUL(6)
 Q 0
FIN Q 1
TEST D ^JALHY2
 Q
MAX(A,B) Q:A>B A Q B
MIN(A,B) Q:A>B B Q A
TOT(R,I,A) N PERE,U
 S PERE=$$NOMPERE^%QSGES10($$OP^JALRPJ,I)
 S U=$$^%QSCALVA($$GAMME^JALRPJ,PERE,A)
 Q U
TOT1(R,I,A) N PERE,U
 S PERE=$$NOMPERES^%QSGES10(I,1)
 S U=$$^%QSCALVA($$ART^JALRPJ,PERE,A)
 Q U
REG(R,I,A) 
 S A=$$DH31^%QMDATE($$^%QSCALVA(R,I,A))
 Q:A=-1 "" Q A
SYN2(APP,REP,ATT,VAL,ER) S ER=0
 I ATT'="DATE.JALON" Q VAL
 
 I VAL=0 Q 0
 I APP="ZHY" Q $$05^%QMDATE1(VAL)
 I APP="ZHYDI" Q $$50^%QMDATE1(VAL)
 I APP="ZHYZCO" Q $$DATENO3^%QMDATE(VAL)
 Q ATT
SYN3(APP,REP,ATT,VAL,ER) S ER=0
 I ATT'="DATE.JALON" Q $$M^ZSX("QS",REP,ATT,VAL,.ER)
 I APP="ZHY" Q $$^ZSX("JAL","$H","DATENO4",VAL,.ER)
 I APP="ZHYDI" Q $$^ZSX("JAL","DATENO4","$H",VAL,.ER)
 I APP="ZHYZCO" Q $$^ZSX("JAL","$H","DATENO3",VAL,.ER)
 Q VAL

