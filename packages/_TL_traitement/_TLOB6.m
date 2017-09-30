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

;%TLOB6^INT^1^59547,74030^0
%TLOB6 ;;09:22 AM  27 Mar 1992;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
COMPARER(IDEB,NBREG) 
 N ETU,ETU1,ARPREM,ACCOR,LCIB,DOM,TMPX,MSG,REF,SA,MODE,TYPE,REP,IND
 N SCX,NOML,LISDOM,LISRSOU,LISRCIB,LISICIB,VAL
 
 S REP=$$REP^%SCOETUD,MODE="REEL"
 S ETU1=V(IDEB)
 S ETU=V(IDEB+4)
 I ETU'=$C(0),$$IR^%QSGEST5(REP,ETU) S TYPE="ACTIVATION" G COMP11
 S ETU=$$POP^%SCOETUD,TYPE="CREATION"
 I V(IDEB)'=$C(0) S RESUL=$$AFF^%TLOPT(V(IDEB+2),V(IDEB+3),V(IDEB),V(IDEB+1),ETU)
COMP11 S REPS=V(IDEB+5),OBJS=V(IDEB+6)
 G:V(IDEB+7)'=$C(0) CREMOD
 
RECUP 
 S REPC=$$^%QSCALVA($$REP^%SCOETUD,ETU,"REPERTOIRE.CIBLE")
 S LIBC=$$^%QSCALVA($$REP^%SCOETUD,ETU,"LISTE.CIBLES")
 S DOM=$$^%QSCALVA($$REP^%SCOETUD,ETU,"DOMAINE")
 S ACCOR=$$^%QSCALVA($$REP^%SCOETUD,ETU,"TAUX.ACCORD")
 S ARPREM=$$^%QSCALVA($$REP^%SCOETUD,ETU,"ARRET.APRES.PREMIER.INDIVIDU")
 G ACTIV
 
CREMOD S LCIB=V(IDEB+7)
 S REPC=$$NOMLOG^%QSF($$^%QSCALVA("L0",LCIB,"BASE"))
 S DOM=V(IDEB+8)
 S ACCOR=V(IDEB+9)
 S ARPREM=V(IDEB+10)
 D CREER^%SCOETU2(ETU,$$^%QZCHW("comparaison automatique par traitement"),REPS,OBJS,REPC,LCIB,DOM,ACCOR,ARPREM),POCLEPA^%VVIDEO
 
ACTIV 
 S TMPX=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TMPX)
 S LISDOM=$$CONCAS^%QZCHAD(TMPX,"DOMAINE")
 S LISRSOU=$$CONCAS^%QZCHAD(TMPX,"REP.SOURCE")
 S LISRCIB=$$CONCAS^%QZCHAD(TMPX,"REP.CIBLE")
 S LISICIB=$$CONCAS^%QZCHAD(TMPX,"IND.CIBLES")
 S LISCIBLE=$$CONCAS^%QZCHAD(TMPX,"LISTE")
 S @LISDOM@(DOM)=""
 S @LISCIBLE@(1)=LCIB_"^"_"LISTE"
 
 S MSG=$$CONTPAR^%SCOACTR(REPS,OBJS,ACCOR,ARPREM,0)
 
 S MSG=$$CONTDOM^%SCOACTR(LISDOM,LISRSOU,LISRCIB,0)
 
 S MSG=$$CONTCIB^%SCOACTR(LISCIBLE,LISICIB,0)
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
 D ^%SCOA1(SCX,.NOML)
 D PA^%QSGESTI($$REP^%SCOETUD,ETU,"LISTE.COMPARABLES",NOML,1)
 
FIN K @(TMPX)
 Q NOML
 ;

