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

;%DLJUC2^INT^1^59547,73868^0
DLJUC2 ;
 
 
 
 
 
 
NUPAPLJ S REFUSE=0 I RESUL(1)="" S REFUSE=1 G FIN
 I RESUL(IC)="SINON" G FIN
 S:'($D(^[QUI]CPTEUR("NUPAPLJ",RESUL(1)))) ^[QUI]CPTEUR("NUPAPLJ",RESUL(1))=0 L ^[QUI]CPTEUR("NUPAPLJ",RESUL(1)) S PN=^[QUI]CPTEUR("NUPAPLJ",RESUL(1)),PN=PN+1,^[QUI]CPTEUR("NUPAPLJ",RESUL(1))=PN
 S TAB(IC)=PN,ICC=IC D AFFICHE L
 G FIN
 
ALL S REFUSE=0,CTRLF=0 Q:RESUL(IC)'="*"
 S STOPUC=1 Q
 
AFFICHE 
 S DEJALU(ICC)=1,DX=^%SCRE(SCR,ICC,2),DY=^%SCRE(SCR,ICC,3) X XY S RESUL(ICC)=TAB(ICC) W ^%SCRE(SCR,ICC,1),TAB(ICC)
 Q
 
PARAVIDE S REFUSE=0 G:RESUL(IC)'="" FIN
 S LIMITE=$S(SCR="DLJ":20,1:IC)
SAUT F I1=IC:1:LIMITE S DEJALU(I1)=1,RESUL(I1)=""
 S (ICC,IC)=LIMITE,STOPUC=1 G FIN
 
UNITES S REFUSE=0,STOPUC=0,CTRLF=0 Q:RESUL(IC)'="?"
 D POCLEPA^%VVIDEO F I=1:1:^%SCRE(SCR,ICC,6) W ^%SCRE(SCR,ICC,6+I) H 2 D POCLEPA^%VVIDEO
 S REFUSE=1 Q
 
FIN K TAB Q
 
CAPA 
 I RESUL(ICC)="" S TAB(ICC)=0 D ^%VAFFICH Q
 I '($$ADR^%QZNBN1(RESUL(ICC))) D ^%VZEAVT($$^%QZCHW("La capacite doit avoir une valeur numerique")) S REFUSE=1 Q
 Q
 
INFC 
 
 N %U,%S,GLO,U,S,M,SEC,DEF,C,MAX
 D ^%VZEATT
 S REFUSE=0,M=RESUL(1),SEC=RESUL(2),U="",MAX=""
 S GLO=^%SCRE("DLMACAP","GLOSTOC")
 F %U=0:0 S U=$O(@GLO@(M,SEC,U)) Q:U=""  S DEF=$$DEF(M,SEC,U),S="" F %S=0:0 S S=$O(@GLO@(M,SEC,U,S)) Q:S=""  S C=$P(@GLO@(M,SEC,U,S),"^",1) S:C="" C=DEF I C>RESUL(ICC) S REFUSE=1 I C>MAX S MAX=C
 I REFUSE=1 D ^%VZEAVT($$^%QZCHW("La charge maxi doit etre superieure a la capacite maximale existante pour une semaine")_" ("_MAX_")")
 D POCLEPA^%VVIDEO Q
 
DEF(M,S,U) 
 N GL,C
 S GL=^%SCRE("MACAPD","GLOSTOC")
 S C=$S($D(@GL@(M,S,U)):$P(@GL@(M,S,U),"^",1),1:"")
 Q C
 
CAPAINF(CAPA) 
 Q
 N R,C
 S C=$P(CAPA,"^",1),R=$P(CAPA,"^",2)
 I R="" Q
 I C="" S C=$$DEF(RESUL(1),RESUL(2),RESUL(3))
 I C<R D ^%VZEAVT($$^%QZCHW("La charge reelle doit etre inferieure a la capacite")) S (REFUSE,CTOPUC)=1
 Q
 
MAX 
 
 N CHM,REPM
 S REPM=$$MACH^%DLCON2
 S CHM=$$^%QSCALVA(REPM,RESUL(1),"CHARGE.MAXI")
 I CHM>RESUL(ICC) Q
 D PA^%QSGESTI(REPM,RESUL(1),"CHARGE.MAXI",RESUL(ICC),1)
 Q
 
STO 
 N I,MESSER,VISU
 F I=1:1:4 S RESUL(I)=$$GETLBLAN^%VTLBLAN(RESUL(I))
 D ^%VAUTOST Q:ABENDSCR=1
 N ARTI,WB1,WB2,WB3,WB4,TBA,ERREUR,MESERR
 S ERREUR=0
 D POCLEPA^%VVIDEO,^%VZEATT
 S (ARTI,WB1)=RESUL(1),TBA="^[QUI]FLPLJ(WB1)",WB2=RESUL(2),WB3=RESUL(3),WB4=RESUL(4)
 S VISU=1
 D INIT^%DLJANAL
 D ^%DLJCPTI
 D END^%DLJANAL
 I ERREUR S ABENBSCR=1 D ^%VZEAVT(MESERR)
 Q
 
MODEL 
 N M
 I RESUL(ICC)'="" G MOD
 S M=$$MODEL^%QSMODEL
 I M="" S REFUSE=1 Q
 S TAB(ICC)=M D ^%VAFFICH Q
MOD I '($D(^RQSMOD(RESUL(ICC)))) D ^%VZEAVT($$^%QZCHW("Ce schema de donnees est inconnu")) S REFUSE=1
 Q
 
REP 
 N M
 S M=RESUL(2)
 I $$REP^%QSGES90(M,RESUL(ICC))'=2 D ^%VZEAVT($$^%QZCHW("Repertoire inexistant dans le schema de donnees")) S REFUSE=1
 Q
 
LIENG 
 N M
 S M=RESUL(2)
 I $$LIENPF^%QSGES90(M,RESUL(ICC-1),RESUL(ICC))=0 D ^%VZEAVT($$^%QZCHW("Lien non hierarchique dans le schema de donnees")) S REFUSE=1
 Q
 
LIENO 
 N M,REP
 S M=RESUL(2),REP=$$REPD^%QSGES90(M,RESUL(ICC-2),RESUL(ICC-1))
 
 I $$LIENPF^%QSGES90(M,REP,RESUL(ICC))=0 D ^%VZEAVT($$^%QZCHW("Lien non hierarchique dans le schema de donnees")) S REFUSE=1
 Q
 
LAN 
 N M,REP
 S M=RESUL(2),REP=RESUL(ICC-3)
 I $$LIENR^%QSGES90(M,REP,RESUL(ICC))=0 D ^%VZEAVT($$^%QZCHW("Ces deux repertoires ne sont pas lies par un lien relationnel")) S REFUSE=1
 Q
 
INVO 
 S REFUSE=0
 I RESUL(2)="" D ^%VZEAVT($$^%QZCHW("Nom du schema de donnees non defini")) S REFUSE=1 Q
 I RESUL(4)="" D ^%VZEAVT($$^%QZCHW("Repertoire")_" ARTICLE "_$$^%QZCHW("non defini")) S REFUSE=1 Q
 I '($$LIENINV^%QSGES90(RESUL(2),RESUL(4),RESUL(ICC))) D ^%VZEAVT($$^%QZCHW("Lien non involutif pour ce schema de donnees")) S REFUSE=1
 Q
 
UNIT 
 S:RESUL(IC)="" STOPUC=1
 Q

