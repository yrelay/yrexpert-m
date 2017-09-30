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

;TORQY8^INT^1^59547,74875^0
TORQY8(NUFA,TWREF,LISTE) 
 K ^CONS($J),^DIM($J),^U($J) Q:'($D(@("^[QUI]TREEWORK(NUFA,"_TWREF_")")))  S ARTI=$P(@("^[QUI]TREEWORK(NUFA,"_TWREF_")"),"^",2) Q:'($D(^[QUI]ANTETUDE(ARTI,NUFA,TWREF)))
 S REFTOT=$P(^[QUI]ANTETUDE(ARTI,NUFA,TWREF),"^",1) D INIT^%MZS01
 S QT=$S($D(^[QUI]TVPAR(NUFA,TWREF,$$^%QZCHW("QUANTITE"))):^[QUI]TVPAR(NUFA,TWREF,$$^%QZCHW("QUANTITE")),1:1),ARC=$P(@("^[QUI]TREEWORK(NUFA,"_TWREF_")"),"^",10)
 
 S %RP=$S($D(^RQSTOTEM(WHOIS)):^MOZIDF($I,WHOIS,"GI"),1:""),%RHI=$$^TOMOZDEF(%RP) I %RHI="" D ^%VZEAVT("Transfert impossible") Q
T0 S %CUK=$S(%RHI="HIER":ARC,1:NUFA_"."_$TR(TWREF,",","")) G:%RHI="IND" T01
 I %RHI'="",ARC="" D ^%VZEAVT("Etude "_NUFA_"."_$TR(TWREF,",",".")_" impossible a transferer") Q
T01 D KILL K RESUL S SCR="MOZGARDE",NOMTAB="^[QUI]"_SCR,%V=^%SCRE(SCR),ABENDSCR=0 F %U=1:1:%V S RESUL(%U)=""
 S RESUL(1)=%CUK,RESUL(10)=ARTI,RESUL(11)=REFTOT D ZD^%QMDATE4,INT^%QMDAK0 S RESUL(18)=$$^%QZCHW("Recuperation")_" TOTEM "_%DAT_$$^%QZCHW(" a ")_HEURE D ^%VAUTOST
 D PA^%QSGESTI($$GI^%MZQS,%CUK,"NUMERO.TOTEM",NUFA,1)
 D PA^%QSGESTI($$GI^%MZQS,%CUK,"DATE.RECUPERATION.TOTEM",%DAT,1)
 
 
 
 K TBP,PTB
 S TBM="^U($J,0)",LIC=0,NUPH=-1
LPH S NUPH=$N(^[QUI]PHAS(NUFA,TWREF,NUPH)) G:NUPH=-1 FPH K CH S OPER=NUPH,NUOP=^[QUI]PHAS(NUFA,TWREF,NUPH),ACT=$P(NUOP,"/",1),MAC=$S($D(^[QUI]SECT(NUFA,TWREF,NUOP)):^[QUI]SECT(NUFA,TWREF,NUOP),1:"???"),MAC=$$S^%QAX(MAC) K COM S NCOM=1
 
CONSU 
 N ATT,LAT,CH,LIB,%U,VAL,LIG,POS,ID,COM,LIC,TBM
 S TBM="^U($J,0)",LIC=0
ATT ;;NUMERO.OPERATION^OPER^1,MACHINE^MAC^1,TEMPS.PREPARATION^TPR^1,TEMPS.FABRICATION^TPF^1,ACTION^ACT^2
 S CH(1)="",CH(2)="",LAT=$P($T(ATT),";;",2) F %U=1:1 S LIB=$P(LAT,",",%U) Q:LIB=""  S VAL=@$P(LIB,"^",2),LIG=$P(LIB,"^",3),LIB=$P(LIB,"^",1),POS=ATT(LIB),$P(CH(LIG),$C(1),POS)=VAL
 S LIC=LIC+1
 S @TBM@(LIC)="1^"_CH(1)
 S LIC=LIC+1
 S @TBM@(LIC)="2^"_CH(2)
 S ID=-1 F %U=1:1 S ID=$N(COM(ID)) Q:ID=-1  S LIC=LIC+1,@TBM@(LIC)="3^          "_COM(ID)
 S LIC=LIC+1,@TBM@(LIC)="3^" Q
 
FPH S @TBM@(0)=LIC,PAR="@"
PAR S PAR=$O(^[QUI]TVPAR(NUFA,TWREF,PAR)) G:PAR="" FPAR
 D:$$EXISTE(PAR,.LISTE) PA^%QSGESTI($$GI^%MZQS,%CUK,PAR,^[QUI]TVPAR(NUFA,TWREF,PAR),1)
 G PAR
FPAR D TOT^%MZS01(%CUK) G:%RHI="RELAT" LIEN
 Q
ATTC(N,C) 
 N NB,%V,%U,CS S %V=0,NB=$L(C,"|") F %U=1:1:NB S CS=$P(C,"|",%U) I CS'="" S %V=%V+1,^CONS($J,N,%V)=CS
 Q
LIEN D PA^%QSGESTI($$GI^%MZQS,%CUK,%RP,ARC,ARC)
 D PA^%QSGESTI($$NOMEX^%QSF(%RP),ARC,$$GE^%MZQS,%CUK,%CUK)
 Q
TLB F %U=0:0 S ID=$E(CH,$L(CH)) Q:$A(ID)>32  S CH=$E(CH,1,$L(CH)-1) Q:CH=""
 Q
KILL D:%RHI="RELAT" SX^%QSGESTI($$GI^%MZQS,%CUK)
KILL2 S KTB=$P($T(KTB),";;",2) F %U=1:1 S TB=$P(KTB,",",%U) Q:TB=""  K @("^[QUI]"_TB_"(%CUK)")
 Q
KTB ;;MOZART,MOZGARDE,MOZVISA
EXISTE(PAR,LISTE) 
 Q:PAR="" 0
 Q:$$^%QCAZG("LISTE")="*" 1
 Q $D(LISTE(PAR))>0
 ;

