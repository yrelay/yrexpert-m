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

;%ANARB21^INT^1^59547,73866^0
%ANARB21 ;
 
 
 
 
 
COMPAR 
 K @(TEMPO)
 S @TEMPO@(1)="ETU",@TEMPO@(2)="ETU1",@TEMPO@(3)="ARPREM",@TEMPO@(4)="ACCOR",@TEMPO@(5)="LCIB",@TEMPO@(6)="DOM",@TEMPO@(7)="TMPX"
 S @TEMPO@(8)="MSG",@TEMPO@(9)="REF",@TEMPO@(10)="SA",@TEMPO@(11)="MODE",@TEMPO@(12)="TYPE",@TEMPO@(13)="REP",@TEMPO@(14)="IND",@TEMPO@(15)="SCX",@TEMPO@(16)="NOML"
 S @TEMPO@(17)="LISDOM",@TEMPO@(18)="LISRSOU",@TEMPO@(19)="LISRCIB",@TEMPO@(20)="LISICIB"
 D EMPV^%ANGEPIL(TEMPO)
 
 S REP=$$REP^%SCOETUD
 
 S MODE=$S(MODEX=1:"SIMULATION",1:"REEL")
 
 S SA=A,VAL=""
 S A=$$RED(SA,1),ETU1=$$RED(A,"TEXTE")
 D EMPIL^%ANGEPIL("COMP1^%ANARB21") G INT^%ANARBR2
COMP1 
 I '($$IR^%QSGEST5(REP,VAL)) S ETU=$$POP^%SCOETUD,TYPE="CREATION",POS=1 D:$E(ETU1)="%" PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),ETU1,ETU,1) G COMP11
 S ETU=VAL,VAL="",TYPE="ACTIVATION"
 
 
COMP11 S A=$$RED(SA,2)
 D EMPIL^%ANGEPIL("COMP2^%ANARB21") G INT^%ANARBR2
COMP2 
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer individu reference") G ERR
 S REF=VAL,VAL=""
 I REF="" S OBJS=CXT("@","OBJET"),REPS=CXT("@","BASE") G COMP21
 I '($D(CXT(REF))) S MSG=$$^%QZCHW("Imposs. evaluer individu reference") G ERR
 S OBJS=CXT(REF,"OBJET"),REPS=CXT(REF,"BASE")
COMP21 S A=$$RED(SA,3)
 I A=0 G RECUP
 D EMPIL^%ANGEPIL("COMP3^%ANARB21") G INT^%ANARBR2
COMP3 
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer liste cibles") G ERR
 S LCIB=VAL,VAL=""
 I '($$IR^%QSGEST5("L0",LCIB)) S MSG=$$^%QZCHW("liste cibles inconnue") G ERR
 S REPC=$$NOMLOG^%QSF($$^%QSCALVA("L0",LCIB,"BASE"))
 I REPC="" S MSG=$$^%QZCHW("repertoire cible inconnu") G ERR
 S A=$$RED(SA,4)
 D EMPIL^%ANGEPIL("COMP4^%ANARB21") G INT^%ANARBR2
COMP4 
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer domaine comparaison") G ERR
 S DOM=VAL,VAL=""
 I '($$EXIST^%SCODDOM(DOM)) S MSG=$$^%QZCHW("Imposs. evaluer domaine comparaison") G ERR
 S A=$$RED(SA,5)
 D EMPIL^%ANGEPIL("COMP5^%ANARB21") G INT^%ANARBR2
COMP5 
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer taux accord") G ERR
 S ACCOR=VAL,VAL=""
 I ACCOR=0 G COMP51
 I (ACCOR<0)!(ACCOR>1) S MSG=$$^%QZCHW("taux accord incompatible") G ERR
COMP51 S A=$$RED(SA,6)
 D EMPIL^%ANGEPIL("COMP6^%ANARB21") G INT^%ANARBR2
COMP6 
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer parametre d'arret") G ERR
 S ARPREM=VAL,VAL=""
 I (ARPREM'="OUI")&(ARPREM'="NON") S MSG=$$^%QZCHW("parametre d'arret incorrect") G ERR
 I TYPE="CREATION" G VER
 
 I '($$IR^%QSGEST5(REP,ETU)) S MSG=ETU_" "_$$^%QZCHW("etude inconnue") G ERR
 
