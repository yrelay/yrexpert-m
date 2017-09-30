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

;%PBP3F^INT^1^59547,73874^0
PTF ;
 
 N TYPFE,TABLE,MODE
 S:'($D(%9NLI)) %9NLI=1 S:'($D(%9NCO)) %9NCO=1
 S ENVL(%TERM,"%9NCO")=%9NCO,ENVL(%TERM,"%9NLI")=%9NLI
COUL F I=1:1:8 S ENVL(%TERM,$P(^ENVCONF(%TERM),"^",(2*(I-1))+2),$P(^ENVCONF(%TERM),"^",(2*(I-1))+3))=I
 S ENVL(%TERM,"PITCH")=$P(^ENVCONF(%TERM),"^",18)
 S ENVL(%TERM,"%PFXI")=^ENVCONF(%TERM,"%PFXI")
 S ENVL(%TERM,"%PFYI")=^ENVCONF(%TERM,"%PFYI")
 S ENVL(%TERM,"SZX")=^ENVCONF(%TERM,"SZX")
 S ENVL(%TERM,"SZY")=^ENVCONF(%TERM,"SZY")
 S ENVL(%TERM,"RAP")=13E-1
 S ENVL(%TERM,"%DLI")=ENVL(%TERM,"SZY")\ENVL(%TERM,"%9NLI")
 S ENVL(%TERM,"%DCO")=ENVL(%TERM,"SZX")\ENVL(%TERM,"%9NCO")
 I ENVL(%TERM,"%DCO")>(ENVL(%TERM,"RAP")*ENVL(%TERM,"%DLI")) S ENVL(%TERM,"%TCO")=ENVL(%TERM,"%DLI")*ENVL(%TERM,"RAP"),ENVL(%TERM,"%TLI")=ENVL(%TERM,"%DLI")
 E  S ENVL(%TERM,"%TCO")=ENVL(%TERM,"%DCO"),ENVL(%TERM,"%TLI")=ENVL(%TERM,"%DCO")\ENVL(%TERM,"RAP")
 S ENVL(%TERM,"%FEN")=0,ENVL(%TERM,"%RED")=ENVL(%TERM,"%TCO")/4096
 D ^%PBP3TAI
 S ENVL(%TERM,"%PFX")=^ENVCONF(%TERM,"%PFXI"),ENVL(%TERM,"%PFY")=(^ENVCONF(%TERM,"%PFYI")+ENVL(%TERM,"SZY"))-ENVL(%TERM,"%DLI")
 S ENVL(%TERM,"PITCH")=$J(ENVL(%TERM,"PITCH")*ENVL(%TERM,"%RED"),1,3) W "LT;",!
 W "PA;PU",ENVL(%TERM,"%PFX"),",",ENVL(%TERM,"%PFY"),";",!
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 S TYPFE=$P(^ENVCONF(%TERM),"^")
 S TABLE=$S($D(^ENVCONF(%TERM,"TABLE")):^ENVCONF(%TERM,"TABLE"),1:"A2")
 G:TABLE="A0" TABLA0
 
 I TYPFE="A3" W "IP-12280,-8400,3720,2600;",! G SCALE
 I TYPFE="A2" W "IP-12280,-8400,11480,8400;",! G SCALE
 
 W "IP-12280,-8400,-1000,0;",!
 G SCALE
TABLA0 
 I TYPFE="A3" W "IP-23760,-16800,-7760,-5800;",! G SCALE
 I TYPFE="A2" W "IP-23760,-16800,0,0;",! G SCALE
 I TYPFE="A0" W "IP-23760,-16800,23760,16800;",! G SCALE
 
 W "IP-23760,-16800,-12480,-8400;",!
 G SCALE
SCALE 
 
 S MODE=$S('($D(^ENVCONF(%TERM,"MODE"))):"A",1:^ENVCONF(%TERM,"MODE"))
 
 I MODE="A" W "SC0,297,0,210;",! S %LIMYCM=21 Q
 
 
 I TYPFE="A4" W "SC0,297,0,210;",! S %LIMYCM=21 Q
 I TYPFE="A3" W "SC0,420,0,297;",! S %LIMYCM=297E-1 Q
 I TYPFE="A2" W "SC0,574,0,420;",! S %LIMYCM=42 Q
 I TYPFE="A0" W "SC0,1188,0,840;",! S %LIMYCM=84 Q
 
 
 
TYPFE 
 N TYPFE,CTR,YY1,TYPES,TABLE
 D CLEPAG^%VVIDEO
 S TYPES("A2")="",TYPES("A3")="",TYPES("A4")="",TYPES("A0")=""
 S TYPFE=$P(^ENVCONF("RD-GL2"),"^")
 S TABLE=$S($D(^ENVCONF("RD-GL2","TABLE")):^ENVCONF("RD-GL2","TABLE"),1:"A2")
 D LIRE2^%VREAD($$^%QZCHW("Taille de la table tracante")_" : ",TABLE,10,60,10,10,"","",.CTR,.YY1)
 S ^ENVCONF("RD-GL2","TABLE")=YY1
 S TYPFE=$P(^ENVCONF("RD-GL2"),"^")
 D LIRE2^%VREAD($$^%QZCHW("Format des feuilles de la table tracante")_" : ",TYPFE,10,60,12,12,"","",.CTR,.YY1)
 Q:CTR'=""  Q:YY1=""
 I YY1="?" S YY1=$$UN^%PKCHOIX("TYPES",15,15,5) Q:YY1=""
 I '($D(TYPES(YY1))) S YY1=$$UN^%PKCHOIX("TYPES",15,15,5) Q:YY1=""
 I YY1'=TYPFE S $P(^ENVCONF("RD-GL2"),"^")=YY1
 S MODE=$S($D(^ENVCONF("RD-GL2","MODE")):^ENVCONF("RD-GL2","MODE"),1:"A")
 D LIRE2^%VREAD($$^%QZCHW("Impression en mode reel (R) ou en mode A4 agrandi (A) ?")_" : ",MODE,10,70,14,14,"","",.CTR,.YY1)
 S ^ENVCONF("RD-GL2","MODE")=MODE
 Q

