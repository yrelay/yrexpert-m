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

;%PBCACV^INT^1^59547,73872^0
PTICONV ;
 
 
 
 
TR(X,Y,T,XD,YD) 
 
 S XD=X+T("X"),YD=Y+T("Y")
 
XY(X,Y,P,XD,YD) 
 
 
 
 N C,S,X1,Y1
 S X1=X*P("R"),Y1=Y*P("R"),C=$$COS(P("A")),S=$$SIN(P("A"))
 S XD=((X1*C)-(Y1*S))+P("X"),YD=((X1*S)+(Y1*C))+P("Y") Q
 
DIST(D,P) Q D*P("R")
 
 
 
 
 
ANGL(A,P) Q A+P("A")
 
 
SIN(A) S A=A#360 Q:$D(^SIN(A)) ^SIN(A)
 I $O(^SIN(A))="" Q 0
 Q ^SIN($O(^SIN(A)))
 
 
COS(A) S A=A#360 Q:$D(^COS(A)) ^COS(A)
 I $O(^COS(A))="" Q 0
 Q ^COS($O(^COS(A)))
 
DISTANCE(X1,Y1,X2,Y2) 
 N DX,DY
 S DX=X1-X2,DY=Y1-Y2
 Q $$SQROOT((DX*DX)+(DY*DY))
 
SQROOT(X) 
 N T,Y S Y=0 Q:X'>0 Y S Y=(X/2)+1
SQR S T=Y,Y=((X/T)+T)/2 Q:Y'<T Y G SQR
 
ANGLE(X1,Y1,X2,Y2) 
 N %ATG,DX,DY,%VAL S DX=X2-X1,DY=Y2-Y1
 I DX=0 S %ATG=$S(DY>0:90,1:270) G ENDA
 I DY=0 S %ATG=$S(DX>0:0,1:180) G ENDA
 S %VAL=DY/DX,%ATG=$$ARCTG^%TLCAMTH(%VAL) S:X2<X1 %ATG=%ATG+180
ENDA Q $$NORM(%ATG)
 
 
CALXY(X,Y,XT,YT,A,E,XD,YD) N XX,YY
 S XX=X*E
 S YY=Y*E
 S XD=$P((($$COS(A)*XX)-($$SIN(A)*YY))+XT,".",1)
 S YD=$P((($$SIN(A)*XX)+($$COS(A)*YY))+YT,".",1)
 Q
 
A(ANG,A) Q $$NORM(ANG+A)
 
D(D,E) Q $P(D*E,".",1)
 
NORM(A) N I F I=0:0 Q:A'<0  S A=A+360
 Q $P(A#360,".",1)
 
MILIEU(X1,Y1,X2,Y2,X,Y) S X=(X1+X2)/2,Y=(Y1+Y2)/2 Q
 
NEWP(X,Y,D,A,XD,YD) S A=$$NORM(A),XD=(D*$$COS(A))+X,YD=(D*$$SIN(A))+Y Q
 
ARCR(XD,YD,XA,YA,D,X,Y) 
 N A,L,XI,YI
 S A=$$ANGLE(XA,YA,XD,YD)
 S L=$$DISTANCE(XD,YD,XA,YA),L=(L*L)/4,L=$$SQROOT((D*D)-L)
 S XI=(XD+XA)/2,YI=(YD+YA)/2
 S X=$P((L*$$SIN(A))+XI,".",1)
 S Y=$P(((-(L))*$$COS(A))+YI,".",1)
 Q
 
ROTP(X1,Y1,X2,Y2,AN,XR,YR) 
 D ROTO(X2-X1,Y2-Y1,AN,.XR,.YR)
 S XR=XR+X1,YR=YR+Y1 Q
 
ROTO(X,Y,AN,XF,YF) 
 S XF=(X*$$COS(AN))-(Y*$$SIN(AN))
 S YF=(X*$$SIN(AN))+(Y*$$COS(AN))
 Q
 
SYMP(X1,Y1,X2,Y2,AN,XR,YR) 
 D SYMO(X2-X1,Y2-Y1,AN,.XR,.YR)
 S XR=XR+X1,YR=YR+Y1
 Q
 
SYMO(X,Y,AN,XF,YF) 
 S XF=(X*$$COS(AN+AN))+(Y*$$SIN(AN+AN))
 S YF=(X*$$SIN(AN+AN))-(Y*$$COS(AN+AN))
 Q

