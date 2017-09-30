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

;TO6ACQPA^INT^1^59547,74871^0
TO6ACQPA ;
 
LOOP S CMS=0,SCR="RECHSCR",TABCOM="^[QUI]ANTETUDE",%DRES=0
 D CLEPAG^%VVIDEO,POCLEPA^%VVIDEO W $$^%QZCHW("Saisie d'une gamme de : ") S DX=$X D ^%VLEC G:(CTRLA=1)!((CTRLF=1)!(Y1="")) FS S YA=Y1 S:$D(^[QUI]ACOMMEB(YA)) YA=$P(^[QUI]ACOMMEB(YA),"^",1) G:'($D(^[QUI]EXPLICI(YA))) LOOP S (%EXPERT,YB)=Y1 D ^TO4GEXPL
ACTIV D ^TO4ACTIS G FS:ABENDSCR=1 D ^TO6CUMPA
 D POCLEPA^%VVIDEO W $$^%QZCHW("Un instant...")
 S NUF=-1 F UU=0:0 S NUF=$N(^[QUI]ANTETUDE(%EXPERT,NUF)) G:NUF=-1 AJ S KN=-1 F VV=0:0 S KN=$N(^[QUI]ANTETUDE(%EXPERT,NUF,KN)) Q:KN=-1  I ^[QUI]ANTETUDE(%EXPERT,NUF,KN)=IDENTCO S NUFA=NUF G MOD
FS S DX=0,DY=23 X XY U 0 Q
AJ D ^TO6POP S ^[QUI]ANTETUDE(%EXPERT,NUFA,0)=IDENTCO,MODGP="A"
MOD S MODGP="M" D ^%AB3STAR,132^%VVIDEO,^TO6GPHAS,80^%VVIDEO G LOOP

