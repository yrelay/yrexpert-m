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

;%QSEDI2^INT^1^59547,73881^0
QSEDIT ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
TRAIT 
 I NB=1 S IF=IND G AT
 S I2=$O(@INDIV@(IND)) I (NB=2)!(I2="") S IF=I2 G AT
 S I3=$O(@INDIV@(I2)) I (NB=3)!(I3="") S IF=I2 G AT
 S (IF,I4)=$O(@INDIV@(I3))
AT S A="" F %A=0:0 S A=$O(@ATT@(A)) Q:A=""  D TR Q:ARRET=1
 Q
TR 
 S EA=$$^%QZCHEV(A,L,"P"),VIND=$E($$^%QSCALVA(BASE,IND,A),1,L-1) I NB=1 S %CH=EA_$J("",L-$L(EA))_VIND G STR
 S VI2=$E($$^%QSCALVA(BASE,I2,A),1,L-1) I (NB=2)!(I2="") S %CH=EA_$J("",L-$L(EA))_VIND_$J("",L-$L(VIND))_VI2 G STR
 S VI3=$E($$^%QSCALVA(BASE,I3,A),1,L-1) I (NB=3)!(I3="") S %CH=EA_$J("",L-$L(EA))_VIND_$J("",L-$L(VIND))_VI2_$J("",L-$L(VI2))_VI3 G STR
 S %CH=EA_$J("",L-$L(EA))_VIND_$J("",L-$L(VIND))_VI2_$J("",L-$L(VI2))_VI3_$J("",L-$L(VI3))_$E($$^%QSCALVA(BASE,I4,A),1,L-1)
STR 
 S GLZ=GLZ+1,ZLG=ZLG+1 G:(ZLG'>LIM)&('(NOUV)) INT
 
 S GLZ=1,ZLG=10,NOUV=0,EGAP=EGAP+1
 S E=$E(IND,1,L-1),CH=E,AF=IND G:NB=1 LNI G:I2="" LNI
 S E2=$E(I2,1,L-1),CH=CH_$J("",L-$L(E))_E2,AF=AF_" "_I2 G:NB=2 LNI G:I3="" LNI
 S E3=$E(I3,1,L-1),CH=CH_$J("",L-$L(E2))_E3,AF=AF_" "_I3 G:NB=3 LNI G:I4="" LNI
 S CH=CH_$J("",L-$L(E3))_$E(I4,1,L-1),AF=AF_" "_I4
LNI S ^AFF($J,EGAP)=AF,^AFFIND($J,EGAP)=CH
 S DX=0,DY=7 D CLEBAS^%VVIDEO,L7^%QSLIB W ?60,$$^%QZCHW("Page : "),EGAP S DX=0,DY=7 X XY
 W ?L,CH
INT S ^AFFPAG($J,EGAP,ZLG)=%CH
 I (GLZ#15)=0 S GLZ=1,DX=0,DY=7 D CLEBAS^%VVIDEO,L7^%QSLIB W ?60,$$^%QZCHW("Page : "),EGAP S DX=0,DY=7 X XY W ?L,CH
 W !,%CH R *ARRET:0 D TOUCHE^%INCCLAV(ARRET,.ARRET) Q
1 
 D IMPR^%QSEDECI Q
0 
 S BL=$J("",8),TIT=$$^%QZCHW("Attributs")_$J("",L-9)_I G:NB=1 AP
 S TIT=TIT_BL_I G:NB=2 AP S TIT=TIT_BL_I G:NB=3 AP S TIT=TIT_BL_I
AP D ECR^%QSEDECI Q

