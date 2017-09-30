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

;TORQY5^INT^1^59547,74875^0
TORQY5(NUFA,TWREF,LISTE,BASI,%CUK,GAM,RGAMME,FILS,NIV,TETE,CPR) 
 
 
 
 
 
 
 N REFTOT,PAR,BASF,BASFI,OP,OR,OPE,TT,VATT,VATT2,NOR,SOPS,OPER,LSTLIEN,SBASI,NOMGAM
 N OUI,ODUP,ODUN,OCOUT,OCO1,OCO2,ODI1,ODI2
 N ATDUP,ATDUN,ATCOU,ATCO1,ATCO2,ATDI1,ATDI2
 D INIT^TORQY51
 S ARTI=$P(@("^[QUI]TREEWORK(NUFA,"_TWREF_")"),"^",2)
 S REFTOT=$P(^[QUI]ANTETUDE(ARTI,NUFA,TWREF),"^",1)
 S QT=$S($D(^[QUI]TVPAR(NUFA,TWREF,$$^%QZCHW("QUANTITE"))):^[QUI]TVPAR(NUFA,TWREF,$$^%QZCHW("QUANTITE")),1:1)
T0 
T01 I '($D(^KLNTOT($J))) D PA^%QSGESTI(BASI,%CUK,"NUMERO.TOTEM",NUFA,1),PA^%QSGESTI(BASI,%CUK,"DATE.RECUPERATION.TOTEM",$$DATE3^%QMDATE,1) G T02
 D PA^%QSGESTI(BASI,%CUK,"DATE.RECUPERATION.LINK",$$DATE3^%QMDATE,1)
T02 D LIEN^%QSGEST9(BASI,"LSTLIEN")
 D:'(CPR) PAR
 D:CPR PA^%QSGESTI(BASI,%CUK,$$^%QZCHW("QUANTITE"),^[QUI]TVPAR(NUFA,TWREF,$$^%QZCHW("QUANTITE")),1)
 Q:(GAM=0)!(FILS="")
 
 S SBASI=BASI,%SCUK=%CUK
 I BASI=RGAMME G SUITE
 
 
 I $$LIENPF^%QSGEL2(BASI,RGAMME)="" Q
 
 S NOMGAM=$S(NIV=0:NUFA,1:TETE)
 D PA^%QSGESTI(RGAMME,%CUK_","_NOMGAM,"NOM",NOMGAM,1)
 
 D ADDO^%QSGEST3(BASI,%CUK,NOMGAM,$$LIENPF^%QSGEL2(BASI,RGAMME),RGAMME,NOMGAM)
 
 S BASI=RGAMME,%CUK=%CUK_","_NOMGAM
SUITE S BASF=$$NOMLOG^%QSF(FILS)
 S BASFI=FILS
 D MSG^%VZEATT($$^%QZCHW("gamme")_" : "_%CUK)
 D SUPFILS
 S NOR="" F II=1:1 S NOR=$O(^[QUI]PHAS(NUFA,TWREF,NOR)) Q:NOR=""  S NCOM=1 D GENERAL
 
 
 Q
CONS 
 S OP=$O(^[QUI]CONS(NUFA,TWREF,""))
 F CS=1:1 Q:OP=""  D CONSIG S OP=$O(^[QUI]CONS(NUFA,TWREF,OP))
DIME 
 G DIME^TORQY51
 
DUREE 
 G DUREE^TORQY51
DIM1 
 G DIM1^TORQY51
GENERAL 
 N LG,BLOC,PHS
 I '($D(OCOUT)) N OUI,ODUP,ODUN,OCOUT,OCO1,OCO2,ODI1,ODI2,ATDUP,ATDUN,ATCOU,ATCO1,ATCO2,ATDI1,ATDI2 D INIT^TORQY51
 S OP=^[QUI]PHAS(NUFA,TWREF,NOR)
 D NUMOP^TORQY10(.NOR,.OP) S OPE=%CUK_","_OPER(OP,"NOM")
 D PA^%QSGESTI(BASFI,OPE,"NOM",OPER(OP,"NOM"),1),PA^%QSGESTI(BASFI,OPE,"NUMERO.OPERATION",$P(OPER(OP,"NUM"),".",1),1),PA^%QSGESTI(BASFI,OPE,"ACTION",$P(OPER(OP,"NOM"),"/",1),1)
 
 D ADDO^%QSGEST3(BASI,%CUK,OPER(OP,"NUM"),$$LIENPF^%QSGEL2(BASI,BASFI),BASFI,OPER(OP,"NOM"))
 S LG=$L(NOR,".") G:LG=1 GENERL1
 I LG=2 S BLOC=$P(NOR,".",2) G ECRB
 S BLOC="" F I=2:1:LG-1 S BLOC=BLOC_$P(NOR,".",I)_"."
 S BLOC=BLOC_$P(NOR,".",LG)
