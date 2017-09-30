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

;%PSDKB2^INT^1^59547,73874^0
%PSDKB2(NUMET) ;;03:30 PM  10 May 1992;
 
 
 
 N DEFETU,RES,CXT
 S DEFETU=$$DEFETU^%PSDKBE(NUMET)
 S RES=$$RUN($P(DEFETU,$C(0)),$P(DEFETU,$C(0),3),$P(DEFETU,$C(0),5),$P(DEFETU,$C(0),7),0,1,.CXT)
 D ^%VZEAVT($S(RES:"succes",1:"echec"))
 Q
 
 
 
 
 
 
RUN(REP,IND,DOM,PRB,VIS,FLUX,CXT) 
 N TP,TEMP,DEF,TABIND,ROUTINE,OI,OF,SVGDE,RAC,OBJRES
 N T,%T,O,%O,V,L,%L,RESUL
 S TP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S:'($D(@TP)) @TP=0 S @TP=@TP+1
 S TEMP=$$CONCAS^%QZCHAD(TP,@TP),DEF=$$CONCAS^%QZCHAD(TEMP,"DEF"),TABIND=$$CONCAS^%QZCHAD(TEMP,"TBI"),ROUTINE=$$CONCAS^%QZCHAD(TEMP,"RTN"),SVGDE=$$CONCAS^%QZCHAD(TEMP,"SVG")
 S @ROUTINE@("CDIF")="CALDIFF^%PSDKB21"
 S @ROUTINE@("MKENSOP")="MKENSOP^%PSDKB21"
 S @ROUTINE@("NODIFF")="$$NODIFF^%PSDKB21"
 S @ROUTINE@("TROPLOIN")="$$TROPLOIN^%PSDKB21"
 S @ROUTINE@("APPLIQUE")="$$APPLIQUE^%PSDKB20"
 S @ROUTINE@("AXIOMBA")="$$AXIOMBA^%PSDKB20"
 
 S @ROUTINE@("RECUSE")="RECUSE^%PSDKB20"
 
 I '($$VERIF) Q 0
 S RAC=$$GEN^%QCAPOP("IGS")
 D RECOP^%QSGES25(REP,IND,RAC,"",0)
 D ADDS^%QSGEST3(REP,IND,"OPERATEUR",REP,RAC)
 D PA^%QSGESTI($$LIENI^%QSGEL3,$$NOML1^%QSGES20(IND,RAC,"OPERATEUR",RAC),"PAR.APPLICATION.DE","** DUPLICATION **",1)
 S OI=$$TEMP^%SGUTIL
 S @TABIND=0
 S OF=$$CONCAS^%QZCHAD(TEMP,"OF")
 S @DEF@("REP")=REP,@DEF@("IND")=RAC,@DEF@("DOM")=DOM,@DEF@("VIS")=VIS
 S @OF=PRB
 S @OI@("REP")=REP,@OI@("IND")=RAC,@OI@("CXTPCT")="",@OI@("%")=""
 
 
 
 S SAVE=$S(FLUX:OI,1:SVGDE)
 S T="" F %T=0:0 S T=$$NXTRIA^%QSTRUC8("%",$J,T) Q:T=""  S O="" F %O=0:0 S O=$$NXTRIAO^%QSTRUC8("%",$J,T,O) Q:O=""  S @SAVE@("%",T,O)=$$VALEUR^%QSTRUC8("%",$J,T,O)
 
 S T="" F %T=0:0 S T=$O(CXT(T)) Q:T=""  I $E(T)="%" S O="" F %O=0:0 S O=$O(CXT(T,O)) Q:O=""  S V=CXT(T,O),@SAVE@("CXTPCT",T,O)=V
 
 S L="" F %L=0:0 S L=$O(CXT(L)) Q:L=""  I $E(L)'="%" S T="" F %T=0:0 S T=$O(CXT(L,T)) Q:T=""  S V=CXT(L,T),@SVGDE@("CXTNPCT",L,T)=V
 S @TABIND=@TABIND+1,@TABIND@(@TABIND)=OI
 
 D CLEPAG^%VVIDEO
 S SHOW=1
 
 D INIOPTIM^%TLIACUN
 
 Q:'($$VERIF^%QSGES26(REP,"OPERATEUR",REP))
 S RESUL=$$T^%PSALG41(ROUTINE,OI,OF,.OBJRES,TEMP)
 D FINOPTIM^%TLIACUN
 S L="" F %L=0:0 S L=$O(CXT(L)) Q:L=""  I $E(L)'="%" K CXT(L)
 G:FLUX&RESUL FINPR
 
 D SX^%QSGESTK("%",$J) K CXT
 S:'(RESUL) SAVE=OI
 S T="" F %T=0:0 S T=$O(@SAVE@("%",T)) Q:T=""  S O="" F %O=0:0 S O=$O(@SAVE@("%",T,O)) Q:O=""  S V=@SAVE@("%",T,O) D PA^%QSGESTI("%",$J,T,V,O) S ^V($J,"%",T,O)=V
 S T="" F %T=0:0 S T=$O(@SAVE@("CXTPCT",T)) Q:T=""  S O="" F %O=0:0 S O=$O(@SAVE@("CXTPCT",T,O)) Q:O=""  S V=@SAVE@("CXTPCT",T,O),CXT(T,O)=V
 G FINPR
 
