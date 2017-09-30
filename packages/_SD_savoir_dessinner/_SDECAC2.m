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

;%SDECAC2^INT^1^59547,73888^0
SDECAC2 ;
 
 
 
 
 
 
CERCLE 
 D XY^%SDECAC(AD,OD,.AD,.OD),XY1^%SDECAC(R,.R)
 D CALXY^%PBCACV(AD,OD,XO,YO,ANGO,ECHO,.AD,.OD)
 
 D CALXY^%PBCACV(AD,OD,XOC,YOC,ANGC,ECHC,.AD,.OD)
 S R=$$D^%PBCACV(R,ECHO*ECHC)
 D EPAIS
 D CERCLE^%PBMFN(AD,OD,R,EF,TL,VIS)
 D KILL
 Q
FLECH 
 Q:POINTE=""
 Q:TYPE=""
 D XY^%SDECAC(AD,OD,.AD,.OD),XY^%SDECAC(AA,OA,.AA,.OA)
 D CALXY^%PBCACV(AD,OD,XO,YO,ANGO,ECHO,.AD,.OD)
 D CALXY^%PBCACV(AA,OA,XO,YO,ANGO,ECHO,.AA,.OA)
 
 D CALXY^%PBCACV(AD,OD,XOC,YOC,ANGC,ECHC,.AD,.OD)
 D CALXY^%PBCACV(AA,OA,XOC,YOC,ANGC,ECHC,.AA,.OA)
 S %9EPA=EPAISSEUR*1E-2
 D DROITE^%PBMFN(AD,OD,AA,OA,EF,TL,VIS)
 N SENS,ANGLE,X1,X2,Y1,Y2
 D EPAIS
 S ANGLE=$$ANGLE^%PBCACV(AD,OD,AA,OA)
 
 I POINTE="I" G INT
EXT 
 D CAL(AA,OA,ANGLE,-1,.X1,.Y1,.X2,.Y2)
 D AFFSEG(AA,OA,X1,Y1,X2,Y2,0)
 I TYPE'="D" D KILL G TEXTE
 D CAL(AD,OD,ANGLE,1,.X1,.Y1,.X2,.Y2)
 D AFFSEG(AD,OD,X1,Y1,X2,Y2,0)
 D KILL
 G TEXTE
 
INT 
 D CAL(AA,OA,ANGLE,1,.X1,.Y1,.X2,.Y2)
 D AFFSEG(AA,OA,X1,Y1,X2,Y2,0)
 I TYPE'="D" D KILL G TEXTE
 D CAL(AD,OD,ANGLE,-1,.X1,.Y1,.X2,.Y2)
 D AFFSEG(AD,OD,X1,Y1,X2,Y2,0)
 D KILL
 G TEXTE
 
 
CAL(XX,YY,ANGLE,SENS,X1,Y1,X2,Y2) 
 S D=40*SENS
 S ANG1=(150+ANGLE)#360,ANG2=(210+ANGLE)#360
 
 S X1=XX+(D*$$COS^%PBCACV(ANG1)),Y1=YY+(D*$$SIN^%PBCACV(ANG1))
 
 S X2=XX+(D*$$COS^%PBCACV(ANG2)),Y2=YY+(D*$$SIN^%PBCACV(ANG2))
 Q
 
AFFSEG(XX,YY,X1,Y1,X2,Y2,EF) 
 D DROITE^%PBMFN(XX,YY,X1,Y1,EF,TL,VIS)
 D DROITE^%PBMFN(XX,YY,X2,Y2,EF,TL,VIS)
 Q
 
TEXTE 
 
 
 
 
 
 N SENS1,SENS2 S SENS1=1,SENS2=1
 S I=$$ANGLE^%PBCACV(AD,OD,AA,OA)-ANGO,TAILLE=75E-2
 
 S AA=(AD+AA)/2,OA=(OD+OA)/2
 I I>180 S SENS1=-1
 I (I'<90)&(I'>270) S SENS2=-1
 
 S AD=((AD+AA)/2)+(40*SENS1),OD=((OD+OA)/2)+(40*SENS2)
 G TEXTE1^%SDECAC
 
