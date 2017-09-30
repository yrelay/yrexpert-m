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

;%HXYIST1^INT^1^59547,73870^0
HXYIST1(X,Y,H,L,LC,E,CL) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N PREC,LIGBASE,I,J,HABS,LIM,LCVAR,ESPREST,DEUX,OLCVAR,TRAIT,REV
 S TRAIT="ppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp"
 D CLFEN^%VVIDEO(X,Y,H,L) S DEUX=0
 I $D(@CL@(3)) S DEUX=1
 S (PREC,DX)=X,DY=$Y,LIGBASE=Y+H X XY
 
 
 
 
 I (L\(LC+E))<@CL S LIM=L\(LC+E)
 E  S LIM=@CL
 
 I LC>L S LCVAR=L,LIM=1 G BOUCOL
 S LCVAR=LC
BOUCOL S OLCVAR=LCVAR
 D REV^%VVIDEO
 F I=1:1:LIM D COL
 S I=I+1
 D COLREST(1)
 D NORM^%VVIDEO X XY
 I DEUX=0 Q
 D G0ON^%VVIDEO
 S LCVAR=OLCVAR,(PREC,DX)=X,DY=$Y,LIGBASE=Y+H X XY
 F I=1:1:LIM D COL2
 S I=I+1
 D COLREST(2)
 D G0OFF^%VVIDEO,NORM^%VVIDEO
 Q
COL S DX=PREC,DY=(LIGBASE-@CL@(2,I))-1 D COLPLEIN Q
COLPLEIN S HABS=@CL@(1,I)-@CL@(2,I) D TESTFEN F J=1:1:HABS X XY W $J(" ",LCVAR) S DX=$X-LCVAR,DY=$Y-1
 S PREC=(DX+E)+LCVAR Q
TESTFEN 
 
 I (DY'>Y)!(HABS<0) S HABS=0 Q
 I DY'<LIGBASE S HABS=@CL@(1,I),DY=LIGBASE-1
 S HABS=DY-$$PLGR(DY-HABS,Y-1) Q
COL2 S DX=PREC,DY=(LIGBASE-@CL@(4,I))-1 D COLP2 Q
COLP2 S HABS=@CL@(3,I)-@CL@(4,I)
 D:@CL@(1,I)>@CL@(3,I) REV^%VVIDEO
 D TESTF2 I HABS>0 S DY=(DY-HABS)+1 X XY D BLD^%VVIDEO X XY W $E(TRAIT,1,LCVAR) X XY
 D:@CL@(1,I)>@CL@(3,I) NORM^%VVIDEO
 S PREC=(DX+E)+LCVAR Q
 
TESTF2 
 
 I (DY'>Y)!(HABS<0) S HABS=0 Q
 I DY'<LIGBASE S HABS=@CL@(3,I),DY=LIGBASE-1
 S HABS=DY-$$PLGR(DY-HABS,Y-1) Q
COLREST(A) S ESPREST=L-((LC+E)*LIM) Q:ESPREST'>E
 
 S LCVAR=$$PLPET(LC,ESPREST)
 I A=1 D COL Q
 D COL2 Q
PLGR(UN,DE) 
 Q:UN>DE UN Q DE
PLPET(UN,DE) 
 Q:UN<DE UN Q DE
 
TEST D CLEPAG^%VVIDEO
 K CLO,CM,CN S CLO=12,CM=12_"^"_4 F M=1:1:CLO D T1
 F M=1:1:CLO D T2
 F M=1:1:16 S CN(1,M)=16-M
 S CN=1_"^"_16
 D ^%HXYIST1(4,2,15,50,5,1,"CLO")
 D ^%VZECOL(4,19,4,50,5,1,"CM")
 D ^%VZECOL(0,2,14,3,3,1,"CN")
 D CARSP^%VVIDEO(3,0,19,52),^%VZEAVT(" ") Q
T1 S CLO(2,M)=0,CLO(1,M)=$$RNZE(CLO(2,M),25)
 S CM(M,2)=CLO(2,M),CM(M,1)=CLO(1,M) Q
T2 S CLO(4,M)=0,CLO(3,M)=$$RNZE(CLO(2,M),25)
 S CM(M,4)=CLO(4,M),CM(M,3)=CLO(3,M) Q
RNZE(PLANCHER,PLAFOND) 
 N ALPHA
 S ALPHA=$R(1000)/1000 Q ((PLAFOND*ALPHA)+((1-ALPHA)*PLANCHER))\1

