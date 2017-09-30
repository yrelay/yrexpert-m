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

;%PBEL26^INT^1^59547,73873^0
PTEL26 ;
 Q:'(AFF)  N AD,AF,AN,ATT,I,J,PA,PAR,PC,PD,R,RA,S,SN,SY,TL,X,XA,XD,Y,YA,YD
 S J=2 F I="X","Y","R","AD","AF","TL","PD","PA","PC","AN","RA","S" S @I=$P(CH,"^",J),J=J+1
 G:((PD="")&(PA=""))&(PC="") OK
 S I=POINT(PD),XD=$P(I,"^",1),YD=$P(I,"^",2)
 S I=POINT(PA),XA=$P(I,"^",1),YA=$P(I,"^",2)
 S I=POINT(PC),X=$P(I,"^",1),Y=$P(I,"^",2)
 S AD=$$ANGLE^%PBCACV(X,Y,XD,YD)
 S AF=$$ANGLE^%PBCACV(X,Y,XA,YA)
 S R=$$DISTANCE^%PBCACV(X,Y,XD,YD)
OK 
 D CALXY^%PBCACV(X,Y,XT,YT,ROT,AGR,.X,.Y)
 S AD=$$A^%PBCACV(AD,ROT)
 S AF=$$A^%PBCACV(AF,ROT)
 S R=$$D^%PBCACV(R,AGR)
 
 D ARC^%PBMFN(X,Y,R,AD,AF,0,TL,0) Q

