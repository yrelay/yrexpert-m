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

;%HXIISS2^INT^1^59547,73869^0
HXIISS2 ;
 
 
 
 
 
AFF(GL,HIS,OPTH) 
 D MKGRA(GL,HIS,OPTH),MKCOL(GL,HIS,OPTH),MKTEX(GL,HIS,OPTH)
 D REAFF(GL,HIS,OPTH)
 Q
 
 
MKGRA(GL,HIS,OPTH) 
 N GRAD,IND,NV
 K @TEXT2@(HIS)
 S NV=5-$L($J(ECHEL(HIS),1,0)) S:NV<0 NV=0
 S GRAD=ECHEL(HIS)/HHIST,(SSCUMUL,I)=0
 F IND=1:1:HHIST+1 S @TEXT2@(HIS,1,(HHIST-IND)+2)=$S(I=0:0,1:$J($$TRAIT(I),1,NV)),I=I+GRAD
 S @TEXT2@(HIS)=1_"^"_IND
 Q:OPTH'=0
 F I=1:1:@GL S SSCUMUL=SSCUMUL+$$SOM(I)
 S SSCUMUL=$S(SSCUMUL=0:"Non evaluable",(CARD="")!(CARD=0):"Inconnu",1:$J($$SQR^%TLCAMTH(SSCUMUL/CARD),1,2))
 
 Q
 
MKCOL(GL,HIS,OPTH) 
 N E,J,K,TOP,NBRI
 K @COLON@(HIS)
 S TOP=(NOCOL(HIS)+NBCOL(HIS))-1
 I ECHEL(HIS)=0 S @COLON@(HIS)=0 G COLNUL
 S E=HHIST/ECHEL(HIS)
 I OPTH!(HIS=2) S SSCUMUL=0,NBRI=0
 I (OPTH=0)&(HIS=2) F I=1:1:@GL S SSCUMUL=SSCUMUL+$$SOM(I),NBRI=NBRI+@GL@(I,"IND")
 I (OPTH=0)&(HIS=2) S SSCUMUL=$S(SSCUMUL=0:"Non evaluable",NBRI=0:"Inconnu",1:$J($$SQR^%TLCAMTH(SSCUMUL/NBRI),1,2))
 S @COLON@(HIS)=NBCOL(HIS)+1
 F I=NOCOL(HIS):1:TOP D TCOL
 Q
 
TCOL S J=(I-NOCOL(HIS))+1,@COLON@(HIS,2,J)=0
 I $D(@GL@(I))#10 S K=E*@GL@(I),@COLON@(HIS,1,J)=$P(K,".",1)+($E($P(K,".",2),1)>5) S:OPTH SSCUMUL=@GL@(I)+SSCUMUL Q
 S @COLON@(HIS,1,J)=0
 Q
COLNUL F I=NOCOL(HIS):1:TOP S J=(I-NOCOL(HIS))+1,@COLON@(HIS,2,J)=0,@COLON@(HIS,1,J)=0
 Q
 
