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

;%QSCPKI^INT^1^59547,73881^0
QSCPKI(STRUCT,BOUCLE) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N BASE,MSG,I,LIEN,LIEN1,PILE,INTERD,STACK,CTR,R,STRUCT1,MACRO,ATLIEN
 S PILE="STACK"
 S MSG=""
 D CLEPAG^%VVIDEO,MES^%VLECFL2($$^%QZCHW("Quel est le nom du macro-individu que vous allez definir ? : "),.CTR,.MACRO)
 Q:((CTR'="")&(CTR'="F"))!(MACRO="") "Pas de macro individu"
 I $D(@STRUCT@(MACRO)) D POCLEPA^%VVIDEO S REP=$$CONFIRM^%VZEOUI($$^%QZCHW("Cet individu existe deja souhaitez vous le detruire ? ")) Q:REP=0 "Individu deja existant" K @STRUCT@(MACRO)
 S STRUCT1=$$CONCAS^%QZCHAD(STRUCT,MACRO)
 D INITFI^%QCASTA(PILE)
 S BASE=$$NOMINT^%QSF($$REP^%QSGES14)
 I BASE="" S MSG="Pas de repertoire de reference" D ^%VZEAVT($$^%QZCHW(MSG)) K @STRUCT@(MACRO) Q MSG
 S MSG=$$INIT($$CONCAS^%QZCHAD(STRUCT1,"S,"_BASE),BASE)
 I MSG'="" D ^%VZEAVT($$^%QZCHW(MSG)) K @STRUCT@(MACRO) Q MSG
 S @STRUCT1@("BS")=BASE S:'(BOUCLE) INTERD(BASE)=""
 D PUSH^%QCASTA(PILE,BASE)
 F I=0:0 Q:$$PILEVIDE^%QCASTA(PILE)!(MSG'="")  D T
 K @(PILE) K:MSG'="" @STRUCT@(MACRO)
 Q MSG
T S LIEN=$$POP^%QCASTA(PILE)
 D PUSH^%QCASTA(PILE,LIEN)
 
 
 S ATLIEN=$$^%QSGES16(LIEN,.INTERD)
 S LIEN1=$$REPD^%QSGEL2(LIEN,ATLIEN)
 I LIEN1="" S LIEN=$$POP^%QCASTA(PILE) Q
 S MSG=$$INIT($$CONCAS^%QZCHAD(STRUCT1,"S,"_LIEN1),LIEN1)
 I MSG'="" D ^%VZEAVT($$^%QZCHW(MSG)) Q
 S @STRUCT1@("S",LIEN,"R",ATLIEN)=LIEN1 S:'(BOUCLE) INTERD(LIEN1)=""
 
 
 D PUSH^%QCASTA(PILE,LIEN1)
 Q
INIT(STRUCT,BASE) 
 N R,LILA,REP,BASED
 S @STRUCT@("LO")=$$NOMLOG^%QSF(BASE)
 Q ""
TEST S BOUCLE=0,STRUCT="^DAT(""XX"")"
 S MSG=$$^%QSCPKI(STRUCT,BOUCLE)
 Q:MSG'=""
 Q
INT(MODEL) 
 N CHOIX
 D CLEPAG^%VVIDEO S CHOIX=$$^%VZECH2("","Macro individu","transformation inter repertoire")
 I CHOIX["CTR" D CLEPAG^%VVIDEO Q
 I CHOIX["Macro" D MACRO,CLEPAG^%VVIDEO Q
 D TRANS,CLEPAG^%VVIDEO
 Q
MACRO S BOUCLE=0,STRUCT=$$CONCAS^%QZCHAD("^RQSMOD7",MODEL_",MI")
 S MSG=$$^%QSCPKI(STRUCT,BOUCLE)
 Q
TRANS S BOUCLE=0,STRUCT=$$CONCAS^%QZCHAD("^RQSMOD7",MODEL_",TR")
 S MSG=$$^%QSCOPIN(STRUCT,BOUCLE)
 Q

