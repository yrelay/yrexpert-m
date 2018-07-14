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
;! HL001 ! HL     ! 01/01/01 ! Erreur %GTM-E-INVCMD -> $ZT="G ..."            !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%SDOPAS4^INT^1^59547,73889^0
SDOPASS ;
 
 
 
 
 
 
 
UN(O,V) 
 N ERR
 S ERR=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"ERREUR") K @(ERR)
 S $ZT="G ERREUR^%SDOPAS4"
 D EXT(O,V)
 G FIN
 
 
ALL 
 N O,V,ERR
 S ERR=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"ERREUR") K @(ERR)
 S O=""
LOOP1 S O=$O(^[QUI]GRAPHE2(O)) G:O="" FIN
 S V=""
LOOP2 S V=$O(^[QUI]GRAPHE2(O,V)) G:V="" LOOP1
 S $ZT="G ERREUR^%SDOPAS4"
 D EXT(O,V)
 G LOOP2
 
ERREUR 
 S $ZT=""
 S @ERR@(O_" "_V_" "_$ZE)=""
 I $ZE["INTERRUPT" G FIN
 G LOOP2
 
FIN 
 
 I '($D(@ERR)) G FIN2
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("liste d'erreurs"),0)
 D INIT^%QUCHOIP(ERR,1,"",1,2,70,18),AFF^%QUCHOIP
 S A=$$UN^%QUCHOIP
 
FIN2 
 K @(ERR)
 Q
 
EXT(O,V) 
 
 
 
 D CLEPAG^%VVIDEO,^%VZCDB("passerelle graphique V 2.2 vers V 2.3",0)
 D ^%VZCDB($$^%QZCHW("objet")_" : "_O_"   "_$$^%QZCHW("version")_" : "_V,1)
 D ^%VZCDB("generation automatique des collections",2)
 N N,NUM,FIRST S NUM=0
 S N=0 F I=0:0 S N=$O(^[QUI]GRAPHE2(O,V,N)) Q:N=""  D TRANS(O,V,N)
 I $$EXI^%SDCCMS(O,V) S NUM=$S(FIRST:NUM+1,1:1) D POCLEPA^%VVIDEO W "insertion de"_" ---------> "_NUM_"  "_O2_"    "_V2 D AJOBJ^%SDCCMS(O,V,NUM,O,V,0,0,0,1)
 Q
TRANS(O,V,N) 
 N TYP,ELEM,TYPE
 S ELEM=^[QUI]GRAPHE2(O,V,N)
 S TYP=$P(ELEM,"^",1)
 Q:TYP'=8
 
AJ 
 S FIRST=$S(N=1:1,1:0) I '(FIRST) S NUM=NUM+1
 S O2=$P(ELEM,"^",2),V2=$P(ELEM,"^",3),XO=$P(ELEM,"^",4),YO=$P(ELEM,"^",5),ANG=$P(ELEM,"^",6),ECH=$P(ELEM,"^",7)
 S NUM=NUM+1
 D POCLEPA^%VVIDEO W "insertion de"_" ---------> "_NUM_"  "_O2_"    "_V2
 D AJOBJ^%SDCCMS(O,V,NUM,O2,V2,$$T(XO),$$T(YO),ANG,ECH)
 Q
 
T(XX) 
 Q $J(XX/188E-1,1,1)

