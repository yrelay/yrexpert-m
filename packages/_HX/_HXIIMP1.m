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

;%HXIIMP1^INT^1^59547,73869^0
HXIIMP1(X,Y,H,L,LC,E,CL) 
 
 
 
 
 
 
 N PREC,LIGBASE,I,J,HABS,LIM,LCVAR,ESPREST
 S (PREC,DX)=X,DY=$Y,LIGBASE=Y+H X XY
 I (L\(LC+E))<@CL S LIM=L\(LC+E)
 E  S LIM=@CL
 I LC>L S LCVAR=L,LIM=1 G BOUCOL
 S LCVAR=LC
BOUCOL F I=1:1:LIM D COL
 S I=I+1
 D COLREST
 D NORM^%VVIDEO Q
 
COL S DX=PREC,DY=(LIGBASE-@CL@(2,I))-1 D COLPLEIN Q
 
COLPLEIN 
 S HABS=@CL@(1,I)-@CL@(2,I) D TESTFEN
 F J=1:1:HABS X XY S ^IMP($J,$Y,$X)=$$SUITEC("#",LCVAR),DX=$X,DY=$Y-1
 S PREC=(DX+E)+LCVAR Q
 
TESTFEN 
 
 I (DY'>Y)!(HABS<0) S HABS=0 Q
 I DY'<LIGBASE S HABS=@CL@(1,I),DY=LIGBASE-1
 S HABS=DY-$$PLGR(DY-HABS,Y-1) Q
 
COLREST S ESPREST=L-((LC+E)*LIM) Q:ESPREST'>E
 
 S LCVAR=$$PLPET(LC,ESPREST)
 D COL Q
 
PLGR(UN,DE) 
 Q:UN>DE UN Q DE
 
PLPET(UN,DE) 
 Q:UN<DE UN Q DE
 
SUITEC(A,B) 
 N I,S
 S S=""
 F I=1:1:B S S=S_A
 Q S

