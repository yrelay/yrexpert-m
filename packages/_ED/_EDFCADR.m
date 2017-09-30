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

;%EDFCADR^INT^1^59547,73869^0
EDFCADRE(A,C) 
 
 
 
 
 N %FONC,%9O,O,POS,%9X1,X1,%9X2,X2,%9Y1,Y1,%9Y2,Y2
 S X1=$$SUBST^%ANARBR2($$RED^%ANA(A,1),.C,"AFF^%EDFTRAI",.POS) Q:'(POS)
 S Y1=$$SUBST^%ANARBR2($$RED^%ANA(A,2),.C,"AFF^%EDFTRAI",.POS) Q:'(POS)
 S X2=$$SUBST^%ANARBR2($$RED^%ANA(A,3),.C,"AFF^%EDFTRAI",.POS) Q:'(POS)
 S Y2=$$SUBST^%ANARBR2($$RED^%ANA(A,4),.C,"AFF^%EDFTRAI",.POS) Q:'(POS)
 S O=$$^%QSCALIN(C("%","BASE"),C("%","OBJET"),"%ORIENTATION",1)
 Q:(O'="VERTICALE")&(O'="HORIZONTALE")
 S %FONC="SEGMENT"
 D XY^%EDFTRAI(X1,Y1,O,.%9X1,.%9Y1),XY^%EDFTRAI(X1+X2,Y1,O,.%9X2,.%9Y2),^%PBPZ
 D XY^%EDFTRAI(X1+X2,Y1,O,.%9X1,.%9Y1),XY^%EDFTRAI(X1+X2,Y1+Y2,O,.%9X2,.%9Y2),^%PBPZ
 D XY^%EDFTRAI(X1+X2,Y1+Y2,O,.%9X1,.%9Y1),XY^%EDFTRAI(X1,Y1+Y2,O,.%9X2,.%9Y2),^%PBPZ
 D XY^%EDFTRAI(X1,Y1+Y2,O,.%9X1,.%9Y1),XY^%EDFTRAI(X1,Y1,O,.%9X2,.%9Y2),^%PBPZ
 Q

