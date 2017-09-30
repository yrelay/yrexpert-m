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

;%QUBKVR^INT^1^59547,73884^0
%QUBKVR(TEMP) ;;04:48 PM  13 May 1993; ; 06 Oct 93  9:53 AM
 
 
 
 
 
 
 
 N %F,BUF,COL,I,J,L,LC,LD,LF,SX,SY,V,X,X1,Y,NC,PA,NP,CGEN,VID
 N NBFIX,LGFIX,LGSCR,YBAS,LIGWB,LIGWH,LAR,MAXOU,IFEN,VUE,AC,NUMUC,IN
 N FINEXE,MENUH,TITRE,ADRES,CONTR,RES,TABLES,VARIAS
 N REF
 
 
 
 N NBFEN,NBLIFEN,COLCOUR,LIGCOUR,FENCOUR,XC,YC,A,OK,REAF,NBCOL,IFI,ILIG
 
 N DEBFEN,LARG,COLG,COLD
 
 S TABLES=$$CONCAS^%QZCHAD(TEMP,"TB")
 S VARIAS=$$CONCAS^%QZCHAD(TEMP,"VA")
 
 S I="" F %I=0:0 S I=$O(@TABLES@(I)) Q:I=""  S J="" F %J=0:0 S J=$O(@TABLES@(I,J)) Q:J=""  S @I@(J)=@TABLES@(I,J)
 S I="" F %I=0:0 S I=$O(@VARIAS@(I)) Q:I=""  S @I=@VARIAS@(I)
 
 D:'($D(PK)) INIT^%PKDEV
AFFG1 D MOVUPDW
 
L0 D VAL
 S DX=XC,DY=YC X XY D ECHOFF^%VVIDEO,ZFLECHE^%VZATOU,ECHON^%VVIDEO G:%F'="" @%F
 F I=1,2,4,5,6,7,9,13,26 G:I=X1 @I
 
 G:(X1<31)!(X1>126) ERR
 
 I $D(@A@(LIGCOUR)),'($D(@IN@("CHI",COLCOUR))) D MODD^%QUBKV3 G D
 G ERR
 
FIN 
 F I="LIGCOUR","COLCOUR","FENCOUR","NBFEN","YBAS","LIGWH","LIGWB","XC","YC" S @VARIAS@(I)=@I
 Q RES
 
 
 
 
1 S RES=0 G FIN
 
2 I '($D(@IN@("UCONT","CTRB"))) G L0
 S REAF=0
 D @(@IN@("UCONT","CTRB")_"(REF)")
 D:REAF AFF^%QUBKVA G L0
 
4 G:FENCOUR=1 ERR
 S FENCOUR=FENCOUR-1,COLCOUR=COLG(FENCOUR),XC=DEBFEN(FENCOUR)
 G L0
 
5 G:FENCOUR=NBFEN ERR
 S FENCOUR=FENCOUR+1,COLCOUR=COLG(FENCOUR),XC=DEBFEN(FENCOUR)
 G L0
 
6 S RES=1 G FIN
 
7 I $D(@IN@("CHI",COLCOUR)) G ERR
 D SUPPCH^%QUBKV3 G L0
 
9 I $D(@IN@("CHI",COLCOUR)) G ERR
 D MOD^%QUBKV3 G D
 
 
 
 
H I '($D(@A@(LIGCOUR-1))) G ERR
 I LIGCOUR>LIGWH S LIGCOUR=LIGCOUR-1,YC=YC-1 D MOVUPDW G L0
 S LIGCOUR=LIGCOUR-1,LIGWB=LIGWB-1,LIGWH=LIGWH-1 F IFEN=1:1:NBFEN D AFFFEN^%QUBKVA(IFEN)
 D MOVUPDW
 G L0
 
MOVUPDW Q:'($D(@IN@("SUPPLEM")))
 S REAF=0
 D @(@IN@("SUPPLEM")_"(REF)")
 D:REAF AFF^%QUBKVA
 Q
 
