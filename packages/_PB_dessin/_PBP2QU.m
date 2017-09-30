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

;%PBP2QU^INT^1^59547,73874^0
%PBP2QU ;
 N U,X,Y,R,X1,X2,Y1,Y2,COS,SIN,ANGLE
 S U=%UU*10
 S X=$J((635E-5*%9X)*U,1,5)+%TRSLTX,Y=(%LIMY-%TRSLTY)-$J((%LIMYCM-(635E-5*%9Y))*U,1,5),R=$J((635E-5*%9R)*U,1,5)
 S COS=^COS($O(^COS(%9AD#360))),SIN=^SIN($O(^SIN(%9AD#360)))
 S X1=$J((R*COS)+X,1,5),Y1=Y+$J(R*SIN,1,5)
 S COS=^COS($O(^COS(%9AF#360))),SIN=^SIN($O(^SIN(%9AF#360)))
 S X2=$J((R*COS)+X,1,5),Y2=Y+$J(R*SIN,1,5)
 
 Q:ENVL(%TERM,"CRAYON")'="TENU"
 W "newpath ",X1," ",Y1," moveto ",X," ",Y," lineto stroke",!,"closepath",!,"newpath ",X2," ",Y2," moveto ",X," ",Y," lineto stroke",!,"closepath",!,"newpath",!,X," ",Y," ",R," ",%9AD," ",%9AF," arc stroke",!,"closepath",!
 S ENVL(%TERM,"X")=X,ENVL(%TERM,"Y")=Y Q

