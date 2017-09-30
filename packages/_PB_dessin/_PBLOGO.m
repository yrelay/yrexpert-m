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

;%PBLOGO^INT^1^59547,73873^0
PTLOGO ;
 
 Q:'($D(^LOGO(WHOIS)))  G @$S($P(^LOGO(WHOIS),"^")="PECHINEY":"PEC",1:"FIN")
PEC S %FONC="TAILLE",%9MOD=%Z D ^%PBPZ S %FONC="MOUV" D ^%PBPZ S %FONC="CRAYON",%9TC="FEUTRE",%9CL="NOIR" D ^%PBPZ S %FONC="INCLIN",%9TA=4E-1 D ^%PBPZ S %FONC="TEXT",%9STR="PECHINEY" D ^%PBPZ S %FONC="INCLIN" K %9TA D ^%PBPZ
 S %FONC="MOUV" D ^%PBPZ S %9X=(-50+500)*%Z,%9Y=-100*%Z,%FONC="MOUVREL",XXX=%9X,YYY=%9Y D ^%PBPZ S %FONC="LBREL",%9LXY=(150*%Z)_","_0_","_(50*%Z)_","_(50*%Z)_","_(50*%Z)_","_0 D ^%PBPZ S %FONC="ARCREL",%9X=0,%9Y=100*%Z,%9R=100*%Z,%9AD=270,%9AF=90 D ^%PBPZ
 S %FONC="SEGREL",%9X=-200*%Z,%9Y=0 D ^%PBPZ S %FONC="CRAYON",%9TC="FEUTRE",%9CL="ROUGE" D ^%PBPZ
 S %FONC="LBREL",%9LXY=(50*%Z)_","_(-100*%Z)_","_(150*%Z)_","_0_","_(-150*%Z)_","_0_","_(-100*%Z)_","_(-150*%Z) D ^%PBPZ S %FONC="TAILLE",%9MOD=1/%Z D ^%PBPZ Q