FINPR S L="" F %L=0:0 S L=$O(@SVGDE@("CXTNPCT",L)) Q:L=""  S T="" F %T=0:0 S T=$O(@SVGDE@("CXTNPCT",L,T)) Q:T=""  S V=@SVGDE@("CXTNPCT",L,T),CXT(L,T)=V
 D PA^%QSGESTI(REP,RAC,"RESULTAT.GPS",$S(RESUL:"SUCCES",1:"ECHEC"),1)
 I RESUL D PA^%QSGESTI(REP,RAC,"INDIVIDU.RESULTAT",@OBJRES@("IND"),1)
 K @(SVGDE),@(OI),@(TEMP) S @TP=@TP-1
 Q RESUL
 
 
 
 
VERIF() N PRD,OPE,TRT,IC,OOPE
 S PRD=$$^%QSCALIN("DOMAINE",DOM,"PREDICAT",1)
 I PRD'="",'($$EXIPRED^%PSPRGES(PRD)) Q 0
 S @TEMP@("SPD","AXIOMBA")=PRD
 S OOPE=""
VER2 S OOPE=$$NXTRIAO^%QSTRUC8("DOMAINE",DOM,"OPERATEUR.LIE",OOPE)
 G:OOPE="" VER3
 S OPE=$$VALEUR^%QSTRUC8("DOMAINE",DOM,"OPERATEUR.LIE",OOPE)
 G:OPE="" VER3
 S TRT=$$^%QSCALIN("OPERATEUR",DOM_","_OPE,"TRAITEMENT","PROLOGUE")
 I TRT'="",'($$EXISTE^%TLGEST(TRT)) Q 0
 S @TEMP@("SPD","OPE",OPE,"PROL")=TRT
 F IC=1:1 S TRT=$$^%QSCALIN("OPERATEUR",DOM_","_OPE,"TRAITEMENT",IC) Q:TRT=""  G:'($$EXISTE^%TLGEST(TRT)) VERR S @TEMP@("SPD","OPE",OPE,"TRT",IC)=TRT
 S @TEMP@("SPD","OPE",OPE,"TRT")=IC-1
 
 F IC=1:1 S PRD=$$^%QSCALIN("OPERATEUR",DOM_","_OPE,"PREDICAT",IC) Q:PRD=""  G:'($$EXIPRED^%PSPRGES(PRD)) VERR S @TEMP@("SPD","OPE",OPE,"PRED",IC)=PRD
 S @TEMP@("SPD","OPE",OPE,"PRED")=IC-1
 S TRT=$$^%QSCALIN("OPERATEUR",DOM_","_OPE,"TRAITEMENT","RECUSATION")
 I TRT'="",'($$EXISTE^%TLGEST(TRT)) Q 0
 S @TEMP@("SPD","OPE",OPE,"RECUS")=TRT
 G VER2
VER3 Q 1
VERR Q 0

