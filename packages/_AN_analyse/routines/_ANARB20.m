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

;%ANARB20^INT^1^59547,73866^0
%ANARB20 ;
 
 
 
 
JALON 
 K @(TEMPO)
 S @TEMPO@(1)="ETU",@TEMPO@(2)="ETU1",@TEMPO@(3)="DATE",@TEMPO@(4)="CAPLIM",@TEMPO@(5)="NL",@TEMPO@(6)="SENS",@TEMPO@(7)="CAPA"
 S @TEMPO@(8)="MSG",@TEMPO@(9)="LAN",@TEMPO@(10)="SA",@TEMPO@(11)="MODE",@TEMPO@(12)="TYPE",@TEMPO@(13)="REP",@TEMPO@(14)="IND"
 S @TEMPO@(15)="DEC",@TEMPO@(16)="TYPDEC",@TEMPO@(17)="COCONT",@TEMPO@(18)="MAXITER",@TEMPO@(19)="LOUI",@TEMPO@(20)="LNON"
 D EMPV^%ANGEPIL(TEMPO)
 S LOUI=$$^%QZCHW("OUI"),LNON=$$^%QZCHW("NON")
 
 S REP=$$REP^%DLETUDE
 
 S MODE=$S(MODEX=1:"SIMULATION",1:"REEL")
 
 S SA=A,VAL=""
 S A=$$RED(SA,1),ETU1=$$RED(A,"TEXTE")
 D EMPIL^%ANGEPIL("JAL1^%ANARB20") G INT^%ANARBR2
JAL1 
 I VAL="" S ETU=$$POP^%DLETUDE,TYPE="CREATION",POS=1 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),ETU1,ETU,1)
 I VAL'="" S ETU=VAL,VAL="",TYPE="ACTIVATION"
 S A=$$RED(SA,2)
 D EMPIL^%ANGEPIL("JAL2^%ANARB20") G INT^%ANARBR2
JAL2 
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer nom lancement") G ERR
 S LAN=VAL,VAL=""
 I TYPE="ACTIVATION",LAN="" S LAN=$$^%QSCALVA(REP,ETU,"LANCEMENT")
 I LAN'="",'($$IR^%QSGE5($$LAN^%DLCON2,LAN)) S MSG=$$^%QZCHW("Lancement inconnu") G ERR
 S A=$$RED(SA,3)
 D EMPIL^%ANGEPIL("JAL3^%ANARB20") G INT^%ANARBR2
JAL3 
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer nom liste") G ERR
 S NL=VAL,VAL=""
 I TYPE="ACTIVATION",NL="" S NL=$$^%QSCALVA(REP,ETU,"LISTE.LANCEMENTS")
 S A=$$RED(SA,4)
 D EMPIL^%ANGEPIL("JAL4^%ANARB20") G INT^%ANARBR2
JAL4 
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer sens jalonnement") G ERR
 S SENS=VAL,VAL=""
 I TYPE="ACTIVATION",SENS="" S SENS=$$^%QSCALVA(REP,ETU,"SENS.JALONNEMENT")
 I (SENS'="AVAL")&(SENS'="AMONT") S MSG=$$^%QZCHW("Sens jalonnement : AVAL ou AMONT uniquement") G ERR
 S A=$$RED(SA,5)
 D EMPIL^%ANGEPIL("JAL5^%ANARB20") G INT^%ANARBR2
JAL5 
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer respect capacites") G ERR
 S CAPLIM=VAL,VAL=""
 I TYPE="ACTIVATION",CAPLIM="" S CAPLIM=$$^%QSCALVA(REP,ETU,"RESPECT.CAPACITES.MACHINES")
 I (CAPLIM'=LOUI)&(CAPLIM'=LNON) S MSG=$$^%QZCHW("Respect capacites")_" : "_LOUI_" "_$$^%QZCHW("ou")_" "_LNON G ERR
 S A=$$RED(SA,6)
 D EMPIL^%ANGEPIL("JAL6^%ANARB20") G INT^%ANARBR2
JAL6 
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer la date") G ERR
 S DATE=VAL,VAL=""
 I DATE'="" G JL6
 
 I A'=0 S DATE=$$DATE^%QMDATE G JL6
 S DATE=$$^%QSCALVA(REP,ETU,"DATE.LIMITE.DEBUT")
 G JAL7
