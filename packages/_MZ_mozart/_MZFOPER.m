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

;%MZFOPER^INT^1^59547,73871^0
MOZFOPER ;
 
RFSH S OK=1 S:'($D(%TAB)) %TAB=0 Q:%TAB=0  S @%TT@($J,0,EDCL)=XOP_"^"_X,%TAB=0,YA="MOZ" D ^%MZANAL I '(OK) S EDCL=$N(@%TT@($J,0,-1)) G END
 S %V1=$ZP(^U($J,0,"")),EDCL=(%V1\1)+1,LC=EDCL
 S %L="" F %U=1:1 S %L=$ZP(@%TT@($J,0,%L)) Q:%L=""  S X=$P(@%TT@($J,0,%L),"^",2,999) Q:(X'="")&((X'="u2")&((X'="u3")&(X'="u0")))  K @%TT@($J,0,%L)
 S %L=-1 F %U=1:1 S %L=$N(@%TT@($J,0,%L)) Q:%L=-1  S X=@%TT@($J,0,%L),XOP=$P(X,"^",1),X=$P(X,"^",2,999) I (X'="u2")&((X'="u3")&(X'="u0")) S ^U($J,0,LC)=XOP_"^"_X,^U($J,0,LC,0)=%V1,%V1=LC,LC=LC+1
 S %L=-1 F %U=1:1 S %L=$N(^W2($J,0,%L)) Q:%L=-1  S X=^W2($J,0,%L),XOP=$P(X,"^",1),X=$P(X,"^",2,999),^U($J,0,LC)=XOP_"^"_X,^U($J,0,LC,0)=%V1,%V1=LC,LC=LC+1
 S %TT="^U",%TAB=0 K ^REF($J) I '($D(@%TT@($J,0))) S @%TT@($J,0,1)="^",@%TT@($J,0,1,0)="",EDCL=1 G END
 S EDCL=$ZP(^U($J,0,""))
END S X=@%TT@($J,0,EDCL),XOP=$P(X,"^",1),X=$P(X,"^",2,999),EDN=@%TT@($J,0,EDCL,0),EDP=$L(X)+1,EDFL=1 D STAT1^%MZWORD I '(OK) S %TAB=1,DX=0,DY=23 X XY D BLD^%VVIDEO,BLK^%VVIDEO,REV^%VVIDEO W " Refus " D NORM^%VVIDEO
 D RF^%MZED Q

