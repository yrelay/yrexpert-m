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

;%ANARB22^INT^1^59547,73866^0
%ANARB22 ;
 
 
 
 
 
AJDEL 
 K @(TEMPO)
 S @TEMPO@(1)="NBJ",@TEMPO@(2)="DAT",@TEMPO@(3)="SA",@TEMPO@(4)="REG"
 S @TEMPO@(5)="ADRDEL",@TEMPO@(6)="MSG",@TEMPO@(7)="ERR"
 S @TEMPO@(8)="ATTRI",@TEMPO@(9)="IN",@TEMPO@(10)="VAR",@TEMPO@(11)="REP2"
 D EMPV^%ANGEPIL(TEMPO)
 S SA=A,ERR=0
 S ADRDEL="AJDELR"
 G PARDEL
 
AJDELR S VAL=$$ADDJOUR^%QMDRUTI(DAT,NBJ,.REG,.ERR)
 I ERR'=0 S MSG=$S(ERR=1:$$^%QZCHW("Regime")_" "_REG_" "_$$^%QZCHW("indefini"),1:$$^%QZCHW("Regime")_" "_REG_" "_$$^%QZCHW("incomplet")) G ERRDEL
 S VAL=$$AFFI^%QMDAUC(REP2,ATTRI,VAL)
 G DEPIL^%ANGEPIL
 
 
RETDEL 
 K @(TEMPO)
 S @TEMPO@(1)="NBJ",@TEMPO@(2)="DAT",@TEMPO@(3)="SA",@TEMPO@(4)="REG"
 S @TEMPO@(5)="ADRDEL",@TEMPO@(6)="MSG",@TEMPO@(7)="ERR"
 S @TEMPO@(8)="ATTRI",@TEMPO@(9)="IN",@TEMPO@(10)="VAR",@TEMPO@(11)="REP2"
 D EMPV^%ANGEPIL(TEMPO)
 S SA=A,ERR=0
 S ADRDEL="REDELR"
 G PARDEL
 
REDELR S VAL=$$RETJOUR^%QMDRUTI(DAT,NBJ,.REG,.ERR)
 I ERR'=0 S MSG=$S(ERR=1:$$^%QZCHW("Regime")_" "_REG_" "_$$^%QZCHW("indefini"),1:$$^%QZCHW("Regime")_" "_REG_" "_$$^%QZCHW("incomplet")) G ERRDEL
 S VAL=$$AFFI^%QMDAUC(REP2,ATTRI,VAL)
 G DEPIL^%ANGEPIL
 
 
PARDEL 
 S A=$$RED(SA,1)
 I '($$ATTR^%TLIACT4(A,.ATTRI,.IN,.VAR,.REP2)) S MSG=$$^%QZCHW("Imposs. reconnaitre attribut") G ERRDEL
 I $$TYPE^%QSGESPE(ATTRI_"/"_$$NOMLOG^%QSF(REP2))'="DATE" S MSG=$$^%QZCHW("Attribut n'est pas de type date") G ERRDEL
 D EMPIL^%ANGEPIL("PDEL1^%ANARB22") G INT^%ANARBR2
PDEL1 
 I '(POS) S MSG=$$^%QZCHW("Imposs. evaluer date") G ERRDEL
 I VAL="" S MSG=$$^%QZCHW("Date = chaine vide") G ERRDEL
 S DAT=VAL
 I '($$FINT^%QMDAUC(REP2,ATTRI,.DAT)) S MSG=$$^%QZCHW("Valeur attr. ne correspond pas au format") G ERRDEL
 S DAT=$P(DAT,"/")
 S A=$$RED(SA,2)
 D EMPIL^%ANGEPIL("PDEL2^%ANARB22") G INT^%ANARBR2
PDEL2 
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer nbre de jours") G ERRDEL
 I VAL="" S MSG=$$^%QZCHW("Nbre de jours = chaine vide") G ERRDEL
 I '($$ADR^%QZNBN1(VAL)) S MSG=$$^%QZCHW("Nbre jours non numerique") G ERRDEL
 S NBJ=VAL
 S A=$$RED(SA,3)
 I A=0 S REG="" G @ADRDEL
 D EMPIL^%ANGEPIL("PDEL3^%ANARB22") G INT^%ANARBR2
PDEL3 
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer regime") G ERRDEL
 S REG=VAL
 G @ADRDEL
 
 
ERRDEL S ECHEC=1,POS=0,VAL=""
 I MODAF'=0 D:MSG'=" " ADD^%TLIFEN("LOG","  "_MSG)
 G DEPIL^%ANGEPIL
 
 
POPER 
 K @(TEMPO)
 S @TEMPO@(1)="TYPE",@TEMPO@(2)="RACINE",@TEMPO@(3)="SA",@TEMPO@(4)="MSG"
 D EMPV^%ANGEPIL(TEMPO)
 S SA=A,ERR=0,RACINE=""
 S A=$$RED(SA,1)
 D EMPIL^%ANGEPIL("POP1^%ANARB22") G INT^%ANARBR2
