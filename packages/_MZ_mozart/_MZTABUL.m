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

;%MZTABUL^INT^1^59547,73872^0
MOZTABUL ;
 
 D NORM^%VVIDEO S:'($D(%TAB)) %TAB=0 G:%TAB'=0 INSER S:XOP="" XOP=0 S ^U($J,0,EDCL)=XOP_"^"_X K SAV,^OPC($J),ORD,^W($J)
OK1 S %LUBAT=1
 S %TT="^W",%TT1="^W($J,0)",%L=1,(EDN,LC)=^U($J,0,EDCL,0),%V1=0,%V2=0
LOPL S LC=$N(^U($J,0,LC)) G:LC=-1 COMPW S X=^U($J,0,LC),XOP=$P(X,"^",1),X=$P(X,"^",2,999),XOP=$S((XOP="")!(XOP=0):3,1:XOP) G @XOP
2 G:'(%V1) 20 G 21
20 S @%TT@($J,0,%L)="1^",@%TT@($J,0,%L,0)=%L-1,%L=%L+1 F %U=1:1:3 S @%TT@($J,0,%L)="1^u"_$S(%U=3:0,1:%U+1),@%TT@($J,0,%L,0)=%L-1,%L=%L+1
 S OXOP=1,%V1=1 G 22
21 S %U1=$S('(%V2):1,1:2),%V2=1 F %U=1:1:3 S @%TT@($J,0,%L)=%U1_"^u"_$S(%U=3:0,1:%U+1),@%TT@($J,0,%L,0)=%L-1,%L=%L+1
22 S @%TT@($J,0,%L)="2^"_X,@%TT@($J,0,%L,0)=%L-1,%L=%L+1,OXOP=XOP K ^U($J,0,LC) G LOPL
3 I '(%V1) S @%TT@($J,0,%L)="1^",@%TT@($J,0,%L,0)=%L-1,%L=%L+1,%V1=1
 S @%TT@($J,0,%L)="3^"_X,@%TT@($J,0,%L,0)=%L-1,%L=%L+1 K ^U($J,0,LC) G LOPL
1 G:%V1 COMPW S @%TT@($J,0,%L)="1^"_X,@%TT@($J,0,%L,0)=%L-1,%L=%L+1,%V1=1 K ^U($J,0,LC) G LOPL
COMPW K ^W2($J) G:LC=-1 COMPW0 S LCC=LC,(LC,EDNC)=^U($J,0,LCC,0) F %U=1:1 S LC=$N(^U($J,0,LC)) Q:LC=-1  S ^W2($J,0,LC)=^U($J,0,LC),^W2($J,0,LC,0)=^U($J,0,LC,0) K ^U($J,0,LC)
 S ^W2($J)=LCC
COMPW0 G:%V1=1 COMPW2 F %L=1:1:4 S @%TT@($J,0,%L)="1^"_$S(%L=1:"",1:"u"_$S(%L=4:0,1:%L)),@%TT@($J,0,%L,0)=%L-1
 S %L=5 G COMPW1
COMPW2 S %U=$ZP(@%TT@($J,0,"")),X=@%TT@($J,0,%U),XOP=$P(X,"^",1),X=$P(X,"^",2,999) I (X="u0")!((X="u2")!(X="u3")) S @%TT@($J,0,%L)=$S(%V2:2,1:1)_"^",@%TT@($J,0,%L,0)=%L-1,%L=%L+1
 S %U1=$S(%V2:2,1:1),%V2=1 F %U=1:1:3 S @%TT@($J,0,%L)=%U1_"^u"_$S(%U=3:0,1:%U+1),@%TT@($J,0,%L,0)=%L-1,%L=%L+1
COMPW1 F %V1=1:1:10 F %U=1:1:4 S @%TT1@(%L,0)=%L-1,%U1=%U#4,@%TT1@(%L)=2_$S(%U1'=1:"^u"_%U1,1:"^"),%L=%L+1
 S %LUBAT=1,@%TT1@(%L)="2^",@%TT1@(%L)=%U,%TAB=1,EDCL=$N(@%TT@($J,0,-1)),EDFL=1,EDN=@%TT@($J,0,EDCL,0),EDP=1,X=@%TT@($J,0,EDCL),XOP=$P(X,"^",1),X=$P(X,"^",2,999) D RF^%MZED Q
TAB K TBP,TBL,TBDX F %W=1,2 S TABI=$S($D(^MOZ(WHOIS,"C","L",%W)):"^MOZ(WHOIS,""C"",""L"",%W)",1:"^MOZ(""C"",""L"",%W)") D TAB0
 Q
TAB0 S TAB=@TABI F %U=1:1 S TBI=$P(TAB,"/",%U) Q:TBI=""  S TBP(%W,%U)=$P(TBI,",",2),TBL(%W,%U)=$P(TBI,",",1),TBDX(%W,TBP(%W,%U)+1)=1
 Q
U2 D TAB S TAB=@TABI D G0ON^%VVIDEO X XY,XL W "t" S DXG=1,DYH=DY,BLD=0,LH=78 D TRH^%VVIDEO,G0ON^%VVIDEO S DX=79 X XY W "u" S %V=-1 F %U=1:1 S %V=$N(TBP(%WU,%V)) Q:%V=-1  S DX=TBP(%WU,%V) X XY W:DX>1 "n"
 D G0OFF^%VVIDEO K TAB,%U,%V Q
U0 D G0ON^%VVIDEO X XY,XL W "m" S DXG=1,DYH=DY,LH=78,BLD=0 D TRH^%VVIDEO
 D G0ON^%VVIDEO W "j" S %V=-1 F %U=1:1 S %V=$N(TBP(%WU,%V)) Q:%V=-1  S DX=TBP(%WU,%V) X XY W:DX>1 "v"
 D G0OFF^%VVIDEO Q
U3 D G0ON^%VVIDEO X XY,XL W "x" S %V=-1 F %U=1:1 S %V=$N(TBP(%WU,%V)) Q:%V=-1  S DX=TBP(%WU,%V) X XY W:DX>1 "x"
 S DX=79 X XY W "x" D G0OFF^%VVIDEO,LIB Q
LIB D REV^%VVIDEO S %V=-1 F %U=1:1 S %V=$N(TBL(%WU,%V)) Q:%V=-1  S DX=TBP(%WU,%V)+1 X XY W TBL(%WU,%V)
 D NORM^%VVIDEO Q
INSER S EDCLCC=EDCL F %U=1:1 S EDCL=$N(@%TT@($J,0,EDCL)) Q:EDCL=-1  S XOPC=$P(@%TT@($J,0,EDCL),"^",2,999) Q:XOPC="u0"
 G:EDCL'=-1 INSER1 S EDCLD=$ZP(@%TT@($J,0,"")),EDND=@%TT@($J,0,EDCLD,0) F %U=1:1:3 S @%TT@($J,0,EDCLD+%U)="2^u"_$S(%U=1:2,%U=2:3,1:0),@%TT@($J,0,EDCLD+%U,0)=EDND,EDND=EDCLD+%U
 S @%TT@($J,0,EDCLD+4)="2^",@%TT@($J,0,EDCLD+4,0)=EDND,EDCL=EDCLD+3
INSER1 S EDCL=$N(@%TT@($J,0,EDCL)),EDCLC=EDCL,EDNC=@%TT@($J,0,EDCL,0) F %U=1:1:4 S EDNC2=(EDCL+EDNC)/2,@%TT@($J,0,EDCL,0)=EDNC2,@%TT@($J,0,EDNC2,0)=EDNC,@%TT@($J,0,EDNC2)="2^"_$S(%U=1:"",%U=4:"u0",1:"u"_%U),EDNC=EDNC2
 S EDCL=EDCLCC,%=3 K EDCLCC,XOPC,EDNC,EDNC2
INSER2 Q

