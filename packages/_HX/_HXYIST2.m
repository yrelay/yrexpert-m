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

;%HXYIST2^INT^1^59547,73870^0
HXYIST2 ;
 
 
 
 
 
INIT 
 S MDCOL=80,NOCOL=1,ECART=1,LARG=4,LMARG=15,LMARD=2,LHIST=(MDCOL-LMARG)-LMARD,HTEXT=4,HFHA=4,HHIST=12,LMENU=23
 S ECHEL=@HISTO@("MAX"),ECHEL=$S(ECHEL:ECHEL,1:1)
 S NBCOL=LHIST\(LARG+ECART) S:(NBCOL*(LARG+ECART))<LHIST NBCOL=NBCOL+1
 S CARD=$$^%QSCALVA("L0",L,"CARD"),REPER=$$^%QSCALVA("L0",L,"OBJET")
 S REPI=$$NOMINT^%QSF(REPER),CUMUL=@HISTO@("TOTAL")
 S REPR=$S($P(ATCUM,"^",2)="":REPI,1:$$NOMINT^%QSF($P(ATCUM,"^",2)))
 S REPT=$S($P(ATOT,"^",2)="":REPI,1:$$NOMINT^%QSF($P(ATOT,"^",2)))
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S @TEMP@("LISTE")=L
 S INVC=$$CONCAS^%QZCHAD(TEMP,"INVCOL")
 S MENU=$$CONCAS^%QZCHAD(TEMP,"MENU"),COLON=$$CONCAS^%QZCHAD(TEMP,"COL")
 S TEXT=$$CONCAS^%QZCHAD(TEMP,"TEXT"),TEXT2=$$CONCAS^%QZCHAD(TEMP,"TEXT2")
 S SSCUMUL=0 Q:OPTH
 F I=1:1:@HISTO S SSCUMUL=SSCUMUL+$$SOM(I)
 S SSCUMUL=$S(SSCUMUL=0:"Non evaluable",(CARD="")!(CARD=0):"Inconnu",1:$J($$SQR^%TLCAMTH(SSCUMUL/CARD),1,2))
 
 Q
 
MKGRA 
 N GRAD,IND,I,NV
 K @(TEXT2)
 S NV=5-$L($J(ECHEL,1,0)) S:NV<0 NV=0
 S GRAD=ECHEL/HHIST,I=0
 F IND=1:1:HHIST+1 S @TEXT2@(1,(HHIST-IND)+2)=$S(I=0:0,1:$J($$TRAIT(I),1,NV)),I=I+GRAD
 S @TEXT2=1_"^"_IND
 Q
 
MKCOL 
 N E,I,J,K,IND
 K @(COLON)
 S IND=0,@COLON=NBCOL,E=HHIST/ECHEL I OPTH S SSCUMUL=0
 F I=NOCOL:1:NOCOL+NBCOL D TCOL
 I FCOL'="" F I=NOCOL:1:NOCOL+NBCOL D TFCOL
 Q
TCOL S J=(I-NOCOL)+1,@COLON@(2,J)=0
 I $D(@HISTO@(I)) S K=E*@HISTO@(I),@COLON@(1,J)=$P(K,".",1)+($E($P(K,".",2),1)>5) S:OPTH SSCUMUL=SSCUMUL+@HISTO@(I) Q
 S @COLON@(1,J)=0
 Q
TFCOL S J=(I-NOCOL)+1,@COLON@(4,J)=0
 I $D(@HISTO@(I,"FCOL")) S K=E*@HISTO@(I,"FCOL"),@COLON@(3,J)=$P(K,".",1)+($E($P(K,".",2),1)>5) Q
 S @COLON@(3,J)=0
 Q
 
MKTEX 
 N I,IND,LIMCOL
 K @(TEXT)
 S IND=0,@TEXT=NBCOL_"^4"
 S LIMCOL=$S((NOCOL+NBCOL)>@HISTO:@HISTO,1:(NOCOL+NBCOL)-1)
 I FCOL="" F I=NOCOL:1:LIMCOL D MKT1
 I FCOL'="" F I=NOCOL:1:LIMCOL D MKT2
 Q
MKT1 S IND=IND+1
 S @TEXT@(IND,1)=$$SYN^%HXYISTO(FSYN,"ZHY",REPR,R,@HISTO@(I,"TEXT"))
 S @TEXT@(IND,2)=$$SYN^%HXYISTO(FSYN,"ZHY",REPT,T,$$TRAIT(@HISTO@(I)))
 I OPTH=1 S @TEXT@(IND,3)=$S(@HISTO@("TOTAL")=0:0,1:$$TRAIT((@HISTO@(I)*100)/@HISTO@("TOTAL")))
 I OPTH=0 S @TEXT@(IND,3)=$S(@HISTO@(I,"IND")=0:"",1:$$TRAIT($$SQR^%TLCAMTH($$SOM(I)/@HISTO@(I,"IND"))))
 S @TEXT@(IND,4)=$$TRAIT(@HISTO@(I,"IND"))
 Q
