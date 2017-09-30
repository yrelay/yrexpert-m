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

;%SDECAC^INT^1^59547,73888^0
%SDECAC ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
DEMIE 
 D XY(AD,OD,.AD,.OD),XY(PR,GR,.PR,.GR)
 D CALXY^%PBCACV(AD,OD,XO,YO,ANGO,ECHO,.AD,.OD)
 D CALXY^%PBCACV(AD,OD,XOC,YOC,ANGC,ECHC,.AD,.OD)
 
 S ID=((ID+ANGO)+ANGC)#360
 S PR=$$D^%PBCACV(PR,ECHO*ECHC)
 S GR=$$D^%PBCACV(GR,ECHO*ECHC)
 D EPAIS^%SDECAC2
 D DEMIE^%PBMFN(AD,OD,PR,GR,ID,EF,TL,VIS)
 D KILL
 Q
ELLIP 
 D XY(AD,OD,.AD,.OD),XY(PR,GR,.PR,.GR)
 D CALXY^%PBCACV(AD,OD,XO,YO,ANGO,ECHO,.AD,.OD)
 D CALXY^%PBCACV(AD,OD,XOC,YOC,ANGC,ECHC,.AD,.OD)
 
 S ID=((ID+ANGO)+ANGC)#360
 S PR=$$D^%PBCACV(PR,ECHO*ECHC)
 S GR=$$D^%PBCACV(GR,ECHO*ECHC)
 D EPAIS^%SDECAC2
 D ELLIPSE^%PBMFN(AD,OD,PR,GR,ID,EF,TL,VIS)
 D KILL
 Q
POINT 
 N TAILLE,AD2,OD2
 D XY(AD,OD,.AD,.OD)
 D CALXY^%PBCACV(AD,OD,XO,YO,ANGO,ECHO,.AD2,.OD2)
 D CALXY^%PBCACV(AD2,OD2,XOC,YOC,ANGC,ECHC,.AD2,.OD2)
 D POINT^%PBMFN(AD2,OD2,EF)
 I VISIBLE S AD=AD+20,OD=OD+20,TAILLE=75E-2 D ECR(TEXTE,AD,OD,"",AD,OD)
 D KILL
 Q
TEXTE 
 D XY(AD,OD,.AD,.OD)
 D CALXY^%PBCACV(AD,OD,XO,YO,ANGO,ECHO,.AD,.OD)
TEXTE1 N SANGO S SANGO=ANGO,ANGO=ANGO+I
 K ENVL(%TERM,"EPAISSEUR")
 I %PORT'=0 S %9EPA=1E-2,%FONC="EPAISSEUR" D ^%PBPZ
 
 I TEXTE'["!@#" D ECR(TEXTE,AD,OD,"",AD,OD) G FTEXTE
 N CH,CHAINE,LG1,CPT,DEBUT,FIN,TYP,CAR,NIVO,XS
 S CPT=0,LG1=$L(TEXTE),CHAINE=TEXTE,NIVO=0,XS=AD,YS=OD
LOOP1 S CPT=CPT+1
 I CPT>LG1 G FTEXTE
 I CPT=LG1 D ECR(CHAINE,AD,OD+NIVO,"",.XS,.YS) G FTEXTE
 S CAR=$E(CHAINE,CPT),DEBUT="",FIN=""
 I CAR="!" S DEBUT=CAR F I=1:1:2 S DEBUT=DEBUT_$E(CHAINE,CPT+I)
 I DEBUT'="!@#" G LOOP1
 S CPT=CPT+3
 S TYP=$E(CHAINE,CPT)
 I "HBS"'[TYP G LOOP1
 S DEBUT=DEBUT_TYP
 S CH=$E(CHAINE,1,CPT-4) D ECR(CH,AD,OD+NIVO,"",.XS,.YS)
 S CHAINE=$E(CHAINE,CPT-3,99),CPT=4,LG1=$L(CHAINE)
 S NIVO=0
 I TYP="H" S NIVO=250
 I TYP="H" S NIVO=-250
LOOP2 S CPT=CPT+1
 I CPT=LG1 D ECR(CHAINE,AD,OD+NIVO,TYP,.XS,.YS) G FTEXTE
 S CAR=$E(CHAINE,CPT),FIN=""
 I CAR="!",TYP'="S" G SYMB
 I CAR'=TYP G LOOP2
 F I=1:1:3 S FIN=FIN_$E(CHAINE,CPT+I)
 I FIN'="#@!" G LOOP2
 S FIN=TYP_FIN
 S CH=$P(CHAINE,DEBUT,2),CH=$P(CH,FIN,1)
 D ECR(CH,AD,OD+NIVO,TYP,.XS,.YS)
 S CHAINE=$P(CHAINE,DEBUT_CH_FIN,2),LG1=$L(CHAINE),CPT=0
 G LOOP1
