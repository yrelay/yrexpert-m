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

;%SDYCMS^INT^1^59547,73890^0
SDYCMS ;
 
 
 
 
 
 
 
 
DUP 
 N CTR,DUP,SYM
DSY D TIT($$^%QZCHW("duplication"))
 
 S DX=10,DY=5 X XY
 D LIRE2^%VREAD($$^%QZCHW("symbole a dupliquer")_" : ","",9,RM-1,DY+1,DY-1,"TIT^%SDYCMS($$^%QZCHW(""duplication""))","$$SYM^%SDYCMS",.CTR,.DUP)
 
 I (DUP="")!(CTR'="") Q
 I '($$EXI(DUP)) D ^%VZEAVT($$^%QZCHW("ce symbole n'existe pas")) G DSY
 S DX=10,DY=5 X XY W $$^%QZCHW("symbole a dupliquer")," : ",DUP
 
DCR S DX=10,DY=8 D CLEBAS^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW("symbole a creer")_" : ","",9,RM-1,DY+1,DY-1,"TIT^%SDYCMS($$^%QZCHW(""duplication""))","",.CTR,.SYM)
 I (CTR'="")!(SYM="") G DSY
 I SYM="?" G DCR
 I $$EXI(SYM) D ^%VZEAVT($$^%QZCHW("ce symbole existe deja")) G DCR
 
 D MSG^%VZEATT($$^%QZCHW("duplication en cours")_"...")
 D GLOCOP^%QCAGLC($$DEF(DUP),$$DEF(SYM))
 D GLOCOP^%QCAGLC($$TEXT(DUP),$$TEXT(SYM))
 D GLOCOP^%QCAGLC($$COMP(DUP),$$COMP(SYM))
 
 D EXT(SYM)
 G DSY
 
 
SUP 
 N CTR,SYM
 
SUD D TIT($$^%QZCHW("suppression"))
 S DX=10,DY=5 X XY
 D LIRE2^%VREAD($$^%QZCHW("symbole a supprimer")_" : ","",9,RM-1,DY+1,DY-1,"TIT^%SDYCMS($$^%QZCHW(""suppression""))","$$SYM^%SDYCMS",.CTR,.SYM)
 
 I (CTR'="")!(SYM="") Q
 I '($$EXI(SYM)) D ^%VZEAVT($$^%QZCHW("ce symbole n'existe pas")) G SUD
 D POCLEPA^%VVIDEO
 I $$CONFIRM^%VZEOUI($$^%QZCHW("confirmez-vous la suppression de ce symbole")_" ? ")=1 D SUPPR(SYM)
 G SUD
 
SUPPR(SYM) 
 K @($$DEF(SYM)),@($$TEXT(SYM)),@($$COMP(SYM))
 Q
 
 
DESC 
 I '($$EXIST^%SDXGEN) D ^%VZEAVT($$^%QZCHW("environnement d'exploitation non defini")) Q
 N CTR,SYM,VERS
DEB 
 D TIT($$^%QZCHW("definition"))
 S DX=10,DY=5 X XY
 D LIRE2^%VREAD($$^%QZCHW("symbole")_" : ","",9,RM-1,DY+1,DY-1,"TIT^%SDYCMS($$^%QZCHW(""definition""))","$$SYM^%SDYCMS",.CTR,.SYM)
 
 I (CTR'="")!(SYM="") Q
 D POCLEPA^%VVIDEO
 
 I '($$EXI(SYM)) D ^%VSQUEAK I $$MES^%VZEOUI($$^%QZCHW("symbole inexistant, voulez-vous le creer")_" ? ","N")'=1 G DEB
 D EXT(SYM)
 G DEB
 
 
REGEN 
 N CTR,SYM,VERS
REGEN2 
 D TIT($$^%QZCHW("reanalyse"))
 S DX=10,DY=5 X XY
 D LIRE2^%VREAD($$^%QZCHW("symbole")_" : ","",9,RM-1,DY+1,DY-1,"TIT^%SDYCMS($$^%QZCHW(""definition""))","$$SYM^%SDYCMS",.CTR,.SYM)
 
 I (CTR'="")!(SYM="") Q
 D POCLEPA^%VVIDEO
 
 I '($$EXI(SYM)) D ^%VSQUEAK I $$MES^%VZEOUI($$^%QZCHW("symbole inexistant, voulez-vous le creer")_" ? ","N")'=1 G DEB
 D EXTGEN(SYM)
 G REGEN2
EXTGEN(SYM) 
 D COPY,EXT^%SDOGEN(SYM,"symbole"),SAUV
 Q
 
EXT(SYM) 
 D COPY
 
 D EXT^%SDODEF(SYM,"symbole")
 D SAUV
 Q
 
COPY 
 D GLOCOP^%QCAGLC($$DEF(SYM),$$DEF^%SDOCMS(SYM,"symbole"))
 D GLOCOP^%QCAGLC($$TEXT(SYM),$$TEXT^%SDOCMS(SYM,"symbole"))
 D GLOCOP^%QCAGLC($$COMP(SYM),$$COMP^%SDOCMS(SYM,"symbole"))
 Q
 
SAUV 
 N EL,GLO,GLS,GLTO,GLTS,GLCO,GLCS
 D MSG^%VZEATT($$^%QZCHW("stockage en cours"))
 S GLO=$$DEF^%SDOCMS(SYM,"symbole"),GLS=$$DEF(SYM)
 S GLTO=$$TEXT^%SDOCMS(SYM,"symbole"),GLTS=$$TEXT(SYM)
 S GLCO=$$COMP^%SDOCMS(SYM,"symbole"),GLCS=$$COMP(SYM)
 D SUPPR(SYM)
 S EL=""
BCL 
 S EL=$O(@GLO@("EL",EL)) I EL="" K @(GLTO),@(GLO),@(GLCO) Q
 S T=@GLO@("EL",EL,"TYPE")
 I (T="POINT")!(T="TEXTE") G BCL
 D GLOCOP^%QCAGLC($$CONCAT^%QZCHAD(GLO,"""EL"""_","_EL),$$CONCAT^%QZCHAD(GLS,"""EL"""_","_EL))
 S @GLTS@(EL)=@GLTO@(EL)
 D GLOCOP^%QCAGLC($$CONCAT^%QZCHAD(GLCO,EL),$$CONCAT^%QZCHAD(GLCS,EL))
 G BCL
 
SYM(YY1,REAF) 
 N SYM
 S REAF=0
 I YY1="" Q 1
 I YY1="?" S REAF=1,YY1=$$SELECT^%QSGEST6("^[QUI]SDSYMBO",$$^%QZCHW("choisissez un symbole")) Q YY1'=""
 Q 1
 
TIT(T) 
 D CLEPAG^%VVIDEO,^%VZCDB(T_" "_$$^%QZCHW("d'un symbole"),0)
 Q
 
 
 
DEF(SYM) 
 N A
 S A=$$CONCAT^%QZCHAD("^[QUI]SDSYMBO",$S($$NUM^%QZNBN(SYM):SYM,1:""""_SYM_""""))
 Q A
 
TEXT(SYM) 
 N A
 S A=$$CONCAT^%QZCHAD("^[QUI]SDSYMBT",$S($$NUM^%QZNBN(SYM):SYM,1:""""_SYM_""""))
 Q A
 
COMP(SYM) 
 N A
 S A=$$CONCAT^%QZCHAD("^[QUI]SDSYMBC",$S($$NUM^%QZNBN(SYM):SYM,1:""""_SYM_""""))
 Q A
 
 
EXI(SYM) 
 I SYM="" Q 0
 N A
 S A=$$DEF(SYM)
 I $D(@A) Q 1
 Q 0

