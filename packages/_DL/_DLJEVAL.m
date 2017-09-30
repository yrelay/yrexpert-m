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

;%DLJEVAL^INT^1^59547,73868^0
PLJEVAL(FAM,ART,PERE,GAMME,LANC,MAC1,MAC2,OP1,OP2) 
 
 
 
 
 N DEF,%NUPA,PRW,FL,%ABEND,%NUFICH,PRX,LTEST,TEST,COND,TAB,SIF,R,V
 N A,REP,O,OB,PREMAF
 S DEF=ART
 K V,%JALON
 S %NUPA=-1,PRW="("""_FAM_""","""_MAC1_""","""_MAC2_"""",FL="^[QUI]DLJ"_PRW_")",%ABEND=0
LOOP S %NUPA=$N(@FL@(%NUPA)) G:%ABEND FINEV G:%NUPA=-1 FINEV S %NUFICH=$S(%NUPA="SINON":"""SINON""",1:%NUPA)
 S PRX=PRW_","_%NUFICH_")",LTT="^[QUI]CDLJ"_PRX,LTT2="^[QUI]CDLJ"_PRW_","_%NUFICH_","
 
 S COND=1,CONDIT=1,NOFI="",LOGI="&"
BCOND S NOFI=$O(@LTT@(NOFI))
 G:NOFI="" VAL
 S LTEST=LTT2_NOFI_")"
 S TEST=@LTEST
 S TAB=LTEST,SIF=1
RETER1 S $ZT="ERR^%DLJEVAL"
 S @("CONDIT=CONDIT"_LOGI_TEST)
 S LOGI=$S($D(@LTEST@("OPERATEUR")):@LTEST@("OPERATEUR"),1:"&")
 G BCOND
 
VAL G:'(CONDIT) LOOP
 S LTEST="^[QUI]ADLJ"_PRX I @LTEST="" S CONDIT=0 G LOOP
 S SIF=1,COND=0
 S TAB=LTEST
RETER2 S $ZT="ERR^%DLJEVAL"
 S TEST=@LTEST
 S @("VAL="_TEST)
 S ^V($J,"DEFAUT",DEF,"JALON")=VAL,%JALON=VAL
 S %ABEND=1
 G LOOP
 
 
FINEV S $ZT=""
 Q
 
ERR S $ZT=""
 G:SIF=2 LOOP
 D QUERV
 G:COND RETER1
 G RETER2
 
 
QUERV N RP,O2
 S SIF=2
 S R=""
QUERVR S R=$O(@TAB@("PAR",R))
 Q:R=""
 S O=""
QUERVO S O=$O(@TAB@("PAR",R,O))
 G:O="" QUERVR
 I $E(O)'="""" S OB=@O,O2=OB,RP=^OBJSP($J,R,OB),A="" G QUERVA
 S OB=$$FAMTEC(O,.O2)
 G:OB="" QUERVO
 S RP=$$ART^%DLCON2
 S A=""
QUERVA S A=$O(@TAB@("PAR",R,O,A))
 G:A="" QUERVO
 G:$D(^V($J,R,O2,A)) QUERVA
 S V=$$^%QSCALVA(RP,OB,A)
 G:V="" QUERVA
 S ^V($J,R,O2,A)=V
 G QUERVA
RIEN Q
 
 
INIT(PERE,ART,GAMME,JALON,TYPJAL) 
 S:ART'="" ^OBJSP($J,"ARTICLE",ART)=REPART,^OBJSP($J,"ARTICLE",ART)=REPART
 S:PERE'="" ^OBJSP($J,"ARTICLE",PERE)=REPART,^V($J,"ARTICLE",PERE,"JALON")=JALON,^V($J,"ARTICLE",PERE,"TYPE.JALON")=$S(TYPJAL=1:"NOMENCLATURE",1:"GAMME")
 S:GAMME'="" ^OBJSP($J,"GAMME",GAMME)=REPGAM
 Q
 
 
INIGLOB(REPART,REPLAN,TETE,LANC) 
 S:TETE'="" ^OBJSP($J,"ARTICLE",TETE)=REPART
 S:LANC'="" ^OBJSP($J,"LANCEMENT",LANC)=REPLAN
 Q
 
INITOP(MAC1,MAC2,OP1,OP2) 
 S:MAC1'="" ^OBJSP($J,"MACHINE1",MAC1)=REPMACH
 S:MAC2'="" ^OBJSP($J,"MACHINE2",MAC2)=REPMACH
 S:OP1'="" ^OBJSP($J,"OPERATION1",OP1)=REPOP
 S:OP2'="" ^OBJSP($J,"OPERATION2",OP2)=REPOP
 Q
 
FIN K ^V($J),^OBJSP($J)
 S $ZT=""
 Q
 
 
ABAQUE(NOMAB,NORMAB,IDENAB,INDIV) 
 K REP,OB,PREMAF,OB2
 S:INDIV="" INDIV="DEFAUT"
 S OB=$O(^OBJSP($J,INDIV,""))
 I OB'="" S REP=^OBJSP($J,INDIV,OB) G AB3
 S OB=""""_INDIV_""""
 S OB=$$FAMTEC(OB,.OB2)
 G:OB="" ABERR
 S REP=$$ART^%DLCON2
AB3 S VAL=0,PREMAF=1
 G:'($$EVAL^%QSABAQU(REP,OB,0,"","","MAJVAL^%DLJEVAL",MODEX,NOMAB,NORMAB,IDENAB,.VAL,.ERR)) ABERR
 G:ERR'=0 ABERR
 G:PREMAF ABERR
 Q VAL
ABERR 
 W *
 
MAJVAL 
 Q:ATTA=$$^%QZCHW("NOM")
 Q:$$TYPE^%QSGEST9(REP,ATTA)'=0
 S EXP2=EXP
 I $$TYPE^%QSGESPE(ATTA_"/"_$$NOMLOG^%QSF(REP))="DATE" S EXP2=$$INTF^%QMDAUC(REP,ATTA,EXP2)
 S ^V($J,INDIV,OB,ATTA)=EXP2
 I PREMAF S VAL=EXP2,PREMAF=0
 I TRT D:MODAF'=0 ADD^%TLIFEN("ATT",ATTA_"<--"_EXP2)
 Q
 Q:ATTA="JALON"
 D:MODEX'=1 PA^%QSGESTI(REP,OB,ATTA,EXP2,1)
 D:MODEX=2 STATT^%TLBAATT(REP,OB,ATTA,EXP2,1,"AJOUT")
 Q
 
 
FAMTEC(OB,O2) 
 N V
 S V="",O2=$E(OB,2,$L(OB)-1)
 I $D(@FAMTEC@(2,O2)) S V=@FAMTEC@(2,O2)
 S:V="*" V=""
 Q V
 
MAX(VAL1,VAL2) 
 I VAL1>VAL2 Q VAL1
 Q VAL2
 Q VAL2

