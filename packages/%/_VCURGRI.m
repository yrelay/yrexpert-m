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

;%VCURGRI^INT^1^59547,74034^0
GECURGRI(IK,COD) 
 K VU G 60:$D(^GCURGRIL($I,SCR))
 S IK=$S((COD=65)!(COD=68):IK-1,1:IK+1) G FIN
60 S AX=^%SCRE(SCR,IK,2),AY=^%SCRE(SCR,IK,3) G @COD
66 S AX=AX-1
661 S %DIFL=1,AY=$O(^GCURGRIL($I,SCR,AY)) G:AY="" 661 S AX=$S($O(^GCURGRIL($I,SCR,AY,AX))="":"",1:AX)
67 S %DIFL=1,AX=$O(^GCURGRIL($I,SCR,AY,AX)) G:AX="" 661 G DIR
65 S AX=AX+1
651 S %DIFL=-1,AY=$ZP(^GCURGRIL($I,SCR,AY)) G:AY="" 651 S AX=$S($ZP(^GCURGRIL($I,SCR,AY,AX))="":"",1:AX)
68 S %DIFL=-1,AX=$ZP(^GCURGRIL($I,SCR,AY,AX)) G:AX="" 651 G DIR
DIR S IK=^GCURGRIL($I,SCR,AY,AX) G:$D(VU(IK)) REF S VU(IK)=1 I $D(PATOUCH(IK)),PATOUCH(IK)=1 G 67:%DIFL=1,68
 I $D(^%SCRE(SCR,IK,"INVISIBLE")) G 67:%DIFL=1,68
FIN K VU Q IK
REF K VU Q 0
INIT() K VU S IK=1 I $D(PATOUCH(IK)),PATOUCH(IK)=1 S VU(IK)=1,COD=67 G 60
 I $D(^%SCRE(SCR,IK,"INVISIBLE")) S COD=67 G 60
 G FIN

