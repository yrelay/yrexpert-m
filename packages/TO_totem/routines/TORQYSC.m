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

;TORQYSC^INT^1^59547,74875^0
TORQYSC(REPS,OBJS,POCHE,INCOMP,PREDEFINI) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N ACCOR,ARPREM,AT,OR,V1,V2,DOM,ECHEC,LISTE,REPSI,NBREG,VISU,TEMPO,ETU,%ROUT99,TETE,REPONSE
 S PREDEFINI=0
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMPO)
 
 
 S ACCOR=1
 
 S VISU=0
 
 S ARPREM=1
 
 S ETU="TRANSFERT"
 
 N LISTDOM S LISTDOM=$$CONCAS^%QZCHAD(TEMPO,"DOMAINE"),@LISTDOM@(POCHE)=""
 
 N LISRSOU S LISRSOU=$$CONCAS^%QZCHAD(TEMPO,"REP.SOURCE"),@LISRSOU@(REPS)=""
 
 N LISRCIB S LISRCIB=$$CONCAS^%QZCHAD(TEMPO,"REP.CIBLE"),@LISRCIB@($$NOMINT^%QSF(REPS))=""
 
 N LISDOM S LISDOM=$$CONCAS^%QZCHAD(TEMPO,"DOMAINE"),@LISDOM@(POCHE)=""
 
 S %ROUT99="^TORQYEV"
 
 
 I $D(^[QUI]TORQYC(POCHE)) G QUICK
 
 
STAND N LISICIB S LISICIB=$$LISTIND^%QSGEST6($$NOMINT^%QSF(REPS))
ACT 
 
 
 
 I '($$EXIST^%SCODDOM(POCHE)) S INDCOMP="" G FIN2
 
 N AT,OR,V1,V2,DOM,ECHEC,LISTE,REPSI,NBREG,LISTREQ
 N LMALUS S LMALUS=$$CONCAS^%QZCHAD(TEMPO,"MALUS")
 N LATTS S LATTS=$$CONCAS^%QZCHAD(TEMPO,"ATT.SOURCE")
 N LATTC S LATTC=$$CONCAS^%QZCHAD(TEMPO,"ATT.CIBLE")
 N RESULTAT S RESULTAT=$$CONCAS^%QZCHAD(TEMPO,"RESULTAT")
 N CONTEXT S CONTEXT=$$CONCAS^%QZCHAD(TEMPO,"CONTEXTE"),@CONTEXT=0
 N EV S EV=$$CONCAS^%QZCHAD(TEMPO,"EVALUATION.POUR")
 S REPSI=$$NOMINT^%QSF(REPS) G:REPSI="" FIN2
 
DEB D MSG^%VZEATT($$^%QZCHW("Activation du savoir-comparer")_" "_POCHE)
 N REPC,CIBLE,FIRST,VIDE,STOP,NIV,SACCOR
 S OBJCIB="",STOP=0,NIV=0,REPC=$$NOMINT^%QSF(REPS)
 
 D CRLIST^%SCOA2(.NLIST,REPC)
 
 K ^[QUI]RQSGLO("SCX",ETU)
 I PREDEFINI G LOPTRI
LOOPCI 
 S OBJCIB=$O(@LISICIB@(OBJCIB))
 G:OBJCIB="" FLOOP
 S DOM="",FIRST=1
 D TRTDOM^%SCOA1(LISDOM,DOM)
 I $$CARD^%QSGEST7(NLIST)=1 G FLOOP
 G LOOPCI
 
LOPTRI 
 N LIG S LIG=""
LOPTRI2 
 S LIG=$O(@ADRL@(LIG))
 G:LIG="" FLOOP
 S OBJCIB=@ADRL@(LIG),DOM="",FIRST=1
 D TRTDOM^%SCOA1(LISDOM,DOM)
 I $$CARD^%QSGEST7(NLIST)=1 G FLOOP
 G LOPTRI2
 
