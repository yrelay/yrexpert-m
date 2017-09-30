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

;%TLOPT^INT^1^59547,74030^0
%TLOPT ;;10:16 AM  26 Oct 1993; ; 03 Nov 93  8:59 AM
 
 
 
 
 
 
ADRQ(R) Q $$LISTIND^%QSGEST6(R)
 
 
IR(R,I) Q $$IR^%QSGE5(R,I)
 
 
AIR(REP,IND,ATT) Q $$AIR^%QSGE5(REP,IND,ATT)
OAIR(R,I,A,O) 
 Q $$OAIR^%QSGE5(R,I,A,O)
 
 
OKNOM(R,I) Q 1
 
 
NOMINT(R) Q $$NOMINT^%QSF(R)
 
 
 
 
 
 
 
 
 
 
AFF(REP,IND,ATT,ORD,VAL) 
 N Y1BIS,GINFO,JRN
 I REP'="%" Q:'($$AIR^%QSGE5(REP,IND,"NOM")) 0
 S Y1BIS=VAL
 D:'($D(^[QUI]RQSDON("REMATDAT",REP,ATT))) SETREM^%QMDAUC(REP,ATT) I ^[QUI]RQSDON("REMATDAT",REP,ATT) S Y1BIS=$$INTF^%QMDAUC(REP,ATT,VAL) Q:Y1BIS="" 0
 S JRN=$$GET^%SGVAR("JRN") I JRN'="" D:$E(ATT)="%" ADDEXEC^%AMJAJ(JRN,"ATTRIBUT.TEMPORAIRE",VAL,ATT,ORD) D:$E(ATT)'="%" ADDEXEC^%AMJAJ(JRN,"ATTRIBUT",VAL,REP,IND,ATT,ORD)
 D:MODEX=2 STATT^%TLBAATT(REP,IND,ATT,Y1BIS,ORD,"AJOUT") D PA^%QSGESTI(REP,IND,ATT,Y1BIS,ORD) D:MODAF ADD^%TLIFEN("ATT",ATT_"<---"_Y1BIS) Q 1
 
 
 
 
GET(REP,IND,ATT,ORD) 
 N Y1BIS,GINFO
 S Y1BIS=$$^%QSCALIN(REP,IND,ATT,ORD)
GETDATE D:'($D(^[QUI]RQSDON("REMATDAT",REP,ATT))) SETREM^%QMDAUC(REP,ATT)
 Q:'(^[QUI]RQSDON("REMATDAT",REP,ATT)) Y1BIS
 Q $$AFFI^%QMDAUC(REP,ATT,Y1BIS)
 
 
 
 
GET2(REP,IND,ATT) 
 N Y1BIS,ORD,GINFO
 S Y1BIS=$$^%QSCALIN(REP,IND,ATT,1) I Y1BIS'="" S ORD=1 G GETDATE
 S Y1BIS=$$FORMEX^%QSCALVA(REP,IND,ATT)
 Q Y1BIS
 
 
 
GETILIE(REPS,INDS,ATT,REP2,IND2) 
 N TYPL
 S REP2=$$REPD^%QSGEL2(REPS,ATT),IND2=$$^%QSCALVA(REPS,INDS,ATT)
 S TYPL=$$TYPEL^%QSGES90(ATT)
 S:TYPL=2 IND2=INDS_","_IND2
 Q
 
 
 
GETILIE2(REPS,INDS,ATT,INX,REP2,IND2) 
 S REP2=$$REPD^%QSGEL2(REPS,ATT),IND2=$$^%QSCALIN(REPS,INDS,ATT,INX)
 S TYPL=$$TYPEL^%QSGES90(ATT)
 S:TYPL=2 IND2=INDS_","_IND2
 Q
 
PREMATT(REP,IND) Q $$NXTRIA^%QSTRUC8(REP,IND,"")
ATTSV(REP,IND,ATT) Q $$NXTRIA^%QSTRUC8(REP,IND,ATT)
 
 
PREMORD(REP,IND,ATT) 
 Q $$NXTRIAO^%QSTRUC8(REP,IND,ATT,"")
 
 N TAB,TYP
 D MVG^%QSCALVA(REP,IND,ATT,"TAB",.TYP)
 Q $O(TAB(""))
 
 
ORDSV(REP,IND,ATT,ORD) 
 Q $$NXTRIAO^%QSTRUC8(REP,IND,ATT,ORD)
 
 N TAB,TYP
 D MVG^%QSCALVA(REP,IND,ATT,"TAB",.TYP)
 Q $O(TAB(ORD))
 
