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

;TOCHRES1^INT^1^59547,74871^0
TOCHRESE ;
 
 K ^ROUAUT($J) S DX=0,DY=6 D CLEBAS^%VVIDEO F %RR=1:1 S LG=$T(RES+%RR),LG=$P(LG,";;",2) Q:LG="*"  D AFF
CH S TOUS=0 D POCLEPA^%VVIDEO W $$^%QZCHW("VOTRE CHOIX ( ex:1,3,4 (ou (T)ous:1,3,4,6,7,8,9)) : ") S DX=$X D ^%VLEC G:CTRLA!CTRLF FIN G:Y1="" CH I Y1=$$^%QZCHW("T") S TOUS=1,Y1="" F %ZZ=1,3,4,6,7,8,9 S Y1=Y1_%ZZ_","
 S NOK=0 F PLC=1:1 S PCH=$P(Y1,",",PLC) Q:PCH=""  D TR G:NOK CH
FIN D CLEPAG^%VVIDEO K RO,LG,%RR,Y1,PLC,NOK,ISNUM,PCH Q
AFF I $P(LG,"~",2)="" G AFFI
 S TEST=$P(LG,"~",2) I @TEST=1 G AFFI
 Q
AFFI W !,?5,%RR,"   ",$P(LG,"~",1) Q
TR D TO^%QZNBN1 I '(ISNUM) D ^%VSQUEAK S NOK=1 Q
 S PCH=PCH*1 I (PCH'>0)!(PCH'<%RR) D ^%VSQUEAK S NOK=1 Q
 S NOK=0,RO=$T(ROUT+PCH),RO=$P(RO,";;",2),^ROUAUT($J,PCH)=RO Q
RES 
 ;;Composants
 ;;Valeurs des parametres
 ;;Valeurs des parametres par ordre d'evaluation
 ;;Parametres non evalues
 ;;Resultats matieres~^TOZE($I,"MATIERE")
 ;;Resultats matieres par ordre d'evaluation~^TOZE($I,"MATIERE")
 ;;Parametres machines~^TOZE($I,"MACHINE")
 ;;Gammes de fabrication~^TOZE($I,"PHASE")
 ;;Recapitulatifs des durees et des couts a l'unite
 ;;*
ROUT 
 ;;TO3RESNO
 ;;TO3RESUM
 ;;TORESOEV
 ;;TO3PNOEV
 ;;TO3RESMA
 ;;TOMATOEV
 ;;TOPARMAC
 ;;TO3RESPH
 ;;TORESDCT

