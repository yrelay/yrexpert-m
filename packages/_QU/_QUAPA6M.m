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

;%QUAPA6M^INT^1^59547,73884^0
QUAPA6M ;
 
 
 
 
UN7 I ((MODE=2)!(MODE=1))&('(^Z($J,Z,"MAN"))) G UN131^%QUAPA5M
 I '(^Z($J,Z,"MAN")) D ^%VSQUEAK G UN0^%QUAPA5M
 D UNSUP^%QUAPA6M(V)
 G GO2^%QUAPA5M
UN8 D ^%QUAPAHM
 G UN18^%QUAPA5M
UN9 I '(^Z($J,Z,"MAN")) D ^%VSQUEAK G UN0^%QUAPA5M
XX D M("") W $$NOMLOG^%QSF(B)," : " S DX=$X,DY=$Y D ^%VLEC I CTRLA!(Y1="") D M("") G UN0^%QUAPA5M
 S INDICE=$$FUTURI^%QSGE11(^Z($J,Z,"LIS"),Y1)
 I ('(T))&$D(@A@(Y1)) D ^%VZEAVT($$NOMLOG^%QSF(B)_$$^%QZCHW(" deja dans la liste...")) G XX^%QUAPA5M
 I T,$D(@A@(INDICE)) D ^%VZEAVT($$NOMLOG^%QSF(B)_$$^%QZCHW(" deja dans la liste...")) G XX^%QUAPA5M
 D UNAJ(Y1)
 G GO2^%QUAPA5M
 
UNSUP(V) 
 D M("Suppression en cours ... un instant")
 D ELIMI^%QSGES11(^Z($J,Z,"LIS"),V)
 D INIT2^%QUAPA7M,AFFICH^%QUAPAGM,M("")
 Q
 
UNAJ(Y1) 
 D M("Ajout en cours ... un instant")
 D STOCK^%QSGES11(^Z($J,Z,"LIS"),Y1)
 D INIT2^%QUAPA7M,AFFP^%QUAPAGM(Y1),AFFICH^%QUAPAGM,M("")
 Q
 
M(M) D POCLEPA^%VVIDEO W $$^%QZCHW(M) Q

