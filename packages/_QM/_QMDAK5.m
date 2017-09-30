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

;%QMDAK5^INT^1^59547,73877^0
ZSEM ;
 
 
 
 
NOSEM(H) 
 N NS,A,HPS
 S A=$$ANNEEX^%QMDATE(H),HPS=$$HPS(A)
 I HPS>H Q $$NOSEM($$20^%QMDATE1((A-1)_1231))
 S NS=((H-HPS)\7)+1 S:$L(NS)<2 NS="0"_NS
 Q A_NS
HLUN(NSC) 
 Q $$HPS($E(NSC,1,2))+(7*($E(NSC,3,4)-1))
HPS(A) 
 N H1,J
 S H1=$$20^%QMDATE1(A_"0101"),J=$$FIRSTDAY^%QMDATE(A) Q $S(J=1:H1,1:(8-J)+H1)
 
TEST S b=$$BLD^%VVIDEO1,n=$$NORM^%VVIDEO1
 D CLEPAG^%VVIDEO W b,"Conversions date <-> semaine",n,!,!
 W "1  date -> semaine",!,"2  semaine -> date",!,"3  calendrier"
 D ECHON^%VVIDEO W !,!,"Votre choix : " R *REP Q:((REP'=49)&(REP'=50))&(REP'=51)  W ! G @$C(REP)
1 D ECHON^%VVIDEO S DATE=$$SAISIE^%VYDAT G TEST:DATE="" S H=$$10^%QMDATE1(DATE) W b,$$NOSEM(H),n G 1
2 D ECHON^%VVIDEO W !,"Semaine: " R SEM G TEST:SEM="" D BIS2 W !,b,HH,"  ",DAT,n G 2
BIS2 B  S HH=$$HLUN(SEM),DAT=$$01^%QMDATE1(HH) Q
3 D CURRENT^%IS S IO=0 U 0 D ECHON^%VVIDEO W !,"Annee (87) : " R AA G TEST:AA=""
 K IO,IOP D ^%IS D:IO=0 SMTHSCRL^%VVIDEO F S=1:1:53 D BIS3
 D JMPSCRL^%VVIDEO G 3
BIS3 S SEM=AA_$S($L(S)<2:"0"_S,1:S),LIG=SEM_" commence le "_$$01^%QMDATE1($$HLUN(SEM)) U IO W LIG,$J("",40-$L(LIG))
 Q