VER D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("verification des parametres de l'etude")_" "_ETU)
 S MSG=$$VERIF^%SCOETUD(REPS,OBJS,REPC,LCIB,DOM,ACCOR,ARPREM)
 I MSG'="" G ERR
 
 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("creation de l'etude")_" "_ETU)
 D CREER^%SCOETU2(ETU,$$^%QZCHW("comparaison automatique par traitement"),REPS,OBJS,REPC,LCIB,DOM,ACCOR,ARPREM),POCLEPA^%VVIDEO
 D:MODEX=2 STIND^%TLBAATT(REP,ETU,"",ETU1,"AJOUT")
 
ACTIV 
 S TMPX=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TMPX)
 S LISDOM=$$CONCAS^%QZCHAD(TMPX,"DOMAINE")
 S LISRSOU=$$CONCAS^%QZCHAD(TMPX,"REP.SOURCE")
 S LISRCIB=$$CONCAS^%QZCHAD(TMPX,"REP.CIBLE")
 S LISICIB=$$CONCAS^%QZCHAD(TMPX,"IND.CIBLES")
 S LISCIBLE=$$CONCAS^%QZCHAD(TMPX,"LISTE")
 S @LISDOM@(DOM)=""
 S @LISCIBLE@(1)=LCIB_"^"_"LISTE"
 
 S MSG=""
 S MSG=$$CONTPAR^%SCOACTR(REPS,OBJS,ACCOR,ARPREM,0)
 I MSG'="" G ERR
 
 S MSG=$$CONTDOM^%SCOACTR(LISDOM,LISRSOU,LISRCIB,0)
 I MSG'="" G ERR
 I '($D(@LISRSOU@(REPS))) S MSG=$$^%QZCHW("repertoire reference incompatible") G ERR
 
 S MSG=$$CONTCIB^%SCOACTR(LISCIBLE,LISICIB,0)
 I MSG'="" G ERR
 I TYPE="ACTIVATION" S NOML=$$^%QSCALVA($$REP^%SCOETUD,ETU,"LISTE.COMPARABLES") D DEL^%QSGES11($$^%QSCALVA($$REP^%SCOETUD,ETU,"LISTE.COMPARABLES")) K ^[QUI]RQSGLO("SCX",ETU)
 S NOML=""
 S SCX=$$CONCAS^%QZCHAD(TMPX,"PARAMETRES")
 S @SCX@("BASE.REFERENCE")=REPS
 S @SCX@("OBJET.REFERENCE")=OBJS
 S @SCX@("REPERTOIRE.REFERENCE")=LISRSOU
 S @SCX@("REPERTOIRE.CIBLE")=LISRCIB
 S @SCX@("OBJET.CIBLE")=LISICIB
 S @SCX@("DOMAINE")=LISDOM
 S @SCX@("TAUX.ACCORD")=ACCOR
 S @SCX@("ARRET/PREMIER")=ARPREM
 S @SCX@("VISU")=0
 S @SCX@("ROUTINE.EVALUATION")=""
 S @SCX@("ETUDE")=ETU
 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("activation de l'etude")_" "_ETU)
 D ^%SCOA1(SCX,.NOML)
 D PA^%QSGESTI($$REP^%SCOETUD,ETU,"LISTE.COMPARABLES",NOML,1)
 
FIN K @(TMPX)
 S VAL=NOML
 G DEPIL^%ANGEPIL
 
ERR S ECHEC=1,POS=0,VAL=""
 I MODAF'=0 D:MSG'=" " ADD^%TLIFEN("LOG","  "_MSG)
 G DEPIL^%ANGEPIL
 
RECUP 
 I '($$IR^%QSGEST5(REP,ETU)) S MSG=ETU_" "_$$^%QZCHW("etude inconnue") G ERR
 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("recuperation des parametres de l'etude")_" "_ETU)
 S REPC=$$^%QSCALVA($$REP^%SCOETUD,ETU,"REPERTOIRE.CIBLE")
 S LIBC=$$^%QSCALVA($$REP^%SCOETUD,ETU,"LISTE.CIBLES")
 S DOM=$$^%QSCALVA($$REP^%SCOETUD,ETU,"DOMAINE")
 S ACCOR=$$^%QSCALVA($$REP^%SCOETUD,ETU,"TAUX.ACCORD")
 S ARPREM=$$^%QSCALVA($$REP^%SCOETUD,ETU,"ARRET.APRES.PREMIER.INDIVIDU")
 G ACTIV
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

