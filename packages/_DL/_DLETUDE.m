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

;%DLETUDE^INT^1^59547,73867^0
DLETUDE ;
 
 
 
 
 
 
AJ 
 N RESUL,A,TM,CTR,MEN,ADR
 I $$CONFINS^%DLCON1=0 Q
 I '($D(^[QUI]RQSGLO("JALON","APP"))) D POCLEPA^%VVIDEO,^%VZEAVT($$^%QZCHW("Les parametres de decalage d'une etude ne sont pas definis")),POCLEPA^%VVIDEO Q
 S MEN=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"MENU") K @(MEN)
 S @MEN@(1)="Ajout"_"^CR",@MEN@(2)="Fin"_"^FCR"
 S TM=$$^%QZCHW("creation")
CR D AFF(TM)
 S RESUL(1)=$$POP
 
 S RESUL(9)="EN CARNET",RESUL(11)="REEL",RESUL(12)="AVAL"
 S RESUL(14)="OUI",RESUL(15)="TEMPS.FABRICATION"
 S RESUL(17)=^[QUI]RQSGLO("JALON","APP","DEC")
 I RESUL(17)="OUI/NON" S RESUL(17)="OUI"
 I RESUL(17)="NON" S (PATOUCH(18),PATOUCH(19),PATOUCH(20))=1 G CREA
 S RESUL(18)=$$DEF^%DLETUC(^[QUI]RQSGLO("JALON","APP","TYPDEC"))
 S RESUL(19)=^[QUI]RQSGLO("JALON","APP","COEF.SUP")
 S RESUL(20)=^[QUI]RQSGLO("JALON","APP","MAX.ITER")
 I RESUL(18)="R" S PATOUCH(19)=1,RESUL(19)="" G CREA
 I RESUL(18)="C" S PATOUCH(20)=1,RESUL(20)=""
 
CREA 
 S A=$$CR1(.RESUL,1)
 K RESUL,PATOUCH
ACR 
 D POCLEPA^%VVIDEO,^%VQUIKMN(10,70,23,MEN,.ADR,.CTR)
 G:(CTR="A")!(CTR="F") FCR
 G:ADR="" ACR G @ADR
FCR K @(MEN)
 Q
 
 
CMS 
 N RESUL,A,TM,CTR,ADR,CONTR,MEN,SCR,CMS,ABENDSCR,RESUL,PATOUCH
 I $$CONFINS^%DLCON1=0 Q
 
 S TM=$$^%QZCHW("modification / duplication / suppression")
 S MEN=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"MENU") K @(MEN)
 S SCR="DLETUDE",(CMS,ABENDSCR)=0
 S @MEN@(1)=$$^%QZCHW("Modification")_"^MO"
 S @MEN@(2)=$$^%QZCHW("Duplication")_"^DU"
 S @MEN@(3)=$$^%QZCHW("Suppression")_"^SU"
