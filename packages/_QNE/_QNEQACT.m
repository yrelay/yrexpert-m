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

;%QNEQACT^INT^1^59547,73879^0
QNEQACT(ETI) 
 
 
 
 
 
 
 
 
 
 
 N CTR,ETUDE,DX,DY,TMOD,MSG,MODAF,ABANDON
 S TMOD=$$^%QZCHW($S(ETI="SEP":"inseparables",ETI="COM":"incompatibles",1:"activation"))
AC D REAFF(TMOD)
 D LIRE2^%VREAD($$^%QZCHW("Etude")_" : ","",1,RM-1,DY+1,DY-1,"REAFF^%QNEQACT("""_TMOD_""")","$$UC^%QNEQACT",.CTR,.ETUDE)
 I (CTR'="")!(ETUDE="") Q
 S MODAF=$$MODAF(ETUDE)
 I (MODAF'=0)&(MODAF'=1) Q
 D REAFF(TMOD)
 
 S MSG=$$ACT^%QNEQUI2(ETUDE,MODAF,ETI,0,.ABANDON),ABANDON=0
 I MSG'="" D ^%VZEAVT(MSG)
 K CTR,ETUDE
 G AC
 
 
CREER 
 N RESUL,A,DX,DY,TMOD,CTR,MEN,ADR
 S MEN=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"MENU") K @(MEN)
 S @MEN@(1)="Ajout"_"^CR",@MEN@(2)="Fin"_"^FCR"
 S TMOD=$$^%QZCHW("creation")
CR D REAFF(TMOD)
 S RESUL(1)=$$POP^%QNEQETU
 
 S A=$$CR1(.RESUL)
 K RESUL,PATOUCH
ACR 
 D POCLEPA^%VVIDEO,^%VQUIKMN(10,70,23,MEN,.ADR,.CTR)
 G:(CTR="A")!(CTR="F") FCR
 G:ADR="" ACR G @ADR
FCR K @(MEN)
 Q
 
 
MOD 
 N RESUL,A,DX,DY,TMOD,CTR,ADR,CONTR,MEN,SCR,ABENDSCR,RESUL,PATOUCH
 
 S TMOD=$$^%QZCHW("modification / duplication / suppression")
 S MEN=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"MENU") K @(MEN)
 S SCR="QNEQU1"
 S @MEN@(1)=$$^%QZCHW("Modification")_"^MO"
 S @MEN@(2)=$$^%QZCHW("Duplication")_"^DU"
 S @MEN@(3)=$$^%QZCHW("Suppression")_"^SU"
CMS 
 D REAFF(TMOD)
 K CTR,ETUDE,RESUL,PATOUCH
 D LIRE2^%VREAD($$^%QZCHW("Etude")_" : ","",1,RM-1,DY+1,DY-1,"REAFF^%QNEQACT("""_TMOD_""")","$$UC^%QNEQACT",.CTR,.ETUDE)
 I (CTR'="")!(ETUDE="") K @(MEN) Q
 
 D LOAD^%QNEQET2(ETUDE,.RESUL)
 D ^%VAFIGRI,^%VAFISCR
ACT 
 D POCLEPA^%VVIDEO,^%VQUIKMN(10,70,23,MEN,.ADR,.CONTR)
 G:(CONTR="A")!(CONTR="F") CMS
 G:ADR="" ACT G @ADR
MO 
 S A=$$CR1(.RESUL)
 G ACT
DU 
 D POCLEPA^%VVIDEO
 G:$$MES^%VZEOUI($$^%QZCHW("Voulez-vous dupliquer l'etude")_" "_ETUDE_" : ","N")'=1 ACT
 S ETUDUP=$$POP^%QNEQETU
 D MSG^%VZEATT($$^%QZCHW("Creation de l'etude")_" "_ETUDUP)
 D ^%QMCP9(WHOIS,QUI,$$REP^%QNEQETU,ETUDE,WHOIS,QUI,ETUDUP,"")
 D LOAD^%QNEQET2(ETUDUP,.RESUL)
 
 S A=$$CR1(.RESUL)
 G CMS
SU 
 D POCLEPA^%VVIDEO
 I $$CONFIRM^%VZEOUI($$^%QZCHW("Voulez-vous supprimer l'etude")_" "_ETUDE_" : ") D SUP^%QNEQETU(ETUDE) G CMS
 G ACT
 
 
MODAF(NOM) 
 N ETU,MEN
 S ETU=$$REP^%QNEQETU
 I ($$^%QSCALVA(ETU,NOM,"TRAITEMENT.ACCEPTATION.LOCAL")="")&($$^%QSCALVA(ETU,NOM,"TRAITEMENT.ACCEPTATION.GLOBAL")="") Q 0
 D POCLEPA^%VVIDEO
 Q $$MES^%VZEOUI($$^%QZCHW("activation des traitements en mode visible ?"),"N")
 
REAFF(MOD) 
 D CLEPAG^%VVIDEO,^%VZCDB(MOD_" "_$$^%QZCHW("d'une etude"),0)
 S DX=0,DY=5
 Q
 
UC(YY1,REAF) 
 N ETU
 S REAF=0
 I YY1="" Q 1
 I YY1="?" S REAF=1 Q $$HELP^%QNEQET2(.YY1,0)
 S ETU=$$REP^%QNEQETU
 I '($$IR^%QSGEST5(ETU,YY1)) D ^%VZEAVT($$^%QZCHW("Individu inconnu dans le repertoire")_" "_$$NOMLOG^%QSF(ETU)) Q 0
 I $$^%QSCALVA(ETU,YY1,"TYPE.ETUDE")'="EQUILIBRAGE" D ^%VZEAVT($$^%QZCHW("Cette etude n'est pas de type equilibrage")) Q 0
 Q 1
 
CR1(RESUL) 
 
 N CTR,MSG,GAM,LIS,REPG
AFE D POCLEPA^%VVIDEO,AFF1^%VACTGRQ("QNEQU1",.RESUL,.CTR)
 I CTR="A" Q 0
 S GAM=RESUL(4),LIS=RESUL(5),REPG=RESUL(3)
 D MSG^%VZEATT($$^%QZCHW("Verification des donnees"))
 
 
 
 
 
 S MSG=$$VERIF^%QNEQETU(RESUL(1),.REPG,.LIS,.GAM,RESUL(7),RESUL(6),RESUL(11),RESUL(12),RESUL(9),RESUL(10))
 S RESUL(3)=REPG,RESUL(4)=GAM,RESUL(5)=LIS
 I MSG'="" D ^%VZEAVT(MSG) G AFE
 
 D CREER^%QNEQET2(RESUL(1),RESUL(2),REPG,GAM,LIS,RESUL(6),RESUL(8),RESUL(7),RESUL(9),RESUL(10),RESUL(11),RESUL(12),RESUL(13),RESUL(14))
 Q 1

