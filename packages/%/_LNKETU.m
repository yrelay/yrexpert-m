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

;%LNKETU^INT^1^59547,73870^0
LNKETU ;
 
 
 
 
AJ 
 N RESUL,A,DX,DY,TM,CTR,MEN,ADR
 S MEN=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"MENU") K @(MEN)
 S @MEN@(1)="Ajout"_"^CR",@MEN@(2)="Fin"_"^FCR"
 S TM=$$^%QZCHW("creation")
CR D AFF(TM)
 S RESUL(1)=$$POP
 
 S A=$$CR1(.RESUL,1)
 K RESUL,PATOUCH
ACR 
 D POCLEPA^%VVIDEO,^%VQUIKMN(10,70,23,MEN,.ADR,.CTR)
 G:(CTR="A")!(CTR="F") FCR
 G:ADR="" ACR G @ADR
FCR K @(MEN)
 Q
 
 
CMS 
 N RESUL,A,DX,DY,TM,CTR,ADR,CONTR,MEN,SCR,CMS,ABENDSCR,RESUL,PATOUCH
 
 S TM=$$^%QZCHW("modification / duplication / suppression")
 S MEN=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"MENU") K @(MEN)
 S SCR="LNKETU",(CMS,ABENDSCR)=0
 S @MEN@(1)=$$^%QZCHW("Modification")_"^MO"
 S @MEN@(2)=$$^%QZCHW("Duplication")_"^DU"
 S @MEN@(3)=$$^%QZCHW("Suppression")_"^SU"
 
 D AFF(TM)
 K CTR,ETU,RESUL,PATOUCH
 D LIRE2^%VREAD($$^%QZCHW("Etude")_" : ","",1,RM-1,DY+1,DY-1,"AFF^%LNKETU("""_TM_""")","$$UC^%LNKETU",.CTR,.ETU)
 I (CTR'="")!(ETU="") K @(MEN) Q
 
 D LOAD^%LNKETU2(ETU,.RESUL)
 D ^%VAFIGRI,^%VAFISCR
ACT 
 D POCLEPA^%VVIDEO,^%VQUIKMN(10,70,23,MEN,.ADR,.CONTR)
 G:(CONTR="A")!(CONTR="F") CMS
 G:ADR="" ACT G @ADR
MO 
 D MOD(.RESUL)
 G ACT
DU 
 D POCLEPA^%VVIDEO
 G:$$MES^%VZEOUI($$^%QZCHW("Voulez-vous dupliquer l'etude")_" "_ETU_" : ","N")'=1 ACT
 S RESUL(1)=$$POP
 
 S A=$$CR1(.RESUL,1)
 G CMS
SU 
 D POCLEPA^%VVIDEO
 I $$CONFIRM^%VZEOUI($$^%QZCHW("Voulez-vous supprimer l'etude")_" "_ETU_" : ")=1 D SUP^%LNKETU2(ETU) G CMS
 G ACT
 
 
AFF(MOD) 
 D CLEPAG^%VVIDEO,^%VZCDB(MOD_" "_$$^%QZCHW("d'une etude"),0)
 S DX=0,DY=5 Q
 
UC(YY1,REAF) 
 N ETU
 S REAF=0
 I YY1="" Q 1
 I YY1="?" S REAF=1 Q $$HELP^%LNKETU2(.YY1)
 S ETU=$$REP
 I '($$IR^%QSGEST5(ETU,YY1)) D ^%VZEAVT($$^%QZCHW("Individu inconnu dans le repertoire")_" "_$$NOMLOG^%QSF(ETU)) Q 0
 I $$^%QSCALVA(ETU,YY1,"TYPE.ETUDE")'="CONFIGURATEUR" D ^%VZEAVT($$^%QZCHW("Cette etude n'est pas de type configurateur")) Q 0
 Q 1
 
CR1(RESUL,MOD) 
 
 N %AJM,CTR,DAT,L,NL,MSG
 I MOD=0 G VER
AFE D POCLEPA^%VVIDEO,AFF1^%VACTGRQ("LNKETU",.RESUL,.CTR)
 I CTR="A" Q 0
VER D MSG^%VZEATT($$^%QZCHW("Verification des donnees"))
 S MSG=$$VERIF(RESUL(3),RESUL(4),RESUL(5),RESUL(6),RESUL(7),RESUL(8),RESUL(9),RESUL(10))
 I MSG'="" D:MSG'=" " ^%VZEAVT(MSG) Q:MOD=0 0 G AFE
 
 D CREER^%LNKETU2(RESUL(1),RESUL(2),RESUL(3),RESUL(4),RESUL(5),RESUL(6),RESUL(7),RESUL(8),RESUL(9),RESUL(10))
 Q 1
 
MOD(RESUL) 
 N A
 K PATOUCH S PATOUCH(1)=1
 I RESUL(4)'="" S RESUL(6)="",PATOUCH(6)=1
 I RESUL(6)'="" S RESUL(4)="",PATOUCH(4)=1
 F A=1:1:10 S OR(A)=RESUL(A)
MD D ^%VMODISC
 I ABENDSCR=0 S A=$$CR1(.RESUL,0) G:A=0 MD Q
 F A=1:1:10 S RESUL(A)=OR(A)
 D ^%VAFIGRI,^%VAFISCR Q
 
 
 
 
VERIF(REPS,OBJS,LIEN,LIND,POCHE,ECH1,ECH2,TRANS) 
 N MSG,I,ERR,GLO
 S MSG=""
 I $$REPM^%QSGEST9(REPS)'=2 S MSG=$$^%QZCHW("repertoire inconnu") Q MSG
 I (OBJS="")&(LIND="") S MSG=$$^%QZCHW("individu et liste inconnus") Q MSG
 I (OBJS'="")&(LIND'="") S MSG=$$^%QZCHW("individu OU liste a configurer") Q MSG
 I OBJS'="",'($$IR^%QSGE5($$NOMINT^%QSF(REPS),OBJS)) S MSG=$$^%QZCHW("individu inconnu") Q MSG
 I LIND'="",'($$IR^%QSGE5("L0",LIND)) S MSG=$$^%QZCHW("liste inconnue") Q MSG
 I LIND'="",'($$VAIR^%QSGE5("L0",LIND,"BASE",$$NOMINT^%QSF(REPS))) S MSG=$$^%QZCHW("incompatibilite entre repertoire et liste") Q MSG
 I $$TYPE^%QSGEST9($$NOMINT^%QSF(REPS),LIEN)<4 S MSG=$$^%QZCHW("lien non involutif"),REFUSE=1 Q MSG
 S GLO=$S(DTM:"^[QUI]EXPLICI",1:"^[QUI]EXPLICIT")
 I POCHE'="",'($D(@GLO@(POCHE))) S MSG=$$^%QZCHW("poche inconnue"),REFUSE=1 Q MSG
 S GLO=$$ADR^%QMLILA
 I ECH1="" G VER0
 I '($D(@GLO@(ECH1))) S MSG=$$^%QZCHW("liste d'attributs inconnue") Q MSG
VER0 I ECH2="*" G VER1
 I ECH2="" S RESUL(9)="*" G VER1
 I '($D(@GLO@(ECH2))) S MSG=$$^%QZCHW("liste d'attributs inconnue") Q MSG
VER1 I (TRANS'="OUI")&(TRANS'="NON") S RESUL(10)="OUI"
 Q MSG
 
POP() 
 Q $$GEN^%QCAPOP("CFX")
 
REP() 
 Q "ETUDE.I"

