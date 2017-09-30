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

;%SRTRINT^INT^1^59547,73891^0
SRTRINT ;
 
 
 
 
 N GL,%I,ADV1,ADV2,V,%T,PC,SUP,GLO
 N SAIS2,SAIS1,NB1,NB2,ID,NBC1,NBC2,IDC,GLERR,WAR,ERR,GLWAR
CHS 
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Transfert de donnees entre saisies"),0)
SAIS2 S SAIS2=$$TIT^%PKCHOIX($$ADR^%SRSAIS2,10,3,17,$$^%QZCHW("Depuis"),1)
 Q:SAIS2=""
 S GLERR=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"WARNING")
 K @(GLERR)
 S ADRC2=$$ADR^%SRCOMP(SAIS2)
 I '($D(@ADRC2)) D MESS^%PKUTIL(25,12,$$^%QZCHW("Compilation inexistante"),1) G SAIS2
SAIS1 S SAIS1=$$TIT^%PKCHOIX($$ADR^%SRSAIS2,40,3,17,$$^%QZCHW("Vers"),1)
 G:SAIS1="" SAIS2
 S ADRC1=$$ADR^%SRCOMP(SAIS1)
 I '($D(@ADRC1)) D MESS^%PKUTIL(45,12,$$^%QZCHW("Compilation inexistante"),1) G SAIS1
 S NBC1=@ADRC1@("CLE")
 S NBC2=@ADRC2@("CLE"),IDC=NBC1=NBC2
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Transfert de donnees entre saisies"),0)
 W !,!,NBC1," ",$$^%QZCHW("et")," ",NBC2," -> ",$$^%QZCHW("nombre de cles")," ",$S(IDC:$$^%QZCHW("identique"),1:$$^%QZCHW("different"))
 I '(IDC),$$POCLE^%PKOUNO($$^%QZCHW("Continuons-nous ?")_" ","N")'=1 G CHS
 S NB1=@ADRC1@("NBC")
 S NB2=@ADRC2@("NBC"),ID=NB1=NB2
 W !,NB1," ",$$^%QZCHW("et")," ",NB2," -> ",$$^%QZCHW("nombre de champs")," ",$S(ID:$$^%QZCHW("identique"),1:$$^%QZCHW("different"))
 G:ID VERCLE
 I NB1>NB2 W !,$$^%QZCHW("Les derniers champs de")_" "_SAIS1_" "_$$^%QZCHW("seront remplis par des chaines vides")
 I $$POCLE^%PKOUNO($$^%QZCHW("Continuons-nous ?")_" ","N")'=1 G CHS
VERCLE S I="",ERR=0,WAR=0
 F %I=0:0 S I=$O(@ADRC1@("POSCLE",I)) Q:I=""  S CH=@ADRC1@("POSCLE",I),PC(I)=CH D CONTCH
 I WAR'=0 D AFFW
 I ERR'=0 D AFFER G FIN
 S SUP=$$POCLE^%PKOUNO(SAIS2_" : "_$$^%QZCHW("suppression des valeurs transferees dans")_" "_SAIS1_" ? ","N")
 I $$POCLE^%PKOUNO($$^%QZCHW("OK pour le transfert des valeurs")_" ? ","N")'=1 G CHS
 F %I=NB2+1:1:NB1 S VAL(%I)=""
 S ADV1=$$ADR^%SRACTIV(SAIS1)
 S ADV2=$$ADR^%SRACTIV(SAIS2)
 S ADV1=$S(ADV1'["(":ADV1_"(",1:$E(ADV1,1,$L(ADV1)-1)_",")
 S ADV2=$E(ADV2,1,$L(ADV2)-1)
 S SA=SAIS1,GLO=ADRC1
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Transfert de donnees entre saisies"),0)
 W !,!
 D ADR^%QCAGTW(ADV2,"RECOP^%SRTRINT")
 I ERR'=0 D AFFER
 
FIN K @(GLERR)
 G CHS
 
RECOP S V=@%T,CLE="",C="",ERRGL=0,CH=""
 S REF=$P(%T,ADV2,2),REF=$E(REF,2,$L(REF)-1)
 W !,REF
 F %I=1:1:NB2 S VAL(%I)=$P(V,$C(0),%I)
 X ^%PKREAD("POPER21")
 F %I=0:0 S C=$O(PC(C)) Q:C=""  S VA=VAL(PC(C)) S:VA="" ERRGL=1 S CLE=CLE_$S(VA?.N:","_VA,1:","""_VA_"""")
 S CLE=$E(CLE,2,999)
 S GL=ADV1_CLE_")"
 I $D(@GL) S ERR=ERR+1,@GLERR@(ERR)=REF_" "_$$^%QZCHW("cle(s) deja existante(s)") Q
 F %I=1:1:NB1 S CH=CH_VAL(%I)_$C(0)
 K:SUP @(%T)
 S @GL=CH
 Q
 
CONTCH I '($D(@ADRC2@("CHAMPS",CH))) S ERR=ERR+1,@GLERR@(ERR)=$$^%QZCHW("Champ")_" "_CH_" -> "_$$^%QZCHW("cle dans")_" "_SAIS1_", "_$$^%QZCHW("inexistant dans")_" "_SAIS2 Q
 I @ADRC2@("OBLIGAT",CH)="" S WAR=WAR+1,GLWAR(WAR)=$$^%QZCHW("Champ")_" "_CH_" -> "_$$^%QZCHW("cle dans")_" "_SAIS1_", "_$$^%QZCHW("non obligatoire dans")_" "_SAIS2
 Q
 
AFFW S %R=4 D PARAM^%PKPOP("30\CWHRL\1\\\  W A R N I N G  ")
 S A=$$UN^%PKCHOIX(.WAR,5,5,12)
 Q
 
AFFER S %R=4 D PARAM^%PKPOP("30\CWHRL\1\\\  erreurs trouvees ")
 S A=$$UN^%PKCHOIX(GLERR,5,5,16)
 Q

