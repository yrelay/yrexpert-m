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

;%MZPREND^INT^1^59547,73872^0
MOZPREND ;
 
 
 
 
 
 
 
 
 S:'($D(%TAB)) %TAB=0 G:%TAB'=0 FIN G @^MOZMEM($J)
 
0 
 S ^MOZMEM($J)=1,^MOZMEM($J,0)=EDCL,DX=45,DY=23 X XY D BLD^%VVIDEO,BLK^%VVIDEO X XY W $$^%QZCHW("Prendre un groupe de lignes") D NORM^%VVIDEO G FIN
 
1 
 S DEB=^MOZMEM($J,0) K ^MOZMEM($J) S ^MOZMEM($J)=0,LIP="",LI=1,BEG=$S(DEB<EDCL:DEB,1:EDCL),END=$S(BEG=EDCL:DEB,1:EDCL)
 S LJ=$ZP(^U($J,0,BEG)) F %U=1:1 S LJ=$N(^U($J,0,LJ)) Q:LJ=-1  Q:LJ>END  S ^MOZMEM($J,LI,0)=LIP,^MOZMEM($J,LI)=^U($J,0,LJ),LIP=LI,LI=LI+1
 S ^MOZMEM($J,"DEBUT")=BEG,^MOZMEM($J,"FIN")=END
 N EDCLS,EDFLS,DEB,END,LI1,LI2
 
 S DEB=^MOZMEM($J,"DEBUT"),END=^MOZMEM($J,"FIN")
 S EDCLS=EDCL,EDFLS=EDFL,EDCL=DEB I '($D(ED(DEB))) S EDFL=DEB
 D REAFF,AFFSEL^%MZINSER(DEB,END)
 D NORM^%VVIDEO S DX=2,DY=21 X XY W "                 "
 S DX=45,DY=23 X XY W $J("",$L($$^%QZCHW("Prendre un groupe de lignes")))
 K LJ,LI,%U,BEG,DEB,END
FIN Q
REAFF 
 S EDN=^U($J,0,EDCL,0),EDP=1,XOP=$P(^U($J,0,EDCL),"^",1),X=$P(^U($J,0,EDCL),"^",2,999) D RF^%MZED
 Q

