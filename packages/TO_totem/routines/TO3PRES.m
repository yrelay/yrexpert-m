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
;! Nomprog     : TO3PRES                                                      !
;! Module      : TO3 (TOTEM version 3)                                        !
;! But         : Presentation du SF et de ses attributs                       !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!     SOURIS/ / /                                                            !
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

;TO3PRES^INT^1^59547,74870^0
TO3PRES ;
 
EFF Q:NUFA=($$^%QZCHW("Sous-etude ")_$I)  I $D(^TPRESV($I,"YBCOUR")) S DY=$P(^TPRES($I,^TPRESV($I,"YBCOUR")),"^",1),DX=$P(^TPRES($I,^TPRESV($I,"YBCOUR")),"^",2) X XY W ^TPRESV($I,"YBCOUR")
 S ^TPRESV($I,"LIPRES")=$S($D(^TPRESV($I,"LIPRES")):^TPRESV($I,"LIPRES"),1:14),^TPRESV($I,"COPRES")=$S($D(^TPRESV($I,"COPRES")):^TPRESV($I,"COPRES"),1:0) I '($D(^TPRES($I,YB))) G SUIT
 S DY=$P(^TPRES($I,YB),"^",1),DX=$P(^TPRES($I,YB),"^",2),MSG=YB D INVDEO^%VZEAVT
 G FIN
SUIT S LYB=$L(YB) I (^TPRESV($I,"COPRES")+LYB)>79 S ^TPRESV($I,"COPRES")=0,^TPRESV($I,"LIPRES")=^TPRESV($I,"LIPRES")+1 Q:^TPRESV($I,"LIPRES")>20
 S ^TPRES($I,YB)=^TPRESV($I,"LIPRES")_"^"_^TPRESV($I,"COPRES"),MSG=YB,DY=^TPRESV($I,"LIPRES"),DX=^TPRESV($I,"COPRES") D INVDEO^%VZEAVT W "/" S ^TPRESV($I,"COPRES")=(^TPRESV($I,"COPRES")+LYB)+2
FIN S ^TPRESV($I,"YBCOUR")=YB K MSG,LYB Q

