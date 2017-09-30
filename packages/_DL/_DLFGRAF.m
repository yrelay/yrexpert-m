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

;%DLFGRAF^INT^1^59547,73867^0
DLFGRAF ;
 
 
 
 
 
 
 
DEF 
 N CTRLA,Y1,%FLU
FLU D CLEPAG^%VVIDEO,^%VZCD(0,39,0,4,1,0,$$^%QZCHW("GESTION FORMAT DE FLUX"))
 
 D CARSP^%VVIDEO(10,10,3,40,1)
 S DX=12,DY=11 X XY W $$^%QZCHW("Format de flux")," : " S DX=$X,DY=$Y D ^%VLEC Q:(CTRLA=1)!(Y1="")
 I Y1'="?" S %FLU=Y1 G DES
 S %FLU=$O(^[QUI]DLFLUX(""))
 I (%FLU="")!(%FLU="z") D ^%VZEAVT($$^%QZCHW("Aucun schema de flux")) G FLU
 S %FLU=$$SELECT^%QSGEST6("^[QUI]DLFLUX",$$^%QZCHW("Choisissez un schema"))
 G:%FLU="" FLU
DES D ^%DLFPLAC
 Q
 
 
 
SUP 
 N %FLU,Y1,CTRLA
SAI 
 D CLEPAG^%VVIDEO,^%VZCD(0,39,0,4,1,0,$$^%QZCHW("SUPPRESSION D'UN FLUX"))
 D CARSP^%VVIDEO(10,10,3,60,1)
 S Y1=""
L1 S DX=12,DY=11 X XY W $$^%QZCHW("Format de flux")," : "
 S DX=$X,DY=$Y W $J("",$L(Y1)) X XY D ^%VLEC Q:(CTRLA=1)!(Y1="")
 I Y1'="?" S %FLU=Y1 G S
 S %FLU=$O(^[QUI]DLFLUX(""))
 I (%FLU="")!(%FLU="z") D ^%VZEAVT($$^%QZCHW("Aucun schema de flux")) G L1
 S %FLU=$$SELECT^%QSGEST6("^[QUI]DLFLUX",$$^%QZCHW("Choisissez un schema"))
 G:%FLU="" SAI
 
S I '($D(^[QUI]DLFLUX(%FLU))) D ^%VZEAVT($$^%QZCHW("Format inconnu")) G SAI
 D POCLEPA^%VVIDEO I $$CONFIRM^%VZEOUI($$^%QZCHW("Voulez-vous toujours detruire le format")_" "_%FLU_" ? ")'=1 D POCLEPA^%VVIDEO Q
 D POCLEPA^%VVIDEO W $$^%QZCHW("OK format")," ",%FLU," ",$$^%QZCHW("detruit")," ..." H 2
 K ^[QUI]DLFLUX(%FLU)
 D POCLEPA^%VVIDEO
 Q
 
TRANS 
 N %F,F
 S F=""
 F %F=0:0 S F=$O(^[QUI]PLPOINTS(F)) Q:(F="")!(F="z")  D GLOCOP^%QCAGLC($$CONCAS^%QZCHAD("^[QUI]PLPOINTS",F),$$CONCAS^%QZCHAD("^[QUI]DLFLUX("""_F_""")","POINTS"))
 S F=""
 F %F=0:0 S F=$O(^[QUI]PLTEXTE(F)) Q:(F="")!(F="z")  D GLOCOP^%QCAGLC($$CONCAS^%QZCHAD("^[QUI]PLTEXTE",F),$$CONCAS^%QZCHAD("^[QUI]DLFLUX("""_F_""")","TEXTE"))
 S F=""
 F %F=0:0 S F=$O(^[QUI]PLPOSQUA(F)) Q:(F="")!(F="z")  D GLOCOP^%QCAGLC($$CONCAS^%QZCHAD("^[QUI]PLPOSQUA",F),$$CONCAS^%QZCHAD("^[QUI]DLFLUX("""_F_""")","POSQUA"))
 S F=""
 F %F=0:0 S F=$O(^[QUI]PLFLUX(F)) Q:(F="")!(F="z")  D GLOCOP^%QCAGLC($$CONCAS^%QZCHAD("^[QUI]PLFLUX",F),$$CONCAS^%QZCHAD("^[QUI]DLFLUX("""_F_""")","FLUX"))
 Q

