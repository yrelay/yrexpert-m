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

;%PBEL^INT^1^59547,73873^0
PTEL ;
 
DEMIE(X,Y,PR,GR,I,TL,PD,PO,PC,R1,R2,IN,SY) Q "1^"_X_"^"_Y_"^"_PR_"^"_GR_"^"_I_"^"_TL_"^"_PD_"^"_PO_"^"_PC_"^"_R1_"^"_R2_"^"_IN_"^"_SY
 
ELLIPSE(X,Y,PR,GR,I,TL,PD,PO,PC,R1,R2,INSY) Q "2^"_X_"^"_Y_"^"_PR_"^"_GR_"^"_I_"^"_TL_"^"_PD_"^"_PO_"^"_PC_"^"_R1_"^"_R2_"^"_INSY
 
POINT(X,Y,EX,EY,N) Q "3^"_X_"^"_Y_"^"_EX_"^"_EY_"^"_N
 
TEXTE(X,Y,T,S) Q "4^"_X_"^"_Y_"^"_T_"^"_S
 
DROITE(X1,Y1,X2,Y2,TL,PD,PA,SY) Q "5^"_X1_"^"_Y1_"^"_X2_"^"_Y2_"^"_TL_"^"_PD_"^"_PA_"^"_SY
 
ARC(X,Y,R,AD,AF,TL,PD,PA,PC,AN,RA,SY) Q "6^"_X_"^"_Y_"^"_R_"^"_AD_"^"_AF_"^"_TL_"^"_PD_"^"_PA_"^"_PC_"^"_AN_"^"_RA_"^"_SY
 
CERCLE(X,Y,R,TL,PD,PP,RA,SY) Q "7^"_X_"^"_Y_"^"_R_"^"_TL_"^"_PD_"^"_PP_"^"_RA_"^"_SY
 
IMAGE(O,V,XT,YT,ROT,AGR) Q "8^"_O_"^"_V_"^"_XT_"^"_YT_"^"_ROT_"^"_AGR
 
 
AFF(O,V,XT,YT,A,E,EL,P,INVIS) N EF,TL S EF=0,TL=0 G AF
 
AFF2(O,V,XT,YT,A,E,EL,EF,INVIS,TL) N P S P=1
AF N ELEM S ELEM=^[QUI]GRAPHE2(O,V,EL) G @$P(ELEM,"^",1)
1 N X,Y S X=$P(ELEM,"^",2),Y=$P(ELEM,"^",3)
 D CALXY^%PBCACV(X,Y,XT,YT,A,E,.X,.Y) S TL=$$TL($P(ELEM,"^",7))
 D DEMIE^%PBMFN(X,Y,$$D^%PBCACV($P(ELEM,"^",4),E),$$D^%PBCACV($P(ELEM,"^",5),E),$$A^%PBCACV($P(ELEM,"^",6),A),EF,TL,INVIS) Q
2 N X,Y S X=$P(ELEM,"^",2),Y=$P(ELEM,"^",3)
 D CALXY^%PBCACV(X,Y,XT,YT,A,E,.X,.Y) S TL=$$TL($P(ELEM,"^",7))
 D ELLIPSE^%PBMFN(X,Y,$$D^%PBCACV($P(ELEM,"^",4),E),$$D^%PBCACV($P(ELEM,"^",5),E),$$A^%PBCACV($P(ELEM,"^",6),A),EF,TL,INVIS) Q
