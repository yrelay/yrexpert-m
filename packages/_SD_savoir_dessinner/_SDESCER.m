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

;%SDESCER^INT^1^59547,73889^0
SDESCER(XC,YC,XA,YA,TYPL,VIS,OK,OBLI) 
 
 
 
 
 N ATT,D,PA,PAR,PC,R,RA,SN,SY S OK=1
 S TYPL=$$TYPL^%SDEDEF($$ZSUBST^%QZCHSUB(TYPL,"""",""))
 D EFFBAS^%SDUMEN,AFFI^%SDUMEN(0,0,$$^%QZCHW("Pointez le centre du cercle avec la mire"))
L0 D ^%PBPZGRA S R=$$LOC^%PBMFN(.XC,.YC)
 I R=0,OBLI G L0
 D EFFBAS^%SDUMEN
 I R=0 S OK=0 Q
 D POINT^%PBMFN(XC,YC,0)
 D AFFI^%SDUMEN(0,0,$$^%QZCHW("Pointez un point du cercle avec la mire"))
L1 D ^%PBPZGRA S R=$$LOC^%PBMFN(.XA,.YA)
 I R=0,OBLI G L1
 D EFFBAS^%SDUMEN
 I R=0 D EFF1 S OK=0 Q
 S D=$P($$DISTANCE^%PBCACV(XC,YC,XA,YA),".",1)
 D CERCLE^%PBMFN(XC,YC,D,0,TYPL,VIS) H 2
 Q
EFF1 D POINT^%PBMFN(XC,YC,1) Q
EFF2 D POINT^%PBMFN(XA,YA,1) Q
EFF(XC,YC,XA,YA,TYPL,VIS) 
 N D S D=$P($$DISTANCE^%PBCACV(XC,YC,XA,YA),".",1)
 S TYPL=$$TYPL^%SDEDEF($$ZSUBST^%QZCHSUB(TYPL,"""",""))
 D ^%PBPZGRA
 D EFF1,EFF2,CERCLE^%PBMFN(XC,YC,D,1,"F",VIS),EFF^%PBP5EC(0)
 Q

