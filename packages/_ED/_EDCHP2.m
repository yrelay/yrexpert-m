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

;%EDCHP2^INT^1^59547,73868^0
EDCHP2 ;
 
 
 
 
 
 
 
LIGNE 
 N TG,X,Y,X1,X2,Y1,Y2,DX2,DY2,DX3,DY3,DX,DY,SENSY,COS,SIN,SAVEPA,%FONC,%9X,%9Y,EPA,T
 S SENSY=1,EPA=1E-2
 I $$^%QCAZG("AGR")="" N AGR S AGR=1
 
 S X1=%9X1,X2=%9X2,Y1=%9Y1,Y2=%9Y2
 
 I X1>X2 S X=X1,X1=X2,X2=X,Y=Y1,Y1=Y2,Y2=Y
 I Y1>Y2 S SENSY=-1
 I X1=X2 D VERT^%EDCHP(X1,Y1,X1,Y2,EPA) Q
 I Y1=Y2 D HORI^%EDCHP(X1,Y1,X2,Y1,EPA) Q
 I (X2-X1)<5E-2 S DX=3E-2,DY=3E-2,TG="INFINI",SIN=0,COS=0 G BOUCLE
 S TG=(SENSY*(Y2-Y1))/(X2-X1)
 S COS=$$SQR^%TLCAMTH(1/(1+(TG*TG)))
 S SIN=$$SQR^%TLCAMTH((TG*TG)/(1+(TG*TG)))
 S T=5E-2
 S DY=T*SIN,DX=T*COS
BOUCLE 
 I SENSY=1 G LIGNE2:(Y1>Y2)!(X1>X2)
 I SENSY=-1 G LIGNE2:(Y1<Y2)!(X1>X2)
 S (%9X,%9X1)=X1,(%9Y,%9Y1)=Y1,%9X2=X1+DX,%9Y2=Y1+DY
 D:SIN'>5E-1 HORI^%EDCHP(%9X1,%9Y1,%9X2,%9Y1,EPA)
 D:SIN>5E-1 VERT^%EDCHP(%9X1,%9Y1,%9X1,%9Y2,EPA)
 I TG="INFINI" S X1=X1,Y1=Y1+(SENSY*DY) G BOUCLE
 S X1=X1+DX,Y1=Y1+(SENSY*DY)
 G BOUCLE
LIGNE2 
 S (ENVL(%TERM,"X"),%9X2)=X2,(ENVL(%TERM,"Y"),%9Y2)=Y2
 S %FONC="TAILLE" D ^%PBPZ
 S %FONC="EPAISSEUR" D ^%PBPZ
 Q
 
 
 
 
 
 
 
 
 
 
 
 
 
 