MKT2 S IND=IND+1
 S @TEXT@(IND,1)=$$SYN^%HXYISTO(FSYN,"ZHY",REPR,R,@HISTO@(I,"TEXT"))
 S @TEXT@(IND,2)=$$SYN^%HXYISTO(FSYN,"ZHY",REPT,T,$$TRAIT(@HISTO@(I)))
 S @TEXT@(IND,3)=$$SYN^%HXYISTO(FSYN,"ZHY",REPT,T,$$TRAIT(@HISTO@(I,"FCOL")))
 S @TEXT@(IND,4)=$$TRAIT(@HISTO@(I,"IND"))
 Q
 
AFGRA D ^%VZECOL(LMARG-15,HFHA,HHIST+1,13,13,0,TEXT2) Q
 
AFCOL D CARSP^%VVIDEO(LMARG-1,HFHA-1,HHIST+2,LHIST+2,1)
 D ^%HXYIST1(LMARG,HFHA,HHIST,LHIST,LARG,ECART,COLON) Q
 
AFTEX D ^%VZECOL(LMARG,(HFHA+HHIST)+1,HTEXT,LHIST,LARG,ECART,TEXT)
 Q
 
TRAIT(KAS) 
 Q:KAS=0 0
 I $F(KAS,".")'=0 S KAS2=$E(KAS,1,$F(KAS,".")-1)_$E(KAS,$F(KAS,"."),$F(KAS,".")+1) Q KAS2
 E  Q KAS
SOM(I) 
 N II,INDIV,SOMME,DIF
 S INDIV="",SOMME=0
 F II=1:1 S INDIV=$O(@HISTO@(I,"IND",INDIV)) Q:INDIV=""  S DIF=$P(@HISTO@(I,"IND",INDIV),"^")-@HISTO@(I),SOMME=SOMME+(DIF*DIF)
 Q SOMME
 
REAFF 
 D CLEPAG^%VVIDEO,REV^%VVIDEO
 
 S DX=LMARG-15,DY=0 X XY W $$^%QZCHW("Liste : ") S DX=$X,DY=$Y D BLD^%VVIDEO X XY W L
 D NORM^%VVIDEO,BLD^%VVIDEO,BLK^%VVIDEO
 S DX=LMARG-15,DY=1 X XY W $S((CARD=0)!(CARD=""):$$^%QZCHW("Liste inexistante"),1:CARD_" "_REPER_"(s)")
 D NORM^%VVIDEO
 I $D(@HISTO@("DATE")) S DX=0,DY=2 X XY W $$^%QZCHW("Date")," : ",@HISTO@("DATE")
 S DX=(MDCOL-LMARD)-43,DY=1 X XY W $$^%QZCHW($S(OPTH:"Cumul",1:"Moyenne"))," : " S DX=$X,DY=$Y D BLD^%VVIDEO X XY W ATOT D NORM^%VVIDEO
 S DX=(MDCOL-LMARD)-43,DY=2 X XY W $$^%QZCHW("Sur   : ") S DX=$X,DY=$Y D BLD^%VVIDEO X XY W ATCUM D NORM^%VVIDEO
 
 S DX=LMARG-15,DY=(HFHA+HHIST)+2 X XY W $$^%QZCHW($S(OPTH:"Total",1:"Moyenne")_" colonne")
 I FCOL="" S DY=DY+1 X XY W $$^%QZCHW($S(OPTH:"Pourcentage ",1:"Ecart type "))
 I FCOL'="" S DY=DY+1 X XY W $E($$^%QCAZG("FCOL(""LIB"")"),1,12)
 S DY=DY+1 X XY W $$^%QZCHW("Nb individus")
 S DX=LMARG-15,DY=((HFHA+HHIST)+HTEXT)+2 X XY W $J("",40) D REV^%VVIDEO
 X XY W $$^%QZCHW($S(OPTH:"Total cumule",1:"Moyenne totale"))," = "
 S DX=$X,DY=$Y D BLD^%VVIDEO X XY W $J(CUMUL,1,2) D NORM^%VVIDEO
 
REAFF2 I $D(SSCUMUL) S DX=LMARG-15,DY=((HFHA+HHIST)+HTEXT)+1 X XY W $$^%QZCHW($S(OPTH:"Total courant",1:"Ecart type total"))," = " S DX=$X,DY=$Y D BLD^%VVIDEO X XY W SSCUMUL_"     " D NORM^%VVIDEO
 D AFGRA,AFCOL,AFTEX Q

