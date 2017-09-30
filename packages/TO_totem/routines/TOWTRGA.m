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

;TOWTRGA^INT^1^59547,74877^0
TOWTRGA ;
 
BEG D POCLEPA^%VVIDEO S PDL=$$L23^%QSLIB2("(S)uppression, (CTRLG) Gomme") W PDL," " S DX=0,PY=8
DEB S MPASX=0,MPASY=1,NXI=-1,NXS=79,NYI=8,NYS=22,%9NSUP=0
DEB1 S DY=PY+1 S:DY>20 (DY,PY)=20 S DX=0 X XY D ^%VZECUR G:(X1=1)!(X1=6) END S PY=$Y
 G:'($D(^POSENR($I,PAGE,PY))) DEB1 G:X1=7 GOM G:X1'=83 DEB1
 S X1=$C(X1),%9OX1=X1 W X1
 S %9OBJ=^POSENR($I,PAGE,PY),PLC=1 F %IT="%AL","%ET","%LA","%EP" S @%IT=$P(%9OBJ,"^",PLC),PLC=PLC+1
 I X1="S" S ^COMPILVU($I,PAGE,PY)=%AL_"^"_%ET_"^"_%LA_"^"_%EP,%9QUIT=1 D AFF2^TOWSEEGA,NORM^%VVIDEO G DEB1
GOM K ^COMPILVU($I,PAGE,PY) W " " S %9QUIT=1 D NORM^%VVIDEO,AFF2^TOWSEEGA G BEG
END K MPASX,MPASY,NXI,NXS,NYI,NYS,%9NSUP,X1,%IT,%AL,%ET,%LA,%EP Q

