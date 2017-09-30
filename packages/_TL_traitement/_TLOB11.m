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

;%TLOB11^INT^1^59547,74030^0
%TLOB11 ;;04:03 PM  29 Oct 1993; ; 29 Oct 93  4:04 PM
 
 
 
 
 
 
 
 
SOLVE(IDEB,NBREG) 
 N VAL
 S VAL=$$RUN^%PSDKB2(V(IDEB),V(IDEB+1),V(IDEB+2),V(IDEB+3),0,1,.CXT)
 Q VAL
 
 
 
 
TRACER(IDEB,NBREG) 
 N Y
 I V(IDEB)="" D CLFEN^%VVIDEO(1,1,3,78) Q 1
 D ECR(V(IDEB),$S(NBREG>1:V(IDEB+1),1:1),$S(NBREG>2:V(IDEB+2),1:1),$S(NBREG>3:V(IDEB+3),1:1)) Q 1
 S Y="2,2\RLWY\1\\\"
 S Y(1)=$E(V(IDEB)_"                                                                        ",1,72)_"*"
 D ^%PKPOP
 Q 1
 
ECR(CH,XG,YH,CADRE) 
 S LG=78-XG,LCH=$L(CH)
 D REV^%VVIDEO
 I CADRE D CARSA^%VVIDEO(XG,YH,LG,3) S DX=XG+1,DY=YH+1 X XY W $E(CH,1,LG-2)_$J("",(LG-LCH)-2)
 I '(CADRE) S DX=XG,DY=YH X XY W $E(CH,1,LG)_$J("",LG-LCH)
 D NORM^%VVIDEO
 Q

