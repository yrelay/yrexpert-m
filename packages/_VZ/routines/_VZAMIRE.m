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

;%VZAMIRE^INT^1^59547,74036^0
VVZAMIRE ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
MIRE(MODE,%LIXG,%LIXD,%LIYH,%LIYB,POSITCUR,A,DX,DY,X1) 
 N DDX,DDY,DXB,DYB,ODX,ODY,PX,PY,X2,X3,NX,NY
 D ^%VCREA04(MODE,.A,POSITCUR) Q
 
ZMIRE(MODE,POSITCUR,A,DX,DY) 
 N %LIXG,%LIXD,%LIYH,%LIYB,X1
 S %LIXG=0,%LIXD=79,%LIYH=0,%LIYB=23
 D MIRE(MODE,%LIXG,%LIXD,%LIYH,%LIYB,POSITCUR,.A,.DX,.DY,.X1)
 Q
 
MARE(MODE,POSITCUR,A,DX,DY,X1) 
 N %LIXG,%LIXD,%LIYH,%LIYB
 S %LIXG=0,%LIXD=79,%LIYH=0,%LIYB=23
 D MIRE(MODE,%LIXG,%LIXD,%LIYH,%LIYB,POSITCUR,.A,.DX,.DY,.X1)
 Q
 
POSIT(MODE,POSITCUR,A,DX,DY,X1) 
 N %LIXG,%LIXD,%LIYH,%LIYB,DDX,DDY,DXB,DYB,ODX,ODY,PX,PY,X2,X3,NX,NY
 S %LIXG=0,%LIXD=79,%LIYH=0,%LIYB=23
 D POSIT^%VCREA04(MODE,POSITCUR,.A,.DX,.DY)
 Q

