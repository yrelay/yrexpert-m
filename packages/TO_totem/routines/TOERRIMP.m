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

;TOERRIMP^INT^1^59547,74872^0
TOERRIMP ;
 
ADR D ^TOSAVERR S $ZT="" D ^TOKILLER S END="",%ERRETUD=1,%TBVAL=$S($D(%TABTV):%TABTV,1:"^[QUI]TVPAR(NUFA,TWREF)"),$ZT=""
 S LLB=0 D ^TOERRZE Q:%EXPLIC=0
 
 I BATCH'=0 S ^CSTEST($I,"ERREUR")=$P(^DOLARZE($I),"^",1)_$$^%QZCHW(" de ")_$P(^DOLARZE($I),"^",2)_$$^%QZCHW(" ")_NTABN_$$^%QZCHW(" ")_SOURCE,%ABEND=1,LLB=""
 S $ZT="",SFA=YA,NSFA=TWREF,TGRIL=NTABN,DDYY=6
 I BATCH=0 D ^%VSQUEAK,CLEPAG^%VVIDEO
 I BATCH=0 S DX=5,DY=0 W $S(^DOLARZE($I)["UNDEFINED":$$^%QZCHW("ERREUR"),^DOLARZE($I)["DIVIDE":$$^%QZCHW("Division par zero"),1:$$^%QZCHW("Probleme")),$$^%QZCHW(" dans l'analyse des "),NTABN,$$^%QZCHW(" de "),$P(SOURCE,",",1),!,!,$$^%QZCHW("Regle : ") F PP=2:1:NCLE W $P(SOURCE,",",PP),$$^%QZCHW(" ")
ADR2 S $ZT=END,DC=PNUM,N=NTABN
 S TTAA="^[QUI]"_$S(N["AUTREFO":N,N["ON MAC":"MACSEL",N["tres MAC":"IMPMAC",N["S-FA":"SELMAT",N["LE MA":$$^%QZCHW("MATIERE"),N["STOC":"IMPMAT",N["IMPL":"IMPLICI",N["COMPOSANT":"NOMENC",N["PHAS":"PHASE",N["CONSIGNES":"OUTCONS",1:"FORMULE")
 S %1AR=0,NOMTAB=TTAA,TTBB=TTAA,PAR=-1 D ^%VTNAMFU S:%NFU'="" TTAA=%NFU I BATCH=0,TTAA["FLIMPLI" S PAR=$P($P(SOURCE,",",2),"""",2) I PAR["$ARG",$D(^[QUI]DEPARG(YA,PAR)) W !,$$^%QZCHW("Pour evaluation de la regle : "),^[QUI]DEPARG(YA,PAR)
 I BATCH=0,TTAA["FLIMPLI",SOURCE["%ARGINTER" S %1AR=1,%ARG=$P(SOURCE,"""",4),NUGR=$P(%ARG,".",2),%TYP=$P(%ARG,".",3) S:%TYP="" %TYP=1 S %UCI=^TABIDENT($I,"%UCI"),QU=$S(%TYP=0:%UCI,1:QUI),ABAC=$S($D(^[QU]GROUGRIL(NUGR)):$P(^[QU]GROUGRIL(NUGR),"|",2),1:"???")
 I %1AR=1,BATCH=0 W !,$$^%QZCHW("Pour evaluation de l'abaque : ") F %TYP=1:1 Q:$P(ABAC,"^",%TYP)=""  W $P(ABAC,"^",%TYP),"  "
 S CGRIL=@(TTAA_"("_SOURCE_")") Q
COND S $ZT="" K ^EVERROR($I) D ADR G:%EXPLIC=0 RET G:(BATCH=0)&(LLB'=0) RET W:LLB=0 !,!,?10,$$^%QZCHW("L'erreur est apparue dans le conditionnement")
 S DY=$Y+2,DX=5 X XY W:LLB=0 $$^%QZCHW("Conditionnement : ") S DX=10,DY=DY+2 X XY
 F CAS=1:1 S ITEM=$P(CGRIL,"^",DC) G:ITEM="" FIN D:((CAS-1)#4)=0 1^TO3VSFSU D:((CAS-3)#4)=0 2^TO3VSFSU S:ITEM="[]" ITEM=$$^%QZCHW("compris entre") D:ITEM["??" INCO W:LLB=0 ITEM_$$^%QZCHW(" ") D NORM^%VVIDEO S DC=DC+1 I (CAS#4)=0 S DY=DY+1 X XY
 Q
AFF K ^EVERROR($I) D ADR G:%EXPLIC=0 RET G:(BATCH=0)&(LLB'=0) RET D ^TOFTBERR S $ZT="" W:LLB=0 !,!,?10,$$^%QZCHW("L'erreur est apparue dans la formule")
 W:LLB=0 !,?5,EXPAF(1) S EXP=EXP(1) D ^TOVAPFOR I NFOR=2 W:LLB=0 !,!,?10,$$^%QZCHW("ou dans la formule"),!,?5,EXPAF(2) S EXP=EXP(2),DDYY=$Y D ^TOVAPFOR
FIN D:$D(^[QUI]VALITOLE(YA)) ^TOERTRIP G:LLB'=0 IER D POCLEPA^%VVIDEO W $$^%QZCHW("RETURN pour continuer ") R *RET
 S $ZT=""
 D ^TOERROR,^TOTCADRE S CONDIT=0
RET K %TBVAL,EXPAF,EXP,TTBB D RES^TOSAVERR G @ADERROR
INCO S ^EVERROR($I,$P(ITEM,"(",1))=1 D BLD^%VVIDEO,REV^%VVIDEO,BLK^%VVIDEO Q
IER S LLB=-1 F UU=1:1 S LLB=$N(^EVERROR($I,LLB)) Q:LLB=-1  S ^CSTEST($I,"UNDEF",LLB)=1
 K ^EVERROR($I) G RET
END Q
 
ZZE() 
 I '(DTM) Q $P($ZE,"^",1)_$$^%QZCHW(" de ")_$P($ZE,"^",2)
 Q $$^%SYSBUG($ZERR)_$$^%QZCHW(" de ")_%ZPROG

