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

;%LXBESTA^INT^1^59547,73870^0
LEXBESTA ;
 
 K CPT,CPTAB S %CAR=".",RS=LIBCPT D ^%QZCHNBC S NBT=%NBCAR+1
 F UU=1:1:NBT S CPT(UU)=$P(LIBCPT,".",UU),CPTAB(UU)=$S(UU=1:"",1:".")
 S PCOUR=1,SSLIB=1
LOOP S CPTAB(SSLIB)=CPTAB(SSLIB)_$E(CPT(SSLIB),PCOUR)
 D GETABR S PCH=ABR G:PCH=LIBCPT FIN D ^%LXABR
 G:CONCUR=1 FIN
 S SSLIB=SSLIB+1 I SSLIB>NBT S SSLIB=1,PCOUR=PCOUR+1
 G LOOP
GETABR S ABR="" F VV=1:1:NBT S ABR=ABR_CPTAB(VV)
 Q
FIN S NPT=$L(LIBCPT,".")-1,NPTA=$L(PCH,".")-1 I NPTA<NPT S PCH=PCH_$TR($J("",NPT-NPTA)," ",".")
 S NPTA=NPT+1 K NPT F UU=1:1:NPTA S VV=$P(PCH,".",UU) D T0
 S PCH=NPT(1) F UU=2:1:NPTA S PCH=PCH_"."_NPT(UU)
 K NPTA,CPT,CPTAB,%CAR,RS,LIBCPT,%NBCAR,NBT,UU,PCOUR,SSLIB,ABR,VV Q
T0 S RS="" F %U=1:1 S %CAR=$E(VV,%U) S:%CAR="" %CAR=$E($P(LIBCPT,".",UU),%U) Q:%CAR=""  S RS=RS_%CAR Q:"AEIOUY"[%CAR
 S NPT(UU)=$S($L(RS)>$L(VV):RS,1:VV),LIBU=$P(LIBCPT,".",UU)
LP S LU=$L(NPT(UU)),CC=$E(NPT(UU),LU) Q:"AEIOUY"'[CC  S CC=$E(LIBU,LU+1) Q:CC=""  S NPT(UU)=NPT(UU)_CC G LP
 Q
TEST W !,$$^%QZCHW("Libelle complet : ") S DX=$X,DY=$Y D ^%VLEC G:(CTRLA=1)!((CTRLF=1)!(Y1="")) FIN S LIBCPT=Y1 D ^%LXBESTA W !,?10,$$^%QZCHW("Abreviation proposee : "),PCH G TEST
ALL K ^TRAD("ABR") S LIBC=-1,NU=1
LLI S LIBC=$N(^[QUI]TOLEX(LIBC)) Q:LIBC=-1  S LIBCPT=LIBC W !,NU,?10,LIBCPT," = " D ^%LXBESTA S ^TRAD("ABR",LIBC)=PCH,NU=NU+1 W PCH G LLI

