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

;%QSCOLF^INT^1^59547,73880^0
QSCOLF(XG,YH,HA,LA,LE,COLON,DONNE,GATT,MODEL,REP,INDIV,AFF) 
 
 
 
 
 N %F,AT,CH,DX,DY,I,J,L,LC,RM,X1,ATT,EXI,OLD,OR,ORD,R,NP
 N COLDEP,COLFIN,LARG,LIGDEP,NOCOL,NOPAG,POSIT,PAGE,PC,PL,PX,PY,REXT,TABH
 S COLDEP=1,LIGDEP=1,TABH=1,NOPAG=1,NOCOL=1 D REAFF
 S RM=LE
 D INIT
BMOV D FULL
MOUV D CUR,ECHOFF^%VVIDEO,ZFLECHE^%VZATOU,ECHON^%VVIDEO G:%F'="" @%F
TM F I=1,2,4,6,7,9,10,13,16,18,43,45,61,95 G:I=X1 @I
 G:(X1=63)&(PC=1) VISLEX
 G:(X1<32)!(X1>126) ERR
 I $D(@DONNE@(PL,PC)) G:PC=1 ERR G:(@DONNE@(PL,1)="")&(@DONNE@(PL,PC)="") ERR
 N INS D:$$UC CR^%QSCOLF2 G:'(INS) MOUV
 G BMOV
B 
 G:PL=((LIGDEP+HA)-5) 43
 S PL=PL+1,PY=PY+1 G BMOV
H 
 I PL=LIGDEP D MOINS(.R) S:R=1 PL=(LIGDEP+HA)-5,PY=(YH+HA)-3 G BMOV
 S PL=PL-1,PY=PY-1 G BMOV
G 
 G:'($D(POSIT(PC-1))) ERR
 S PC=PC-1,PX=POSIT(PC) G BMOV
D 
 G:'($D(POSIT(PC+1))) ERR
 S PC=PC+1,PX=POSIT(PC) G BMOV
1 
 Q
2 
 G:('($D(@DONNE@(PL,1))))!('($D(@DONNE@(PL,2)))) ERR
 S ATT=$P(@DONNE@(PL,1)," (",1),REXT=$$ROUTMAJ^%QSGESPE(REP,ATT)
 I (REXT'="")&(@DONNE@(PL,2)'="") S O=$P($P(@DONNE@(PL,1),"(",2),")") S:O="" O=1 D EXE^%QSCOLF2("M",ATT,@DONNE@(PL,2),O,REXT) G BMOV
 G:$$TYPE^%QSGESPE(ATT_"/"_$$NOMLOG^%QSF(REP))'="DATE" ERR
 
 D DATE,MES^%QSCOLF3("") G BMOV
4 
 S AFF=(AFF+1)#3
 S ^OAFF($I)=AFF
 D INIT^%QSINDIV(MODEL,REP,INDIV,XG,YH,HA,LA,LE,DONNE,GATT,AFF)
 D POCLEPA^%VVIDEO,REAFF G BMOV
6 
 Q
7 
 G:'($$UC) MOUV G:'($D(@DONNE@(PL,PC))) ERR
 G:@DONNE@(PL,PC)="" ERR
 N SUP D SUP^%QSCOLF1 G:SUP'=2 BMOV
 S PC=2
 S DX=PX,DY=PY X XY D ZFLECHE^%VZATOU G:%F'="" @%F G TM
