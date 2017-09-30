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

;%DLJCOMP^INT^1^59547,73868^0
DLJCOMP ;
 I '($$CONF^%DLCON1) Q
 N ARTI,TBA,WB1,WB2,WB3,WB4,ERRTOT,GLOERR,NOER,MESERR,VISU
 D CLEPAG^%VVIDEO,^%VZCD0("COMPREHENSION DES JALONS")
 S GLOERR=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"ERR"),VISU=0
 K @(GLOERR)
 S @GLOERR@(1)=" "
 S NOER=1
 S ERRTOT=0
 D ^%QCAGLK("^[QUI]ADLJ")
 D ^%QCAGLK("^[QUI]CDLJ")
 D INIT^%DLJANAL
 S TBA="^[QUI]FLPLJ(WB1)"
 S WB1="",DX=6,DY=6
BOUC1 S WB1=$O(^[QUI]DLJ(WB1))
 G:WB1="" FIN
 S WB2="",ARTI=WB1
BOUC2 S WB2=$O(^[QUI]DLJ(WB1,WB2))
 G:WB2="" BOUC1
 S WB3=""
BOUC3 S WB3=$O(^[QUI]DLJ(WB1,WB2,WB3))
 G:WB3="" BOUC2
 S WB4=""
BOUC4 S WB4=$O(^[QUI]DLJ(WB1,WB2,WB3,WB4))
 G:WB4="" BOUC3
 S DY=DY+1
 I DY>21 S DY=6 X XY D CLEBAS^%VVIDEO
 X XY
 W WB1," ",WB2," ",WB3," ",WB4
 S DY=DY+1
 I DY>21 S DY=6 X XY D CLEBAS^%VVIDEO
 X XY
 W "      "_$$^%QZCHW("Valeur")
 S ERREUR=0
 D VAL^%DLJCPTI
 I ERREUR W " ",MESERR S NOER=NOER+1,@GLOERR@(NOER)=WB1_" "_WB2_" "_WB3_" "_WB4_" "_$$^%QZCHW("Valeur")_" -> "_MESERR,ERRTOT=1
 S WB5=""
BOUC5 S WB5=$O(^[QUI]DLJCOND(WB1,WB2,WB3,WB4,WB5))
 G:WB5="" BOUC4
 S DY=DY+1
 I DY>21 S DY=6 X XY D CLEBAS^%VVIDEO
 X XY
 W "      "_$$^%QZCHW("Conditions, page no")_" "_WB5
 S ERREUR=0
 D COND^%DLJCPTI
 I ERREUR W " ",MESERR S NOER=NOER+1,@GLOERR@(NOER)=WB1_" "_WB2_" "_WB3_" "_WB4_" "_$$^%QZCHW("Conditions, page no")_" "_WB5_" -> "_MESERR,ERRTOT=1
 G BOUC5
 
FIN D END^%DLJANAL
 S:'(ERRTOT) @GLOERR@(2)="     "_$$^%QZCHW("Pas d'erreur")
 D AFFERR^%QULIMZ(GLOERR,$$^%QZCHW("ERREURS DE COMPREHENSION"))
 K @(GLOERR)
 Q

