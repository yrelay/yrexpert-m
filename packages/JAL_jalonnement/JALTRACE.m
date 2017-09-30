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

;JALTRACE^INT^1^59547,74867^0
JALTRACE ;
 
 
 
TOP(CRA,REPO,RE) 
 N U,DX,DY,TAB
 D TAB
 D CLEPAG^%VVIDEO S DX=0,DX=0 X XY W $$ART^JALRPJ_" : ",CRA I RE W ?40,"erreur ",RE G FTOP
 S DY=3 X XY W ?TAB(1),"oper",?TAB(2),"mach",?TAB(3),"dj init."
 S DX=0,DY=4 X XY F U=1:1 Q:'($D(REPO(U)))  W U,?TAB(1),$E(REPO(U),1,(TAB(2)-TAB(1))-1),?TAB(2),$E($$^%QCAZG("REPO(U,0)"),1,(TAB(3)-TAB(2))-1),?TAB(3),$E($$^%QCAZG("REPO(U,1)"),1,(TAB(4)-TAB(3))-1),!
 D WAIT Q
TAB ;;3,35,60,70
 F U=1:1:5 S TAB(U)=$P($P($T(TAB),";;",2),",",U)
 Q
DAT(REPO) 
 N U,DX,DY,TAB
 D TAB
 S DY=3,DX=TAB(4) X XY W "dj resul."
 S DY=4 F U=1:1 Q:'($D(REPO(U)))  X XY W $$^%QCAZG("REPO(U,1)") S DY=DY+1
 D FIN Q
INT(NIT) 
 N DX,DY,U,V,CH,NB S NB=0
 S DX=0,DY=15 X XY D CLEBAS^%VVIDEO
 F U=1:1:30 I $D(NIT(U)) F V=1:1:30 I $D(NIT(U,V)) S NB=NB+1,CH=U_" - "_V_" : "_NIT(U,V) W CH,$J("",20-$L(CH))
 D WAIT Q
WAIT W *-1 D POCLEPA^%VVIDEO W "[RETURN]" R *REP D POCLEPA^%VVIDEO Q
FIN W *-1 D POCLEPA^%VVIDEO W "[RETURN]" R *REP D CLEPAG^%VVIDEO Q

