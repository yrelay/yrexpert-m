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

;%MZMAJ^INT^1^59547,73872^0
MOZMAJ(GAM) 
 
 
 
 
 
 
 
 
 
 D CURRENT^%IS,MSG^%VZEATT("Preparation de la Sauvegarde ...")
 K ^MOZU($J) S NOMTREE="^U("_$J,%TREECOP="^MOZU("_$J D ^%QCAGLC
 K ^CONS($J),^DIM($J) G GOG
TOT(GAM) 
GOG K ^OPVU($J),OPVUU($J),^MOZTABU($J),^MOZTABUU($J),^MOZCOM($J),^MOZMOUV($J) S TB="^U($J,0)",TB2="^MOZSAVU($J,0)",NPH="",COM=0,LC="",(NEWOP,ENCOURS,FINCOM)=0 D INIT,INIS,INT^%MZMAJ2
 N TEMP K SOP S SOP=0,IDC="",NLI="",NM=0,NLIS=""
LOP S NLI=$O(@TB@(NLI)) G:NLI="" FIN S LC=@TB@(NLI),TYP=$P(LC,"^",1)+0,LC=$P(LC,"^",2,999) S:TYP>3 TYP=3 G @TYP
0 G 3
1 I ('(FINCOM))&ENCOURS S NOR=$S($D(NOR(IDC)):NOR(IDC)+1,1:1) D DELCOM^%MZMAJ2(NOR,NLIS)
 I ENCOURS D RECUP^%MZMAJ3(NLIS+1),MAJ^%MZMAJ3
 D INCR(NLI)
 K VAL,ATT I '($D(^TOR3($J,NLI))) G LOP
 D C(1) S SOP=5E-1,IDC="",NPH=ATT("NUMERO.OPERATION",1) G LOP
2 I ('(FINCOM))&ENCOURS S NOR=$S($D(NOR(IDC)):NOR(IDC)+1,1:1) D DELCOM^%MZMAJ2(NOR,NLIS)
 I ENCOURS D RECUP^%MZMAJ3(NLIS+1),MAJ^%MZMAJ3
 I ^TOR2($J,NLI)="" G LOP
 G 3:NPH="" D C(2) G 3:'($D(ATT("ACTION"))),3:ATT("ACTION",1)="",3:ATT("NUMERO.OPERATION",1)=""
 S SOP=$S($D(SOP(NPH)):SOP(NPH)+1,1:1),SOP(NPH)=SOP+1,OP=NPH_"."_$TR($J("",3-$L(SOP))," ",0)_SOP,IDC=ATT("ACTION",1)_"/"_OP
 S ^OPVU($J,OP)=IDC,^OPVU($J)=GAM,SAVIDC=IDC
 
 S NLI2=NLI D MSG^%VZEATT("Operation "_SAVIDC_" en cours ....")
 I '($$OVAIR^%QSGE5($$GI^%MZQS,GAM,$$LIEN^%MZQS,IDC,OP)) G CREOP
 D DEB^%MZMAJ2 S ENCOURS=1 D INCR(NLI) G LOP
CREOP D MSG^%VZEATT("Creation de l'operation "_SAVIDC)
 S LIEN=$$LIEN^%MZQS
 I LIEN="" D ^%VZEAVT("Impossible de creer l'operation "_IDC),INCR(NLI-1),INCR(NLI) G LOP
 D ADDO^%QSGEST3($$GI^%MZQS,GAM,OP,LIEN,$$OI^%MZQS,IDC),PA^%QSGESTI($$OI^%MZQS,GAM_","_IDC,"NOM",IDC,1)
 S ATT="" F %U=1:1 S ATT=$O(ATT(ATT)) Q:ATT=""  S NOR="" F %U=1:1 S NOR=$O(ATT(ATT,NOR)) Q:NOR=""  S:(ATT["MACHINE")!(ATT="POSTE.MAIN") ATT(ATT,NOR)=$$M^%QAX(ATT(ATT,NOR)) D STOCK^%QSGESTI($$OI^%MZQS,GAM_","_IDC,ATT,ATT(ATT,NOR),NOR)
 S (ENCOURS,NEWOP)=1 D INCR(NLI-1),INCR(NLI) G LOP
3 G 31:IDC'="" D INCR(NLI) G LOP
31 I $E(LC)="*" S SOP=0,NPH="",IDC="" K ATT D INCR(NLI) G LOP
 I $E(LC)=";" D INCR(NLI) G LOP
 I '($D(NOR(IDC))) K NOR S NOR(IDC)=0,OKCOM=0
 S NOR=NOR(IDC)+1,NOR(IDC)=NOR
 D INCR(NLI)
 I NEWOP D PA^%QSGESTI($$OI^%MZQS,GAM_","_IDC,"COMMENTAIRE",LC,NOR) G LOP
 I FINCOM S ^MOZCOM($J,IDC,"COMMENTAIRE",NOR)=LC,ENCOURS=1 G LOP
 S OKCOM=$$3^%MZMAJ2 S:'(OKCOM) ^MOZCOM($J,IDC,"COMMENTAIRE",NOR)=LC
 S ENCOURS=1 G LOP
C(I) S %U="" F %V=1:1 S %U=$O(MOZ(I,%U)) Q:%U=""  S ATT=$P(MOZ(I,%U),"^",1),VAL=$P(LC,$C(1),%V),NOR=$P(MOZ(I,%U),"^",2) S:NOR="" NOR=1 D NET S ATT(ATT,NOR)=VAL
 S ATT("NUMERO.OPERATION",1)=ATT("NUMERO.OPERATION",1)+0
 Q
NET S LAV=$E(VAL,1) Q:LAV'=" "  S VAL=$E(VAL,2,99999) G NET
FIN D:$$^%QCAZG("NOR")'="" DELCOM^%MZMAJ2(NOR,NLIS-1)
 S SAVIDC=IDC D RECUP^%MZMAJ3(NLIS+1),MAJ^%MZMAJ3,^%MZMAJ3
 K ATT,ATT2,SOSP,SOP,NPH,NPHS,IDC,IDCS,NLI,NLIS,OPS,OP,SAVIDC,TYP,TYPS,VAL,VALS,^MOZTABU($J),^MOZTABUU($J),^MOZCOM($J),^MOZMOUV($J),^OPVU($J),^OPVUU($J),TB,TB2,VALEUR,NLI2,OLDVAL,%RENUM
 K ^U($J) S NOMTREE="^MOZU("_$J,%TREECOP="^U("_$J D ^%QCAGLC
 K ^MOZSAVU($J) S NOMTREE="^MOZU("_$J,%TREECOP="^MOZSAVU("_$J D ^%QCAGLC
 K ^MOZU($J) Q
ATTS(TB,ATT) S NOPX300=""
 F %U=0:0 S NOPX300=$O(^OPVU($J,NOPX300)) Q:NOPX300=""  I $D(@TB@(^OPVU($J,NOPX300))) S IDFX300=^OPVU($J,NOPX300),%NTT="" F %U=0:0 S %NTT=$O(@TB@(IDFX300,%NTT)) Q:%NTT=""  D STOATT
 K %NTT,NOPX300,IDFX300 Q
STOATT D STOCK^%QSGESTI($$OI^%MZQS,^OPVU($J)_","_IDFX300,ATT,@TB@(IDFX300,%NTT),%NTT) Q
INIS K ^TOR3($J),^TOR2($J),^TOR1($J) S %NX300="",%IX300=0,NOP=""
T1 S %NX300=$O(@TB@(%NX300)) G:%NX300="" T2 S %LX300=@TB@(%NX300),%TX300=$P(%LX300,"^",1)+0
 I %TX300=1 S NOP=$P($P(%LX300,"^",2,999),$C(1),1),%IX300=%IX300+1,^TOR1($J,%NX300)=NOP G T1
 I %TX300=2 S %VX300=$ZP(^TOR1($J,%NX300)),^TOR2($J,%NX300)=%VX300 S:%VX300'="" ^TOR3($J,%VX300,%NX300)=""
 G T1
T2 K %TX300,%VX300,%NX300,%LX300,%IX300 Q
INIT N %UTIL K MOZ
 I $D(^[QUI]MOZ("GRILLE",WHOIS,$$GE^%MZQS)) S %TS=$$GE^%MZQS,%UTIL=WHOIS D ADR^%QCAGLC("^[QUI]MOZ(""GRILLE"","""_%UTIL_""","""_%TS_"""","MOZ") G A
 I $D(^[QUI]MOZ("GRILLE","TRAZOM",$$GE^%MZQS)) S %TS=$$GE^%MZQS,%UTIL="TRAZOM" D ADR^%QCAGLC("^[QUI]MOZ(""GRILLE"","""_%UTIL_""","""_%TS_"""","MOZ") G A
 S %TS="STAND",%UTIL="TRAZOM" D ADR^%QCAGLC("^[QUI]MOZ(""GRILLE"","""_%UTIL_""","""_%TS_"""","MOZ")
A K ATT S LI="" F %U=1:1 S LI=$O(MOZ(LI)) Q:LI=""  S ATX300="" F %U=1:1 S ATX300=$O(MOZ(LI,ATX300)) Q:ATX300=""  S ATT($P(MOZ(LI,ATX300),"^",1))=ATX300
 K ATX300,LX300 Q
INCR(I) S ^MOZTABU($J,I)="" Q

