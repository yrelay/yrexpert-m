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

;%ANARB19^INT^1^59547,73866^0
%ANARB19 ;
 
 
 
 
FOEQU 
 K @(TEMPO)
 S @TEMPO@(3)="GAMME",@TEMPO@(4)="ENTREE",@TEMPO@(5)="ATTCAP",@TEMPO@(6)="CYCLE",@TEMPO@(7)="TAL",@TEMPO@(8)="TAG",@TEMPO@(9)="INSEP"
 S @TEMPO@(10)="INCOMP",@TEMPO@(11)="NMULT",@TEMPO@(12)="LENT",@TEMPO@(13)="VATTCAP",@TEMPO@(14)="VCYCLE",@TEMPO@(15)="SA",@TEMPO@(16)="LGAMME"
 S @TEMPO@(17)="ETU",@TEMPO@(18)="ETU1",@TEMPO@(19)="REPETU",@TEMPO@(20)="REPG",@TEMPO@(21)="NREP",@TEMPO@(22)="ERR"
 D EMPV^%ANGEPIL(TEMPO)
 S ERR="%ERREUR.EQUILIBRAGE"
 S SA=A,VAL=""
 S A=$$RED(SA,1),ETU1=$$RED(A,"TEXTE")
 D EMPIL^%ANGEPIL("EQU1^%ANARB19") G INT^%ANARBR2
EQU1 
 I VAL="" S ETU=$$POP^%QNEQETU,MODE="CREATION",POS=1 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),ETU1,ETU,1)
 I VAL'="" S ETU=VAL,VAL="",MODE="ACTIVATION"
 S A=$$RED(SA,2)
 D EMPIL^%ANGEPIL("EQU2^%ANARB19") G INT^%ANARBR2
EQU2 
 I POS=0 G DEPIL^%ANGEPIL
 S NREP=VAL,VAL=""
 S A=$$RED(SA,3)
 D EMPIL^%ANGEPIL("EQU3^%ANARB19") G INT^%ANARBR2
EQU3 
 I POS=0 G DEPIL^%ANGEPIL
 S GAMME=VAL,VAL=""
 S A=$$RED(SA,4)
 D EMPIL^%ANGEPIL("EQU4^%ANARB19") G INT^%ANARBR2
EQU4 
 I POS=0 G DEPIL^%ANGEPIL
 S ENTREE=VAL,VAL=""
 S A=$$RED(SA,5)
 D EMPIL^%ANGEPIL("EQU5^%ANARB19") G INT^%ANARBR2
EQU5 
 I POS=0 G DEPIL^%ANGEPIL
 S ATTCAP=VAL,VAL=""
 S A=$$RED(SA,6)
 D EMPIL^%ANGEPIL("EQU6^%ANARB19") G INT^%ANARBR2
EQU6 
 I POS=0 G DEPIL^%ANGEPIL
 S CYCLE=VAL,VAL=""
 S A=$$RED(SA,7)
 D EMPIL^%ANGEPIL("EQU7^%ANARB19") G INT^%ANARBR2
EQU7 
 I POS=0 S VAL=""
 S TAL=VAL,VAL=""
 S A=$$RED(SA,8)
 D EMPIL^%ANGEPIL("EQU8^%ANARB19") G INT^%ANARBR2
EQU8 
 I POS=0 S VAL=""
 S TAG=VAL,VAL=""
 S A=$$RED(SA,9)
 D EMPIL^%ANGEPIL("EQU9^%ANARB19") G INT^%ANARBR2
EQU9 
 I POS=0 S VAL=""
 S INSEP=VAL,VAL=""
 S A=$$RED(SA,10)
 D EMPIL^%ANGEPIL("EQU10^%ANARB19") G INT^%ANARBR2
EQU10 
 I POS=0 S VAL=""
 S INCOMP=VAL,VAL=""
 S A=$$RED(SA,11)
 D EMPIL^%ANGEPIL("EQU11^%ANARB19") G INT^%ANARBR2
EQU11 
 I POS=0 G DEPIL^%ANGEPIL
 S MULT=VAL,VAL=""
 S REPETU=$$REP^%QNEQETU
 I MODE="CREATION" G CREQUI
 
 D:MODAF M($$^%QZCHW("mise a jour de l'etude")_" "_ETU)
 I '($$IR^%QSGEST5(REPETU,ETU)) S POS=0,VERR=ETU_" "_$$^%QZCHW("est une etude inconnue") D:MODAF M(VERR) D:MODEX'=1 PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),ERR,VERR,1) G DEPIL^%ANGEPIL
 S REPG=$$^%QSCALVA(REPETU,ETU,"REPERTOIRE.GAMME")
 I NREP="" S NREP=REPG G EQUMG
 I REPG'=NREP D:MODEX'=1 PA^%QSGESTI(REPETU,ETU,"REPERTOIRE.GAMME",NREP,1)
