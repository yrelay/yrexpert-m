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

;%SDESRAC^INT^1^59547,73889^0
SDESRAC(XD,YD,XA,YA,ELD,ELA,PD,PA,TYPL,VIS,OK,OBLI) 
 
 
 
 
 
 
 
 
 
 N ATT,NOM,PAR,R,TYP,MAT,MSG,D,XT1,YT1,XT2,YT2,XU1,YU1,XU2,YU2,TYP1,TYP2,PHI,XPD,XPA,YPD,YPA,COSPHI,SINPHI,COSPHI2,SINPHI2,ECH,EF
 S (PD,PA)=""
 S MAT=$$ADR^%SDOMAT,R=1,EF=0
 I '($D(@MAT)) D ^%SDOMAT(OBJ,VERS)
 S OK=1
 S TYPL=$$TYPL^%SDEDEF($$ZSUBST^%QZCHSUB(TYPL,"""",""))
DEB 
L0 
 D SELEC^%SDOGRIL(.XD,.YD,.XPD,.YPD,$$^%QZCHW("Pointez le point de depart du raccordement avec la mire")) S:XD="" R=0
 I R=0,OBLI G L0
 I R=0 S OK=0 Q
 I '($$EXIST(XD,YD,.ELD,.MSG)) D AFFI^%SDUMEN(0,0,$$^%QZCHW(MSG)) G L0
 D INIT(XPD,YPD,ELD,.XT1,.YT1,.XT2,.YT2,.PD)
 I PD="" D AFFI^%SDUMEN(0,0,$$^%QZCHW("aucun point n'a ete defini")) G L0
 
L1 
 D SELEC^%SDOGRIL(.XA,.YA,.XPA,.YPA,$$^%QZCHW("Pointez le point d'arrivee du raccordement avec la mire")) S:XA="" R=0
 I R=0,OBLI G L1
 I R=0 S OK=0 Q
 I '($$EXIST(XA,YA,.ELA,.MSG)) D AFFI^%SDUMEN(0,0,$$^%QZCHW(MSG)) G L1
 D INIT(XPA,YPA,ELA,.XU1,.YU1,.XU2,.YU2,.PA)
 I PA="" D AFFI^%SDUMEN(0,0,$$^%QZCHW("aucun point n'a ete defini")) G L1
 
 
 I (XPD=XPA)&(YPD=YPA) D AFFI^%SDUMEN(0,0,$$^%QZCHW("point deja selectionne")) G L1
SPLIN 
 
 
 S ECH=$$DISTANCE^%PBCACV(XT1,YT1,XU1,YU1)
 S PHI=$$ANGLE^%PBCACV(XT2,YT2,XT1,YT1)
 S COSPHI=$$COS^%PBCACV(PHI)
 S SINPHI=$$SIN^%PBCACV(PHI)
 
 S NXU1=((COSPHI*(XU1-XT1))+(SINPHI*(YU1-YT1)))/ECH
 S NYU1=(((-(SINPHI))*(XU1-XT1))+(COSPHI*(YU1-YT1)))/ECH
 
 S NXU2=((COSPHI*(XU2-XT1))+(SINPHI*(YU2-YT1)))/ECH
 S NYU2=(((-(SINPHI))*(XU2-XT1))+(COSPHI*(YU2-YT1)))/ECH
 
 I (NXU1=0)!(NYU1=0) G DROITE
 
 S SIGN=$$SIGN((NYU2*NXU1)-(NXU2*NYU1))*$$SIGN(NYU2-NYU1)
 I SIGN'=1 G DROITE
 
 I (((NYU2*NXU1)/NYU1)>NXU2)&((NYU2/NYU1)>1) S COURBE=1,EPSILON=1
 I (((NYU2*NXU1)/NYU1)<NXU2)&((NYU2/NYU1)<1) S COURBE=1,EPSILON=-1
 
 S PHI2=$$ANGLE^%PBCACV(NXU1,NYU1,NXU2,NYU2)
 S COSPHI2=$$COS^%PBCACV(PHI2)
 S SINPHI2=$$SIN^%PBCACV(PHI2)
 
 S TIA=(3*NXU1)-((2*1)+(EPSILON*COSPHI2))
 S TIB=((-2*NXU1)+1)+(EPSILON*COSPHI2)
 S TIC=(3*NYU1)-(EPSILON*SINPHI2)
 S TID=(-2*NYU1)+(EPSILON*SINPHI2)
 
 S A=(TIA*COSPHI)-(TIC*SINPHI)
 S B=(TIB*COSPHI)-(TID*SINPHI)
 S C=(TIA*SINPHI)+(TIC*COSPHI)
 S D=(TIB*SINPHI)+(TID*COSPHI)
 
 F T=0:1E-1:9E-1 D TRACE
 Q
TRACE 
 S X1=XT1+(ECH*(((COSPHI*T)+((T*T)*A))+(((T*T)*T)*B)))
 S Y1=YT1+(ECH*(((SINPHI*T)+((T*T)*C))+(((T*T)*T)*D)))
 N TT S TT=T+1E-1
 S X2=XT1+(ECH*(((COSPHI*TT)+((TT*TT)*A))+(((TT*TT)*TT)*B)))
 S Y2=YT1+(ECH*(((SINPHI*TT)+((TT*TT)*C))+(((TT*TT)*TT)*D)))
 D DROITE^%PBMFN(X1,Y1,X2,Y2,EF,TYPL,VIS)
 Q
 
SIGN(XX) 
 I XX=0 Q 0
 I XX>0 Q 1
 Q -1
 
EXIST(XX,YY,EL,MSG) 
 S MSG=""
 
 I @MAT@(XX,YY)=0 S MSG="aucun element" Q 0
 
 I @MAT@(XX,YY)>1 G MULT
 
 N TYP
 S EL=$O(@MAT@(XX,YY,""))
 
 S TYP=$$TYPELEM^%SDEGEST(OBJ,VERS,EL)
 I TYP'="DROITE" S MSG="raccordement impossible" Q 0
EXIPT 
 I '($D(@GLOBJ@("PAEI",EL))) S MSG="pas de point sur la droite" Q 0
 Q 1
 
MULT 
 N I,NB S NB=0
 S EL="" F I=0:0 S EL=$O(@MAT@(XX,YY,EL)) Q:EL=""  S TYP=$$TYPELEM^%SDEGEST(OBJ,VERS,EL) I TYP="DROITE" S NB=NB+1,NB(EL)=""
 I NB=0 S MSG="raccordement impossible" Q 0
 I NB=1 S EL=$O(NB("")) G EXIPT
 N LIST S LIST=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"DROITE") K @(LIST)
 S EL="" F I=0:0 S EL=$O(NB(EL)) Q:EL=""  S @LIST@($E(^[QUI]SDTEXT(OBJ,VERS,EL),1,70))=""
 D ALFA^%SDEDEF,BLD^%VVIDEO,^%VZCDB($$^%QZCHW("Choisissez une droite"),0),NORM^%VVIDEO
 S EL=$$UN^%PKCHOIX(LIST,2,3,20)
 S EL=$$GETLBLAN^%VTLBLAN($P(EL,";",1))
 D GRAPH^%SDEDEF
 I %TERM="VT-340" D CADRE^%SDOAFFI,REAF^%SDOAFFI(OBJ,VERS,%PORT,%TERM)
 I EL="" Q 0
 G EXIPT
 
INIT(XO,YO,EL,X1,Y1,X2,Y2,PT) 
 N D1,D2,XX1,YY1,XX2,YY2,DIFX,DIFY
 
 S XX1=$P(^[QUI]SDOBJ(OBJ,VERS,"EL",EL,"PRES"),"^",2)
 S YY1=$P(^[QUI]SDOBJ(OBJ,VERS,"EL",EL,"PRES"),"^",3)
 S XX2=$P(^[QUI]SDOBJ(OBJ,VERS,"EL",EL,"PRES"),"^",4)
 S YY2=$P(^[QUI]SDOBJ(OBJ,VERS,"EL",EL,"PRES"),"^",5)
 S D1=$$DISTANCE^%PBCACV(XO,YO,XX1,YY1)
 S D2=$$DISTANCE^%PBCACV(XO,YO,XX2,YY2)
 
 I D1<D2 S X1=XX1,Y1=YY1,X2=XX2,Y2=YY2
 E  S X1=XX2,Y1=YY2,X2=XX1,Y2=YY1
 
 S PT="" D ^%PBPZALF
INIT0 S PT=$O(@GLOBJ@("PAEI",EL,PT))
 Q:PT=""
 S XX1=@GLOBJ@("PTR",PT,"X"),YY1=@GLOBJ@("PTR",PT,"Y")
 S XX1=$J(XX1*188E-1,1,1),YY1=$J(YY1*188E-1,1,1)
 S DIFX=X1-XX1,DIFY=Y1-YY1
 S DIFX=$S(DIFX<0:-(DIFX),1:DIFX),DIFY=$S(DIFY<0:-(DIFY),1:DIFY)
 I (DIFX'>4)&(DIFY'>4) Q
 G INIT0
 
DROITE 
 D DROITE^%PBMFN(XT1,YT1,XU1,YU1,EF,TYPL,VIS)
 Q
 
EXT(OBJ,VERS,XPD,YPD,XPA,YPA,ELD,ELA,TYPL,VIS) 
 I '($$VERIF(ELD,ELA)) Q
 N EF S EF=0
 G SUITE
 
EFF(XPD,YPD,XPA,YPA,ELD,ELA,TYPL,VIS) 
 I '($$VERIF(ELD,ELA)) Q
 N EF S EF=1
SUITE 
 N ATT,NOM,PAR,R,TYP,MAT,MSG,D,XT1,YT1,XT2,YT2,XU1,YU1,XU2,YU2,TYP1,TYP2,PHI,COSPHI,SINPHI,COSPHI2,SINPHI2,ECH,PD,PA
 S MAT=$$ADR^%SDOMAT
 I '($D(@MAT)) D ^%SDOMAT(OBJ,VERS)
 D INIT(XPD,YPD,ELD,.XT1,.YT1,.XT2,.YT2,.PD)
 D INIT(XPA,YPA,ELA,.XU1,.YU1,.XU2,.YU2,.PA)
 G SPLIN
VERIF(ELD,ELA) 
 N TYP,EL
 
 F EL=ELD,ELA I '($D(@GLTEXT@(EL))) G NOK
 
 F EL=ELD,ELA I $$TYPELEM^%SDEGEST(OBJ,VERS,EL)'="DROITE" G NOK
 Q 1
NOK Q 0

