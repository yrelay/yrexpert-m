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

;%QMCAREC^INT^1^59547,73876^0
QMCAREC() 
 
 
 
 
 
 N ECHEC,AT,OR,IND,%A,%O,%I,CPT,SYN,ARRET,CARD,GLO,DEB,BREP
 D INIT^%QMCARES
 
 S STOP=$$PARC("CV") G:ARRET=1 FINC
 I NUMORD=0 G ATRI
 G ORD
FINC G FINC^%QMCARES
 
CV 
 D VAL(VAL)
 Q
 
ORD 
 S STOP=$$PARC("CO") G:ARRET=1 FINC
 G ATRI
CO 
 S IND=""
 F %I=0:0 S IND=$$NXTRI^%QSTRUC8(REP,IND) Q:(IND="")!(ARRET=1)  D VALO(VAL)
 Q
 
ATRI 
 S STOP=$$PARC("CA") G:ARRET=1 FINC
 
 S SYN=$O(^[QUI]TOSYNONY(VAL,"")) G:SYN="" INDIV
 D CS(SYN)
 G:ARRET=1 FINC G INDIV
CA 
 Q:'($$AR^%QSGE5(REP,VAL))
 D CAI(VAL)
 Q
 
INDIV 
 S STOP=$$PARC("CI") G:ARRET=1 FINC
 
 S COD="" F %I=0:0 S COD=$O(^[QUI]ZSYNINV(COD)) Q:COD=""  D CSI(VAL)
 G REPER
CI 
 Q:'($$IR^%QSGE5(REP,VAL))
 S SYN=$$S^%QAX(VAL),SYN=$S(SYN=VAL:"",1:" il a pour synonyme "_SYN)
 D AD(VAL_" est un individu",0)
 D AD(" du repertoire "_@LISTREP@(REP),0)
 D AD(SYN,1)
 S IND=VAL
 D LIST,ARRET
 Q
 
REPER 
 S REP="",%O=0
 F %R=0:1 S REP=$O(@LISTREP@(REP)) Q:REP=""  I VAL=@LISTREP@(REP) S %O=1 Q
 G:%O=0 FINC
 D AD(VAL_" est un repertoire du schema de donnees courant",0)
 D AD(" Choisissez l'option MODELE pour plus de renseignements sur le schema",2)
 D AD("",1)
 S:STOP=1 BREP=2 S:STOP=0 BREP=1
 S (ATR,IND)="" D LIST
 G FINC
 
PARC(ROU) 
 
 S REP=""
 F %R=0:1 S REP=$O(@LISTREP@(REP)) Q:(REP="")!(ARRET=1)  D @ROU
 Q STOP
 
VAL(SAUV) 
 S AT=""
 F %A=0:0 S AT=$$NXTRVA^%QSTRUC8(REP,SAUV,AT) Q:(AT="")!(ARRET=1)  S OR="" F %O=0:0 S OR=$$NXTRVAO^%QSTRUC8(REP,SAUV,AT,OR) Q:(OR="")!(ARRET=1)  S IND="" F %I=0:0 S IND=$$NXTRVAOI^%QSTRUC8(REP,SAUV,AT,OR,IND) Q:IND=""  D INS Q:ARRET=1
 Q
