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
;! Nomprog     : %VQUIKMN                                                     !
;! Module      : VIDEO                                                        !
;! But         : Menu pamamétré                                               !
;!                                                                            !
;! Description :                                                              !
;!                                                                            !
;!   EXEMPLE :                                                                !
;!   consultation  consultation.etendue  reconsulter  localisation  details   !
;!   toutes.reponses  schema  impression  compulser  nettoyage                !
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

%VQUIKMN(XG,XD,YH,MES,AD,CONT) 

 ;----------------------------------------------------------------------------
 ;XG    : Coin haut gauche
 ;XD    : Coin haut droit
 ;YH    : Hauteur
 ;MES   : Global contenant le menu
 ;.AD   : Retour adresse choisie
 ;.CONT : Retour contrôle choisi
 ;----------------------------------------------------------------------------

 N CONFIRM
 S CONFIRM=0
 
 D REINIT^%EDPRLG
 G CONF1
 
 
CONF(XG,XD,YH,MES,CONFIRM,AD,CONT) 
 
CONF1 S AD=""
 I $$TABID^%INCOIN("ORDINATEUR")="PDP" D ^%VGENMEN(XG,XD,YH,MES),CONFIRM^%VLECMEN(CONFIRM,.AD,.CONT) Q
 N CAD S CAD=0 G BEG
1(XG,XD,YH,MES,CAD,AD,CONT,DIM,LLIB)

 ;-------------------------------------------------------
 ;XG    : Coin gauche haut
 ;XD    : Coin droit haut
 ;YH    : Hauteur
 ;MES   : Glogal contenant le menu
 ;CAD   : Dessiner un cadre
 ;.AD   : Retour de l'adresse choisie
 ;.CONT : Retour du contrôle saisi
 ;.DIM  : Retour de la position
 ;.LLIB : Retour de l'étiquette de l'adresse choisie
 ;-------------------------------------------------------

 N CONFIRM
 S CONFIRM=0,AD=""
 
BEG N %EQI,%U,%V,%VINV,%W,%Z,CC,EQ,LC,LGI,LI,LMX,NOP,OPT,VID,TBMOV,REVID,ODX,ODY,NDX,NDY,LGC,AX,AY,%MC,%GF,TEMP,%GF1
 S TEMP=$$TEMP^%INCOIN("%GF1",$P($ZPOS,"^",2)) K @(TEMP)
 S %GF=$$CONCAS^%QZCHAD(TEMP,"%GF")
 S LI="",LGI=0,LMX=(XD-XG)-1,LC=YH,CC=XG+1 S:LC>23 LC=23 S @%GF@(4,LC)="",%U="",NOP=1
 
 
 
 
LU S %U=$O(@MES@(%U)) G:%U="" FLU S %V=@MES@(%U),%W=$P(%V,"^",2,999),%V=$$^%QZCHW($P(%V,"^",1)),LGC=(LGI+$L($TR(%V,"#","")))+2
 I (LGC>LMX)&(LGI'=0) S LGI=0,CC=XG+1,LC=LC+1,@%GF@(4,LC)="" S:LC>23 LC=23
 I $E(^TOZE($I,"AFMEN"))="M" S %V=$$MAJ^%VMINUSC(%V),%VINV=$$MIN^%VMINUSC(%V) G LUS
 S %V=$$MIN^%VMINUSC(%V),%VINV=$$MAJ^%VMINUSC(%V)
 
LUS S @%GF@(4,LC)=@%GF@(4,LC)_%V_"  ",@%GF@(2,LC,CC)=%V,@%GF@(1,$TR($S(%V["#":$P(%V,"#",2,999),1:%V),"#",""))=LC_"/"_CC,@%GF@(3,LC,CC)=%W,@%GF@(6,LC,CC)=$S($D(@MES@(%U,"COM")):$$^%QZCHW(@MES@(%U,"COM")),1:""),LGI=(LGI+$L($TR(%V,"#","")))+2
 S @%GF@(1,$S(%VINV["#":$TR($P(%VINV,"#",2,999),"#",""),1:%VINV))=LC_"/"_CC,@%GF@(1,NOP)=LC_"/"_CC
 
 I $D(@MES@(%U,"EQU")) S EQ=@MES@(%U,"EQU") F %Z=1:1 S %EQI=$P(EQ,"^",%Z) Q:%EQI=""  S @%GF@(1,%EQI)=LC_"/"_CC,%EQI=$$MIN^%VMINUSC(%EQI),@%GF@(1,%EQI)=LC_"/"_CC
 S CC=(CC+$L($TR(%V,"#","")))+2,NOP=NOP+1 G LU
 
 
FLU S LI=$ZP(@%GF@(2,""))+1,%Z=0 S:LI>23 LI=23 S:($D(@MES)#10)=1 LC=$P(@MES,"^",1),CC=$P(@MES,"^",2),EQ=$P(@MES,"^",3),%Z=1
 S @%GF@(6)=$S(%Z=1:$S($D(@%GF@(4,LC)):LI,1:LC),1:LI)_$S(%Z=1:$S(CC<EQ:"^"_CC_"^"_EQ_"0",1:"^"_XG_"^"_XD_"^0"),1:"^"_XG_"^"_XD_"^0")
 
 
 
 
 
 
 
 
 
 
 S DIM=$$DIM I CAD D CARSP^%VVIDEO($P(DIM,",",1),$P(DIM,",",2),$P(DIM,",",3),$P(DIM,",",4))
 S LLIB=$$CONF^%VQUIKM2(.AD,.CONT,CONFIRM)

FIN K @(TEMP) Q
DIM() 
 N D,XG,YH,LH,LV,L S D="",LH=0,L="",YH=$O(@%GF@(2,"")) Q:YH="" D S XG=$O(@%GF@(2,YH,"")) Q:XG="" D F LV=0:1 S L=$O(@%GF@(4,L)) Q:L=""  S LH=$S($L(@%GF@(4,L))>LH:$L(@%GF@(4,L)),1:LH)
 Q (XG-CAD)_","_(YH-CAD)_","_(LV+(2*CAD))_","_(LH+(2*CAD))
 



TEST
 K ^TEST($J) S EXPL=$P($T(EXPL),";;",2) F %U=1:1 S OPT=$P(EXPL,",",%U) Q:OPT=""  S ^TEST($J,%U)=$P(OPT,"|",1),^TEST($J,%U,"EQU")=$P(OPT,"|",2),^TEST($J,%U,"COM")=$P(OPT,"|",3)
 S ^TEST($J)="5^5^7" D CLEPAG^%VVIDEO
ESS D POCLEPA^%VVIDEO W "Suite ? " R *X Q:X=1  D CLEPAG^%VVIDEO F DX=20,60 S DY=8 X XY W "*"
 D 1^%VQUIKMN(20,60,8,"^TEST($J)",1,.ADR,.CTRL,.POS,.LL)
 D POCLEPA^%VVIDEO W "ADR = ",ADR,?$X+10,"CTLR = ",CTRL,?$X+20,POS,?$X+40,LL R *X G ESS
EXPL ;;A#D#R#E#S#S#E #1#^AD1|B|adresse 1,boujour #2#^AD2|C|adresse 2,Charles^AD3,ADRESSE 4^AD4,ADRESSE 5^AD5,ADRESSE 6^AD6,ADRESSE 7^AD7,ADRESSE 8^AD8,ADRESSE 9^AD9,ADRESSE 10^AD10