RACCO 
 N TIA,TIB,TIC,TID,X1,Y1,COSPHI,SINPHI,PHI,COSPHI2,SINPHI2,PHI2,SIGN,NXU1,NXU2,NYU1,NYU2,PD,PA,ECH,TYPL,XX,YY
 D EPAIS
 
 
 S PT=$P(P1,"P",2),PD=PT
 S AD=$$^%SDSCPT("%POINT"_PT,"ABSCISSE")
 S OD=$$^%SDSCPT("%POINT"_PT,"ORDONNEE")
 
 S PT2="" F I=0:0 S PT2=$O(^[QUI]SDOBJ(OBJ,VERS,"PAEI",D1,PT2)) Q:PT2=""  I PT2'=PT Q
 I PT2="" D RECUP(D1,AD,OD,.AD2,.OD2) G D2
 S AD2=$$^%SDSCPT("%POINT"_PT2,"ABSCISSE")
 S OD2=$$^%SDSCPT("%POINT"_PT2,"ORDONNEE")
D2 
 S PT=$P(P2,"P",2),PA=PT
 S AA=$$^%SDSCPT("%POINT"_PT,"ABSCISSE")
 S OA=$$^%SDSCPT("%POINT"_PT,"ORDONNEE")
 
 S PT2="" F I=0:0 S PT2=$O(^[QUI]SDOBJ(OBJ,VERS,"PAEI",D2,PT2)) Q:PT2=""  I PT2'=PT Q
 I PT2="" D RECUP(D2,AA,OA,.AA2,.OA2) G TRT
 S AA2=$$^%SDSCPT("%POINT"_PT2,"ABSCISSE")
 S OA2=$$^%SDSCPT("%POINT"_PT2,"ORDONNEE")
TRT 
 I (AD=AA)&(OD=OA) Q
 
 
 D XY^%SDECAC(AD,OD,.AD,.OD),XY^%SDECAC(AD2,OD2,.AD2,.OD2)
 D XY^%SDECAC(AA,OA,.AA,.OA),XY^%SDECAC(AA2,OA2,.AA2,.OA2)
 D CALXY^%PBCACV(AD,OD,XO,YO,ANGO,ECHO,.AD,.OD)
 D CALXY^%PBCACV(AD2,OD2,XO,YO,ANGO,ECHO,.AD2,.OD2)
 
 
 D CALXY^%PBCACV(AA,OA,XO,YO,ANGO,ECHO,.AA,.OA)
 D CALXY^%PBCACV(AA2,OA2,XO,YO,ANGO,ECHO,.AA2,.OA2)
 
 
 D CALXY^%PBCACV(AD,OD,XOC,YOC,ANGC,ECHC,.XT1,.YT1)
 D CALXY^%PBCACV(AD2,OD2,XOC,YOC,ANGC,ECHC,.XT2,.YT2)
 
 D CALXY^%PBCACV(AA,OA,XOC,YOC,ANGC,ECHC,.XU1,.YU1)
 D CALXY^%PBCACV(AA2,OA2,XOC,YOC,ANGC,ECHC,.XU2,.YU2)
 S TYPL=TL
 D SPLIN^%SDESRAC
 D KILL
 Q
 
RECUP(D,XX,YY,XX2,YY2) 
 N AD,OD,AA,OA
 X ^[QUI]SDCOMP(OBJ,VERS,D,1)
 X ^[QUI]SDCOMP(OBJ,VERS,D,2)
 X ^[QUI]SDCOMP(OBJ,VERS,D,3)
 X ^[QUI]SDCOMP(OBJ,VERS,D,4)
 I (XX=AD)&(YY=OD) S XX2=AA,YY2=OA Q
 S XX2=AD,YY2=OD
 Q
 
KILL K %8ELIPS,%8BET,%9X1,%9Y1,%9X2,%9Y2,%9X1S,%9Y1S,%9X2S,%9Y2S,%9AD,%9AF,%9STR,%9R,%9EPA,%9E,%FONC
 Q
 
TL(LT) Q:LT="P" $S(TL:"F",1:"P") Q:LT'="I" $S(TL:"P",1:LT) Q:'(VIS) $S(TL:"P",1:"I") Q $S(TL:"F",1:"P")
 
EPAIS 
 Q:%PORT=0
 
 
 S ENVL(%TERM,"EPAISSEUR")=EPAISSEUR,%9EPA=EPAISSEUR*1E-2,%FONC="EPAISSEUR" D ^%PBPZ Q