INS G:AT="NOM" NOM
 
 Q:'($D(@LISTR@(REP)))
 
 Q:$$TYPE^%QSGEST9(REP,AT)'=0
 D AD(SAUV_" est la valeur de l'attribut "_AT,0)
 D AD(" de l'individu "_IND,0)
 I @LISTREP@(REP)'="LIEN" D AD(" du repertoire "_@LISTREP@(REP),1) G FINS
 
 N LIEN S LIEN=$P(IND,"\",1)
 D AD(" entre "_$$^%QSCALVA(REP,IND,"REP.SOURCE")_" "_$$^%QSCALVA(REP,IND,"SOURCE."_LIEN)_" et "_$$^%QSCALVA(REP,IND,"REP.DESTINATION")_" "_$$^%QSCALVA(REP,IND,"DESTINATION."_LIEN),1)
 G FINS
NOM 
 Q:IND=SAUV
 D AD(SAUV_" est un individu",0)
 D AD(" du repertoire "_@LISTREP@(REP),0)
 D AD(" de nom complet "_IND,1)
FINS D LIST,ARRET
 Q
 
VALO(SAUV) 
 S AT=""
 F %A=0:0 S AT=$$NXTRIOV^%QSTRUC8(REP,IND,SAUV,AT) Q:(AT="")!(ARRET=1)  S OR="" F %O=0:0 S OR=$$NXTRIOAV^%QSTRUC8(REP,IND,SAUV,AT,OR) Q:OR=""  D INSO Q:ARRET=1
 Q
INSO 
 Q:'($D(@LISTR@(REP)))
 
 Q:$$TYPE^%QSGEST9(REP,AT)'=0
 D AD(SAUV_" est le numero d'ordre de l'attribut "_AT,0)
 D AD(" de valeur "_OR_" pour l'individu "_IND,0)
 D AD(" du repertoire "_@LISTREP@(REP),1)
 D LIST,ARRET
 Q
 
CAI(SAUV) 
 
 Q:'($D(@LISTR@(REP)))
 S SYN=$O(^[QUI]TOLEXS(SAUV,"")),SYN=$S(SYN="":"",1:" il a pour synonyme "_SYN)
 S AT=$$TYPE^%QSGEST9(REP,SAUV)
 D AD(SAUV_" est un attribut"_$S(AT=0:"",1:" lien"),0)
 D AD(" du repertoire "_@LISTREP@(REP)_$S(AT=0:"",1:" vers le repertoire "_$$NOMLOG^%QSF($$REPD^%QSGEL2(REP,SAUV))),0)
 D AD(SYN,1)
 S IND="",ATR=SAUV
 D LIST,ARRET
 Q
 
CS(SYN) 
 S REP="",%O=0
 F %R=0:1 S REP=$O(@LISTREP@(REP)) Q:REP=""  I $$AR^%QSGE5(REP,SYN) S %O=1 Q
 Q:%O=0
 D AD(SAUV_" est le synonyme",0)
 D AD(" de l'attribut "_SYN,0)
 D AD(" du repertoire "_@LISTREP@(REP),1)
 S IND="",ATR=SYN
 D LIST,ARRET
 Q
 
CSI(SAUV) 
 S SYN=$O(^[QUI]ZSYNINV(COD,SAUV,"")) I SYN="" Q
 S REP="",%O=0
 F %R=0:1 S REP=$O(@LISTREP@(REP)) Q:REP=""  I $$IR^%QSGE5(REP,SYN) S %O=1 Q
 Q:%O=0
 D AD(SAUV_" est le synonyme sous le code utilisateur "_COD,0)
 D AD(" de l'individu "_SYN,0)
 D AD(" du repertoire "_@LISTREP@(REP),1)
 S IND=SYN
 D LIST,ARRET
 Q
 
LIST 
 I $D(@ECHEC@(REP)) K @ECHEC@(REP)
 S STOP=1,NUML=NUML+1,CPT=CPT+1 Q
 
ARRET 
 R *ARRET:0 D TOUCHE^%INCCLAV(ARRET,.ARRET)
 I ARRET=1 D POCLEPA^%VVIDEO S ARRET=$$MES^%VZEOUI($$^%QZCHW("Voulez-vous arreter la recherche")_" ? ","O")=1
 Q
 
AD(MSG,T) 
 
 
 
AD2 I CPT=0 S @GLIST@(NUMS,"DEB")=DEB
 D:CPT<2 ADD^%TLBAGF1("CALISTE",MSG) D ADD2^%TLBAGF1("CADETAIL",MSG,0)
 I T=1 D:CPT<2 ADD^%TLBAGF1("CALISTE","     - -") D ADD2^%TLBAGF1("CADETAIL","     - -",0) D:CPT>2 MSG^%VZEATT((CPT-2)_" autres reponses")
 I T'=2 S @IMPR@(NUML)=$S($D(@IMPR@(NUML)):@IMPR@(NUML),1:"   ")_MSG
 Q

