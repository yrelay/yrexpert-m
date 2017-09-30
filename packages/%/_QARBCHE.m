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

;%QARBCHE^INT^1^59547,73874^0
QARCHE(NG,ORI,RES,TAB) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Calcul des plus courts chemins"),0)
 D ^%VZEATT
 D INIT
 S RES=1
 D CALC(.RES)
 Q
 
INIT 
 N I,N
 K @TAB@("DIST",NG,1),@TAB@("PRED",NG,1)
 S @TAB@("DIST",NG,1,ORI,ORI)=0,@TAB@("PRED",NG,1,ORI,ORI)=ORI
 S I=""
 F N=0:1 S I=$O(^[QUI]RQSGLO("SOMGR",NG,I)) Q:I=""  I I'=ORI S @TAB@("PRED",NG,1,ORI,I)=I,@TAB@("DIST",NG,1,ORI,I)=1000000000000E-0
 S ^[QUI]RQSGLO("NOMGR",NG)=N
 Q
 
EDIT(D,A) 
 N %A,P,PR
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Plus court chemin entre")_" "_D_" "_$$^%QZCHW("et")_" "_A,0)
 S DX=30,DY=5 X XY W "Longueur ",@TAB@("DIST",NG,1,D,A)
 S P=A,DX=20,DY=7
 F %A=0:0 S DY=DY+1,PR=P,P=$P(@TAB@("PRED",NG,1,D,P),"~",1) X XY W "par l'arc ",$P(@TAB@("PRED",NG,1,D,PR),"~",2)," au sommet ",P Q:(P=D)!($P(@TAB@("PRED",NG,1,D,PR),"~",2)="")
 I P'=D D ^%VZEAVT($$^%QZCHW("Il n'existe pas de chemin entre")_" "_S_" "_$$^%QZCHW("et")_" "_D)
 Q
 
 
 
CALC(ARRET) 
 N %I,I,K,MOD,N,NA,Z
 S K=1,N=^[QUI]RQSGLO("NOMGR",NG)
CAL S MOD=0,I=""
 F %I=0:0 S I=$O(^[QUI]RQSGLO("GRAPHE",NG,I)) Q:I=""  S J="" F %J=0:0 S J=$O(^[QUI]RQSGLO("GRAPHE",NG,I,J)) Q:J=""  I (J'=ORI)&(J'=I) S NA="" D ARC
 G:'(MOD) END
 S K=K+1 G:K'=N CAL
END I K=N S ARRET=0
 Q
ARC 
 S NA=$O(^[QUI]RQSGLO("GRAPHE",NG,I,J,NA)) Q:NA=""
 
 S Z=@TAB@("DIST",NG,1,ORI,I)+^[QUI]RQSGLO("GRAPHE",NG,I,J,NA)
 I Z'<@TAB@("DIST",NG,1,ORI,J) G ARC
 S @TAB@("DIST",NG,1,ORI,J)=Z,@TAB@("PRED",NG,1,ORI,J)=I_"~"_NA
 S MOD=1
 G ARC
 
 
 
TEST D CLEPAG^%VVIDEO
 S DX=10,DY=5 X XY W "Nom du graphe ? " R NG
 S DX=10,DY=7 X XY W "Nom du sommet origine ? " R ORI
 
 F I="A","B","C","D","E" F J="A","B","C","D","E" D SAI
 D ^%QARBCHE(NG,ORI,.RES,"^RESUL")
 F I="GRAPHE","NOMGR","SOMGR" K ^[QUI]RQSGLO(I,NG)
 Q
SAI I I=J S VAL=10E10
 E  W !,"Valeur de ",I,",",J R VAL
 S:VAL="" VAL=10E10
 S ^[QUI]RQSGLO("SOMGR",NG,I)="",^[QUI]RQSGLO("GRAPHE",NG,I,J,1)=VAL
 Q