CREERIND(REP,IND,ORD) 
 N RCREA,MSG,JRN
 S RCREA=1-$$CREER^%QSGEIND(REP,IND,ORD,1,.MSG)
 S JRN=$$GET^%SGVAR("JRN") I JRN'="" D ADDEXEC^%AMJAJ(JRN,"INDIVIDU","",REP,IND)
 Q RCREA
 
 
 
 
 
 
 
AJCXT(VPCT,REP,IND) 
 N REF,GINFO
 I WHOIS("ETUDE")=0 S CXT(VPCT,"BASE")=REP,CXT(VPCT,"OBJET")=IND G AJCXT2
 S REF=$$REF^%QXPGESD(WHOIS("ETUDE"),REP,IND)
 D:REF'=0 PUSHVAL^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"INDSYMB",VPCT,REF)
AJCXT2 Q $$AFF(CXT("%","BASE"),CXT("%","OBJET"),VPCT,1,IND)
 Q
 
 
 
 
GETIPCT(INDSY,REP2,IND2) 
 N REF,GINFO
 I WHOIS("ETUDE")=0 S REP2=CXT(INDSY,"BASE"),IND2=CXT(INDSY,"OBJET") G GETIP2
 S REF=$$PULLVAL^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"INDSYMB",INDSY)
 S REF=$$PULLVAL^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"REFERENCE",REF),REP2=$P(REF,$C(0)),IND2=$P(REF,$C(0),2)
GETIP2 
 Q
 
 
EXIIPCT(INDSY) 
 N REF
 I WHOIS("ETUDE")=0 Q $D(CXT(INDSY))
 S REF=$$PULLVAL^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"INDSYMB",INDSY) I (REF="")!(REF=$C(0)) Q 0
 S REF=$$PULLVAL^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"REFERENCE",REF) I (REF="")!(REF=$C(0)) Q 0
 Q 1
 
 
 
REPPCT() Q CXT("%","BASE")
 
 
INDPCT() Q CXT("%","OBJET")
 
 
 
 
 
EXILIS(LIS) Q $$EX^%QSGEST7(LIS)
 
 
 
BASEL(LISTE) 
 Q $$BASE^%QSGEST7(LISTE)
 
 
 
PREML(LISTE) 
 Q $$SUIVL^%QS0XG1(LISTE,"")
 
 
 
SUIVL(LISTE,IND) 
 Q $$SUIVL^%QS0XG1(LISTE,IND)
 
 
SUIVXL(LISTE,IND,ORD) 
 Q $$SUIVXL^%QS0XG2(LISTE,IND,ORD)
 
 
ORDXL(LISTE,IND) 
 Q $$GETX^%QS0XG2(LISTE,IND)
 
 
 
 
 
EXITRT(TRT) Q $$EXISTE^%TLGEST(TRT)
 
 
 
 
 
 
 
LOGN(VAL) N RES,EXPFONC
 Q $$LOGBN^%TLCAMTH(VAL)
 
 
ISNUM(VAL) Q $$PARA^%QZNBN1(VAL)
 
 
 
OPE(OPE,V1,V2) 
 Q:OPE="+" V1+V2 Q:OPE="*" V1*V2 Q:OPE="-" V1-V2 Q:OPE="!" V1!V2 Q:OPE="_" V1_V2 Q:OPE="&" V1&V2 Q:OPE="#" V1#V2
 Q:OPE="\" $S(V2=0:"999999999999999999 (division par 0)",1:V1\V2)
 Q:OPE="/" $S(V2=0:"999999999999999999 (division par 0)",1:V1/V2)
 Q V1
 
 
CMP(CMP,V1,V2) 
 Q:CMP="=" V1=V2 Q:CMP="<" V1<V2 Q:CMP=">" V1>V2 Q:CMP="'<" V1'<V2 Q:CMP="'>" V1'>V2 Q:CMP="'=" V1'=V2
 Q:CMP="[" V1[V2 Q:CMP="]" V1]V2 Q:CMP="'[" V1'[V2 Q:CMP="']" V1']V2
 Q 0
 
CMP3(CMP,V1,V2,V3) 
 Q:V1<V2 0 Q:V1>V3 0
 I $E(CMP)="]" Q:V1=V2 0
 I $E(CMP,2)="[" Q:V1=V3 0
 Q 1
 
 
 
HEURE() Q $$HEURE^%QMDATE

