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

;%MZINSER^INT^1^59547,73872^0
MOZINSER ;
 
 
 
 
 
 
 
 
 I '($D(^MOZMEM($J,"DEBUT"))) D ^%VSQUEAK Q
 N LIM
 K ^MOZP2($J)
 S (LIM,LI)=$ZP(^U($J,0,EDCL)) F %U=1:1 S LI=$N(^U($J,0,LI)) Q:LI=-1  S ^MOZP2($J,LI)=^U($J,0,LI) K ^U($J,0,LI)
 S LI=(LIM\1)+1,EDN=LIM,LJ=-1 F %U=1:1 S LJ=$N(^MOZMEM($J,LJ)) Q:LJ=-1  Q:LJ="DEBUT"  S ^U($J,0,LI)=^MOZMEM($J,LJ),^U($J,0,LI,0)=EDN,EDN=LI,LI=LI+1
 S LJ=-1 F %U=1:1 S LJ=$N(^MOZP2($J,LJ)) Q:LJ=-1  S ^U($J,0,LI)=^MOZP2($J,LJ),^U($J,0,LI,0)=EDN,EDN=LI,LI=LI+1
 S EDN=^U($J,0,EDCL,0),EDP=1,XOP=$P(^U($J,0,EDCL),"^",1),X=$P(^U($J,0,EDCL),"^",2,999) D RF^%MZED
 K ^MOZMEM($J) S ^MOZMEM($J)=0
 K LI,LJ,LIC,%U Q
 
ERASE 
 I '($D(^MOZMEM($J,"DEBUT"))) D ^%VSQUEAK Q
 N EDCLS,EDFLS,DEB,END,LI1,LI2
 
 S DEB=^MOZMEM($J,"DEBUT"),END=^MOZMEM($J,"FIN")
 S EDCLS=EDCL,EDFLS=EDFL,EDCL=DEB I '($D(ED(DEB))) S EDFL=DEB
 D REAFF,AFFSEL(DEB,END)
 
 D NORM^%VVIDEO S DX=2,DY=21 X XY W "commande: EFFACER"
 D POCLEPA^%VVIDEO S REP=$$MES^%VZEOUI($$^%QZCHW("confirmation"),"N")
 D POCLEPA^%VVIDEO S DX=2,DY=21 X XY W "                 "
 I (REP=0)!(REP=-1) S EDCL=EDCLS,EDFL=EDFLS D REAFF Q
 
 S LI1=$ZP(^U($J,0,DEB)) F %U=1:1 S LI1=$O(^U($J,0,LI1)) Q:LI1>END  Q:LI1=""  K ^U($J,0,LI1)
 I '($D(^U($J,0))) S ^U($J,0,1)="3^ ",^U($J,0,1,0)=0,LI1=1 G ERASE2
 S LI1=$ZP(^U($J,0,DEB)),LI2=$O(^U($J,0,END))
 I LI1="" S (LI1,EDFLS)=LI2,^U($J,0,LI2,0)=0 G ERASE2
 I LI2'="" S ^U($J,0,LI2,0)=LI1
ERASE2 S EDCL=LI1,EDFL=EDFLS D REAFF K ^MOZMEM($J) S ^MOZMEM($J)=0
 Q
REAFF 
 I '($D(^U($J,0))) Q
 S EDN=^U($J,0,EDCL,0),EDP=1,XOP=$P(^U($J,0,EDCL),"^",1),X=$P(^U($J,0,EDCL),"^",2,999) D RF^%MZED
 Q
 
 
AFFSEL(DEB,END) 
 N CH
 D REV^%VVIDEO S LI1=$ZP(^U($J,0,DEB)),DX=0
 F %U=1:1 S LI1=$O(ED(LI1)) Q:LI1=""  Q:LI1>END  I $D(ED(LI1)) S DY=ED(LI1) X XY S CH=$P(^U($J,0,LI1),"^",2) D W
 Q
W 
 N L S L=$L(CH,$C(1))
 S CH=$$ZSUBST^%QZCHSUB(CH,$C(1),"")_$J(" ",L)
 I $P(^U($J,0,LI1),"^")'=3,$L(CH)<80 S CH=$J(CH,80)
 W CH
 Q

