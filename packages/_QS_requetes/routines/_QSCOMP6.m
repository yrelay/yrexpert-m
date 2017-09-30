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

;%QSCOMP6^INT^1^59547,73881^0
RQSCOMP6 ;
 
 
PASS 
 
 N AI,ATT,%ATT,CH,CRIT,IC,IM,IN,INT,INTER,LIG,%LIG,M,MOD,NI,NPI,NV,N,PI1,PI2,TETE,V,%V,VAR,ATUER,CORRES
 
 
 F LIG=1:1:$ZP(^[QUI]RQS1(R,"CONTRAINTES","")) D TLIG
 Q:'(RESF)
 
 S LIG=-1 F %LIG=0:0 S LIG=$N(CRIT(LIG)) Q:LIG=-1  D TLIND
 
 S LIG=-1 F %LIG=0:0 S LIG=$N(CRIT(LIG)) Q:LIG=-1  D TCOMM
 
 S LIG=-1 F %LIG=0:0 S LIG=$N(CRIT(LIG)) Q:LIG=-1  D TDUPL
 
 K CORRES
 S IN=-1 F NI=0:0 S IN=$N(IM(IN)) Q:IN=-1  D TCORR
 
 K ATUER
 S IN=-1 F NI=0:0 S IN=$N(IM(IN)) Q:IN=-1  D TSUBS
 S IN=-1 F NI=0:0 S IN=$N(ATUER(IN)) Q:IN=-1  D KILL^%ANA(IN)
 
 Q
TCORR S TETE=$N(IM(IN,1,-1)),PI1=-1
 F AI=1:1 S PI1=$N(IM(IN,2,PI1)) Q:PI1=-1  S CORRES(PI1)=$$RED^%ANA(TETE,AI)
 Q
TSUBS 
 S TETE=$$RED^%ANA(IN,"PERE")
 I (TETE'="")&(TETE'=0) F AI=1:1 Q:$$RED^%ANA(TETE,AI)=IN
 S PI1=$$NEW^%ANA D SET^%ANA(PI1,"CALCUL","INTERSECTION")
 D SET^%ANA(PI1,"REPERTOIRE",$$RED^%ANA(IN,"REPERTOIRE"))
 S PI2=0 F NPI=1:1 S ATT=$$RED^%ANA(IN,NPI) Q:(ATT=0)!(ATT="")  I '($D(IM(IN,2,ATT))) S PI2=PI2+1 D SET^%ANA(PI1,PI2,$$RECOP^%ANA(ATT))
 S NPI=-1 F %ATT=0:0 S NPI=$N(IM(IN,1,NPI)) Q:NPI=-1  S PI2=PI2+1 D SET^%ANA(PI1,PI2,NPI)
 S:IN=A A=PI1
 I TETE=0 S ATUER(IN)="" Q
 I '($D(CORRES(TETE))) D SET^%ANA(TETE,AI,PI1) S ATUER(IN)="" Q
 S TETE=CORRES(TETE),TETE=$$RED^%ANA(TETE,1)
 D SET^%ANA(TETE,AI,PI1)
 S ATUER(IN)=""
 Q
TLIG I '($D(^[QUI]RQS1(R,"CONTRAINTES",LIG,"TETE"))) S RESF=0 D:^TOZE($I,"DEBUG") ^%VZEAVT($$^%QZCHW("Impossible de retrouver l'arbre d'analyse de la ligne ")_LIG) Q
 S TETE=^[QUI]RQS1(R,"CONTRAINTES",LIG,"TETE")
 Q:$$RED^%ANA(TETE,"MULTI")'=1
 S CRIT(LIG)=TETE Q
TLIND D LVAR^%ANARBRE(CRIT(LIG),.NV,.VAR)
 I $D(VAR("@")) S LVAR("@")=$$NOMINT^%QSF(BASE),PAPA("@")="@"
 S V=-1 F %V=0:0 S V=$N(VAR(V)) Q:V=-1  S ATT=-1 F %ATT=0:0 S ATT=$N(VAR(V,ATT)) Q:ATT=-1  S CRIT(LIG,V,ATT)=""
 Q