POP1 
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer type") G ERRPOP
 S TYPE=VAL
 I ((TYPE'=1)&(TYPE'=2))&(TYPE'=3) S MSG=$$^%QZCHW("Type : 1, 2  ou 3 uniquement") G ERRPOP
 S A=$$RED(SA,2)
 G:A=0 POPAC
 D EMPIL^%ANGEPIL("POP2^%ANARB22") G INT^%ANARBR2
POP2 
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer racine") G ERRPOP
 S RACINE=VAL
 I $L(RACINE)>3 S MSG=$$^%QZCHW("Longueur racine < 3") G ERRPOP
POPAC I TYPE=1 S VAL=$$GEN^%QCAPOP(RACINE) G POPF
 I TYPE=3 S VAL=$$12NC^%QCAPOP(RACINE) G POPF
 I RACINE="" S VAL=$$GLOB^%QCAPOP("^[QUI]CPTEUR(""POP"")") G POPF
 S VAL=RACINE_$$GLOB^%QCAPOP("^[QUI]CPTEUR("""_RACINE_""")")
 
POPF G DEPIL^%ANGEPIL
 
ERRPOP S ECHEC=1,POS=0,VAL=""
 I MODAF'=0 D:MSG'=" " ADD^%TLIFEN("LOG","  "_MSG)
 G DEPIL^%ANGEPIL
 
 
DATE 
 K @(TEMPO)
 S @TEMPO@(1)="FORM",@TEMPO@(2)="DAT",@TEMPO@(3)="SA",@TEMPO@(4)="MSG",@TEMPO@(5)="FORD"
 D EMPV^%ANGEPIL(TEMPO)
 S SA=A,ERR=0,(FORM,FORD,DAT)=""
 S A=$$RED(SA,1)
 G:A=0 DATAC
 D EMPIL^%ANGEPIL("DAT1^%ANARB22") G INT^%ANARBR2
DAT1 
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer type format") G ERRDAT
 S FORM=VAL
 I '($$PARA^%QZNBN1(FORM)) S MSG=$$^%QZCHW("Format non numerique") G ERRDAT
 I '($D(^RQSGLU("QMDA","FORM",FORM))) S MSG=$$^%QZCHW("Format inexistant") G ERRDAT
 S A=$$RED(SA,2)
 G:A=0 DATAC
 D EMPIL^%ANGEPIL("DAT2^%ANARB22") G INT^%ANARBR2
DAT2 
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer date") G ERRDAT
 S DAT=VAL
 S A=$$RED(SA,3)
 G:A=0 DATAC
 D EMPIL^%ANGEPIL("DAT3^%ANARB22") G INT^%ANARBR2
DAT3 
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer format de la date") G ERRDAT
 S FORD=VAL
 I FORD'="",'($D(^RQSGLU("QMDA","FORM",FORD))) S MSG=$$^%QZCHW("Format de la date inexistant") G ERRDAT
DATAC S VAL=$$DATET^%QMDATE2(FORM,DAT,FORD)
 G DEPIL^%ANGEPIL
 
ERRDAT S ECHEC=1,POS=0,VAL=""
 I MODAF'=0 D:MSG'=" " ADD^%TLIFEN("LOG","  "_MSG)
 G DEPIL^%ANGEPIL
 
 
FOMAT K @(TEMPO)
 S @TEMPO@(1)="NB",@TEMPO@(2)="MSG",@TEMPO@(3)="SA",@TEMPO@(4)="PDECI"
 D EMPV^%ANGEPIL(TEMPO)
 S SA=A,PDECI=""
 S A=$$RED(SA,1)
 D EMPIL^%ANGEPIL("FOMAT1^%ANARB22") G INT^%ANARBR2
FOMAT1 
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer nombre") G ERRFOMAT
 S NB=VAL
 I '($$PARA^%QZNBN1(NB)) S MSG=$$^%QZCHW("Valeur non numerique") G ERRFOMAT
 S A=$$RED(SA,2)
 G:A=0 FOMATAC
 D EMPIL^%ANGEPIL("FOMAT2^%ANARB22") G INT^%ANARBR2
FOMAT2 
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer long. partie decimale") G ERRFOMAT
 I '($$PARA^%QZNBN1(VAL)) S MSG=$$^%QZCHW("Longueur part. dec. non numerique") G ERRFOMAT
 S PDECI=VAL
FOMATAC S VAL=$$NBCOMPT^%VFORMAT(NB,PDECI)
 G DEPIL^%ANGEPIL
 
ERRFOMAT S ECHEC=1,POS=0,VAL=""
 I MODAF'=0 D:MSG'=" " ADD^%TLIFEN("LOG","  "_MSG)
 G DEPIL^%ANGEPIL
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

