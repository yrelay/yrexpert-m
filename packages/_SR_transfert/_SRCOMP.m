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

;%SRCOMP^INT^1^59547,73891^0
SRCOMP(SA,GLO) 
 
 
 
 
 
 
 
 
 N ADR,CLE,COMPDEF,CONT,FOR,LB,LARG,LIB,LV,MOD,N,NC,P,COMPOP,COMPO2
 D ^%VZEATT
 S ADR=$$CONCAT^%QZCHAD($$ADR^%SRSAIS2,""""_SA_"""")
 S CONT=@ADR
 
 S @GLO@("H")=$P(CONT,$C(0),3),@GLO@("V")=$P(CONT,$C(0),4)
 S @GLO@("FL")="RLD"
 
 S (@GLO,@GLO@("TITRE"))=$P(CONT,$C(0),2)
 
 S LV=0,P=""
 F N=0:1 S P=$O(@ADR@("CHAMPS",P)) Q:P=""  D LARG
 S @GLO@("NBC")=N,@GLO@("L")=LV
 
 S (LB,NC)=0,P="",COMPDEF="",COMPOP=0,COMPO2=0
 F N=1:1 S P=$O(@ADR@("CHAMPS",P)) Q:P=""  D STO
 
 S @GLO@("DEFAUT")=$E(COMPDEF,2,999)
 
 I COMPOP=0 S @GLO@("POP1")="",@GLO@("POP2")="" G POP2
 S @GLO@("POP1")="F %II=1:1:"_COMPOP_" X @GLO@(""POP1"",%II)"
 F %I=1:1:COMPOP S @GLO@("POP1",%I)=COMPOP(%I)
 S @GLO@("POP2")="F %II=1:1:"_COMPO2_" X @GLO@(""POP2"",%II)"
 F %I=1:1:COMPO2 S @GLO@("POP2",%I)=COMPO2(%I)
 
POP2 S @GLO@("PLL")=LB,@GLO@("CLE")=NC
 
 F P=1:1:N I $D(MOD(P)) S @GLO@("SUIV",P)=$O(MOD(P)),@GLO@("PREC",P)=$ZP(MOD(P))
 S:$O(MOD(""))'="" @GLO@("SUIV",$ZP(MOD("")))=$O(MOD("")),@GLO@("PREC",$O(MOD("")))=$ZP(MOD(""))
 
 S LIB=$S($D(@ADR@("UCONTS")):@ADR@("UCONTS"),1:"")
 S @GLO@("BOU.AJOUT")=$S(LIB="":1,1:$P(LIB,$C(0),1)="O")
 S @GLO@("BOU.ERREUR")=$S(LIB="":1,1:$P(LIB,$C(0),2)="O")
 S @GLO@("EXEC.UCONT")=$S(LIB="":"B",1:$P(LIB,$C(0),3))
 S @GLO@("STO.DER")=$S(LIB="":1,1:$P(LIB,$C(0),4)="O")
 S @GLO@("AJOUT")=$S(LIB="":1,1:$P(LIB,$C(0),5)="O")
 D POCLEPA^%VVIDEO
 Q
 
LARG 
 
 S LIB=$$GETLBLAN^%VTLBLAN($P(@ADR@("CHAMPS",P),$C(0),5))
 
 I LIB="$JOUR" S LARG=8 G FL
 
 I $E(LIB,1,7)="$HEURE(" S LARG=8 G FL
 
 I $E(LIB,1,7)="$ANNEE(" S LARG=4 G FL
 
 I $E(LIB,1,6)'="$DATE(" S LARG=$P(@ADR@("CHAMPS",P),$C(0),6) G FL
 
 S CONT=$P($P(LIB,"(",2),")",1)
 S LARG=$L(^RQSGLU("QMDA","FORM",CONT))
FL I LARG>LV S LV=LARG
 Q
 
STO 
 S CONT=@ADR@("CHAMPS",P)
 S LIB=$P(CONT,$C(0),2)
 
 S @GLO@("CHAMPS",N)=LIB
 I $L(LIB)>LB S LB=$L(LIB)
 
 S LARG=$P(CONT,$C(0),6) I LARG="" S LARG=LV
 S @GLO@("LARG",N)=LARG
 
 I $P(CONT,$C(0),3)="O" S MOD(N)=1
 
 S CLE=$P(CONT,$C(0),7)
 I CLE'="" S @GLO@("CLE",N)=CLE,@GLO@("POSCLE",CLE)=N,NC=NC+1
 
 S @GLO@("OBLIGAT",N)=$S(CLE'="":"S OK=(VAL'="""")",$P(CONT,$C(0),4)="O":"S OK=(VAL'="""")",1:"")
 
 I $P(CONT,$C(0),8)="O" S @GLO@("RECUP",N)=""
 
 S LIB=$P(CONT,$C(0),5),LIB=$$GETLBLAN^%VTLBLAN(LIB)
 
 G:(((($E(LIB,1,6)'="$POPER")&(LIB'="$JOUR"))&($E(LIB,1,6)'="$DATE("))&($E(LIB,1,7)'="$HEURE("))&($E(LIB,1,7)'="$ANNEE(") STOL
 
 G @$E(LIB,2,5)
 
STOL 
 I LIB="" S LIB=" S @VAL@("_N_")=""""" G AIDE
 S LIB=" S @VAL@("_N_")="""_$$ZSUBST^%QZCHSUB(LIB,"""","""""")_""""
 G AIDE
 
ANNE 
 S FOR=$$GETLBLAN^%VTLBLAN($P($P(LIB,"(",2),")"))
 S LIB=" S DA="_$S(FOR=1:"",1:"19_")_"$$ANNO^%QMDATE1($H) S @VAL@("_N_")=DA_$J("""","_LARG_"-"_$S(FOR=1:2,1:4)_")"
 G:$D(@GLO@("RECUP",N)) AIDE
 S COMPOP=COMPOP+1
 S COMPOP(COMPOP)="S VAL("_N_")="_$S(FOR=1:"",1:"19_")_"$$ANNO^%QMDATE1($H)_$J("""","_LARG_"-"_$S(FOR=1:2,1:4)_"),Y("_(@GLO@("NBC")+N)_")=VAL("_N_")"
 S COMPO2=COMPO2+1
 S COMPO2(COMPO2)="S VAL("_N_")="_$S(FOR=1:"",1:"19_")_"$$ANNO^%QMDATE1($H)_$J("""","_LARG_"-"_$S(FOR=1:2,1:4)_")"
 G AIDE
 
DATE 
 S FOR=$$GETLBLAN^%VTLBLAN($P($P(LIB,"(",2),")"))
 S LIB=" S DA=$$^%QMDAFFI($H_""/""_$H,"_FOR_"),@VAL@("_N_")=DA_$J("""","_LARG_"-$L(DA))"
 G:$D(@GLO@("RECUP",N)) AIDE
 S COMPOP=COMPOP+1
 S COMPOP(COMPOP)="S VAL("_N_")=$$^%QMDAFFI($H_""/""_$H,"_FOR_"),VAL("_N_")=VAL("_N_")_$J("""","_LARG_"-$L(VAL("_N_"))),Y("_(@GLO@("NBC")+N)_")=VAL("_N_")"
 S COMPO2=COMPO2+1
 S COMPO2(COMPO2)="S VAL("_N_")=$$^%QMDAFFI($H_""/""_$H,"_FOR_"),VAL("_N_")=VAL("_N_")_$J("""","_LARG_"-$L(VAL("_N_")))"
 G AIDE
 
JOUR 
 S LIB=" S DA=$$MAJ^%VMINUSC($E($$J^%QMDATE1($H),1,"_LARG_")),@VAL@("_N_")=DA_$J("""","_LARG_"-$L(DA))"
 G:$D(@GLO@("RECUP",N)) AIDE
 S COMPOP=COMPOP+1
 S COMPOP(COMPOP)="S VAL("_N_")=$$MAJ^%VMINUSC($E($$J^%QMDATE1($H),1,"_LARG_")),VAL("_N_")=VAL("_N_")_$J("""","_LARG_"-$L(VAL("_N_"))),Y("_(@GLO@("NBC")+N)_")=VAL("_N_")"
 S COMPO2=COMPO2+1
 S COMPO2(COMPO2)="S VAL("_N_")=$$MAJ^%VMINUSC($E($$J^%QMDATE1($H),1,"_LARG_")),VAL("_N_")=VAL("_N_")_$J("""","_LARG_"-$L(VAL("_N_")))"
 G AIDE
 
HEUR 
 S FOR=$$GETLBLAN^%VTLBLAN($P($P(LIB,"(",2),")"))
 S LIB=" S DA=$$HEURNO"_$S(FOR=1:"",1:2)_"^%QMDATE($P($H,"","",2)),@VAL@("_N_")=DA_$J("""","_LARG_"-$L(DA))"
 G:$D(@GLO@("RECUP",N)) AIDE
 S COMPOP=COMPOP+1
 S COMPOP(COMPOP)="S VAL("_N_")=$$HEURNO"_$S(FOR=1:"",1:2)_"^%QMDATE($P($H,"","",2)),VAL("_N_")=VAL("_N_")_$J("""","_LARG_"-$L(VAL("_N_"))),Y("_(@GLO@("NBC")+N)_")=VAL("_N_")"
 S COMPO2=COMPO2+1
 S COMPO2(COMPO2)="S VAL("_N_")=$$HEURNO"_$S(FOR=1:"",1:2)_"^%QMDATE($P($H,"","",2)),VAL("_N_")=VAL("_N_")_$J("""","_LARG_"-$L(VAL("_N_")))"
 G AIDE
 
POPE S FOR=$$GETLBLAN^%VTLBLAN($P($P(LIB,"(",2),")"))
 G:FOR'="" POPRACI
 S LIB=" S @VAL@("_N_")="""""
 S COMPOP=COMPOP+1
 S COMPOP(COMPOP)="S VAL("_N_")=$J($$GLOB^%QCAPOP(""^[QUI]RQSGLO(""""SR"""",""""CPT"""","""""_SA_""""")""),"_LARG_"),Y("_(@GLO@("NBC")+N)_")=VAL("_N_")"
 S COMPO2=COMPO2+1
 S COMPO2(COMPO2)="S VAL("_N_")=$J($$GLOB^%QCAPOP(""^[QUI]RQSGLO(""""SR"""",""""CPT"""","""""_SA_""""")""),"_LARG_")"
 K MOD(N)
 K @GLO@("RECUP",N)
 G AIDE
POPRACI 
 S LIB=" S @VAL@("_N_")="""""
 S COMPOP=COMPOP+1
 S COMPOP(COMPOP)="S VAL("_N_")=$J($$GEN^%QCAPOP("""_FOR_"""),"_LARG_"),Y("_(@GLO@("NBC")+N)_")=VAL("_N_")"
 S COMPO2=COMPO2+1
 S COMPO2(COMPO2)="S VAL("_N_")=$J($$GEN^%QCAPOP("""_FOR_"""),"_LARG_")"
 K MOD(N)
 K @GLO@("RECUP",N)
 G AIDE
 
AIDE 
 S:$D(@ADR@("CHAMPS",P,"AIDE")) @GLO@("AIDE",N)=@ADR@("CHAMPS",P,"AIDE")
 
 S COMPDEF=COMPDEF_LIB
 Q
 
ADR(SA) 
 N A
 S A=$$CONCAT^%QZCHAD("^[QUI]RQSDON(""SR"",""COMP"")",""""_SA_"""")
 Q A

