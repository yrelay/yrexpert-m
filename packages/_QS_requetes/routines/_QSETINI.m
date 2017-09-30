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

;%QSETINI^INT^1^59547,73881^0
QSETINI ;
 
 
 
 
 
 
 
 
 
 
 
 
M(MES) D MSG^%VZEATT(MES) H 3 Q
 
INIT 
 D M($$^%QZCHW("Initialisations en cours"))
 S CONT=^[QUI]QSETAT(ETAT),TITRE=$P(CONT,"^",1),COM1=$P(CONT,"^",2),COM2=$P(CONT,"^",3),COM3=$P(CONT,"^",4),COM4=$P(CONT,"^",5),REP=$P(CONT,"^",6)
 I SOR=0 S LIM=21,IMP=0 G IN2
 I IMPR="S" S IMP=$S($D(^TABIDENT(WHOIS,"PRINTER")):^TABIDENT(WHOIS,"PRINTER"),1:0)
 E  S IMP=$S($D(^TABIDENT(WHOIS,"TABTRA")):^TABIDENT(WHOIS,"TABTRA"),1:0)
 S LIM=$S(IMPR="G":62,$D(^TABIDENT(WHOIS,"IMPRCOUR")):^TABIDENT(WHOIS,"IMPRCOUR")-5,1:60)
IN2 I NL=REP S BASE=$$NOMINT^%QSF(NL),TRI=0,LISTE=$$LISTIND^%QSGEST6(BASE) G TLI
 S BASE=$$^%QSCALVA("L0",NL,"BASE"),TRI=$S($$^%QSCALVA("L0",NL,"TRIABLE")="OUI":1,1:0)
 I BASE'=$$NOMINT^%QSF(REP) D M($$^%QZCHW("Cette liste ne contient pas des")_" "_REP) S BOOL=0 Q
 S LISTE=$S(TRI:$$^%QSCALVA("L0",NL,"TRIEE"),1:$$^%QSCALVA("L0",NL,"ADRESSE"))
TLI I LISTE="" D M($$^%QZCHW("Impossible de retrouver la liste")) S BOOL=0 Q
 I '($D(^[QUI]QSETATP(ETAT))) D M($$^%QZCHW("Les premisses ne sont pas definis")) S BOOL=0 Q
 Q
 
CONSTAB 
 N %NF,ATRP,BASER,LATTR,LLIGN,NF
 D M($$^%QZCHW("Preparation en cours"))
 S (CPT,CPT2,LLIGN,TOT)=0
 S NF="" F %NF=0:0 S NF=$O(^[QUI]QSETATP(ETAT,NF)) Q:NF=""  S LATTR=^[QUI]QSETATP(ETAT,NF) F I=1:5:16 D DETPRE
 S NF="" F %NF=0:0 S NF=$O(^[QUI]QSETATS(ETAT,NF)) Q:NF=""  S LATTR=^[QUI]QSETATS(ETAT,NF) F I=1:4:13 D DETSUP
 I LLIGN'<132 D M($$^%QZCHW("La somme de la largeur des colonnes est superieure a 132, veuillez modifier l'etat")_" "_ETAT) S BOOL=0 Q
 S PAGE=0,L=$S(RM=132:132,(80-LLIGN)>10:80,1:132)-LLIGN,BORNE=CPT+3
 Q
