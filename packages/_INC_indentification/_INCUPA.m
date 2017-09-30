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
;! Nomprog     : %INCUPA                                                      !
;! Module      : SYS                                                          !
;! But         : Gestion des mots de passe                                    !
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

;%INCUPA^INT^1^59547,73870^0
ZPASS ;
 
 
 
 D ECHOFF^%VVIDEO,ZD^%QMDATE4 S B=$P(%DAT,"/",3)_$P(%DAT,"/",2)_$P(%DAT,"/",1)_".1",PC=$ZP(^MODEPAS(WHOIS,B)) I PC="" D POCLEPA^%VVIDEO W $$^%QZCHW("Desole ! Acces momentanement interdit.. Renseignez-vous"),$$^%QZCHW(" [RETURN] ") R *PC:60 G QE
 S B=$P(^MODEPAS(WHOIS,PC),"^",1),PC=$E(PC,5,6)_"/"_$E(PC,3,4)_"/"_$E(PC,1,2),PS1=0
PAS1 S PS1=PS1+1 G:PS1>3 QE D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Mot de passe svp.. ") R PS:^TOZE($I,"ATTENTE") S:$A(PS)<32 PS="?" G QI:PS=B,QE:PS="?" I PS1=2 D POCLEPA^%VVIDEO W $$^%QZCHW("Nouveau mot de passe depuis le "),PC,$$^%QZCHW(" [RETURN] ") R *PS:60
 G PAS1
QE S B="???" K PS1,PS D ECHON^%VVIDEO Q
QI K PS1,PS D ECHON^%VVIDEO Q
FIX(B,XX,YY,OK) 
 S NB=0,OK=0 D ECHOFF^%VVIDEO
BEG S NB=NB+1 G:NB>3 FFI S DX=XX,DY=YY X XY W $$^%QZCHW("Mot de passe")_" : " R Y1:^TOZE($I,"ATTENTE") G:Y1="" FFI D:Y1'=B ^%VSQUEAK G BEG:Y1'=B S OK=1
FFI S:'($D(Y1)) Y1="" S DX=XX,DY=YY X XY W $J("",$L($$^%QZCHW("Mot de passe"))+3) D ECHON^%VVIDEO Q
 
 ;; fonction
FIX2(B,XX,YY) 
 N OK
 S NB=0,OK=0 D ECHOFF^%VVIDEO
BEG2 S NB=NB+1 G:NB>3 FFI2 S DX=XX,DY=YY X XY W $$^%QZCHW("Mot de passe")_" : " R Y1:^TOZE($I,"ATTENTE") G:Y1="" FFI2 D:Y1'=B ^%VSQUEAK G BEG2:Y1'=B S OK=1
FFI2 S:'($D(Y1)) Y1="" S DX=XX,DY=YY X XY W $J("",$L($$^%QZCHW("Mot de passe"))+3) D ECHON^%VVIDEO
 Q OK

