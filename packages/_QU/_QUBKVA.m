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

;%QUBKVA^INT^1^59547,73884^0
%QUBKVA(TEMP) ;;06:28 PM  13 May 1993; ; 13 May 93  6:45 PM
 
 
 
 
 N %F,BUF,COL,I,J,L,LC,LD,LF,SX,SY,V,X,X1,Y,NC,PA,NP,CGEN,VID
 N NBFIX,LGFIX,LGSCR,YBAS,LIGWB,LIGWH,LAR,MAXOU,IFEN,VUE,AC,NUMUC,IN
 N FINEXE,MENUH,TITRE,ADRES,CONTR,RES,REF,TABLES,VARIAS,IFI,LTOT
 
 
 
 N NBFEN,NBLIFEN,COLCOUR,LIGCOUR,FENCOUR,XC,YC,A,OK,REAF,NBCOL,IFI,ILIG
 
 N DEBFEN,LARG,COLG,COLD
 
 S TABLES=$$CONCAS^%QZCHAD(TEMP,"TB")
 S VARIAS=$$CONCAS^%QZCHAD(TEMP,"VA")
 
 S I="" F %I=0:0 S I=$O(@TABLES@(I)) Q:I=""  S J="" F %J=0:0 S J=$O(@TABLES@(I,J)) Q:J=""  S @I@(J)=@TABLES@(I,J)
 S I="" F %I=0:0 S I=$O(@VARIAS@(I)) Q:I=""  S @I=@VARIAS@(I)
 
 D:'($D(PK)) INIT^%PKDEV
 S LTOT=0 F IFI=1:1:NBFEN S LTOT=LTOT+LARG(IFI)
 I LTOT=0 D CLFEN^%VVIDEO(@IN@("X"),@IN@("Y"),@IN@("H"),@IN@("L")) Q
 D AFF
 D VAL
 Q
 
 
AFF D CLFEN^%VVIDEO(@IN@("X"),@IN@("Y"),@IN@("H"),@IN@("L")),CADR,TIT F IFI=1:1:NBFEN D AFFFEN(IFI)
 Q
 
 
CADR D CARSP^%VVIDEO(@IN@("X"),@IN@("Y"),@IN@("H"),@IN@("L"),1) Q
 
 
TIT Q:'($D(@IN@("TI")))
 S DX=((@IN@("X")+(@IN@("L")\2))-($L(@IN@("TI"))\2))-1,DY=@IN@("Y")
 D BLD^%VVIDEO,REV^%VVIDEO X XY W " ",@IN@("TI")," " D NORM^%VVIDEO
 Q
 
AFFFEN(FEN) 
 N XFEN,IFEN,ICOL
 Q:LARG(FEN)=0
 F DY=@IN@("Y")+1:1:YBAS-1 S DX=DEBFEN(FEN) X XY W $J("",LARG(FEN)) W:FEN'=NBFEN PK("VL")
 S MAXOU=(@IN@("Y")+@IN@("H"))-2
 S DX=DEBFEN(FEN),DY=@IN@("Y")+1
 D REV^%VVIDEO
 F ICOL=COLG(FEN):1:COLD(FEN) X XY W:$D(@IN@("LI",ICOL,"T")) @IN@("LI",ICOL,"T") S DX=DX+@IN@("LI",ICOL,"L")
 D NORM^%VVIDEO
 S DY=DY+1
 F ILIG=LIGWH:1:LIGWB S X1=@A@(ILIG),DY=DY+1,DX=DEBFEN(FEN) F ICOL=COLG(FEN):1:COLD(FEN) X XY W $E($P(X1,"^",ICOL),1,@IN@("LI",ICOL,"L")) S DX=DX+@IN@("LI",ICOL,"L")
 Q
 
 
 