9 
 G:('($D(@DONNE@(PL,PC))))!(PC=1) ERR
 G:@DONNE@(PL,1)="" ERR
 D:$$UC MD^%QSCOLF2 G BMOV
10 
 D IMPR^%QSCOLF3 G BMOV
13 
 G:'($D(@DONNE@(PL,PC))) 130
 G:@DONNE@(PL,PC)="" 130
 D ATTPRED^%QSCOLF3(@DONNE@(PL,PC))
 G BMOV
130 G:PC=1 BMOV
 G:'($D(@DONNE@(PL,1))) BMOV
 D ATDAT^%QSCOLF2(.PL)
 G BMOV
16 
 D MES^%QSCOLF3("") W $$^%QZCHW("Numero de page")," : "
 R NP D MES^%QSCOLF3("")
 G:NP="" BMOV
 I (NP<1)!(NP=NOPAG) G ERR
 I NP<NOPAG D MOINSP(NP,.R) G S16
 D PLUSP(NP,.R)
S16 D:R=1 INIT
 G BMOV
18 
 D REAFF G BMOV
43 
 D PLUS G BMOV
61 G 43
95 G 45
45 
 D MOINS(.R) D:R=1 INIT G BMOV
ERR 
 D ^%VSQUEAK G MOUV
 
VISLEX G:'($D(@DONNE@(PL,1))) ERR
 G:@DONNE@(PL,1)="" ERR
 D CLEPAG^%VVIDEO
 D AFF^%LXIQ($P(@DONNE@(PL,1)," ")),^%VZEAVT("")
 D @ROUTAFF
 G BMOV
 
 
UC() 
 Q:'($D(@DONNE@(PL,PC,"PROTECT"))) 1
 I @DONNE@(PL,PC,"PROTECT") D ^%VSQUEAK Q 0
 Q 1
 
MOINS(R) 
 I LIGDEP=1 D ^%VSQUEAK S R=0 Q
 S NOPAG=NOPAG-1,LIGDEP=LIGDEP-(HA-4) D REAFF S R=1 Q
 
PLUS 
 I '($D(@DONNE@((LIGDEP+(HA-4))-1))) D ^%VSQUEAK Q
 S NOPAG=NOPAG+1,LIGDEP=LIGDEP+(HA-4) D REAFF
 D INIT S:'($D(@DONNE@(PL,PC))) PC=PC-1,PX=POSIT(PC)
 Q
 
MOINSP(NOP,R) 
 S LIGDEP=LIGDEP-((HA-4)*(NOPAG-NOP)),NOPAG=NOP D REAFF S R=1 Q
 
PLUSP(NOP,R) 
 N LL
 S LL=LIGDEP+((HA-4)*(NOP-NOPAG))
 I '($D(@DONNE@(LL))) D ^%VSQUEAK S R=0 Q
 S NOPAG=NOP,LIGDEP=LL D REAFF S R=1 Q
INIT 
 S PC=COLDEP+1,PL=LIGDEP,PX=POSIT(PC),PY=YH+2
 Q
 
NEXT(R) 
NEX1 S R=0 G:$D(POSIT(PC+1)) COLOK
 I PL=((LIGDEP+HA)-5) D PLUS Q
 
 I PC'=2 S PC=COLDEP,PX=POSIT(PC),PL=PL+1,PY=PY+1 Q:$$UC  G NEX1
 I '($D(@DONNE@(PL+1,PC))) S PC=PC-1,PX=POSIT(PC)
 S PL=PL+1,PY=PY+1 Q:$$UC  G NEX1
COLOK 
 S PC=PC+1,PX=POSIT(PC) Q:$$UC  G NEX1
FULL 
 S DX=XG+1,DY=(YH+HA)-2 X XY W $J("",LA-2)
 S CH=$S('($D(@DONNE@(PL,PC))):"",PC=1:@DONNE@(PL,PC),1:$$AFFI^%QMDAUC(REP,$P(@DONNE@(PL,1)," (",1),@DONNE@(PL,PC))),L=((LA-2)-$L(CH))\2
 S DX=XG+L S:DX<XG DX=XG+1
 D BLD^%VVIDEO,REV^%VVIDEO X XY W $E(CH,1,LA-2) X XY D NORM^%VVIDEO Q
CUR 
 S DX=PX,DY=PY X XY Q
 
REAFF 
 G REAFF^%QSCOLF3
 
DATE 
 D MES^%QSCOLF3("")
FD S Y1=$$^%VZAME1($$^%QZCHW("Quel format")_" : ("_$$^%QSCALIN("ATTRIBUT",ATT_"/"_$$NOMLOG^%QSF(REP),"DERNIER.FORMAT.UTILISE",$I)_") ") Q:Y1=""
 I Y1="?" D LIST^%QMDAUC,@ROUTAFF G DATE
 G:'($$COR^%QMDAUC(ATT,REP,.Y1)) FD
 D REAFF
 Q

