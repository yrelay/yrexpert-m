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

;%HXIIST2^INT^1^59547,73869^0
HXIIST2 ;
 
 
 
 
 
INIT 
 D ^%VZEATT
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S @TEMP@("LISTE")=L,@TEMP@("T")=T,@TEMP@("T2")=T2,@TEMP@("R")=R
 S @TEMP@("ABC")=ABC,@TEMP@("ABC2")=ABC2
 S @TEMP@("OPTH")=OPTH,@TEMP@("OPTH2")=OPTH2
 
 S MENU=$$CONCAS^%QZCHAD(TEMP,"MENU")
 S COLON=$$CONCAS^%QZCHAD(TEMP,"COL")
 S TEXT=$$CONCAS^%QZCHAD(TEMP,"TEXT")
 S TEXT2=$$CONCAS^%QZCHAD(TEMP,"TEXT2")
 S INVC1=$$CONCAS^%QZCHAD(TEMP,"INVC1")
 S INVC2=$$CONCAS^%QZCHAD(TEMP,"INVC2")
 S NOCOL=1,LARG=4,MDCOL=80,LMENU=23,ECART=1,HTEXT=4,HFHA=4,HHIST=12
 S CARD=$$^%QSCALVA("L0",L,"CARD"),REPER=$$^%QSCALVA("L0",L,"OBJET")
 S REPI=$$NOMINT^%QSF(REPER)
 S REPR=$S($P(GR,"^",2)="":REPI,1:$$NOMINT^%QSF($P(GR,"^",2)))
 
 S LMARG(1)=11,LMARD(1)=42,LMARG(2)=51,LMARD(2)=2
 S LHIST=(MDCOL-LMARG(1))-LMARD(1)
 S NBCOL=LHIST\(LARG+ECART) S:(NBCOL*(LARG+ECART))<LHIST NBCOL=NBCOL+1
 D INV^%HXPARAM(HISTO1,INVC1),INV^%HXPARAM(HISTO2,INVC2)
 Q
 
 
MKGRA(GL,HIS,OPTH) 
 N GRAD,IND,I,NV
 K @TEXT2@(HIS)
 S NV=5-$L($J(ECHEL(HIS),1,0)) S:NV<0 NV=0
 S GRAD=ECHEL(HIS)/HHIST,I=0
 F IND=1:1:HHIST+1 S @TEXT2@(HIS,1,(HHIST-IND)+2)=$S(I=0:0,1:$J($$TRAIT(I),1,NV)),I=I+GRAD
 S @TEXT2@(HIS)=1_"^"_IND
 Q:OPTH'=0
 
 S SSCUMUL=0
 F I=1:1:@GL S SSCUMUL=SSCUMUL+$$SOM(I)
 S SSCUMUL=$S(SSCUMUL=0:"Non evaluable",(CARD="")!(CARD=0):"Inconnu",1:$J($$SQR^%TLCAMTH(SSCUMUL/CARD),1,2))
 Q
 
MKCOL(GL,HIS,OPTH) 
 N E,I,J,K
 K @COLON@(HIS)
 S @COLON@(HIS)=NBCOL,E=HHIST/ECHEL(HIS)
 I OPTH S SSCUMUL=0
 F I=NOCOL:1:(NOCOL+NBCOL)-1 D TCOL
 Q
TCOL S J=(I-NOCOL)+1,@COLON@(HIS,2,J)=0
 I $D(@GL@(I)) S K=E*@GL@(I),@COLON@(HIS,1,J)=$P(K,".",1)+($E($P(K,".",2),1)>5) S:OPTH SSCUMUL=@GL@(I)+SSCUMUL Q
 S @COLON@(HIS,1,J)=0 Q
 