JL6 I '($$FINT^%QMDAUC(REP,"DATE.LIMITE.DEBUT",.DATE)) S MSG=$$^%QZCHW("Date limite : forme incorrecte") G ERR
 
JAL7 
 S (TYPDEC,COCONT,MAXITER)=""
 S A=$$RED(SA,7)
 D EMPIL^%ANGEPIL("JAL8^%ANARB20") G INT^%ANARBR2
JAL8 
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer decalage") G ERR
 S DEC=VAL,VAL=""
 I TYPE="ACTIVATION",DEC="" S DEC=$$^%QSCALVA(REP,ETU,"DECALAGE")
 I (DEC'=LOUI)&(DEC'=LNON) S MSG=$$^%QZCHW("Decalage")_" : "_LOUI_" "_$$^%QZCHW("ou")_" "_LNON G ERR
 G:DEC=LNON JF
 S A=$$RED(SA,8)
 D EMPIL^%ANGEPIL("JAL9^%ANARB20") G INT^%ANARBR2
JAL9 
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer type decalage") G ERR
 S TYPDEC=VAL,VAL=""
 I TYPE="ACTIVATION",TYPDEC="" S TYPDEC=$$^%QSCALVA(REP,ETU,"TYPE.DECALAGE")
 I ((TYPDEC'="C")&(TYPDEC'="R"))&(TYPDEC'="CR") S MSG=$$^%QZCHW("Type decalage = C, R ou CR") G ERR
 G:TYPDEC="R" JAL11
 S A=$$RED(SA,9)
 D EMPIL^%ANGEPIL("JAL10^%ANARB20") G INT^%ANARBR2
JAL10 
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer coeff. contraction") G ERR
 S COCONT=VAL,VAL=""
 I TYPE="ACTIVATION",COCONT="" S COCONT=$$^%QSCALVA(REP,ETU,"CONTRACTION")
 G:TYPDEC="C" JF
JAL11 S A=$$RED(SA,10)
 D EMPIL^%ANGEPIL("JAL12^%ANARB20") G INT^%ANARBR2
JAL12 
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer nbre iterations") G ERR
 S MAXITER=VAL,VAL=""
 I TYPE="ACTIVATION",MAXITER="" S MAXITER=$$^%QSCALVA(REP,ETU,"NOMBRE.ITERATIONS")
 
JF S CAPA=$S(CAPLIM=LNON:0,1:1)
 I TYPE="CREATION" G VER
 
 I '($$IR^%QSGEST5(REP,ETU)) S MSG=ETU_" "_$$^%QZCHW("est une etude inconnue") G ERR
 
VER D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("verification des parametres de l'etude")_" "_ETU)
 S MSG=$$VERIF^%DLETUD3(ETU,.LAN,.NL,MODE,SENS,.DATE,CAPLIM,1,.DEC,.TYPDEC,.COCONT,.MAXITER)
 I MSG'="" G ERR
 
 I TYPE="ACTIVATION" G JALEX
 
 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("creation de l'etude")_" "_ETU)
 D CREER2^%DLETUD2(ETU,$$^%QZCHW("jalonnement automatique par traitement"),LAN,NL,MODE,SENS,DATE,CAPLIM,"","",DEC,TYPDEC,COCONT,MAXITER,MODEX,MODAF)
 D:MODEX=2 STIND^%TLBAATT(REP,ETU,"",ETU1,"AJOUT")
 
JALEX 
 S RES=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"RES")
 K @(RES)
 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("evaluation des delais"))
 S DATE=$P(DATE,",")
 D EXT^%DLANCEX(0,ETU,NL,SENS,CAPA,DATE,MODEX,MODAF'=0,$S(TYPDEC="":0,TYPDEC="C":1,TYPDEC="R":3,1:2),COCONT,MAXITER,RES,.ERR)
 G:MODAF=0 FINJAL
 D POCLEPA^%VVIDEO
 
 F I=1:1 Q:'($D(@RES@(I)))  D ADD^%TLIFEN("LOG","  "_@RES@(I))
 
FINJAL K @(RES)
 S POS=1,VAL=ERR=0
 G DEPIL^%ANGEPIL
 
ERR S ECHEC=1,POS=0,VAL=""
 I MODAF'=0 D:MSG'=" " ADD^%TLIFEN("LOG","  "_MSG)
 G DEPIL^%ANGEPIL
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