FLOOP 
 
EXT N ADRL S ADRL=$$ADRLIS^%QSGEST7(NLIST) I ADRL="" S INDCOMP="" G FIN
 S INDCOMP=$O(@ADRL@("")) I INDCOMP="" G FIN
 
 D PA^%QSGESTI(REPSI,INDCOMP,$$^%QZCHW("PRIME.RECONNAISSANCE"),$$^%QSCALVA(REPSI,INDCOMP,$$^%QZCHW("PRIME.RECONNAISSANCE"))+1,1)
 
 
 
 
 D REAFF^TORQY3
FIN D DEL^%QSGES11(NLIST)
FIN2 D:$D(LISTREQ) DEL^%QSGES11(LISTREQ)
 K @(TEMPO) Q
 
QUICK 
 N REQ
 S LIST=$P(^[QUI]TORQYC(POCHE),"^",1) I LIST'="" G LISTP
QUICK2 S REQ=$P(^[QUI]TORQYC(POCHE),"^",2) I REQ'="" G REQ
 G STAND
 
LISTP 
 
 I '($$EX^%QSGEST7(LIST)) D MSG^%VZEATT($$^%QZCHW("liste")_" "_LIST_" "_$$^%QZCHW("inconnue")) H 2 G QUICK2
 
 I $$^%QSCALVA("L0",LIST,"TRIABLE")'=$$^%QZCHW("OUI") G LISTP2
 
 S ADRL=$$^%QSCALVA("L0",LIST,"TRIEE")
 I ADRL'="" S PREDEFINI=1 D MSG^%VZEATT($$^%QZCHW("prise en compte de la liste predefinie")) H 2 G ACT
 
LISTP2 S ADRL=$$ADRLIS^%QSGEST7(LIST) I ADRL="" G FIN2
 
 S OBJCIB=""
 N LISICIB S LISICIB=$$CONCAS^%QZCHAD(TEMPO,$$REP^%QSGEST7(LIST))
 F I=1:1 S OBJCIB=$O(@ADRL@(OBJCIB)) Q:OBJCIB=""  S @LISICIB@(@ADRL@(OBJCIB))=""
 G ACT
REQ 
 
 
 I '($$EXISTE^%QSINTER(REQ)) G STAND
 D MSG^%VZEATT($$^%QZCHW("prise en compte de la requete predefinie"))
 S I=0
REQ2 S I=I+1 G:'($D(^[QUI]RQS1(REQ,"PARAMETRES",I))) REQ2F
 D POCLEPA^%VVIDEO S MES=$$^%QZCHW("Parametre")_" "_I_" : "
 W MES S DX=$L(MES) D ^%VLEC
REQ21 S PAR=^[QUI]RQS1(REQ,"PARAMETRES",I),@LPARAM@(PAR)=Y1
 G REQ2
REQ2F 
 S EPAR=I'=1
REQ3 
 S LIST=REPS G:LIST="" SUIT
 S NI=$$NOMINT^%QSF(LIST) G:NI'="" SUIT
SUIT D POCLEPA^%VVIDEO
 I '(EPAR) S LISTREQ=$$ACTIVEP^%QSINTER(REQ,LIST,"") G FREQ
 S LISTREQ=$$ACTIVEP^%QSINTER(REQ,LIST,LPARAM)
FREQ 
 I $$CARD^%QSGEST7(LISTREQ)=0 G FIN2
 
 S ADRL=$$ADRLIS^%QSGEST7(LISTREQ) I ADRL="" G FIN2
 S OBJCIB=""
 N LISICIB S LISICIB=$$CONCAS^%QZCHAD(TEMPO,NI)
 F I=1:1 S OBJCIB=$O(@ADRL@(OBJCIB)) Q:OBJCIB=""  S @LISICIB@(OBJCIB)=""
 D REAFF^TORQY3
 G ACT