MKTEX(GL,HIS,OPTH) 
 N I,IND,LIMCOL,SYN
 K @TEXT@(HIS)
 S @TEXT@(HIS)=NBCOL_"^4",IND=0
 S LIMCOL=$S((NOCOL+NBCOL)>@GL:@GL,1:(NOCOL+NBCOL)-1)
 S SYN=$S($P(R,"^",1)'="NOM":0,1:1)
 F I=NOCOL:1:LIMCOL D TEX
 Q
TEX S IND=IND+1
 S @TEXT@(HIS,IND,1)=$S(SYN=0:@GL@(I,"TEXT"),1:$$S^%QAX(@GL@(I,"TEXT")))
 S @TEXT@(HIS,IND,2)=$$TRAIT(@GL@(I))
 I OPTH S @TEXT@(HIS,IND,3)=$S(@GL@("TOTAL")=0:0,1:$$TRAIT((@GL@(I)*100)/@GL@("TOTAL")))
 I OPTH=0 S @TEXT@(HIS,IND,3)=$S(@GL@(I,"IND")=0:"",1:$$TRAIT($$SQR^%TLCAMTH($$SOM(I)/@GL@(I,"IND"))))
 S @TEXT@(HIS,IND,4)=$$TRAIT(@GL@(I,"IND"))
 Q
 
AFGRA(GL,HIS) 
 S I=11
 D ^%HXICOL(LMARG(HIS)-I,HFHA,HHIST+1,I-2,I-2,0,$$CONCAS^%QZCHAD(TEXT2,HIS))
 Q
 
AFCOL(GL,HIS) 
 D CARSP^%VVIDEO(LMARG(HIS)-1,HFHA-1,HHIST+2,LHIST+2,1)
 D ^%HXIIST1(LMARG(HIS),HFHA,HHIST,LHIST,LARG,ECART,$$CONCAS^%QZCHAD(COLON,HIS))
 Q
 
AFTEX(GL,HIS) 
 D ^%HXICOL(LMARG(HIS),(HFHA+HHIST)+1,HTEXT,LHIST,LARG,ECART,$$CONCAS^%QZCHAD(TEXT,HIS))
 Q
 
 
TRAIT(KAS) 
 Q:KAS=0 0
 I $F(KAS,".")'=0 S KAS2=$E(KAS,1,$F(KAS,".")-1)_$E(KAS,$F(KAS,"."),$F(KAS,".")+1) Q KAS2
 E  Q KAS
 
SOM(I) 
 N II,INDIV,SOMME,DIF
 S INDIV="",SOMME=0
 F II=1:1 S INDIV=$O(@GL@(I,"IND",INDIV)) Q:INDIV=""  S DIF=$P(@GL@(I,"IND",INDIV),"^")-@GL@(I),SOMME=SOMME+(DIF*DIF)
 Q SOMME
 
 
REAFF(GL,HIS,OPTH) 
 S I=11
 D REV^%VVIDEO
 I HIS=1 S DX=LMARG(HIS)-I,DY=0 X XY W $$^%QZCHW("Liste : ") S DX=$X,DY=$Y D BLD^%VVIDEO X XY W L
 D NORM^%VVIDEO,BLD^%VVIDEO,BLK^%VVIDEO
 I HIS=1 S DX=LMARG(HIS)+10,DY=0 X XY W $S((CARD=0)!(CARD=""):$$^%QZCHW("Liste inexistante"),1:CARD_" "_REPER_"(s)")
 D NORM^%VVIDEO
 S DX=(MDCOL-LMARD(HIS))-36,DY=1 X XY W $$^%QZCHW($S(OPTH:"Cumul",1:"Moyenne"))," : " S DX=$X,DY=$Y D BLD^%VVIDEO X XY W TOT D NORM^%VVIDEO
 S DX=(MDCOL-LMARD(HIS))-36,DY=2 X XY W $$^%QZCHW("Sur   : ") S DX=$X,DY=$Y D BLD^%VVIDEO X XY W GR D NORM^%VVIDEO
 I $D(@GL@("DATE"))&(HIS=2) S DX=LMARG(HIS)+8,DY=0 X XY W $$^%QZCHW("Date")," : ",@GL@("DATE")
 
 S DX=LMARG(HIS)-I,DY=(HFHA+HHIST)+2 X XY W $$^%QZCHW($S(OPTH:"Total col.",1:"Moy. col."))
 S DY=DY+1 X XY W $$^%QZCHW($S(OPTH:"Pourcentage",1:"Ecart type"))
 S DY=DY+1 X XY W $$^%QZCHW("Nb indiv.")
 D REV^%VVIDEO
 S DX=LMARG(HIS)-I,DY=((HFHA+HHIST)+HTEXT)+2 X XY W $$^%QZCHW($S(OPTH:"Total cumule",1:"Moyenne totale"))," = "
 S DX=$X,DY=$Y D BLD^%VVIDEO X XY W $J(CUMUL,1,2)
 D NORM^%VVIDEO
 I $D(SSCUMUL) S DX=LMARG(HIS)-I,DY=DY-1 X XY W $J("",30) X XY W $$^%QZCHW($S(OPTH:"Total courant",1:"Ecart type total"))," = " S DX=$X,DY=$Y D BLD^%VVIDEO X XY W SSCUMUL D NORM^%VVIDEO
 Q
 
AFF(GL,HIS,OPTH) 
 D REAFF(GL,HIS,OPTH)
 D AFGRA(GL,HIS),AFCOL(GL,HIS),AFTEX(GL,HIS)
 Q

