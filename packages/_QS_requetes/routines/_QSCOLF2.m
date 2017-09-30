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
;! HL002 ! HL     ! 08/09/12 ! Deviceparameter unknown                        !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%QSCOLF2^INT^1^59547,73880^0
QSCOLF2 ;
 
 
 
 
 
 
CR 
 
 
 
 
 N A,CP,NEW,OK,CL,II
 S EXI=$S($D(@DONNE@(PL,PC)):@DONNE@(PL,PC),1:""),OLD=$S(EXI="":"",PC=2:EXI,1:$P(EXI," (",1))
 S ORD=$S(OLD="":"",PC=2:1,EXI["(":$P($P(EXI,"(",2),")",1),1:1),CP=X1
 I (PC'=2)!(OLD="") G SUITE
 D UCO(.OK) G:'(OK) END
SUITE G:PC'=1 CREVAL
CREATT I EXI'="" D COL^%VZEAVT($$^%QZCHW("interdit d'ecraser le nom d'un attribut"),XG,79) G END
 S X1=CP,DX=PX,DY=PY X XY W $C(X1)
 S YG=$C(X1),PCX=PX,PCY=PY D BEG^%VLEC G:CTRLA!(Y1="") END
 N INDICE
 S:Y1["(" INDICE=$P($P(Y1,"(",2,3),")",1),Y1=$$GETLBLAN^%VTLBLAN($P(Y1,"(",1))
 S NEW=Y1,INS=1
 D LEXIQ^%QSCOLF1,MES("") G:INS=0 END
 S A=ATT
 I '($$^%QSDROIT(REP,A,"C",WHOIS)) D COL^%VZEAVT($$^%QZCHW("vous n'avez pas le droit de creer cet attribut"),XG,79) G END
 S REXT=$$ROUTMAJ^%QSGESPE(REP,A) G:REXT="" OKMOR
 S OR="",CL=$S($D(@DONNE@(PL,1)):"I",1:"A")
 D EXE(CL,A,"",OR,REXT)
 S INS=1
 G FIN
OKMOR I '($D(INDICE)) D MES("") S Y1=$$^%VZAME1($$^%QZCHW("no d'ordre")_" : ") G:CTRLA END S:Y1="" Y1=1
 S:$D(INDICE) Y1=INDICE
 I $D(@GATT@(ATT,Y1)) D COL^%VZEAVT($$^%QZCHW("numero d'ordre existant"),XG,79) K INDICE G OKMOR
 S OR=Y1
 G MOD
 
CREVAL I '($D(@DONNE@(PL,1))) D COL^%VZEAVT($$^%QZCHW("saisissez d'abord le nom de l'attribut"),XG,79) G END
 S A=$P(@DONNE@(PL,1)," (",1)
 I '($$^%QSDROIT(REP,A,"C",WHOIS)) D COL^%VZEAVT($$^%QZCHW("vous n'avez pas le droit de creer cet attribut"),XG,79) G END
 S INDICE=$P($P(@DONNE@(PL,1)," (",2),")",1) S:INDICE="" INDICE=1
 S REXT=$$ROUTMAJ^%QSGESPE(REP,A)
 I REXT'="" S INS=1 D EXE("I",A,EXI,INDICE,REXT) G FIN
 S %TAB=0
 S X1=CP,DX=PX,DY=PY X XY W $C(X1)
 S YG=$C(X1)
CRV S PCX=PX,PCY=PY D BEG^%VLEC G:CTRLA END
 I Y1="" G:$$TYPE^%QSGESPE(A_"/"_$$NOMLOG^%QSF(REP))'="DATE" END
 S YG=Y1
 
 I '($$FINT2^%QMDAUC(REP,A,.Y1)) D COL^%VZEAVT($$^%QZCHW("saisie incorrecte"),XG,79) S DX=PX,DY=PY X XY G CRV
 S NEW=Y1,INS=1
 D LEXIQ^%QSCOLF1,MES("") G:INS=0 END
 S II=$$^%QSPRVAL(REP,A,.ATT,XG,YH,LA,HA)
 I II=1 D REAFF^%QSCOLF3
 I II=2 D COL^%VZEAVT($$^%QZCHW("valeur refusee"),XG,79) S DX=PX,DY=DY X XY G CRV
 I ATT="" G END
 S OR=1 G MOD
 
ATDAT(PL) 
 N A,INDICE,II,Y1,NEW
 S A=$P(@DONNE@(PL,1)," (",1)
 G:$$TYPE^%QSGESPE(A_"/"_$$NOMLOG^%QSF(REP))'="DATE" FATDAT
 I '($$^%QSDROIT(REP,A,"C",WHOIS)) G END
 S INDICE=$P($P(@DONNE@(PL,1)," (",2),")",1) S:INDICE="" INDICE=1
 S Y1=""
 I '($$FINT2^%QMDAUC(REP,A,.Y1)) G END
 S NEW=Y1,INS=1
 D LEXIQ^%QSCOLF1,MES("") G:INS=0 END
 S II=$$^%QSPRVAL(REP,A,.ATT,XG,YH,LA,HA)
 I II=1 D REAFF^%QSCOLF3
 I II=2 D COL^%VZEAVT($$^%QZCHW("valeur refusee"),XG,79) G END
 I ATT="" G END
 S EXI=$S($D(@DONNE@(PL,PC)):@DONNE@(PL,PC),1:""),OLD=$S(EXI="":"",PC=2:EXI,1:$P(EXI," (",1))
 S ORD=$S(OLD="":"",PC=2:1,EXI["(":$P($P(EXI,"(",2),")",1),1:1),CP=X1
 S OR=1 G MOD
 
FATDAT D NEXT^%QSCOLF(I)
 S INS=0
 G FIN
 
 
NOUV 
 G MOD
END 
 S INS=0
ENDB D AFF^%QSCOLF3(OLD,ORD) G FIN
 
MOD 
 D AJ^%QSCOLF3(OLD,ORD,ATT,OR,PL,PC)
 D ATTPRED^%QSCOLF3(ATT)
 G FIN
 
MCONT N OK,VAL
 S EXI=@DONNE@(PL,PC),OLD=EXI,ORD=$S(OLD="":"",1:1)
 S ATT=$P(@DONNE@(PL,1)," (",1),OR=$P($P(@DONNE@(PL,1)," (",2),")",1),VAL=EXI
 S REXT=$$ROUTMAJ^%QSGESPE(REP,ATT)
 I REXT'="" D EXE("M",ATT,VAL,OR,REXT)
 G FIN
 
MD N OK,VAL,REXT
 S EXI=@DONNE@(PL,PC),OLD=EXI,ORD=$S(OLD="":"",1:1)
 S ATT=$P(@DONNE@(PL,1)," (",1),OR=$P($P(@DONNE@(PL,1)," (",2),")",1),VAL=EXI S:OR="" OR=1
 D UCO(.OK) G:'(OK) FIN
 N CTR,OLDPC,OLDPL,TAB,YG,Y1,II
 S DX=PX,DY=PY X XY S OLDPC=PC,OLDPL=PL
 S TAB("DX")=XG+2,TAB("DY")=(YH+HA)+1,TAB("MSG")=" Insertion "
 S TAB("PCX")=DX,TAB("PCY")=DY,TAB("%LGX")=DX-1,TAB("%LDX")=DX+POSIT(PC)
 S REXT=$$ROUTMAJ^%QSGESPE(REP,ATT)
 I REXT'="" D EXE("I",ATT,VAL,OR,REXT) G FIN
SD S DX=PX,DY=PY X XY
 S CTRLA=0,YG=$$AFFI^%QMDAUC(REP,ATT,OLD)
 ;HL002 I '(DTM) O 0:(RM:1)
 D MODIF^%VLECFLD(YG,"TAB",.CTR,.Y1)
 S PC=OLDPC,PL=OLDPL I (CTR="A")!(Y1="") G ENDB
 I '($$FINT^%QMDAUC(REP,ATT,.Y1)) D COL^%VZEAVT($$^%QZCHW("saisie incorrecte"),XG,79) G SD
 S II=$$^%QSPRVAL(REP,ATT,.Y1,XG,YH,LA,HA)
 I II=1 D REAFF^%QSCOLF3
 I II=2 D COL^%VZEAVT($$^%QZCHW("valeur refusee"),XG,79) G SD
 I Y1="" G ENDB
 S ATT=Y1,OR=1 G MOD
 
FIN 
 D MES("") S @DONNE=$ZP(@DONNE@("")) Q
 
 
EXE(AC,A,V,OR,R) 
 
 D EXE2^%QSGESP2(AC,XG,YH,LA,HA,REP,INDIV,A,V,OR,R) Q
 
UCO(OK) 
 S OK=1
 I $D(@COLON@(PC,"UC")) S @("OK=$$"_@COLON@(PC,"UC")_"(OLD,OLD,"_PC_","_PL_")")
 I '(OK) D COL^%VZEAVT($$^%QZCHW("vous n'avez pas le droit de modifier cet attribut"),XG,79)
 Q
 
MES(M) D MES^%QSCOLF3(M) Q

