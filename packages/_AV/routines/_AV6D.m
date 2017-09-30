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

;%AV6D^INT^1^59547,73867^0
%AV6D ;;10:47 AM  26 Oct 1993;
 
 
 
 
UNEXP(GEXP,VV,RR,TXT) 
 
 S PILAND=$$TEMP^%SGUTIL D INIPILE^%AVUTI(PILAND)
 
 I EXPR S PILTXT="^test" D INIPILE^%AVUTI(PILTXT)
 
 W /C(1,2),"   information traitee  "
 S PTR=0
loop S PTR=PTR+1
 G:'($D(@GEXP@(PTR))) FIN
 S TYPE=@GEXP@(PTR),VAL=@GEXP@(PTR,"VAL"),INFO=@GEXP@(PTR,"INFO")
 W /C(1,3),/EL,/C(1,3),PTR,?5,TYPE,?30,VAL
 I TYPE["OPERATEUR" G OPERA
 I TYPE="VERBE" G VERBE
 I TYPE="AFFECTATION" G AFFECT
 
 D:EVAL PUSH^%AVUTI(PILAND,VAL,"")
 D:'(EVAL) PUSH^%AVUTI(PILAND,"","")
 D:EXPR PUSH^%AVUTI(PILTXT,$S(TYPE="CONSTANTE.CHAINE":""""_VAL_"""",1:VAL),"")
 G loop
 
OPERA S NB=$P(TYPE,".",2),NB=$S(NB="UNAIRE":1,NB="BINAIRE":2)
 
 K TV,TR
 F I=1:1:NB G:$$PILEVIDE^%AVUTI(PILAND) ERROR D PULL^%AVUTI(PILAND,.TVV,.TRR) S TV((NB-I)+1)=TVV,TR((NB-I)+1)=TRR
 I EXPR F I=1:1:NB G:$$PILEVIDE^%AVUTI(PILTXT) ERROR D PULL^%AVUTI(PILTXT,.TXTL,.TMP) S TXT((NB-I)+1)=TXTL
 
 
 D:VAL="$indeval" indeval
 D:VAL="$subex" subex
 D:VAL="$indice" indice
 D:VAL="^" chap
 D:"=+-#_*"[VAL BINSTD
 D:VAL="'" NEGAT
 
 I EXPR D PUSH^%AVUTI(PILTXT,TXT,"EXPR")
 I '(EVAL) D PUSH^%AVUTI(PILAND,"","") G loop
 
 
 D PUSH^%AVUTI(PILAND,TVV,TRR) G loop
 
VERBE 
 D ADDEXEC^%AMJAJ($$GET^%SGVAR("JRN"),"VERBE",VAL,VAL)
 I EXPR D AJEXPR^%AV6(VAL,"VERBE")
 I EVAL=2 D AJEVAL^%AV6(VAL,VAL)
 S NB=$P(INFO,"/",4)
 
 K TV,TR
 F I=NB:-1:1 G:$$PILEVIDE^%AVUTI(PILAND) ERROR D PULL^%AVUTI(PILAND,.TVV,.TRR) S TV(I)=TVV,TR(I)=TRR
 I EXPR F I=NB:-1:1 G:$$PILEVIDE^%AVUTI(PILTXT) ERROR D PULL^%AVUTI(PILTXT,.TXTL,.TEMP) S TXT(I)=TXTL
 I EXPR S TXT=VAL S:NB>0 TXT=TXT_"(" F I=1:1:NB S TXT=TXT_TXT(I)_";"
 I EXPR S TXT=$E(TXT,1,$L(TXT)-1)_")" D AJEXPR^%AV6(TXT,"EXPR"),PUSH^%AVUTI(PILTXT,TXT,"")
 
 
 K V
 S IREG=1,IARG=1
NXX G:'($D(TV(IARG))) CALLVRB
 S NATPAR=^%RQSGLO("MOTEUR","TRT","VERBE",VAL,"NATURE.PARAMETRE",IARG)
 G:NATPAR="ATT" PARATT
 
 S V(IREG)=TV(IARG),IREG=IREG+1,IARG=IARG+1 G NXX
 
 
 
 
PARATT S V(IREG)=$P(TR(IARG),$C(0),3),IREG=IREG+1
 S V(IREG)=$P(TR(IARG),$C(0),4),IREG=IREG+1
 S V(IREG)=$P(TR(IARG),$C(0),1),IREG=IREG+1
 S V(IREG)=$P(TR(IARG),$C(0),2),IREG=IREG+1
 S V(IREG)=TV(IARG),IREG=IREG+1
 S IARG=IARG+1 G NXX
 
CALLVRB 
 I '(EVAL) D PUSH^%AVUTI(PILAND,"","") G loop
 S ROUT=^%RQSGLO("MOTEUR","TRT","VERBE",VAL,"ADRESSE.DE.LA.ROUTINE",1)
 S @("RES="_ROUT_"(1,"_(IREG-1)_")")
 S TVV=RES,TRR=""
 
 I EVAL D PUSH^%AVUTI(PILAND,TVV,TRR)
 I EVAL>1 D AJEVAL^%AV6(TVV,TVV)
 G loop
 
 
FIN 
 
 I $$PILEVIDE^%AVUTI(PILAND) S ERROR=1 G ERROR
 D PULL^%AVUTI(PILAND,.VV,.RR)
 I '($$PILEVIDE^%AVUTI(PILAND)) S ERROR=1 G ERROR
 I EXPR D PULL^%AVUTI(PILTXT,.TXT,.TEMPO)
 Q
 
ERROR Q
 
 
 
 
 
 
 
 
 
 
 
indeval N REP,IND
 G:'(EXPR) indev2
 S TXT=TXT(1)
 I TXT(1)="%courant" G indev2
 D AJEXPR^%AV6("individu "_TXT,"INDIVIDU")
indev2 Q:'(EVAL)
 I TV(1)="%courant" S ROUT=@GLOROUT@("INDIVIDU COURANT") D @(ROUT_"(.REP,.IND)") S TVV=REP_$C(0)_IND,TR="" Q
 S ROUT=@GLOROUT@("PROXIMITE") D @(ROUT_"(TV(1),.REP,.IND)") S TVV=REP_$C(0)_IND,TR=""
 I EVAL>1 D AJEVAL^%AV6(TVV,TVV)
 Q
 
subex N NUMK,SUBEX
 I EXPR S SUBEX=$E(TXT(1),2,$L(TXT(1))-1),TXT=$S(SUBEX=0:1,1:"("_@DEJAEXP@(SUBEX,"TXT")_")") D:SUBEX'=0 AJEXPR^%AV6(TXT,"EXPR")
 Q:'(EVAL)
 S NUMK=$E(TV(1),2,$L(TV(1))-1)
 S TVV=@DEJAEXP@(NUMK,"VV"),TRR=@DEJAEXP@(NUMK,"RR")
 I EVAL>1,NUMK'=0 D AJEVAL^%AV6(TVV,TVV)
 Q
indice I EXPR S TXT=TXT(1)_"("_TXT(2)_")"
 Q:'(EVAL)  S TVV=TV(1)_$C(0)_TV(2),TRR=TR(1)_$C(0)_TR(2) Q
 
chap N REP,IND,ATT,ORD
 G:'(EXPR) chap2
 I $E(TXT(2))="%" S TXT=TXT(2) D AJEXPR^%AV6(TXT,"ATTRIBUT.TEMPORAIRE") G chap2
 S TXT=TXT(2)_"^"_TXT(1) D AJEXPR^%AV6(TXT,"ATTRIBUT")
chap2 Q:'(EVAL)
 S REP=$P(TV(1),$C(0)),IND=$P(TV(1),$C(0),2),ATT=$P(TV(2),$C(0)),ORD=$P(TV(2),$C(0),2)
 S ROUT=@GLOROUT@("ACCES BASE")
 S @("TVV="_ROUT_"(REP,IND,ATT,ORD)")
 S TRR=TV(1)_$C(0)_TV(2)
 I EVAL>1 D AJEVAL^%AV6($S($E(TV(2))="%":TV(2),1:TRR),TVV)
 Q
 
 
 
BINSTD I EXPR S TXT=TXT(1)_VAL_TXT(2) D AJEXPR^%AV6(TXT,"EXPR")
 Q:'(EVAL)  S TVV=$C(0) S:(TV(1)'=$C(0))&(TV(2)'=$C(0)) @("TVV=TV(1)"_VAL_"TV(2)") S TRR=""
 I EVAL>1 D AJEVAL^%AV6(TVV,TVV)
 Q
 
 
AFFECT 
 K TV,TR
 F I=2:-1:1 G:$$PILEVIDE^%AVUTI(PILAND) ERROR D PULL^%AVUTI(PILAND,.TVV,.TRR) S TV(I)=TVV,TR(I)=TRR
 I EXPR F I=2:-1:1 G:$$PILEVIDE^%AVUTI(PILTXT) ERROR D PULL^%AVUTI(PILTXT,.TXTL,.TMP) S TXT(I)=TXTL
 I EXPR S TXT=TXT(1)_" <- "_TXT(2) D AJEXPR^%AV6(TXT,"EXPR"),PUSH^%AVUTI(PILTXT,TXT,"")
 I '(EVAL) D PUSH^%AVUTI(PILAND,"","") G loop
 S ROUT=@GLOROUT@("ECRITURE BASE")
 S @("TVV="_ROUT_"(TR(1),TV(2))")
 S TRR=TR(1)_$C(0)_TR(2)
 I EVAL>1 D AJEVAL^%AV6(TVV,TVV)
 
 D PUSH^%AVUTI(PILAND,TVV,TRR) G loop
 
NEGAT G:$$PILEVIDE^%AVUTI(PILAND) ERROR
 D PULL^%AVUTI(PILAND,.TVV,.TRR)
 I EXPR D PULL^%AVUTI(PILTXT,.TXT,.TEMP) S TXT="'"_TXT D PUSH^%AVUTI(PILTXT,TXT),AJEXPR^%AV6(TXT,"EXPR")
 I '(EVAL) D PUSH^%AVUTI(PILAND,"","") Q
 D PUSH^%AVUTI(PILAND,'(TVV),TRR) Q
 
 
visu W /CLR
 S x="" F  S x=$O(^TEST2(x)) Q:x=""  S DX=2,DY=x X XY W ^TEST2(x)
 S x="" F  S x=$O(^TEST1(x)) Q:x=""  S DX=40,DY=x X XY W $P(^TEST1(x),$C(0),2,9999)
 Q

