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

;TO42ACQC^INT^1^59547,74870^0
TO32ACQC ;
 
LOOP S CMS=0,SCR="RECHSCR",TABCOM="^[QUI]REFANTET",%DRES=0
 D CLEPAG^%VVIDEO,POCLEPA^%VVIDEO W $$^%QZCHW("Recherche de : ") S DX=$X D ^%VLEC G:(CTRLA=1)!((CTRLF=1)!(Y1="")) FS S YA=Y1 S:$D(^[QUI]ACOMMEB(YA)) YA=$P(^[QUI]ACOMMEB(YA),"^",1) G:'($D(^[QUI]EXPLICI(YA))) LOOP S (%EXPERT,YB)=Y1 D ^TO4GEXPL
ACTIV D ^TO4ACTIS G FS:ABENDSCR=1
DESAC D CLEPAG^%VVIDEO S DX=0,DY=10 X XY W $$L15^%QSLIB,!,!,"- " S DY=DY+2,DX=$X D ^%VLEC G LOOP:CTRLA=1,ACTIV:CTRLF=1 S:Y1="" Y1=0 S %DESAC=Y1
 D LOOP2,CLEPAG^%VVIDEO S DX=0,DY=10 X XY W $$^%QZCHW("Recherche en cours....") D ^TO32GEQU,^TO4EDICO W !,!,"RETURN" R *RET D CLEPAG^%VVIDEO G ACTIV
FS S DX=0,DY=23 X XY U 0 Q
LOOP2 
 S NUM=-1 K ^V($I,YA) F UU=0:0 S NUM=$N(^TO4GEXPL($I,NUM)) Q:NUM=-1  S ^V($I,YA,^TO4GEXPL($I,NUM))=RESUL(NUM)
 Q
FIN Q
ECR D CLEPAG^%VVIDEO W $$^%QZCHW("Solutions admissibles : "),! S NU=-1 F UU=0:0 S NU=$N(^EQUIVAL($I,NU)) Q:NU=-1  W !,$P(^EQUIVAL($I,NU),"^",1),!,?10,$$^%QZCHW("Nombre de desaccords : "),$P(^EQUIVAL($I,NU),"^",2) D:$D(^DESACOR($I,NU)) EXP
 G FIN
EXP W $$^%QZCHW(" sur : ") F VV=1:1 S VD=$P(^DESACOR($I,NU),"^",VV) Q:VD=""  W "/",VD
 G FIN