SYMB 
 S DEBUT2=CAR F I=1:1:3 S DEBUT2=DEBUT2_$E(CHAINE,CPT+I)
 I DEBUT2'="!@#S" G LOOP2
 S CH=$E(CHAINE,5,CPT-1) D ECR(CH,AD,OD+NIVO,TYP,.XS,.YS)
 S CHAINE=DEBUT_$E(CHAINE,($L(CH)+1)+4,999)
 S CH=$P(CHAINE,"!@#S",2),CH=$P(CH,"S#@!",1)
 I $E(CH,1,2)="$$" S @("CH="_CH)
 D ECR(CH,AD,OD+NIVO,TYP,.XS,.YS)
 S CHAINE=$E(CHAINE,1,4)_$E(CHAINE,(($L(CH)+1)+8)+4,999)
 S CPT=4
 G LOOP2
FTEXTE 
 S ANGO=SANGO
 Q
 
ECR(TEXTE,AD,OD,TT,XS,YS) 
 N LG,II,LETTRE,XCOUR,YCOUR
 S LG=$L(TEXTE),II=0
 S XCOUR=XS,YCOUR=$S(TT="H":YS+(((500*1E-1)*TAILLE)*ECHO),TT="B":YS-(((500*1E-1)*TAILLE)*ECHO),1:YS)
 I TT="S" D ^%SDSYMB($E(TEXTE,2,LG-1),XCOUR,YCOUR,TAILLE,%PORT,%TERM) S XCOUR=XCOUR+(((600*1E-1)*TAILLE)*ECHO),YCOUR=YS D CALC(.XCOUR,.YCOUR) G FLOOPT
LOOPT S II=II+1 I II>LG G FLOOPT
 S LETTRE=$E(TEXTE,II)
 D ^%SDSYMB(LETTRE,XCOUR,YCOUR,TAILLE,%PORT,%TERM)
 S XCOUR=XS+((((II*600)*1E-1)*TAILLE)*ECHO),YCOUR=$S(TT="H":YS+(((500*1E-1)*TAILLE)*ECHO),TT="B":YS-(((500*1E-1)*TAILLE)*ECHO),1:YS)
 D CALC(.XCOUR,.YCOUR)
 G LOOPT
FLOOPT 
 S XS=XCOUR,YS=$S(TT="H":YCOUR-(((500*1E-1)*TAILLE)*ECHO),TT="B":YCOUR+(((500*1E-1)*TAILLE)*ECHO),1:YCOUR)
 Q
CALC(XR,YR) 
 Q:ANGO=0
 D ROTO(XR-XS,YR-YS,ANGO,.XR,.YR)
 S XR=XS+XR,YR=YS+YR
 Q
 
ROTO(X,Y,AN,XF,YF) 
 N COS,SIN S COS(AN)=$$COS^%PBCACV(AN),SIN(AN)=$$SIN^%PBCACV(AN)
 S XF=(X*COS(AN))-(Y*SIN(AN))
 S YF=(X*SIN(AN))+(Y*COS(AN))
 Q
 
TRAIT 
 D XY(AD,OD,.AD,.OD),XY(AA,OA,.AA,.OA)
 D CALXY^%PBCACV(AD,OD,XO,YO,ANGO,ECHO,.AD,.OD)
 D CALXY^%PBCACV(AA,OA,XO,YO,ANGO,ECHO,.AA,.OA)
 
 D CALXY^%PBCACV(AD,OD,XOC,YOC,ANGC,ECHC,.AD,.OD)
 D CALXY^%PBCACV(AA,OA,XOC,YOC,ANGC,ECHC,.AA,.OA)
 D EPAIS^%SDECAC2
 D DROITE^%PBMFN(AD,OD,AA,OA,EF,TL,VIS)
 D KILL
 Q
ARC 
 D XY^%SDECAC(AD,OD,.AD,.OD),XY1^%SDECAC(R,.R)
 D CALXY^%PBCACV(AD,OD,XO,YO,ANGO,ECHO,.AD,.OD)
 
 D CALXY^%PBCACV(AD,OD,XOC,YOC,ANGC,ECHC,.AD,.OD)
 S IF=((IF+ANGO)+ANGC)#360
 S ID=((ID+ANGO)+ANGC)#360
 S R=$$D^%PBCACV(R,ECHO*ECHC)
 D EPAIS^%SDECAC2
 D ARC^%PBMFN(AD,OD,R,ID,IF,EF,TL,VIS)
 D KILL
 Q
CERCLE 
 G CERCLE^%SDECAC2
RECTA 
 Q
FLECH 
 G FLECH^%SDECAC2
 
RACCO 
 G RACCO^%SDECAC2
 
KILL K %8ELIPS,%8BET,%9X1,%9Y1,%9X2,%9Y2,%9X1S,%9Y1S,%9X2S,%9Y2S,%9AD,%9AF,%9STR,%9R,%9EPA,%9E
 Q
 
TL(LT) Q:LT="P" $S(TL:"F",1:"P") Q:LT'="I" $S(TL:"P",1:LT) Q:'(VIS) $S(TL:"P",1:"I") Q $S(TL:"F",1:"P")
 
XY(X,Y,XX,YY) 
 S XX=X*188E-1,YY=Y*188E-1 Q
XY1(X,XX) 
 
 S XX=X*188E-1 Q