DETPRE 
 S ATR=$P(LATTR,"^",I) Q:ATR=""
 G:ATR["~" TREP Q:'($$AR^%QSGEST5(BASE,$P(ATR," (")))
 G FDETP
TREP S BASER=$P($P(ATR," ("),"~",2),ATRP=$P($P(ATR," ("),"~",1)
 Q:'($$AR^%QSGEST5($$REPD^%QSGEL2(BASE,BASER),ATRP))
FDETP S CPT=CPT+1,TAB(CPT)=ATR,INT(CPT)=$P(LATTR,"^",I+4)
 S TIT(CPT)=$P(LATTR,"^",I+1),LARG(CPT)=$P(LATTR,"^",I+2),LLIGN=LLIGN+LARG(CPT)
 Q
DETSUP 
 S ATR=$P(LATTR,"^",I) Q:ATR=""
 G:ATR["~" TREPS Q:'($$AR^%QSGEST5(BASE,$P(ATR," (")))
 G FDETS
TREPS S BASER=$P($P(ATR," ("),"~",2),ATRP=$P($P(ATR," ("),"~",1)
 Q:'($$AR^%QSGEST5($$REPD^%QSGEL2(BASE,BASER),ATRP))
FDETS S Y1=$P(LATTR,"^",I+3),CPT2=CPT2+1,TABS(CPT2)=ATR
 S TOT(CPT2)=$S(Y1="":"N",1:Y1),TIT(CPT2+CPT)=$P(LATTR,"^",I+1),LARG(CPT2+CPT)=$P(LATTR,"^",I+2),LLIGN=LLIGN+LARG(CPT2+CPT)
 S:TOT(CPT2)="O" TOT=TOT+1 Q
 
CONSGL 
 N %II,AT2,ATT,BASEP,CLEF,DIV,GLO,LVATT,ORD,RF,TEMP,TEMPP,TYP,SOM,VATT,VLC,VV
 D M($$^%QZCHW("Construction en cours ... Un instant"))
 K ^[QUI]ETAT(ETAT,NL)
 I TRI S II="" F %I=0:0 S II=$O(@LISTE@(II)) Q:II=""  S I=@LISTE@(II) D CONS
 I '(TRI) S I="" F %I=0:0 S I=$O(@LISTE@(I)) Q:I=""  D CONS
 
 S AT2="",GLO="^[QUI]ETAT("""_ETAT_""","""_NL_""")"
 F %I=0:0 S AT2=$O(@GLO@("TOT",AT2)) Q:AT2=""  S I="" F %II=0:0 S I=$O(@GLO@("TOT",AT2,I)) Q:I=""  S @GLO@("SOM",AT2)=$S($D(@GLO@("SOM",AT2)):@GLO@("SOM",AT2),1:0)+@GLO@("TOT",AT2,I)
 Q
CONS 
 S (LVATT,CLEF)=""
 F J=1:1:CPT2 S ATT=TABS(J),VATT=$$VAL(ATT,$S(TOT(J)="O":1,1:0)),LVATT=LVATT_VATT_"^",TEMP(J)=ATT,TEMPP(J)=VATT
 F J=1:1:CPT D CLE F JJ=1:1:CPT2 S ATT=TEMP(JJ),VATT=TEMPP(JJ) I TOT(JJ)="O" D INS
 I CPT=0 S JJ=CPT2,CLE=""
 S RF="^[QUI]ETAT("""_ETAT_""","""_NL_""",""AFF"","_$S(CLE="":"",1:CLE_",")_""""_$$ZSUBST^%QZCHSUB(I,"""","""""")_""")",@RF=$P(LVATT,"^",1,JJ)
 Q
 
CLE 
 S V=$$VAL(TAB(J),0)
 G:(INT(J)="")!(INT(J)=" ") FCLE
 
 S VV=V,V=$S(V<0:V*-1,1:V),DIV=INT(J),N=0
 F %II=0:0 Q:V<DIV  S V=V-DIV,N=N+1
 S V=$S(VV<0:-1*(N*DIV),1:(N+1)*DIV)
FCLE S CLEF=CLEF_""""_$$ZSUBST^%QZCHSUB(V,"""","""""")_""","
 S CLE=$E(CLEF,1,$L(CLEF)-1) Q
 
INS 
 S RF="^[QUI]ETAT("""_ETAT_""","""_NL_""",""TOT"",ATT,"_CLE_")"
 S VLC=$S(($D(@RF)#10)=1:@RF+VATT,1:VATT)
 S @RF=VLC Q
 
VAL(AT,TO) 
 S AT2=$P(AT," (")
 S BASEP=$P(AT2,"~",2),ATR=$P(AT2,"~",1)
 K TYP,GLO D ^%QSCALV(BASEP,BASE,I,ATR,.GLO,.TYP)
 I AT'["(" G:TO=1 VS S ORD=$O(GLO("")) G FV
 S ORD=$P($P(AT,"(",2),")",1)
 I '($D(GLO(ORD))) S ORD=""
FV Q:ORD="" "?"
 Q $P(GLO(ORD),"^",2)
VS 
 I $O(GLO(""))="" Q "?"
 S ORD="",S=0
 F %I=0:0 S ORD=$O(GLO(ORD)) Q:ORD=""  S S=S+$P(GLO(ORD),"^",2)
 Q S
 
KILLMEM 
 D POCLEPA^%VVIDEO I $$CONFIRM^%VZEOUI($$^%QZCHW("Confirmez-vous la suppression de la memorisation")_" ? ")=1 D ^%QCAGLK("^[QUI]ETAT")
 D POCLEPA^%VVIDEO Q
 
COPIE(WHOIS1,QUI1,ETAT1,WHOIS2,QUI2,ETAT2) 
 D GLOCOP^%QCAGLC("^[QUI1]QSETAT("_$$S1^%QZCHAD(ETAT1)_")","^[QUI2]QSETAT("_$$S1^%QZCHAD(ETAT2)_")")
 D GLOCOP^%QCAGLC("^[QUI1]QSETATP("_$$S1^%QZCHAD(ETAT1)_")","^[QUI2]QSETAT("_$$S1^%QZCHAD(ETAT2)_")")
 D GLOCOP^%QCAGLC("^[QUI1]QSETATS("_$$S1^%QZCHAD(ETAT1)_")","^[QUI2]QSETAT("_$$S1^%QZCHAD(ETAT2)_")")
 Q
 
SUP(ETAT) 
 K ^[QUI]ETAT(ETAT)
 K ^[QUI]QSETAT(ETAT),^[QUI]QSETATS(ETAT),^[QUI]QSETATP(ETAT)
 Q