TCOMM S V=-1 F %V=0:0 S V=$N(CRIT(LIG,V)) Q:V=-1  D TV
 S V=$N(CRIT(LIG,-1)),INTER=CH(LIG,V)
 F %V=0:0 S V=$N(CRIT(LIG,V)) Q:V=-1  D TV2
 S IC(LIG)=$P(INTER,",",NPI)
 Q
TV S INTER="",NI=TABIND(V)
BV G:(NI=0)!(NI="") FV I V="@" S INTER="@" G FV
 S:$$RED^%ANA(NI,"CALCUL")="INTERSECTION" INTER=$$RED^%ANA(NI,"INDIVIDU")_","_INTER
 S NI=$$RED^%ANA(NI,"PERE") G BV
FV S CH(LIG,V)=INTER
 Q
TV2 
 S AI=CH(LIG,V),NI="",NPI=0
 F IN=1:1 S PI1=$P(INTER,",",IN),PI2=$P(AI,",",IN) Q:((PI1="")!(PI2=""))!(PI1'=PI2)  S NI=NI_","_PI1,NPI=NPI+1
 S INTER=$E(NI,2,$L(NI)) Q
TDUPL S INTER=TABIND(IC(LIG)),V=-1
 F %V=0:0 S V=$N(CRIT(LIG,V)) Q:V=-1  S NI=TABIND(V) D CAL
 S NI=$$NEW^%ANA,IM(INTER,1,NI)=""
 
 D SET^%ANA(NI,"CALCUL","CRITERE"),SET^%ANA(NI,"ARBRE",CRIT(LIG))
 S MOD="",PI1=0,V=-1 F %V=0:0 S V=$N(CRIT(LIG,V)) Q:V=-1  S ATT=-1 F %ATT=0:0 S ATT=$N(CRIT(LIG,V,ATT)) Q:ATT=-1  S PI1=PI1+1,MOD=MOD_V_","_ATT_","_PI1_";" D SET^%ANA(NI,PI1,CRIT(LIG,V,ATT))
 D SET^%ANA(NI,"MODELE",MOD) Q
CAL 
 S IN=$$RED^%ANA(NI,"PERE") G:(IN=INTER)!(IN=0) SCAL S NI=IN G CAL
SCAL S ATT=-1 F %ATT=0:0 S ATT=$N(CRIT(LIG,V,ATT)) Q:ATT=-1  D VALO
 Q
VALO 
 S IM(INTER,2,NI)=""
 
 I V=IC(LIG) S NI=$$NEW^%ANA,CRIT(LIG,V,ATT)=NI G SVALO
 
 S CRIT(LIG,V,ATT)=$$RECOP^%ANA(NI),NI=$$NEW^%ANA
SVALO D SET^%ANA(NI,"CALCUL","VALORISATION"),SET^%ANA(NI,"ATTRIBUT",ATT)
 
 
 I V=IC(LIG) D SET^%ANA(NI,"REPERTOIRE",$$RED^%ANA(INTER,"REPERTOIRE")) Q
 
 S TETE=$$PERE(V,CRIT(LIG,V,ATT))
 D SET^%ANA(NI,"REPERTOIRE",$$RED^%ANA($$RED^%ANA(TETE,1),"REPERTOIRE"))
 D SET^%ANA(NI,1,$$RED^%ANA(TETE,1)),SET^%ANA(TETE,1,NI) Q
PERE(V,A) Q:A=0
 N IN
 S IN=$$RED^%ANA(A,1) Q:IN=0 ""
 Q:($$RED^%ANA(IN,"CALCUL")="INTERSECTION")&($$RED^%ANA(IN,"INDIVIDU")=V) A
 S INT="" F IN=1:1 S PI1=$$RED^%ANA(A,IN) Q:(PI1="")!(PI1=0)  S INT=$$PERE(V,PI1) Q:INT'=""
 Q INT