3 N X,Y S X=$P(ELEM,"^",2),Y=$P(ELEM,"^",3)
 D CALXY^%PBCACV(X,Y,XT,YT,A,E,.X,.Y),POINT^%PBMFN(X,Y,EF)
 D:P&($P(ELEM,"^",6)'="") TEXTE^%PBMFN(X+20,Y+20,$P(ELEM,"^",6),EF,"H") Q
4 N X,Y S X=$P(ELEM,"^",2),Y=$P(ELEM,"^",3)
 D CALXY^%PBCACV(X,Y,XT,YT,A,E,.X,.Y)
 D TEXTE^%PBMFN(X,Y,$P(ELEM,"^",4),EF,$P(ELEM,"^",5)) Q
5 N X1,Y1,X2,Y2 S X1=$P(ELEM,"^",2),Y1=$P(ELEM,"^",3)
 D CALXY^%PBCACV(X1,Y1,XT,YT,A,E,.X1,.Y1) S TL=$$TL($P(ELEM,"^",6))
 S X2=$P(ELEM,"^",4),Y2=$P(ELEM,"^",5)
 D CALXY^%PBCACV(X2,Y2,XT,YT,A,E,.X2,.Y2)
 D DROITE^%PBMFN(X1,Y1,X2,Y2,EF,TL,INVIS) Q
6 N X,Y S X=$P(ELEM,"^",2),Y=$P(ELEM,"^",3)
 D CALXY^%PBCACV(X,Y,XT,YT,A,E,.X,.Y) S TL=$$TL($P(ELEM,"^",7))
 D ARC^%PBMFN(X,Y,$$D^%PBCACV($P(ELEM,"^",4),E),$$A^%PBCACV($P(ELEM,"^",5),A),$$A^%PBCACV($P(ELEM,"^",6),A),EF,TL,INVIS) Q
7 N X,Y S X=$P(ELEM,"^",2),Y=$P(ELEM,"^",3)
 D CALXY^%PBCACV(X,Y,XT,YT,A,E,.X,.Y) S TL=$$TL($P(ELEM,"^",5))
 D CERCLE^%PBMFN(X,Y,$$D^%PBCACV($P(ELEM,"^",4),E),EF,TL,INVIS) Q
8 Q:TL  N NA,NE,NO,NV,NXT,NYT S NXT=$P(ELEM,"^",4),NYT=$P(ELEM,"^",5)
 D CALXY^%PBCACV(NXT,NYT,XT,YT,A,E,.NXT,.NYT)
 S NA=$$A^%PBCACV($P(ELEM,"^",6),A),NE=$P(ELEM,"^",7)*E,NO=$P(ELEM,"^",2),NV=$P(ELEM,"^",3)
 D ^%PBISAGE(NO,NV,NXT,NYT,NA,NE,0,0) Q
 N EL,%EL S EL=0 F %EL=0:0 S EL=$O(^[QUI]GRAPHE2(NO,NV,EL)) Q:EL=""  D AFF(NO,NV,NXT,NYT,NA,NE,EL,0,0)
 Q
TL(LT) Q:LT="P" $S(TL:"F",1:"P") Q:LT'="I" $S(TL:"P",1:LT) Q:'(INVIS) $S(TL:"P",1:"I") Q $S(TL:"F",1:"P")
 
ZOOM(EL,ZOOM) Q $$TRANS(EL,0,0,0,ZOOM)
ROTATION(EL,ANGL) Q $$TRANS(EL,0,0,ANGL,1)
TRANSLAT(EL,DX,DY) Q $$TRANS(EL,DX,DY,0,1)
TRANS(EL,XT,YT,AN,EC) N R,X,Y
 N ELEM S ELEM=^[QUI]GRAPHE2(O,V,EL) G @("Z"_$P(ELEM,"^",1))
 
Z1 S X=$P(ELEM,"^",2),Y=$P(ELEM,"^",3) D CALXY^%PBCACV(X,Y,XT,YT,AN,EC,.X,.Y) S $P(ELEM,"^",2)=X,$P(ELEM,"^",3)=Y,$P(ELEM,"^",4)=$$D^%PBCACV($P(ELEM,"^",4),EC),$P(ELEM,"^",5)=$$D^%PBCACV($P(ELEM,"^",5),EC)
 S $P(ELEM,"^",6)=$$NORM^%PBCACV(AN+$P(ELEM,"^",6)) Q ELEM
 
Z2 S X=$P(ELEM,"^",2),Y=$P(ELEM,"^",3) D CALXY^%PBCACV(X,Y,XT,YT,AN,EC,.X,.Y) S $P(ELEM,"^",2)=X,$P(ELEM,"^",3)=Y,$P(ELEM,"^",4)=$$D^%PBCACV($P(ELEM,"^",4),EC),$P(ELEM,"^",5)=$$D^%PBCACV($P(ELEM,"^",5),EC)
 S $P(ELEM,"^",6)=$$NORM^%PBCACV(AN+$P(ELEM,"^",6)) Q ELEM
 
Z3 S X=$P(ELEM,"^",2),Y=$P(ELEM,"^",3) D CALXY^%PBCACV(X,Y,XT,YT,AN,EC,.X,.Y) S $P(ELEM,"^",2)=X,$P(ELEM,"^",3)=Y
 D:$P(ELEM,"^",6)'="" ADDPOINT^%PBSOV(O,V,$P(ELEM,"^",6),X,Y) Q ELEM
 
Z4 S X=$P(ELEM,"^",2),Y=$P(ELEM,"^",3) D CALXY^%PBCACV(X,Y,XT,YT,AN,EC,.X,.Y) S $P(ELEM,"^",2)=X,$P(ELEM,"^",3)=Y Q ELEM
Z5 S X=$P(ELEM,"^",2),Y=$P(ELEM,"^",3) D CALXY^%PBCACV(X,Y,XT,YT,AN,EC,.X,.Y) S $P(ELEM,"^",2)=X,$P(ELEM,"^",3)=Y,X=$P(ELEM,"^",4),Y=$P(ELEM,"^",5) D CALXY^%PBCACV(X,Y,XT,YT,AN,EC,.X,.Y) S $P(ELEM,"^",4)=X,$P(ELEM,"^",5)=Y Q ELEM
 
Z6 S X=$P(ELEM,"^",2),Y=$P(ELEM,"^",3) D CALXY^%PBCACV(X,Y,XT,YT,AN,EC,.X,.Y) S $P(ELEM,"^",2)=X,$P(ELEM,"^",3)=Y,$P(ELEM,"^",4)=$$D^%PBCACV($P(ELEM,"^",4),EC)
 S $P(ELEM,"^",5)=$$NORM^%PBCACV(AN+$P(ELEM,"^",5)),$P(ELEM,"^",6)=$$NORM^%PBCACV(AN+$P(ELEM,"^",6))
 Q ELEM
 
Z7 S X=$P(ELEM,"^",2),Y=$P(ELEM,"^",3) D CALXY^%PBCACV(X,Y,XT,YT,AN,EC,.X,.Y) S $P(ELEM,"^",2)=X,$P(ELEM,"^",3)=Y,$P(ELEM,"^",4)=$$D^%PBCACV($P(ELEM,"^",4),EC) Q ELEM
 
Z8 S X=$P(ELEM,"^",4),Y=$P(ELEM,"^",5) D CALXY^%PBCACV(X,Y,XT,YT,AN,EC,.X,.Y) S $P(ELEM,"^",4)=X,$P(ELEM,"^",5)=Y,$P(ELEM,"^",7)=$P(ELEM,"^",7)*EC,$P(ELEM,"^",6)=$$NORM^%PBCACV(AN+$P(ELEM,"^",6)) Q ELEM

