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

;%EMSTGES^INT^1^59547,73869^0
EMSTGES ;
 
 
 
 
 
 
 
 
 N TEMP,STOP
DEB S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 
 S STOP=$$SAISIE(TEMP)
 Q:STOP=1
 
 G:'($D(@TEMP)) DEB
 
 D CALC(TEMP)
 
 D AFFI(TEMP)
 
 I $D(^DEVELOPPE($I)) S ^DEVELOPPE($I,"RESULTAT")=@TEMP@("RESULTAT")
 
 K @(TEMP) G DEB
 
 
SAISIE(TEMP) 
 
 
 
 
 
 
 
 N CTR,SAI,A,DIM,VAL,GL,LIGN,STOP
 S GL=$$CONCAS^%QZCHAD(TEMP,"DIMENSION")
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Acquisition des donnees"),0)
 
 S DX=10,DY=3 X XY
 D LIRE2^%VREAD($$^%QZCHW("Numero de la forme")_" : ","",DX,RM-4,DY+1,DY-1,"","$$UC^%EMSTGES",.CTR,.SAI)
 Q:(SAI="")!(CTR'="") 1
 
 S LIGN=$P($T(FORM+SAI),";;",2) Q:LIGN="" 0
 S @TEMP@("TYPE")="STANDARD"
 S @TEMP@("FORME")=SAI
 S DYC=DY+1,STOP=0
 
 F I=1:1 S DIM=$P(LIGN,"/",I) Q:DIM=""  D SAI(DIM) Q:STOP=1
 I STOP=1 K @(TEMP)
 Q 0
 
SAI(A) 
 S DYC=DYC+2,DX=10,DY=DYC X XY
 D LIRE2^%VREAD($$^%QZCHW("Valeur de la dimension")_" "_A_" : ","",DX,RM-4,DY+1,DY-1,"","$$UCV^%EMSTGES",.CTR,.VAL)
 I (CTR'="")!(VAL="") S STOP=1 Q
 S @GL@(A)=VAL
 Q
 
UC(YY1,REAF) 
 S REAF=0
 I YY1="" Q 1
 I (YY1+0)'=YY1 D ^%VSQUEAK Q 0
 I (YY1<1)!(YY1>24) D ^%VZEAVT($$^%QZCHW("Le numero de forme est compris entre 1 et 24")) Q 0
 Q 1
 
UCV(YY1,REAF) 
 S REAF=0
 I YY1="" Q 1
 D NORMALIS^%QZNBN1(.YY1)
 I (YY1+0)'=YY1 D ^%VZEAVT($$^%QZCHW("La valeur doit etre numerique")) Q 0
 Q 1
 
 
FORM 
 ;;D/L;;2*D*L
 ;;D;;2*D*D
 ;;D1/D2;;(D2*D2)+(D1*D1)
 ;;D/H;;(2*D*D)+(4*D*H)
 ;;D1/D2/L/R;;(D2*D2)+(4*L*L)+R*PI*(D1-(0.2*R))
 ;;D/L;;(D*D)+(4*L*L)
 ;;D1/D2/F/H;;(D1*D1)+(2*D1*H)+(F*(D1+D2))
 ;;D/R;;(D-(2*R))*(D-(2*R))+(2*PI*R*(D-(0.7*R)))
 ;;D1/D2/L/F;;(D1*D1)+(4*F*F)+(2*L*(D2+D1))
 ;;D1/D2/L;;(D1*D1)+(2*L*(D1+D2))
 ;;D1/D2/D3/F/L;;(D1*D1)+(2*(L*(D1+D2)+(F*(D2+D3))))
 ;;D1/D2/D3/L;;(D1*D1)+(2*L*(D1+D2))+(D3*D3)-(D2*D2)
 ;;D/H;;(D*D)+(4*D*H)
 ;;D1/D2/H;;(D2*D2)+(4*D1*H)
 ;;D1/D2/D3/L/H;;(D1*D1)+(2*L*(D2+D1))+(4*D2*H)+(D3*D3)-(D2*D2)
 ;;D1/D2/L/H1/H2;;(D1*D1)+(4*D1*H1)+(2*L*(D2+D1))+(4*D2*H2)
 ;;D1/D2/D3/D4/H1/H2/H3;;(D4*D4)+(4*((D3*H3)+(D2*H2)+(D1*H1)))
 ;;D/R/H;;(D-(2*R))*(D-(2*R))+(4*D*(H-R))+(2*PI*R*(D-(0.7*R)))
 ;;D1/D2/R;;(D2*D2)-(D1*D1)+((D1-(2*R))*(D1-(2*R)))+(2*PI*R*(D1-(0.7*R)))
 ;;D/H/F;;(4*D*H)+(D*D)+(4*F*F)
 ;;D2/D3/R/F;;(D2*D2)+(2.28*R*D2)+(2*F*(D2+D3))-(0.39*R*R)
 ;;D2/D3/R;;(D3*D3)+(2.28*R*D2)-(0.39*R*R)
 ;;D2/D3/R/H;;(D3*D3)+(4*D2*(0.57*R+H))-(0.39*R*R)
 ;;D2/D3/R/H/F;;(D2*D2)+(4*D2*(0.57*R+H+(F/2)))+(2*D3*F)-(0.39*R*R)
 
 
CALC(TEMP) 
 
 
 
 
 
 
 N RES,%I,DIM,GL,D,D1,D2,D3,D4,R,L,H,H1,H2,H3,F,PI
 S GL=$$CONCAS^%QZCHAD(TEMP,"DIMENSION")
 S DIM="",PI=31415926535E-10
 F %I=0:0 S DIM=$O(@GL@(DIM)) Q:DIM=""  S @DIM=@GL@(DIM)
 S RES=$P($T(FORM+@TEMP@("FORME")),";;",3)
 I RES'="" S @("RES="_RES)
 S @TEMP@("RESULTAT")=$J($$SQR^%TLCAMTH(RES)*$S(@TEMP@("FORME")=7:1414E-3,1:1),1,2)
 Q
 
 
AFFI(TEMP) 
 
 
 
 
 D ^%VZCDB($$^%QZCHW("Resultat du calcul du developpe"),0)
 S DX=10,DY=3 X XY
 D BLD^%VVIDEO W $J("",15),$$^%QZCHW("Forme standard numero")," : "
 S DX=$X,DY=$Y X XY
 D REV^%VVIDEO W @TEMP@("FORME")
 D NORM^%VVIDEO
 S DX=20,DY=21 X XY
 D BLD^%VVIDEO W $$^%QZCHW("Diametre du disque capable")
 S DX=50,DY=$Y X XY
 W "--->  " D REV^%VVIDEO W @TEMP@("RESULTAT")
 D NORM^%VVIDEO
 D ^%VZEAVT("")
 Q

