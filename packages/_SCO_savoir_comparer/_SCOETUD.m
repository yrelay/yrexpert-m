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

;%SCOETUD^INT^1^59547,73888^0
SCOETUD ;
 
 
 
 
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
 N RESUL,A,DX,DY,TM,CTR,ADR,CONTR,MEN,SCR,CMS,ABENDSCR,RESUL,PATOUCH,ETU
 
 S TM=$$^%QZCHW("modification / duplication / suppression")
 S MEN=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"MENU") K @(MEN)
 S SCR="SCOETUD",(CMS,ABENDSCR)=0
 S @MEN@(1)=$$^%QZCHW("Modification")_"^MO"
 S @MEN@(2)=$$^%QZCHW("Duplication")_"^DU"
 S @MEN@(3)=$$^%QZCHW("Suppression")_"^SU"
 
 D AFF(TM)
 K CTR,ETU,RESUL,PATOUCH
 D LIRE2^%VREAD($$^%QZCHW("Etude")_" : ","",1,RM-1,DY+1,DY-1,"AFF^%SCOETUD("""_TM_""")","$$UC^%SCOETUD",.CTR,.ETU)
 I (CTR'="")!(ETU="") K @(MEN) Q
 
 D LOAD^%SCOETU2(ETU,.RESUL)
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
 I $$CONFIRM^%VZEOUI($$^%QZCHW("Voulez-vous supprimer l'etude")_" "_ETU_" : ")=1 D SUP^%SCOETU2(ETU) G CMS
 G ACT
 
 
AFF(MOD) 
 D CLEPAG^%VVIDEO,^%VZCDB(MOD_" "_$$^%QZCHW("d'une etude"),0)
 S DX=0,DY=5 Q
 
UC(YY1,REAF) 
 N ETU
 S REAF=0
 I YY1="" Q 1
 I YY1="?" S REAF=1 Q $$HELP^%SCOETU2(.YY1)
 S ETU=$$REP
 I '($$IR^%QSGEST5(ETU,YY1)) D ^%VZEAVT($$^%QZCHW("Individu inconnu dans le repertoire")_" "_$$NOMLOG^%QSF(ETU)) Q 0
 I $$^%QSCALVA(ETU,YY1,"TYPE.ETUDE")'="SAVOIR-COMPARER" D ^%VZEAVT($$^%QZCHW("Cette etude n'est pas de type savoir-comparer")) Q 0
 Q 1
 
CR1(RESUL,MOD) 
 
 N %AJM,CTR,DAT,L,NL,MSG
 I MOD=0 G VER
AFE D POCLEPA^%VVIDEO,AFF1^%VACTGRQ("SCOETUD",.RESUL,.CTR)
 I CTR="A" Q 0
VER D MSG^%VZEATT($$^%QZCHW("Verification des donnees"))
 S MSG=$$VERIF(RESUL(3),RESUL(4),RESUL(5),RESUL(6),RESUL(7),RESUL(8),RESUL(9))
 I MSG'="" D:MSG'=" " ^%VZEAVT(MSG) Q:MOD=0 0 G AFE
 
 D CREER^%SCOETU2(RESUL(1),RESUL(2),RESUL(3),RESUL(4),RESUL(5),RESUL(6),RESUL(7),RESUL(8),RESUL(9))
 Q 1
 
MOD(RESUL) 
 N A
 K PATOUCH
 S PATOUCH(1)=1
 F A=1:1:9 S OR(A)=RESUL(A)
MD D ^%VMODISC
 I ABENDSCR=0 S A=$$CR1(.RESUL,0) G:A=0 MD Q
 F A=1:1:9 S RESUL(A)=OR(A)
 D ^%VAFIGRI,^%VAFISCR Q
 
 
 
 
VERIF(REPS,OBJS,REPC,OBJC,DOM,TO,ARR) 
 N MSG,I,ERR
 S MSG=""
 I ($$REPM^%QSGEST9(REPS)'=2)!($$REPM^%QSGEST9(REPC)'=2) S MSG=$$^%QZCHW("repertoire inconnu") Q MSG
 I '($$IR^%QSGE5($$NOMINT^%QSF(REPS),OBJS)) S MSG=$$^%QZCHW("Individu inconnu") Q MSG
 I ('($$IR^%QSGE5($$NOMINT^%QSF(REPC),OBJC)))&($$^%QSCALVA("L0",OBJC,"BASE")'=$$NOMINT^%QSF(REPC)) S MSG=$$^%QZCHW("erreur : liste ou individu") Q MSG
 I DOM="" S MSG=$$^%QZCHW("erreuur : domaine non defini") Q MSG
 I '($D(^[QUI]SCOMDOM(DOM))) S MSG=$$^%QZCHW("domaine inconnu") Q MSG
 I ARR="" S RESUL(9)="NON"
 I TO="" Q ""
 I TO=0 Q ""
 I '($$NUM^%QZNBN(TO)) S MSG=$$^%QZCHW("taux non numerique") Q MSG
 I TO>1 S MSG=$$^%QZCHW("taux accord")_" : "_$$^%QZCHW("valeurs comprises entre zero et 1") Q MSG
 Q MSG
 
POP() 
 Q $$GEN^%QCAPOP("CPX")
 
REP() 
 Q "ETUDE.I"

