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

;TONAUTOP^INT^1^59547,74873^0
TONAUTOP ;
 
 S BLOCPH=0,RBL="("""_YA_""","""_PH_""","""_OP_""","""_SEC_""","""_COND_""")"
 S (COUTOT,DURTOT)=0,GYA=$P($P(^[QUI]FORMULE(YA,PH,OP,SEC,COND),"^",17),":",1),USER=$P(GYA,"[",2) S:USER'="" USER=$P(USER,"]",1),GYA=$P(GYA,"]",2) S YASSET=GYA,GYA=GYA_":"
 S US=$S(USER="":QUI,$D(^TABIDENT(USER,$$^%QZCHW("MACHINE"))):^TABIDENT(USER,$$^%QZCHW("MACHINE")),1:QUI)
 I $D(^PHASADM($I,NUFA,TWREF,"BLOPH",RBL)) K ^BLOC($I) S ^SAVE($I,"OK")=1,BLOCPH=1,^BLOC($I,1)=NUFA_"^"_TWREF_"^OP^^"_PH_"^"_OP_"^"_OG_"^"_^[QUI]TVPAR(NUFA,TWREF,$$^%QZCHW("QUANTITE")),^BLOC($I,3)=^PHASADM($I,NUFA,TWREF,"BLOPH",RBL) D ^TONGETBL G FIN
 I ('($D(^[US]EXPLICI(YASSET))))&(('($D(^[US]IMPLICI(YASSET))))&(('($D(^[US]ESSABAC(YASSET))))&('($D(^[US]PHASE(YASSET)))))) G FIN
 S BLOCPH=1 D EXBLO G:%ABEND=1 FIN K BLOC($I) S ^BLOC($I,1)=NUFA_"^"_TWREF_"^OP^"_USER_"^"_PH_"^"_OP_"^"_OG_"^"_^[QUI]TVPAR(NUFA,TWREF,$$^%QZCHW("QUANTITE")),^BLOC($I,2)=GYA G GBLOC^TONAUTPH
FIN K NBL,GYA Q
DEB21 S TWREF=0,^V($I,YA,$$^%QZCHW("QUANTITE"))=QTTE,^[QUI]UNITE(YA,$$^%QZCHW("QUANTITE"))="",^[QUI]TREEWORK(NUFA,0)=YA_"^"_YB_"^"_QTTE,^[QUI]TVPAR(NUFA,TWREF,$$^%QZCHW("QUANTITE"))=QTTE G FIN
START I '(DTM) K (%ZD,MCM,COUNT,FF,MA,PIM,PIMEN,QUI,WHOIS,SUB,%PROGEX) G START0
 S TAB125=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB125") K @(TAB125)
 F I="%ZD","MCM","COUNT","FF","MA","PIM","PIMEN","QUI","WHOIS","SUB","%PROGEX","TAB125" S @TAB125@(I)=""
 D KEXMEM^%QCAMEM(TAB125) K TAB125
START0 D VARSYS^%QCSAP G FIN
EXBLO K DON S TACP="^[QUI]BLOCOPER("""_YA_""","""_PH_""","""_OP_""","""_SEC_""","""_COND_""")"
 
 S NUEX=-1 F WWE=0:0 S NUEX=$N(@TACP@(NUEX)) Q:NUEX=-1  D AFF Q:%ABEND=1
END K TACP,WWE,NUEX,DON Q
AFF S $ZT=^TOZE($I,"A")
RETERR S AFFECT=@TACP@(NUEX) I AFFECT="" S DON(NUEX)=AFFECT G GYA
 S @("DON(NUEX)="_AFFECT)
GYA S GYA=GYA_DON(NUEX)_"/" Q
 ;

