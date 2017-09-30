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

;%LXUC72^INT^1^59547,73871^0
%LXUC72 ;;03:15 PM  20 Dec 1996
 
 
 S TB=$P($T(TB),";;",2) F UU=1:1 S T1=$P(TB,",",UU) Q:T1=""  S T2="^"_T1 K @T2@($I) S LU=-1 F %U=1:1 S LU=$N(@T1@(LU)) Q:LU=-1  S @T2@($I,LU)=@T1@(LU)
 F UU=1:1 S T1=$P(TB,",",UU) Q:T1=""  K @(T1)
 K ^SAVOAB($I,SCR) S UU=-1 F %U=1:1 S UU=$N(^OABRES($I,UU)) Q:UU=-1  S ^SAVOAB($I,SCR,UU)=^OABRES($I,UU)
 D ^%VSAVMUL(SCR) S OICC=IC,ONOMTAB=NOMTAB,OSCR=SCR,OREFUS=$S($D(REFUSE):REFUSE,1:0)
 N TLEX
C0 S TLEX(1)=$S($D(PCH):PCH,1:"")
 D CLEPAG^%VVIDEO,POINT^%VAJOUT("LEXIQUE","TLEX")
C1 S TB=$P($T(TB),";;",2) F UU=1:1 S T1=$P(TB,",",UU) Q:T1=""  S T2="^"_T1 K @(T1) S LU=-1 F %U=1:1 S LU=$N(@T2@($I,LU)) Q:LU=-1  S @T1@(LU)=@T2@($I,LU)
 F UU=1:1 S T1=$P(TB,",",UU) Q:T1=""  S T2="^"_T1 K @T2@($I)
 S NOMTAB=ONOMTAB,SCR=OSCR,REFUSE=OREFUS,ABENDSCR=0 D ^%VRESMUL(SCR)
 K ^OABRES($I) S UU=-1 F %U=1:1 S UU=$N(^SAVOAB($I,SCR,UU)) Q:UU=-1  S ^OABRES($I,UU)=^SAVOAB($I,SCR,UU)
 D CLEPAG^%VVIDEO,^%VAFIGRI2(PAGE),^%VAFISCR2(PAGE) S (IC,ICC)=OICC
FIN S CTRLF=0 Q
TB ;;FRESU
 ;;RESUL,FRESU,AFRESU,PATOUCH,DEJALU