VAL S DX=@IN@("X")+1,DY=(@IN@("Y")+@IN@("H"))-2 X XY W $J("",@IN@("L")-2)
 S V=$S('($D(@A@(LIGCOUR))):"",1:$P(@A@(LIGCOUR),"^",COLCOUR))
 S DX=((@IN@("L")\2)+@IN@("X"))-($L(V)\2) X XY
 D BLD^%VVIDEO,REV^%VVIDEO X XY W V
 D NORM^%VVIDEO Q
 
 
 
MODLG(TEMP,NEWLG) 
 N %F,BUF,COL,I,J,L,LC,LD,LF,SX,SY,V,X,X1,Y,NC,PA,NP,CGEN,VID
 N NBFIX,LGFIX,LGSCR,YBAS,LIGWB,LIGWH,LAR,MAXOU,IFEN,VUE,AC,NUMUC,IN
 N FINEXE,MENUH,TITRE,ADRES,CONTR,RES,REF,TABLES,VARIAS
 
 
 
 N NBFEN,NBLIFEN,COLCOUR,LIGCOUR,FENCOUR,XC,YC,A,OK,REAF,NBCOL,IFI,ILIG
 
 N DEBFEN,LARG,COLG,COLD
 
 S TABLES=$$CONCAS^%QZCHAD(TEMP,"TB")
 S VARIAS=$$CONCAS^%QZCHAD(TEMP,"VA")
 
 S I="" F %I=0:0 S I=$O(@TABLES@(I)) Q:I=""  S J="" F %J=0:0 S J=$O(@TABLES@(I,J)) Q:J=""  S @I@(J)=@TABLES@(I,J)
 S I="" F %I=0:0 S I=$O(@VARIAS@(I)) Q:I=""  S @I=@VARIAS@(I)
 S AC=@IN@("X")+2 F IFEN=1:1 Q:'($D(@IN@("FEN",IFEN)))  S LARG(IFEN)=@NEWLG@(IFEN) D INITFEN^%QUBKVI
 S NBFEN=IFEN-1
 S LIGCOUR=1
 F FENCOUR=1:1:NBFEN I LARG(FENCOUR)'=0 S XC=DEBFEN(FENCOUR),COLCOUR=COLG(FENCOUR) Q
 S YC=@IN@("Y")+3
 F I="DEBFEN","COLG","COLD","LARG" S J="" F %J=0:0 S J=$O(@I@(J)) Q:J=""  S @TABLES@(I,J)=@I@(J)
 F I="NBLIFEN","LIGCOUR","COLCOUR","FENCOUR","NBFEN","YBAS","LIGWH","LIGWB","A","NBCOL","XC","YC" I $D(@I) S @VARIAS@(I)=@I
 Q
 
 
PLUS(TEMP) 
 N %F,BUF,COL,I,J,L,LC,LD,LF,SX,SY,V,X,X1,Y,NC,PA,NP,CGEN,VID
 N NBFIX,LGFIX,LGSCR,YBAS,LIGWB,LIGWH,LAR,MAXOU,IFEN,VUE,AC,NUMUC,IN
 N FINEXE,MENUH,TITRE,ADRES,CONTR,RES,REF,TABLES,VARIAS
 
 
 
 N NBFEN,NBLIFEN,COLCOUR,LIGCOUR,FENCOUR,XC,YC,A,OK,REAF,NBCOL,IFI,ILIG
 
 N DEBFEN,LARG,COLG,COLD
 
 S VARIAS=$$CONCAS^%QZCHAD(TEMP,"VA")
 S I="" F %I=0:0 S I=$O(@VARIAS@(I)) Q:I=""  S @I=@VARIAS@(I)
 S BOT=$ZP(@A@(""))
 I LIGWB=BOT Q 0
 S LIGWH=LIGWH+NBLIFEN
 S LIGWB=$S((LIGWB+NBLIFEN)<BOT:LIGWB+NBLIFEN,1:BOT)
 I (LIGCOUR+NBLIFEN)<BOT S LIGCOUR=LIGCOUR+NBLIFEN G PL2
 S YC=YC-((LIGCOUR+NBLIFEN)-BOT),LIGCOUR=BOT
PL2 F I="NBLIFEN","LIGCOUR","COLCOUR","FENCOUR","NBFEN","YBAS","LIGWH","LIGWB","A","NBCOL","XC","YC" I $D(@I) S @VARIAS@(I)=@I
 Q 1
 
MOINS(TEMP) 
 N %F,BUF,COL,I,J,L,LC,LD,LF,SX,SY,V,X,X1,Y,NC,PA,NP,CGEN,VID
 N NBFIX,LGFIX,LGSCR,YBAS,LIGWB,LIGWH,LAR,MAXOU,IFEN,VUE,AC,NUMUC,IN
 N FINEXE,MENUH,TITRE,ADRES,CONTR,RES,REF,TABLES,VARIAS
 
 
 
 N NBFEN,NBLIFEN,COLCOUR,LIGCOUR,FENCOUR,XC,YC,A,OK,REAF,NBCOL,IFI,ILIG
 
 N DEBFEN,LARG,COLG,COLD
 
 S VARIAS=$$CONCAS^%QZCHAD(TEMP,"VA")
 S I="" F %I=0:0 S I=$O(@VARIAS@(I)) Q:I=""  S @I=@VARIAS@(I)
 S BOT=$ZP(@A@(""))
 I LIGWH=1 Q 0
 S LIGWH=$S((LIGWH-NBLIFEN)<1:1,1:LIGWH-NBLIFEN)
 S LIGWB=$S((LIGWH+NBLIFEN)>BOT:BOT,1:LIGWH+NBLIFEN)
 S LIGCOUR=$S((LIGCOUR-NBLIFEN)<0:1,1:LIGCOUR-NBLIFEN)
 F I="NBLIFEN","LIGCOUR","COLCOUR","FENCOUR","NBFEN","YBAS","LIGWH","LIGWB","A","NBCOL","XC","YC" I $D(@I) S @VARIAS@(I)=@I
 Q 1

