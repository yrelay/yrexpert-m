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

;%HXYIMP1^INT^1^59547,73870^0
HXYIMP1(X,Y,H,L,LC,E,CL) 
 
 
 
 
 
 
 N PREC,LIGBASE,I,J,HABS,LIM,LCVAR,ESPREST,DEUX,OLCVAR,TRAIT,REV
 S TRAIT="-------------------------------------------------------------------------------------------------------------------------------------------------------"
 S DEUX=0
 I $D(@CL@(3)) S DEUX=1
 S (PREC,DX)=X,DY=$Y,LIGBASE=Y+H X XY
 I (L\(LC+E))<@CL S LIM=L\(LC+E)
 E  S LIM=@CL
 
 I LC>L S LCVAR=L,LIM=1 G BOUCOL
 S LCVAR=LC
BOUCOL S OLCVAR=LCVAR
 F I=1:1:LIM D COL
 S I=I+1
 D COLREST(1)
 I DEUX=0 Q
 S LCVAR=OLCVAR
 S (PREC,DX)=X,DY=$Y,LIGBASE=Y+H X XY
 F I=1:1:LIM D COL2
 S I=I+1
 D COLREST(2)
 D NORM^%VVIDEO
 Q
 
COL S DX=PREC,DY=(LIGBASE-@CL@(2,I))-1 D COLPLEIN Q
 
COLPLEIN 
 S HABS=@CL@(1,I)-@CL@(2,I) D TESTFEN
 F J=1:1:HABS X XY S ^IMP($J,$Y,$X)=$$SUITEC("#",LCVAR),DX=$X,DY=$Y-1
 S PREC=(DX+E)+LCVAR Q
 
TESTFEN 
 
 I (DY'>Y)!(HABS<0) S HABS=0 Q
 I DY'<LIGBASE S HABS=@CL@(1,I),DY=LIGBASE-1
 S HABS=DY-$$PLGR(DY-HABS,Y-1) Q
 
COL2 S DX=PREC,DY=(LIGBASE-@CL@(4,I))-1 D COLP2 Q
 
COLP2 S HABS=@CL@(3,I)-@CL@(4,I)
 D TESTF2 I HABS>0 S DY=(DY-HABS)+1 X XY S ^IMP($J,$Y,$X)=$E(TRAIT,1,LCVAR),DX=$X,DY=$Y-1
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
 
SUITEC(A,B) 
 N I,S
 S S=""
 F I=1:1:B S S=S_A
 Q S

