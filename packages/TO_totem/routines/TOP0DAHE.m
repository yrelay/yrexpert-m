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

;TOP0DAHE^INT^1^59547,74873^0
TOP0DAHE ;
 
JR K %ARRET S %OK=1,DX=0,(ODY,DY)=6 D CLEBAS^%VVIDEO,POCLEPA^%VVIDEO W "? ou CTRLH pour avoir de l'aide"
 D ^TOP0RECU G FIN
 S DX=0,DY=6 X XY W "Jour de la recuperation (? Aide) : " S (ODX,DX)=$X D ^%VLEC G:CTRLA=1 NOK I CTRLH D ^TOP0RECU G FIN
 I Y1="?" D ^TOP0RECU G FIN
 S JR=Y1 D ^TOP0CTRD S DX=ODX,DY=ODY X XY W DAAT
 S DATE=$P(DAAT,"/",3)_$P(DAAT,"/",2)_$P(DAAT,"/",1)
 I '($D(^[QUI]P0GETARC(DATE))) D ^%VSQUEAK G JR
HR S DX=0,DY=7 D CLEBAS^%VVIDEO W "Heure de le recuperation (? Aide) : " S DX=$X D ^%VLEC G:CTRLA=1 NOK I Y1="?" D HEURE^TOP0AID1 G HR
 I Y1="" D TESTH G:(%HH'=1)!(H1=-1) HR X XY W $TR(H1,".","H") S HOUR=H1 G FIN
 S HEUR=Y1,HOUR=$P(HEUR,"H",1)_"."_$P(HEUR,"H",2) I '($D(^[QUI]P0GETARC(DATE,HOUR))) D ^%VSQUEAK G HR
FIN K DAAT,HEUR,Y1,CTRLA,CTRLE,CTRLL,CTRLF,CTRLZ,JR,H,H1,%HH Q
NOK S %OK=0 G FIN
TESTH S H=-1 F %HH=1:1 S H=$N(^[QUI]P0GETARC(DATE,H)) S:%HH=1 H1=H Q:H=-1
 S %HH=%HH-1 Q