SAI 
 D AFF(TM)
 K CTR,ETU,RESUL,PATOUCH
 D LIRE2^%VREAD($$^%QZCHW("Etude")_" : ","",1,RM-1,DY+1,DY-1,"AFF^%DLETUDE("""_TM_""")","$$UC^%DLETUDE",.CTR,.ETU)
 I (CTR'="")!(ETU="") K @(MEN) Q
 
 D LOAD^%DLETUD2(ETU,.RESUL)
 D ^%VAFIGRI,^%VAFISCR
ACT 
 D POCLEPA^%VVIDEO,^%VQUIKMN(10,70,23,MEN,.ADR,.CONTR)
 G:(CONTR="A")!(CONTR="F") SAI
 G:ADR="" ACT G @ADR
MO 
 D MOD(.RESUL)
 G ACT
DU 
 D POCLEPA^%VVIDEO
 G:$$MES^%VZEOUI($$^%QZCHW("Voulez-vous dupliquer l'etude")_" "_ETU_" : ","N")'=1 ACT
 S RESUL(1)=$$POP
 
 S A=$$CR1(.RESUL,1)
 G SAI
SU 
 D POCLEPA^%VVIDEO
 I $$CONFIRM^%VZEOUI($$^%QZCHW("Voulez-vous supprimer l'etude")_" "_ETU_" : ")'=1 G ACT
 D SUP^%DLETUD2(ETU) G SAI
 
 
AFF(MOD) 
 D CLEPAG^%VVIDEO,^%VZCDB(MOD_" "_$$^%QZCHW("d'une etude"),0)
 S DX=0,DY=5 Q
 
UC(YY1,REAF) 
 N ETU
 S REAF=0
 I YY1="" Q 1
 I YY1="?" S REAF=1 Q $$HELP^%DLETUD3(.YY1)
 S ETU=$$REP
 I '($$IR^%QSGEST5(ETU,YY1)) D ^%VZEAVT($$^%QZCHW("Individu inconnu dans le repertoire")_" "_$$NOMLOG^%QSF(ETU)) Q 0
 I $$^%QSCALVA(ETU,YY1,"TYPE.ETUDE")'="JALONNEMENT" D ^%VZEAVT($$^%QZCHW("Cette etude n'est pas de type jalonnement")) Q 0
 Q 1
 
CR1(RESUL,MOD) 
 
 N %AJM,CTR,DAT,L,NL,MSG,DEC,TYPD
 I MOD=0 G VER
 
AFE D POCLEPA^%VVIDEO,AFF1^%VACTGRQ("DLETUDE",.RESUL,.CTR)
 I CTR="A" Q 0
VER 
 S L=RESUL(3),NL=RESUL(4),DAT=RESUL(13)
 
 I L'="",'($$IR^%QSGEST5($$LAN^%DLCON2,L)) S %AJM="A" D STO^%DLANCEM(L,RESUL(5),RESUL(7),RESUL(6),RESUL(8),RESUL(9),RESUL(10),.MSG) I MSG=1 Q 0
 D MSG^%VZEATT($$^%QZCHW("Verification des donnees"))
 I DAT="" S DAT=$$DATE^%QMDATE
 S DEC=RESUL(17),TYPD=RESUL(18)
 S MSG=$$VERIF^%DLETUD3(RESUL(1),.L,.NL,RESUL(11),RESUL(12),.DAT,RESUL(14),0,.DEC,.TYPD,RESUL(19),RESUL(20))
 I MSG'="" D:MSG'=" " ^%VZEAVT(MSG) Q:MOD=0 0 G AFE
 S RESUL(3)=L,RESUL(4)=NL,RESUL(13)=DAT
 S RESUL(17)=DEC,RESUL(18)=TYPD
 
 D CREER^%DLETUD2(RESUL(1),RESUL(2),RESUL(3),RESUL(4),RESUL(11),RESUL(12),RESUL(13),RESUL(14),RESUL(15),RESUL(16),RESUL(17),RESUL(18),RESUL(19),RESUL(20))
 Q 1
 
MOD(RESUL) 
 N A
 K PATOUCH
 
 F A=3:1:5,1,7 S PATOUCH(A)=1
 
 I RESUL(3)="" F A=6,8:1:10 S PATOUCH(A)=1
 
 I RESUL(17)="NON" F A=18:1:20 S PATOUCH(A)=1
 I RESUL(18)="C" S PATOUCH(20)=1
 I RESUL(18)="R" S PATOUCH(19)=1
 
 F A=1:1:20 S OR(A)=RESUL(A)
MD D ^%VMODISC
 G:ABENDSCR=0 CH
 
 F A=1:1:20 S RESUL(A)=OR(A)
 D ^%VAFIGRI,^%VAFISCR Q
CH 
 S A=$$CR1(.RESUL,0)
 
 I A=0 G MD
 I RESUL(3)'="",A=1 D ST2^%DLANCEM(RESUL(3),RESUL(8),RESUL(6),RESUL(9),RESUL(10))
 Q
 
 
POP() 
 Q $$GEN^%QCAPOP("JLX")
 
REP() 
 Q "ETUDE.I"

