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

;%PBITOT2^INT^1^59547,73873^0
PTITOTA2 ;
DESS(PERE,PERT,PERN,ARRET) N A,O,OR,P1,P2,PLOCAL,R,V,X,X1,X2,Y,Y1,Y2,TEMP1,TEMP
 N UC
 S UC=$$TABID^%INCOIN("ORDINATEUR")
 I UC="VAX" S TEMP="TEMP1"
 I UC'="VAX" S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S PLOCAL=$$CONCAS^%QZCHAD(TEMP,"PLOCAL")
 K @(TEMP)
 Q:PERT=-1
 S O=^[QUI]TVPAR(ETUDE,PERT,"OBJET.GRAPHIQUE")
 S V=^[QUI]TVPAR(ETUDE,PERT,"VERSION")
 G:PAPIER SDESS I TOTAL="" G:'(ALL(PERN)) SDESS
 I '(PAPIER),%TERM'="PT-100G" D EFFBAS^%PBMEN,AFF^%PBMEN(0,0,"etude : "_ETUDE_" "_PERN) G SDESS
 D ^%PBPZALF S DX=25,DY=0 X XY W $J("",65) X XY D REV^%VVIDEO,BLD^%VVIDEO,BLK^%VVIDEO X XY W PERN D NORM^%VVIDEO
 D ^%PBPZGRA
SDESS I (((('($D(^[QUI]TVPAR(ETUDE,PERT,"POINT.DE.RACCORD"))))!(PERT=0))!(TOTAL=0))!(PERE=PERT))!FIRST S FIRST=0 D SOFT3^%PBIMINT(ETUDE,PERT,O,V,PERN,0,0,0,TAILLE,PINTER,PARAMETR,.ARRET,$S(TOTAL="":ALL(PERN),1:1)),FIN Q
 S R=^[QUI]TVPAR(ETUDE,PERT,"ANGLE.ROTATION")
 S A=^[QUI]TVPAR(ETUDE,PERT,"COEFFICIENT.AGRANDISSEMENT")
 S P1=^[QUI]TVPAR(ETUDE,PERT,"POINT.DE.RACCORD")
 S P2=^[QUI]TVPAR(ETUDE,PERT,"POINT.OBJET.DE.RACCORD")
 S OR=^[QUI]TVPAR(ETUDE,PERT,"OBJET.DE.RACCORD")
 D XY(OR,P2,.X1,.Y1)
 D POINTS^%PBIMINT(ETUDE,PERT,O,V,PERN,PLOCAL,PARAMETR,.ARRET) Q:ARRET
 S X2=$P(@PLOCAL@(PERN,P1),"^",1),Y2=$P(@PLOCAL@(PERN,P1),"^",2)
 S D=((($$DISTANCE^%PBCACV(X2,Y2,0,0)*A)*TAILLE)*MP)/$$LEC^%PBSOV(O,V,"MESURE")
 S AN=$$ANGLE^%PBCACV(X2,Y2,0,0)
 D NEWP^%PBCACV(X1,Y1,D,$$NORM^%PBCACV(AN+R),.X,.Y)
 D SOFT3^%PBIMINT(ETUDE,PERT,O,V,PERN,X,Y,R,A*TAILLE,PINTER,PARAMETR,.ARRET,$S(TOTAL="":ALL(PERN),1:1)),FIN Q
XY(N,P,X,Y) S X=$P(@PINTER@(N,P),"^",1),Y=$P(@PINTER@(N,P),"^",2) Q
RECUR(PERE,PERT,PERN,ARRET) N N,%N,T
 S ARRET=0 D DESS(PERE,PERT,PERN,.ARRET) Q:(TOTAL=0)!ARRET
 N MP S MP=$$LEC^%PBSOV(ARTO(PERT,PERN),ARTV(PERT,PERN),"MESURE")
 S N=-1 F %N=0:0 S N=$N(ARB(PERN,N)) Q:N=-1  S T=$N(REF(1,N,-1)) D RECUR(PERE,T,N,.ARRET) Q:ARRET
 Q
FIN K @(TEMP) Q
 ;

