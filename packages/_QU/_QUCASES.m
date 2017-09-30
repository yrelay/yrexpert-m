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

;%QUCASES^INT^1^59547,73884^0
ZFEN(X,Y,H,L,LC,E,CLL,NC,NL,XER) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 D ^%VZECOL(X,Y,H,L,LC,E,"CLL")
 S XER=$$^%VZEMOV(X,Y,$P(CLL,"^",1),$P(CLL,"^",2),LC+E,1,.CLL,.NC,.NL)
 Q
STAND(GLO,DEB,RESUL,XER) 
 N CL1,LIN,COL,X,Y,H,L,LC,E,NC,NL,NBC,NBL,VAL
 D CLEPAG^%VVIDEO
 S X=0,Y=1,H=21,L=80,LC=8,E=2,NBC=8,NBL=20
 K CL1
 S VAL=DEB
 S:DEB="" VAL=$O(@GLO@(""))
 I DEB'="",$D(@GLO@(DEB))=0 S VAL=$O(@GLO@(DEB))
 S CL1=NBC_"^"_NBL
 F LIN=1:1:NBL F COL=1:1:NBL S CL1(COL,LIN)=VAL,VAL=$O(@GLO@(VAL))
 D ZFEN(X,Y,H,L,LC,E,.CL1,.NC,.NL,.XER)
 S:XER RESUL=CL1(NC,NL)
 Q
TEST D STAND("^UTILITY(""GLO"")","",.RESUL,.XER) Q
TEST1 N CL1,LIN,COL D CLEPAG^%VVIDEO
 S X=3,Y=5,H=10,L=60,LC=8,E=2
 K CL1
 S CL1="5^5"
 F LIN=1:1:5 F COL=1:1:5 S CL1(COL,LIN)=$$LINA(0,80)
 D ZFEN(X,Y,H,L,LC,E,.CL1,.NC,.NL,.XER)
 Q
RNZE(PLANCHER,PLAFOND) 
 N ALPHA
 S ALPHA=$R(1000)/1000 Q ((PLAFOND*ALPHA)+((1-ALPHA)*PLANCHER))\1
LINA(PLAN,PLAF) 
 N CH,LONG
 S LONG=$$RNZE(PLAN,PLAF),CH="" F I=1:1:LONG S CH=$C($$RNZE(64,90))_CH
 Q CH

