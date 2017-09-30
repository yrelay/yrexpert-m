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

;%SRTRSUP^INT^1^59547,73891^0
SRTRSUP(TYP) 
 
 
 
 
 
 
 N SA
CHS 
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Choisissez une definition de transfert"),0)
 S SA=$$UN^%PKCHOIX($$ADRS^%SRDESTI,20,3,17)
 Q:SA=""
 D SUP(SA,TYP)
 G CHS
 
SUP(SA,TYP) 
 N GLO,GR,I,NUM,TAB
 D ^%VZCDB($$^%QZCHW("Destruction de groupe de transfert"),0)
 I TYP="OK" S GLO=$$ADROK^%SRBATCH(SA)
 E  S GLO=$$ADRNOK^%SRBATCH(SA)
 I $$POCLE^%PKOUNO($$^%QZCHW("Voulez-vous detruire tous les groupes")_" ? ","N")=1 K @(GLO) G FS
 
 S TAB=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GROUP") K @(TAB)
 F I=0:0 S GR=$$CHGR Q:GR=""  S @TAB@(GR)=""
 I '($D(@TAB)) G FS
 I $$POCLE^%PKOUNO($$^%QZCHW("Confirmez-vous la suppression")_" ? ","N")'=1 G FS
 
 S GR=""
 F I=0:0 S GR=$O(@TAB@(GR)) Q:GR=""  K @GLO@(GR)
 K @(TAB)
FS D POCLEPA^%VVIDEO
 Q
 
CHGR() 
 S NUM=$$NUM^%PKCHOIX(GLO,20,11,9,$$^%QZCHW("Date du transfert"),0)
 Q:NUM="" ""
 S GR=""
 F I=0:1 S GR=$O(@GLO@(GR)) Q:GR=""  I @GLO@(GR)=NUM Q
 Q GR
 
 
 
SUPGR(SA,GR) 
 N GL
 I $$POCLE^%PKOUNO($$^%QZCHW("Confirmez-vous la suppression")_" ? ","N")'=1 G FIN
 S GL=$$CONCAS^%QZCHAD($$ADROK^%SRBATCH(SA),GR) K @(GL)
 S GL=$$CONCAS^%QZCHAD($$ADRNOK^%SRBATCH(SA),GR) K @(GL)
FIN D POCLEPA^%VVIDEO
 Q

