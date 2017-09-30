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

;%PBEL21^INT^1^59547,73873^0
PTEL21 ;
 Q:'(AFF)  N GR,I,IN,J,K,PC,PD,PR,R1,R2,S,TL,X,XC,XD,XO,Y,YC,YD,YO
 S J=2 F K="X","Y","PR","GR","I","TL","PD","PO","PC","R1","R2","IN","S" S @K=$P(CH,"^",J),J=J+1
 G:(R1="")&(R2="") OK
 G:R1="" 2
1 
 S J=POINT(PC),X=$P(J,"^",1),Y=$P(J,"^",2)
 S PR=$$VAL^%PBEL2(NUFA,TWREF,R1,ME,.STOP) Q:(PR="")!STOP
 S GR=$$VAL^%PBEL2(NUFA,TWREF,R2,ME,.STOP) Q:(GR="")!STOP
 S I=$$VAL^%PBEL2(NUFA,TWREF,IN,1000,.STOP) Q:(I="")!STOP
 G OK
2 
 S J=POINT(PD),XD=$P(J,"^",1),YD=$P(J,"^",2)
 S J=POINT(PO),XO=$P(J,"^",1),YO=$P(J,"^",2)
 S X=$P((XD+XO)/2,".",1),Y=$P((YD+YO)/2,".",1)
 S PR=$P($$DISTANCE^%PBCACV(XD,YD,XO,YO)/2,".",1)
 S GR=$$VAL^%PBEL2(NUFA,TWREF,R2,ME,.STOP) Q:(GR="")!STOP
 S I=$$ANGLE^%PBCACV(X,Y,XD,YD)
 G OK
 
OK D CALXY^%PBCACV(X,Y,XT,YT,ROT,AGR,.X,.Y)
 S PR=$$D^%PBCACV(PR,AGR)
 S GR=$$D^%PBCACV(GR,AGR)
 S I=$$A^%PBCACV(I,ROT)
 
 D DEMIE^%PBMFN(X,Y,PR,GR,I,0,TL,0) Q

