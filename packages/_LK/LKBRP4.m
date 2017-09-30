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

;LKBRP4^INT^1^59547,74867^0
LKBRP4 ;
 
 
 
 
DEB 
 N GLO,FORM,STOP,ENR,TYP
 D CLEPAG^%VVIDEO
 S GLO="^[QUI]TEMPO4(""BARPHONE"")"
 S FORM="^[QUI]LK(""BARPHONE"")" K @(FORM)
 F TYP="COMP","GEOM" D FORMAT
 Q
FORMAT 
 S STOP=0
 D TAB
 D CLEPAG^%VVIDEO,^%VZCDB("formatage des "_$S(TYP="COMP":"COMPOSANTS",1:"GEOMETRIES"),0)
 K @FORM@(TYP)
 S ENR="",NBR=0,DATE=$H,NERR=0,ERR=$$TEMP^%QZCHAD($P($ZPOS,"^",2),TYP) K @(ERR)
TRT 
 S ENR=$O(@GLO@(TYP,ENR)) G:ENR="" FTRT
 S VAL=@GLO@(TYP,ENR),REF=VAL
 G @TYP
FTRT 
 I '($D(@ERR@(TYP))) Q
 D CLEPAG^%VVIDEO,^%VZCDB("erreurs de "_TYP,0)
 S ERR=$$CONCAS^%QZCHAD(ERR,TYP) D INIT^%QUCHOIP(ERR,"",1,1,1,78,20),AFF^%QUCHOIP
 S A=$$UN^%QUCHOIP
 Q
GEOM 
 I $E(VAL,1,4)="GEOM" G GEOM2
 I $E(VAL,1,6)="G_ATTR" G GATTR
 G TRT
GEOM2 
 W !,VAL S GEOM=$$GETLBLAN^%VTLBLAN($P(VAL,"GEOM ",2))
 G TRT
GATTR 
 I VAL'["PLACEMENT_OUTLINE" G TRT
 S VAL=$$ZSUBST^%QZCHSUB(VAL,"-  ","")
 S VAL=$$ZSUBST^%QZCHSUB(VAL,"- ","-")
 S VAL=$E(VAL,42,250),CPT=1,LG=$L(VAL," ")
 F I=1:2:LG S @FORM@(TYP,GEOM,"POINT",CPT,"X")=$P(VAL," ",I),@FORM@(TYP,GEOM,"POINT",CPT,"Y")=$P(VAL," ",I+1),CPT=CPT+1
 G TRT
COMP 
 G:(VAL'[TYP)_" " TRT
 S NBR=NBR+1
 D FORM(VAL)
 I STOP S @ERR@(TYP,ENR_" "_@GLO@(TYP,ENR))="",NERR=NERR+1,DX=50,DY=22 X XY W "nbre erreur : "_NERR S STOP=0 G TRT
 
 S DX=35,DY=22 X XY W $J(NBR,5)
 
 S ENR=$O(@GLO@(TYP,ENR)) G:ENR="" FTRT
 S VAL=@GLO@(TYP,ENR)
 I VAL'["C_PROP" G TRT
 S VAL=$E(VAL,8,999)
 D FORM2(VAL)
 
 I STOP S @ERR@(TYP,ENR_" "_@GLO@(TYP,ENR))="",NERR=NERR+1,DX=50,DY=22 X XY W "nbre erreur : "_NERR S STOP=0 G TRT
 G TRT
 
 
FORM(CH) 
 S P=0,LINE="",CPT=0
LOOP D LEC2
 G:CH2="" FFORM
 S CPT=CPT+1
 I C1(CPT)<$L(CH2) S STOP=1 Q
 S BLK=C1(CPT)-$L(CH2)
 S LINE=LINE_CH2_$S(BLK'=0:$J(" ",BLK),1:"")_" "
 D LEC
 D CAR I C="" G FFORM
 S P=P-1
 G LOOP
FFORM 
 S @FORM@(TYP,DATE,"DATA",1,NBR)=LINE
 Q
FORM2(CH) 
 N LISTE
 S P=0,LINE=""
LOOP2 D LEC2
 G:CH2="" FFORM2
 S CH2=$E(CH2,2,$L(CH2)-1),SSCH1=$P(CH2,","),SSCH2=$$ZSUBST^%QZCHSUB($P(CH2,",",2,99),"""","")
 S CPT=CPT+1
 I '($D(C4(SSCH1))) G FORM20
 I C4(SSCH1)<$L(SSCH2) S STOP=1 Q
 S BLK=C4(SSCH1)-$L(SSCH2)
 S LISTE(SSCH1)=SSCH2_$S(BLK'=0:$J(" ",BLK),1:"")
FORM20 D LEC
 D CAR I C="" G FFORM2
 S P=P-1
 G LOOP2
FFORM2 
 S J="" F I=0:0 S J=$O(C2(J)) Q:J=""  S @FORM@(TYP,DATE,"DATA",1,NBR)=@FORM@(TYP,DATE,"DATA",1,NBR)_" "_$S($D(LISTE(C2(J))):LISTE(C2(J)),1:$J(" ",C4(C2(J))))
 Q
CAR S C=$E(CH,P,P) Q
LEC N B F B=0:0 S P=P+1 D CAR Q:C'=" "
 Q
CAR2 S C2=$E(CH,P,P) Q
LEC2 N B S CH2=""
 F B=0:0 S P=P+1 D CAR2 Q:C2=" "  Q:C2=""  S CH2=CH2_C2
 Q
 
TAB 
 
 N GL,A,I,J,D,F
 S GL="^TEMPORAI("_$J_",""LKBRPMN"",""NEUTRAL"")"
 S A="" F I=0:0 S A=$O(@GL@(A)) Q:A=""  S D=$O(@GL@(A,1,"")),VAL=@GL@(A,1,D),F=$P(VAL,"^"),CONFIG(D)=F_"^"_A
 S D="",J=0 F I=1:1 S D=$O(CONFIG(D)) Q:D=""  S VAL=CONFIG(D),F=$P(VAL,"^"),ATT=$P(VAL,"^",2),C1(I)=(F-D)+1 D PROP
 K CONFIG
 Q
PROP 
 I ATT="GROUPE" S J=J+1,C2(J)="GROUP",C3("GROUP")=J,C4("GROUP")=C1(I) Q
 I ATT="CARACTERISTIQUE" S J=J+1,C2(J)="SPICEPAR",C3("SPICEPAR")=J,C4("SPICEPAR")=C1(I) Q
 I ATT="TOLERANCE" S J=J+1,C2(J)="TOLER",C3("TOLER")=J,C4("TOLER")=C1(I) Q
 I ATT="POWER.TYPE" S J=J+1,C2(J)="POW_TYP",C3("POW_TYP")=J,C4("POW_TYP")=C1(I) Q
 Q