B I '($D(@A@(LIGCOUR+1))) G ERR
 I LIGCOUR<LIGWB S LIGCOUR=LIGCOUR+1,YC=YC+1 D MOVUPDW G L0
 S LIGCOUR=LIGCOUR+1,LIGWB=LIGWB+1,LIGWH=LIGWH+1 D MOVUPDW
 F IFEN=1:1:NBFEN D AFFFEN^%QUBKVA(IFEN)
 G L0
 
D 
 I COLCOUR<COLD(FENCOUR) S XC=XC+@IN@("LI",COLCOUR,"L"),COLCOUR=COLCOUR+1 G L0
 
 I COLCOUR<@IN@("FEN",FENCOUR,"F") D SCROLLD^%QUBKV2(FENCOUR),AFFFEN^%QUBKVA(FENCOUR) G L0
 
 S IFEN=FENCOUR
D2 G:IFEN=NBFEN ERR S IFEN=IFEN+1 G:LARG(IFEN)=0 D2
 S FENCOUR=IFEN,XC=DEBFEN(FENCOUR)
 S COLCOUR=COLG(FENCOUR)
 G L0
 
G 
 I COLCOUR>COLG(FENCOUR) S COLCOUR=COLCOUR-1,XC=XC-@IN@("LI",COLCOUR,"L") G L0
 
 I COLCOUR>@IN@("FEN",FENCOUR,"D") D SCROLLG^%QUBKV2(FENCOUR),AFFFEN^%QUBKVA(FENCOUR) G L0
 S IFEN=FENCOUR
G2 G:IFEN=1 ERR S IFEN=IFEN-1 G:LARG(IFEN)=0 G2
 S FENCOUR=IFEN
 S XC=DEBFEN(FENCOUR) F ICO=COLG(FENCOUR):1:COLD(FENCOUR)-1 S XC=XC+@IN@("LI",ICO,"L")
 S COLCOUR=COLD(FENCOUR)
 G L0
 
 
13 
 I COLCOUR<COLD(FENCOUR) S XC=XC+@IN@("LI",COLCOUR,"L"),COLCOUR=COLCOUR+1 G L0
 
 I COLCOUR<@IN@("FEN",FENCOUR,"F") D SCROLLD^%QUBKV2(FENCOUR),AFFFEN^%QUBKVA(FENCOUR) G L0
 
 S IFEN=FENCOUR
R2 G:IFEN=NBFEN R3 S IFEN=IFEN+1 G:LARG(IFEN)=0 R2
 S FENCOUR=IFEN,XC=DEBFEN(FENCOUR)
 S COLCOUR=COLG(FENCOUR)
 G L0
 
R3 I '($D(@A@(LIGCOUR+1))) G ERR
 
 S FENCOUR=1,COLCOUR=COLG(FENCOUR),XC=DEBFEN(FENCOUR)
 I LIGCOUR<LIGWB S LIGCOUR=LIGCOUR+1,YC=YC+1 D MOVUPDW G L0
 S LIGCOUR=LIGCOUR+1,LIGWB=LIGWB+1,LIGWH=LIGWH+1 D MOVUPDW
 F IFEN=1:1:NBFEN D AFFFEN^%QUBKVA(IFEN)
 G L0
 
ERR D ^%VSQUEAK G L0
 
 
VAL S DX=@IN@("X")+1,DY=(@IN@("Y")+@IN@("H"))-2 X XY W $J("",@IN@("L")-2)
 S V=$S('($D(@A@(LIGCOUR))):"",1:$P(@A@(LIGCOUR),"^",COLCOUR))
 S DX=((@IN@("L")\2)+@IN@("X"))-($L(V)\2) X XY
 D BLD^%VVIDEO,REV^%VVIDEO X XY W V
 D NORM^%VVIDEO Q
 ;

