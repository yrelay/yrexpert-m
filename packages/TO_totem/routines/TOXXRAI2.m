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

;TOXXRAI2^INT^1^59547,74877^0
TOXXRAI2 ;
 
COND G FIN:RSF=""
 S TBC="",CD=COND,PGE=1,(LIC,LIH)=13,LIM=19,LIL=46,NBC=1 K TBCOND
LOOP G:NBC>4 FCOND G:$P(RSF,"^",CD)="" INCR
 F %U=CD:1:CD+3 S TEC=$P(RSF,"^",%U) D:(($L(TEC)+$L(TBC))+2)>LIL POP S TBC=TBC_TEC_"  "
INCR D:TBC'="" POP S TBC="",CD=CD+4,NBC=NBC+1 G LOOP
FCOND D ^TOXXRAI3 G FIN
POP S TBCOND(PGE,LIC)=TBC,TBC="",LIC=LIC+1 S:LIC>LIM LIC=LIH,PGE=PGE+1 Q
 
ACT S %LSEP=$$^%QZCHW(" :"",;^%_#+*-/\[]()&!<>=:")
 
 S PGE=0,LIH=13,LIM=19,LIL=46,NBC=1,ADRF="FIN",ADRG="T0^TOXXRAI2" K TBCOND S LFO=-1
LFO S LFO=$N(ACT(LFO)) G:LFO=-1 FCOND
 S XDP=$P(RSF,"^",ACT(LFO)),PGE=PGE+1,LIC=LIH D ^%ABVSQUL D:EX'="" T1 G LFO
T0 S LEX=$L(EX)+$L(VPL) G:LEX'>LIL FIN
T1 S TBCOND(PGE,LIC)=EX,EX="",LIC=LIC+1 S:LIC>LIM PGE=PGE+1,LIC=LIH G FIN
 
PREM S PR="P"
PREMS S NOMG=$P($P(COND,",",1),"""",2),DP=$P(ACT,"/",1),CL=$P(ACT,"/",2),TB1="^[QUI]STRUCT(NOMG,2,PR)",TB2="^[QUI]OCGRIL("_COND_","_DP_",PR,LI,CL)",LI=-1,PGE=1,(LIC,LIH)=13,LIM=19,LIL=46,NBC=1 K TBCOND
LLI S LI=$N(@TB1@(LI)) G:LI=-1 FCOND
 S TBC=$S($D(@TB1@(LI,"FULL")):@TB1@(LI,"FULL"),1:@TB1@(LI))_" : "_$S($D(@TB2):@TB2,1:"") D POP G LLI
RESU S PR="R" G PREMS
 
TPS S TPL=^PILAVER($J)+1,^PILAVER($J)=TPL,^PILAVER($J,TPL)=PH_"^"_OBJ_"^"_TWREF_"^"_ART_"^"_NUFA D PILVU^TOXXRAI3 G FIN
 
CONS G:'($D(^[QUI]CONS(NUFA,TWREF,PH))) FIN K UT S UT=^[QUI]CONS(NUFA,TWREF,PH),UT(1)=$P(PH,"/",2)
 F %U=1:1 S UT(2)=$P(UT,"|",%U) Q:UT(2)=""  S UT(2)=UT(2)_"/"_UT(1),TPL=^PILAVER($J)+1,^PILAVER($J)=TPL,^PILAVER($J,TPL)=UT(2)_"^"_OBJ_"^"_TWREF_"^"_ART_"^"_NUFA D PILVU^TOXXRAI3 S VAL=UT(2)
 G FIN
FIN Q

