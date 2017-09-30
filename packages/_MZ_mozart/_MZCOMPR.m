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

;%MZCOMPR^INT^1^59547,73871^0
MOZCOMPR ;
 
 
 
 
 
DEB 
 D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("COMPREHENSION DU SAVOIR-REDIGER"))
 N REP S DX=0,DY=10 X XY
 S REP=$$MES^%VZEOUI("Voulez-vous une comprehension totale ","O")
 G FIN:REP=-1
 N ARTI
 I REP=1 S ARTI="" D ^%VZEATT G TOTAL
 G PARTIEL:REP=0
 G FIN
TOTAL 
 S ARTI=$O(^[QUI]MOZREL(ARTI)) G FIN:ARTI="" K ^[QUI]CMOZREL(ARTI) D RECABR^%MZCPTIE
 G TOTAL
PARTIEL 
 D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("COMPREHENSION PARTIELLE"))
 S TR=$S($D(^MOZ(WHOIS,"C","PARA")):^MOZ(WHOIS,"C","PARA"),1:^MOZ("STAND","C","PARA"))
 S MSG="Relations possibles",DX=40-($L(MSG)\2),DY=7 D REV^%VVIDEO X XY W MSG D NORM^%VVIDEO
 
 
 S NR=0 F IT1=1:1 S P1=$P(TR,",",IT1) Q:P1=""  F IT2=IT1+1:1 S P2=$P(TR,",",IT2) Q:P2=""  S NR=NR+1,R=P1_"."_P2,TYPREL(R)=R
 D INIT^%QUCHOIP("TYPREL",1,"",30,10,20,13),AFF^%QUCHOIP
 S ARTI=$$UN^%QUCHOIP D END^%QUCHOIP G FIN:ARTI=""
 K ^[QUI]CMOZREL(ARTI) D ^%VZEATT,RECABR^%MZCPTIE H 3
FIN 
 Q