CERCLE 
 N X,Y,R,I,PX1,PX2,PY1,PY2,A
 S A=5
 I $$^%QCAZG("%DESSIN")=1 S X=635E-5*%9X,R=635E-5*%9R,Y=195E-1-(635E-5*%9Y)
 S:R<5E-1 A=2
 F I=0:A:360 S PX1=(R*^COS(I))+X,PY1=Y-(R*^SIN(I)),PX2=(R*^COS((I+A)#360))+X,PY2=Y-(R*^SIN((I+A)#360)) D TRACER(PX1,PY1,PX2,PY2)
 Q
ARC 
 N A,ANGLE S A=5
 S %9AD=%9AD#360,%9AF=%9AF#360
ARC0 N X,Y,R,I,PX1,PX2,PY1,PY2
 S X=%9X,R=%9R,Y=%9Y
 I $$^%QCAZG("%DESSIN")=1 S X=635E-5*%9X,R=635E-5*%9R,Y=195E-1-(635E-5*%9Y)
 I '($D(^COS(%9AF))) S %9AF=$O(^COS(%9AF))
 I '($D(^COS(%9AD))) S %9AD=$O(^COS(%9AD))
 I %9AF<%9AD G ARC1
 
 
 
 I (%9AD+A)>%9AF S PX1=(R*^COS(%9AD))+X,PY1=Y-(R*^SIN(%9AD)),PX2=(R*^COS((%9AD+(%9AF-I))#360))+X,PY2=Y-(R*^SIN((%9AD+(%9AF-I))#360)) D TRACER(PX1,PY1,PX2,PY2) Q
 F I=%9AD:A:%9AF S PX1=(R*^COS(I))+X,PY1=Y-(R*^SIN(I)),PX2=(R*^COS((I+A)#360))+X,PY2=Y-(R*^SIN((I+A)#360)) D TRACER(PX1,PY1,PX2,PY2) I ((I+A)+A)>%9AF Q
 S PX1=(R*^COS(I))+X,PY1=Y-(R*^SIN(I)),PX2=(R*^COS((I+(%9AF-I))#360))+X,PY2=Y-(R*^SIN((I+(%9AF-I))#360)) D TRACER(PX1,PY1,PX2,PY2)
 Q
 
ARC1 
 
 F I=%9AD:A:360 S PX1=(R*^COS(I))+X,PY1=Y-(R*^SIN(I)),PX2=(R*^COS((I+A)#360))+X,PY2=Y-(R*^SIN((I+A)#360)) D TRACER(PX1,PY1,PX2,PY2)
 F I=0:A:%9AF S PX1=(R*^COS(I))+X,PY1=Y-(R*^SIN(I)),PX2=(R*^COS((I+A)#360))+X,PY2=Y-(R*^SIN((I+A)#360)) D TRACER(PX1,PY1,PX2,PY2) I ((I+A)+A)>%9AF Q
 S PX1=(R*^COS(I))+X,PY1=Y-(R*^SIN(I)),PX2=(R*^COS((I+(%9AF-I))#360))+X,PY2=Y-(R*^SIN((I+(%9AF-I))#360)) D TRACER(PX1,PY1,PX2,PY2)
 Q
 
QUART 
 N X,Y,R,%9X1,%9X2,%9Y1,%9Y2,COS,SIN,%FONC,X1,X2,Y1,Y2,AF,AD,SAVX,SAVY,SAVR
 S SAVR=%9R,SAVX=%9X,SAVY=%9Y
 S X=635E-5*%9X,Y=195E-1-(635E-5*%9Y),R=635E-5*%9R
 S AD=%9AD,AF=%9AF
 S %FONC="ARC" D ^%PBPZ
 S COS=^COS($O(^COS(%9AD#360))),SIN=^SIN($O(^SIN(%9AD#360)))
 S X1=(R*COS)+X,Y1=Y-(R*SIN)
 S COS=^COS($O(^COS(%9AF#360))),SIN=^SIN($O(^SIN(%9AF#360)))
 S X2=(R*COS)+X,Y2=Y-(R*SIN)
 S %9X1=X,%9Y1=Y,%9X2=X1,%9Y2=Y1,%FONC="SEGMENT.TEXTE" D ^%PBPZ
 S %9X1=X,%9Y1=Y,%9X2=X2,%9Y2=Y2,%FONC="SEGMENT.TEXTE" D ^%PBPZ
 S ENVL(%TERM,"X")=X,ENVL(%TERM,"Y")=Y
 S %9AD=AD,%9AF=AF
 S %9R=SAVR,%9X=SAVX,%9Y=SAVY
 Q
 
TRACER(%9X1,%9Y1,%9X2,%9Y2) 
 I ($$^%QCAZG("%9O")="HORIZONTALE")&((%9Y1>182E-1)!(%9Y2>182E-1)) Q
 N TG,X,Y,X1,X2,Y1,Y2,DX2,DY2,DX3,DY3,DX,DY,SENSY,COS,SIN,SAVEPA,%FONC,%9X,%9Y,EPA,T
 S SENSY=1,EPA=1E-2
 I $$^%QCAZG("AGR")="" N AGR S AGR=1
 S X1=%9X1,X2=%9X2,Y1=%9Y1,Y2=%9Y2
 
 I X1>X2 S X=X1,X1=X2,X2=X,Y=Y1,Y1=Y2,Y2=Y
 I Y1>Y2 S SENSY=-1
 I (X2-X1)=0 S DX=0,DY=5E-2,COS=0,SIN=1 G LOOP
 S TG=(SENSY*(Y2-Y1))/(X2-X1)
 S COS=$$SQR^%TLCAMTH(1/(1+(TG*TG)))
 S SIN=$$SQR^%TLCAMTH((TG*TG)/(1+(TG*TG)))
 S T=5E-2
 S DY=T*SIN,DX=T*COS
LOOP 
 I SENSY=1 G LIGNE2:(Y1>Y2)!(X1>X2)
 I SENSY=-1 G LIGNE2:(Y1<Y2)!(X1>X2)
 S (%9X,%9X1)=X1,(%9Y,%9Y1)=Y1,%9X2=X1+DX,%9Y2=Y1+DY
 D:SIN'>5E-1 HORI^%EDCHP(%9X1,%9Y1,%9X2,%9Y1,EPA)
 D:SIN>5E-1 VERT^%EDCHP(%9X1,%9Y1,%9X1,%9Y2,EPA)
 
 S X1=X1+DX,Y1=Y1+(SENSY*DY)
 G LOOP

