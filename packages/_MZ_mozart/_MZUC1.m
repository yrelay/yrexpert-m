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

;%MZUC1^INT^1^59547,73872^0
MOZUC1 ;
 
EXIS 
 S ICC=20,TAB(ICC)=" "_$$GE^%MZQS_" " D AFFIG
EXIS2 S:'($D(%AJM)) %AJM="A" I %AJM="C" G FIN
 I RESUL(IC)="" S REFUSE=1 G FIN
 I $D(^[QUI]MOZGARDE(RESUL(IC))) D POCLEPA^%VVIDEO W "Gamme deja existante...[RETURN]" R *X:^TOZE($I,"ATTENTE") D POCLEPA^%VVIDEO S REFUSE=2
 G FIN
DATI D ^%VYDAT G FIN:REFUSE=1 S ICC=IC,TAB(ICC)=$J("",$L(RESUL(IC))) D ^%VAFFICH S TAB(ICC)=$P(DAAT,"/",3)_$P(DAAT,"/",2)_$P(DAAT,"/",1) D ^%VAFFICH G FIN
 
POS 
 S (REFUSE,STOPUC)='($$POS^%QZNBN(RESUL(ICC))) D:REFUSE=1 ^%VZEAVT($$^%QZCHW("Le numero d 'operation doit avoir une valeur strictement positive")) G FIN
FIN K TAB Q
V1 ;;VISA.PREPARATEUR
 S VIS=$P($T(V1),";;",2) G VT
V2 ;;VISA.EMETTEUR
 S VIS=$P($T(V2),";;",2) G VT
V3 ;;VISA.CONTROLE
 S VIS=$P($T(V3),";;",2) G VT
V S VIS=RESUL(IC-3) I VIS="" S REFUSE=1 G FIN
VT I RESUL(IC)="" S REFUSE=1 G FIN
 I '($D(^[QUI]MOZSIGVI(VIS))) S REFUSE=1 G FIN
 D ^%INCUPA I B="???" S REFUSE=1 G FIN
 S RF=^[QUI]MOZSIGVI(VIS),%U=$L(RF,"^"),OK=0 F %W=1:1:%U S %V=$P(RF,"^",%W) I %V=RESUL(IC) S OK=1 Q
 I '(OK) S REFUSE=1
 G FIN
AFFIG D NORM^%VVIDEO S DX=0,DY=0 X XY D REV^%VVIDEO,^%VAFFICH,BLD^%VVIDEO S REFUSE=0,ICC=1 D NORM^%VVIDEO Q