MKTEX(GL,HIS,OPTH) 
 N IND,LIMCOL,SYN
 K @TEXT@(HIS)
 S @TEXT@(HIS)=NBCOL(HIS)_"^4",IND=0
 I '($D(@GL)#10) G NULCOL
 I HIS=1 S SYN=$S($P(R,"^",1)'="NOM":0,1:1)
 I HIS=2 S SYN=$S($P(ECL,"^",1)'="NOM":0,1:1)
 S LIMCOL=$S((NOCOL(HIS)+NBCOL(HIS))>@GL:@GL,1:(NOCOL(HIS)+NBCOL(HIS))-1)
 F I=NOCOL(HIS):1:LIMCOL D PROG1
 Q
PROG1 S IND=IND+1
 S @TEXT@(HIS,IND,1)=$S(SYN=0:@GL@(I,"TEXT"),1:$$S^%QAX(@GL@(I,"TEXT")))
 S @TEXT@(HIS,IND,2)=$$TRAIT(@GL@(I))
 I OPTH S @TEXT@(HIS,IND,3)=$S(@GL@("TOTAL")=0:0,1:$$TRAIT((@GL@(I)*100)/@GL@("TOTAL")))
 I OPTH=0 S @TEXT@(HIS,IND,3)=$S(@GL@(I,"IND")=0:"",1:$$TRAIT($$SQR^%TLCAMTH($$SOM(I)/@GL@(I,"IND"))))
 S @TEXT@(HIS,IND,4)=$$TRAIT(@GL@(I,"IND"))
 Q
NULCOL F IND=1:1:NBCOL(HIS) F I=1:1:4 S @TEXT@(HIS,IND,I)=""
 Q
 
AFGRA(GL,HIS) 
 D ^%HXICOL(LMARG(HIS)-11,HFHA,HHIST+1,9,9,0,$$CONCAS^%QZCHAD(TEXT2,HIS))
 Q
 
AFCOL(GL,HIS) 
 D CARSP^%VVIDEO(LMARG(HIS)-1,HFHA-1,HHIST+2,LHIST(HIS)+2,1)
 D ^%HXIIST1(LMARG(HIS),HFHA,HHIST,LHIST(HIS),LARG(HIS),ECART,$$CONCAS^%QZCHAD(COLON,HIS)) Q
 
AFTEX(GL,HIS) 
 D ^%HXICOL(LMARG(HIS),(HFHA+HHIST)+1,HTEXT,LHIST(HIS),LARG(HIS),ECART,$$CONCAS^%QZCHAD(TEXT,HIS))
 Q
 
TRAIT(KAS) 
 Q:KAS=0 0
 I $F(KAS,".")'=0 S KAS2=$E(KAS,1,$F(KAS,".")-1)_$E(KAS,$F(KAS,"."),$F(KAS,".")+1) Q KAS2
 Q KAS
 
SOM(I) 
 N II,INDIV,SOMME,DIF
 S INDIV="",SOMME=0
 F II=1:1 S INDIV=$O(@GL@(I,"IND",INDIV)) Q:INDIV=""  S DIF=$P(@GL@(I,"IND",INDIV),"^")-@GL@(I),SOMME=SOMME+(DIF*DIF)
 Q SOMME
 
 
REAFF(GL,HIS,OPTH) 
 Q:'($D(@PARGL))
 
 D REV^%VVIDEO
 S I=11,DX=LMARG(HIS)-I,DY=0 X XY
 I HIS=1 W $$^%QZCHW("Liste : ") S DX=$X,DY=$Y D BLD^%VVIDEO X XY W @TEMP@("LISTE")
 D NORM^%VVIDEO,BLD^%VVIDEO,BLK^%VVIDEO
 I HIS=1 S DX=(MDCOL-LMARD(HIS))-18,DY=0 X XY W $S((CARD="")!(CARD=0):$$^%QZCHW("Liste inexistante"),1:CARD_" "_REPER_"(s)")
 I HIS=2 S DX=(MDCOL-LMARD(HIS))-30,DY=0 X XY W R,": ",$S($D(@PARGL@(1,INDCOCOU,"TEXT")):$J(@PARGL@(1,INDCOCOU,"TEXT"),8),1:$J("?",8))
 D NORM^%VVIDEO
 S DX=LMARG(HIS)-I,DY=1
 X XY W $$^%QZCHW($S(OPTH:"Cumul",1:"Moyenne"))," : "
 S DX=$X,DY=$Y D BLD^%VVIDEO X XY W ATTOT D NORM^%VVIDEO
 I $D(@PARGL@(1,"DATE"))&(HIS=2) S DX=LMARG(HIS)-12,DY=0 X XY W @PARGL@(1,"DATE")
 S DX=LMARG(HIS)-I,DY=2 X XY W $$^%QZCHW("Sur"),"   : "
 S DX=$X,DY=$Y D BLD^%VVIDEO X XY
 W $S(HIS=1:ATGROUP,1:ATECL) D NORM^%VVIDEO
 
 S DX=LMARG(HIS)-I,DY=(HFHA+HHIST)+2
 X XY W $$^%QZCHW($S(OPTH:"Total",1:"Moy.")_" col.")
 S DY=DY+1 X XY W $$^%QZCHW($S(OPTH:"Pourcentage",1:"Ecart type "))
 S DY=DY+1 X XY W $$^%QZCHW("Nb indiv.")
 I $D(SSCUMUL) S DX=LMARG(HIS)-I,DY=((HFHA+HHIST)+HTEXT)+1 X XY W $J("",30) X XY W $$^%QZCHW($S(OPTH:"Total courant",1:"Ecart type total"))," = " S DX=$X,DY=$Y D BLD^%VVIDEO X XY W $J("",5) X XY W SSCUMUL
 D NORM^%VVIDEO,REV^%VVIDEO
 S DX=LMARG(HIS)-I,DY=((HFHA+HHIST)+HTEXT)+2
 X XY W $$^%QZCHW($S(OPTH:"Total cumule",1:"Moyenne totale"))," = "
 S DX=$X,DY=$Y D NORM^%VVIDEO X XY W $J("",10) D REV^%VVIDEO,BLD^%VVIDEO X XY W $J(CUMUL,4,2) D NORM^%VVIDEO
 D AFGRA(GL,HIS),AFCOL(GL,HIS),AFTEX(GL,HIS)
 Q

