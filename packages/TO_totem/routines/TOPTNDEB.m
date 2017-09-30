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

;TOPTNDEB^INT^1^59547,74874^0
TOPTNDEB ;
 
 s %8TB="^[QUI]GRAPHE(%9GR,%9VER)",%8PE=$n(@%8TB@(-1)) g:%8PE=-1 FIN s %8RS=@%8TB@(%8PE),%8PE=$e($p(%8RS,"^",1),1,2) g:(%8PE'="TR")&((%8PE'="EL")&((%8PE'="AR")&((%8PE'="CE")&(%8PE'="DE")))) FIN g @%8PE
TR s %8PO=3 g T1
CE g TR
AR s %8SY=$p(%8RS,"^",19) g:%8SY="" TR s %8PO=$s(%8SY["A=":9,1:3) g T1
EL s %8PO=6,%8SY=$p(%8RS,"^",19) g:%8SY="" T1 s %8PO=$s(%8SY[";":6,1:3) g T1
DE g EL
T1 s %8PT=$p(%8RS,"^",%8PO) g:%8PT="" FIN g:'($d(^PARGR($j,%8PT))) FIN s %8PT=^PARGR($j,%8PT),(%9XDEB,%9XD1)=$p(%8PT,"^",1),(%9YDEB,%9YD1)=$p(%8PT,"^",2),^PARGR($j,"%9XDEB")=%9XDEB,^PARGR($j,"%9YDEB")=%9YDEB d ^PTANGROT
FIN k %8PT,%8PE,%8RS,%8PO,%8SY q

