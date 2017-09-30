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

;%QSCOPIN^INT^1^59547,73881^0
QSCOPIN(STRUCT,BOUCLE) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N BASE,MSG,I,LIEN,LIEN1,PILE,INTERD,STACK,MACRO,STRUCT1,NOM,ATLIEN
 S PILE="STACK"
 S MSG=""
 D CLEPAG^%VVIDEO,MES^%VLECFL2($$^%QZCHW("Quel est le nom interne de la tranformation que vous allez definir ? : "),.CTR,.MACRO)
 Q:((CTR'="")&(CTR'="F"))!(MACRO="") "Pas de transformation"
 I $D(@STRUCT@(MACRO)) D POCLEPA^%VVIDEO S REP=$$CONFIRM^%VZEOUI($$^%QZCHW("Cet individu existe deja souhaitez vous le detruire ? ")) Q:REP=0 "Individu deja existant" K @STRUCT@(MACRO)
 S STRUCT1=$$CONCAS^%QZCHAD(STRUCT,MACRO)
 D CLEPAG^%VVIDEO,MES^%VLECFL2($$^%QZCHW("Quel est le nom affichable de la tranformation que vous allez definir ? : "),.CTR,.NOM)
 Q:((CTR'="")&(CTR'="F"))!(NOM="") "Pas de nom affichable"
 S @STRUCT1@("N")=NOM
 D INITFI^%QCASTA(PILE)
 S BASE=$$NOMINT^%QSF($$REP^%QSGES14)
 I BASE="" S MSG="Pas de repertoire de reference" D ^%VZEAVT($$^%QZCHW(MSG)) K @(STRUCT1) Q MSG
 S MSG=$$INIT($$CONCAS^%QZCHAD(STRUCT1,"S,"_BASE),BASE)
 I MSG'="" D ^%VZEAVT($$^%QZCHW(MSG)) K @(STRUCT1) Q MSG
 S @STRUCT1@("BS")=BASE S:'(BOUCLE) INTERD(BASE)=""
 D PUSH^%QCASTA(PILE,BASE)
 F I=0:0 Q:$$PILEVIDE^%QCASTA(PILE)!(MSG'="")  D T
 K @(PILE) K:MSG'="" @(STRUCT1) Q MSG
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
 D ^%VZEAVT($$^%QZCHW("Nom logique du repertoire destination"))
 S REP=$$REP^%QSGES14
 S BASED=$$NOMINT^%QSF(REP) I BASED="" Q "Nom du repertoire destination invalide"
 S @STRUCT@("BD")=REP
 S @STRUCT@("BDI")=BASED
 D POCLEPA^%VVIDEO W $$^%QZCHW("Tous les attributs de ")_$$NOMLOG^%QSF(BASE)
 S R=$$^%VZEOUI("N")
 I R=1 S @STRUCT@("TS")=1 Q ""
 I $$^%QMLILL(.LILA)=1 S @STRUCT@("TS")=0
 S @STRUCT@("LI")=LILA
 Q ""
CHL(BASE) 
 N LIST,LISTE,BASE2 S LISTE=""
 D PFEN^%QS0D,AFFICH^%QUAPAGM
SEL S LIST=$$UN^%QUAPAGM G:LIST="" STOP
 S LISTE=$$^%QSCALIN("L0",LIST,"ADRESSE",1)
 I LISTE="" D ^%VZEAVT($$^%QZCHW("Impossible de retrouver les individus de cette liste")) G SEL
 S BASE2=$$^%QSCALIN("L0",LIST,"BASE",1)
 I BASE2="" D ^%VZEAVT($$^%QZCHW("Impossible de retrouver le repertoire des individus")) G SEL
 I BASE'=BASE2 D ^%VZEAVT($$^%QZCHW("Les objets de cette base ne sont pas des ")_$$NOMLOG^%QSF(BASE)) G SEL
STOP Q LISTE
TEST S BOUCLE=0,STRUCT="^DAT(""LA"")"
 S MSG=$$^%QSCOPIN(STRUCT,BOUCLE)
 Q:MSG'=""
 S LISTE=$$CHL(@STRUCT@("BS"))
 Q:LISTE=""
 S BASE=@STRUCT@("BS")
 D ^%QSCOPY(LISTE,BASE,STRUCT)
 Q

