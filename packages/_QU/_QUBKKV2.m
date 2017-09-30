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

;%QUBKKV2^INT^1^59547,73884^0
%QUBKKV2 ;;02:53 PM  26 Feb 1992; ; 20 Apr 93  9:16 AM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
MKCOL(CO) 
 N ATTRI,INDX,ECRAS
 
 S @GL@("LI",CO,"L")=$P(@GLOCOL@(CO),"^"),@GL@("LI",CO,"T")=$P(@GLOCOL@(CO),"^",4)
 
 S ATTRI=$P(@GLOCOL@(CO),"^",2),INDX=$P(@GLOCOL@(CO),"^",3)
 S ECRAS=$P(@GLOCOL@(CO),"^",6) S:(ECRAS'="J")&(ECRAS'="C") ECRAS="T"
 S @GL@("LI",CO,"U")=$S(ATTRI="NOM":"NOWAY^%QUBKKU",ECRAS="J":"UCJ^%QUBKKU",ECRAS="T":"UCT^%QUBKKU",ECRAS="C":"UCC^%QUBKKU")
 
 
 S:INDX="" INDX=1
 I INDX=1 S @ATTUT@(1000-$L(ATTRI),ATTRI,"C("_CO_")")=""
 S @ATTUT@(-(($L(ATTRI)+2)+$L(INDX)),ATTRI_"("_INDX_")","C("_CO_")")=""
 
 I $P(@GLOCOL@(CO),"^",5)'="" S @FORM@(CO)=$P(@GLOCOL@(CO),"^",5),@FORM@(CO,"ECRAS")=$S($P(@GLOCOL@(CO),"^",6)="":"C",1:$P(@GLOCOL@(CO),"^",6))
 Q
 
 
 
MKFORM(CO) 
 N FRM,L,%L,AT,%AT
 S FRM=@FORM@(CO),FRM=$TR(FRM," ","")
 S L="" F %L=0:0 S L=$O(@ATTUT@(L)) Q:L=""  S AT="" F %AT=0:0 S AT=$O(@ATTUT@(L,AT)) Q:AT=""  I $F(FRM,AT) D VUKEMP("C",CO)
 
 S @FORM@(CO)=FRM
 Q
 
 
MKFORM2(CO) 
 N FRM,L,%L,AT,%AT
 S FRM=@FORM2@(CO),FRM=$TR(FRM," ","")
 S L="" F %L=0:0 S L=$O(@ATTUT@(L)) Q:L=""  S AT="" F %AT=0:0 S AT=$O(@ATTUT@(L,AT)) Q:AT=""  I $F(FRM,AT) D VUKEMP("CFC",CO)
 S @FORM2@(CO)=FRM
 Q
 
 
 
 
MKCOND(IFC) 
 N FRM,L,%L,AT,%AT
 S FRM=@CONDIT@("COND",FE),FRM=$TR(FRM," ","")
 S L="" F %L=0:0 S L=$O(@ATTUT@(L)) Q:L=""  S AT="" F %AT=0:0 S AT=$O(@ATTUT@(L,AT)) Q:AT=""  I $F(FRM,AT) D VUKEMP("F",IFC)
 S @CONDIT@("COND",FE)=FRM
 Q
 
VUKEMP(TYPE,NUM) 
 N SS,%SS,VAL,%F
 S VAL="$S("
 S SS="" F %SS=0:0 S SS=$O(@ATTUT@(L,AT,SS)) Q:SS=""  S VAL=VAL_"$D("_SS_"):"_SS_",",@KEMPLOI@($P(SS,"("),$P($P(SS,")"),"(",2),TYPE,NUM)=""
 S VAL=$E(VAL,1,$L(VAL)-1)_")"
 F %F=0:0 Q:'($F(FRM,AT))  S FRM=$P(FRM,AT)_VAL_$E(FRM,$F(FRM,AT),$L(FRM))
 Q
 
 
TESTFRM() N (FRM,C,ESSAI,CFC)
 S $ZT="ERRFRM"
 S @("ESSAI="_FRM)
 S $ZT="" Q 1
ERRFRM S $ZT="" Q 0
 ;
 ;