EQUMG S LGAMME=$$^%QSCALVA(REPETU,ETU,"NOM.GAMME")
 I GAMME="" S GAMME=LGAMME G EQUML
 I GAMME'=LGAMME D:MODEX'=1 PA^%QSGESTI(REPETU,ETU,"NOM.GAMME",GAMME,1)
EQUML S LENT=$$^%QSCALVA(REPETU,ETU,"LISTE.OPERATIONS.GAMME")
 I ENTREE="" S ENTREE=LENT G EQUM1
 I ENTREE'=LENT D:MODEX'=1 PA^%QSGESTI(REPETU,ETU,"LISTE.OPERATIONS.GAMME",ENTREE,1)
EQUM1 S VATTCAP=$$^%QSCALVA(REPETU,ETU,"ATTRIBUT.CAPACITE")
 I ATTCAP="" S ATTCAP=VATTCAP G EQUM2
 I ATTCAP'=VATTCAP D:MODEX'=1 PA^%QSGESTI(REPETU,ETU,"ATTRIBUT.CAPACITE",ATTCAP,1)
EQUM2 S VCYCLE=$$^%QSCALVA(REPETU,ETU,"CYCLE")
 I CYCLE="" S CYCLE=VCYCLE G EQUM3
 I CYCLE'=VCYCLE D:MODEX'=1 PA^%QSGESTI(REPETU,ETU,"CYCLE",CYCLE,1)
 D:MODAF M($$^%QZCHW("verification des parametres de l'etude")_" "_ETU)
EQUM3 S VERR=$$VERIF^%QNEQETU(ETU,.NREP,.ENTREE,.GAMME,ATTCAP,CYCLE,TAL,TAG,INSEP,INCOMP)
 G:VERR'="" EQUERR
 I TAL'="",TAL'=$$^%QSCALVA(REPETU,ETU,"TRAITEMENT.ACCEPTATION.LOCAL") D:MODEX'=1 PA^%QSGESTI(REPETU,ETU,"TRAITEMENT.ACCEPTATION.LOCAL",TAL,1)
 I TAG'="",TAG'=$$^%QSCALVA(REPETU,ETU,"TRAITEMENT.ACCEPTATION.GLOBAL") D:MODEX'=1 PA^%QSGESTI(REPETU,ETU,"TRAITEMENT.ACCEPTATION.GLOBAL",TAG,1)
 I INSEP'="",INSEP'=$$^%QSCALVA(REPETU,ETU,"LISTE.GROUPES.INSEPARABLES") D:MODEX'=1 PA^%QSGESTI(REPETU,ETU,"LISTE.GROUPES.INSEPARABLES",INSEP,1)
 I INCOMP'="",INCOMP'=$$^%QSCALVA(REPETU,ETU,"LISTE.GROUPES.INCOMPATIBLES") D:MODEX'=1 PA^%QSGESTI(REPETU,ETU,"LISTE.GROUPES.INCOMPATIBLES",INCOMP,1)
 I MULT'="",MULT'=$$^%QSCALVA(REPETU,ETU,"EFFECTIF.MAX.PAR.POSTE") D:MODEX'=1 PA^%QSGESTI(REPETU,ETU,"EFFECTIF.MAX.PAR.POSTE",MULT,1)
ACTIEQ 
 D:MODAF M($$^%QZCHW("activation de l'etude")_" "_ETU)
 S VERR=$$ACT^%QNEQUI2(ETU,MODAF,"AUT",$S(MODEX'=2:1,1:2),.ABANDON)
 D:MODAF REAFF^%TLUTIL
 G:VERR'="" EQUERR
 S VAL=1 G DEPIL^%ANGEPIL
 
CREQUI 
 D:MODAF M($$^%QZCHW("creation de l'etude")_" "_ETU)
 S VERR=$$VERIF^%QNEQETU(ETU,.NREP,.ENTREE,.GAMME,ATTCAP,CYCLE,TAL,TAG,INSEP,INCOMP)
 G:VERR'="" EQUERR
 D CREER^%QNEQET2(ETU,"Equilibrage automatique par traitement",NREP,GAMME,ENTREE,CYCLE,MULT,ATTCAP,INSEP,INCOMP,TAL,TAG,"","")
 G ACTIEQ
 
EQUERR S POS=1
 D:MODAF M(VERR)
 D:MODEX'=1 PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),ERR,VERR,1)
 S VAL=0
 G DEPIL^%ANGEPIL
 
M(MES) D ADD^%TLIFEN("LOG","  "_MES)
 Q
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)
 ;