ECRB D PA^%QSGESTI(BASFI,OPE,"BLOC.PHASE",BLOC,1)
GENERL1 
 S MAC=$S($D(^[QUI]SECT(NUFA,TWREF,OP)):^[QUI]SECT(NUFA,TWREF,OP),1:"???"),MAC=$$M^%QAX(MAC) D PA^%QSGESTI(BASFI,OPE,"MACHINE",MAC,1)
 D:$D(^[QUI]CONS(NUFA,TWREF,OP)) CONSIG
 D:$D(^[QUI]DIM(NUFA,TWREF,OP)) DIM1^TORQY51
 D:$D(^[QUI]DUREE(NUFA,TWREF,OP)) DURE^TORQY51
 I $D(^[QUI]COUT(NUFA,TWREF,OP)) S VALC=$J(^[QUI]COUT(NUFA,TWREF,OP),0,2) D:OCOUT PA^%QSGESTI(BASFI,OPE,ATCOU,VALC,1)
 D AUTRE
 
 
 N PHASE S PHASE=""
 F I=1:1 S PHASE=$O(^[QUI]PHASE(ARTI,PHASE)) Q:PHASE=""  Q:PHASE="z"  D PHASE
 Q
PHASE S PHS=$P(NOR,".",$L(NOR,"."))
 D:$D(^[QUI]PHASE(ARTI,PHASE,PHS,$P(OP,"/",1))) PA^%QSGESTI(BASFI,OPE,"PHASE",PHASE,1) Q
 
DIM G DIM^TORQY51
 
 
AUTRE N A,%A
 S A="" F %A=0:0 S A=$O(^[QUI]CARATPC(NUFA,TWREF,OP,A)) Q:A=""  I ((A'="COUT.UNITAIRE")&(A'="DUREE.PREPARATION"))&(A'="DUREE.UNITAIRE") D PA^%QSGESTI(BASFI,OPE,A,^[QUI]CARATPC(NUFA,TWREF,OP,A),1)
 Q
DURE 
 G DURE^TORQY51
CONSIG 
 D:'($D(ATCO1)) INIT^TORQY51
 N VATT3,LG
 S VATT=^[QUI]CONS(NUFA,TWREF,OP)
 S LG=$L(VATT,"|")
 F I=1:1:LG S VATT3=$P(VATT,"|",I) Q:VATT3=""  S:'($D(OPE)) OPE=%CUK_","_OP D:OCO1 PA^%QSGESTI(BASFI,OPE,ATCO1,VATT3,NCOM) S COMMENT="consignes : "_VATT3 D:OCO2 PA^%QSGESTI(BASFI,OPE,ATCO2,COMMENT,NCOM) S NCOM=NCOM+1
 Q
PAR N PAR,I
 S PAR=$O(^[QUI]TVPAR(NUFA,TWREF,"@"))
 F I=0:0 Q:PAR=""  D PAR1 S PAR=$O(^[QUI]TVPAR(NUFA,TWREF,PAR))
 Q
PAR1 Q:$D(LSTLIEN(PAR))
 D:$$EXISTE(PAR,.LISTE) PA^%QSGESTI(BASI,%CUK,PAR,^[QUI]TVPAR(NUFA,TWREF,PAR),1)
 Q
EXISTE(PAR,LISTE) 
 Q:PAR="" 0 Q:$$^%QCAZG("LISTE")="*" 1
 Q $D(LISTE(PAR))>0
FIN D END^%QUCHOIP Q
 
REPFIL(BASI) N LIENS,LIEN,I,J,PR,DX,REP
 D LIEN^%QSGEST9(BASI,"LIENS")
 Q:LIENS=0 ""
 
 S REP="" F I=1:1 S REP=$O(LIENS(REP)) Q:REP=""  K:LIENS(REP)'=2 LIENS(REP)
 Q:$O(LIENS(""))="" ""
 S PR=$O(LIENS("")),DX=$O(LIENS(PR)) Q:DX="" PR
 S LIEN=$$SEL^%QSGEST6("LIENS",$E("QUEL REPERTOIRE LIE A "_$$NOMLOG^%QSF(BASI)_" ?",5,40))
 Q LIEN
SUPFILS 
 N LIEN
 D LIENS^%QSGEST9(BASI,%CUK,"GLO")
 S LIEN="" F L=1:1 S LIEN=$O(GLO(LIEN)) Q:LIEN=""  D:GLO(LIEN)=2 FILS
 Q
FILS 
 S FILS="" F F=1:1 S FILS=$O(GLO(LIEN,FILS)) Q:FILS=""  D SUPF
 Q
SUPF 
 S NOMF=$$NOMFILS^%QSGES10(BASI,%CUK,BASFI,GLO(LIEN,FILS))
 D SX^%QSGESTI(BASFI,NOMF)
 Q
TEST S NUFA="TOT88110009",TWREF="0",LISTE="*",BASI="MOZ",%CUK="1GA0004J.99901",GAM=1,FILS="MOZOP"
 D ^TORQY5(NUFA,TWREF,LISTE,BASI,%CUK,GAM,FILS,0,"")
 Q

