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
;! HL001 ! HL     ! 01/01/01 ! Erreur %GTM-E-INVCMD -> $ZT="G ..."            !
;! HL002 ! HL     ! 00/00/00 !                                                !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%ZGEGLO^INT^1^59547,74037^0
ZGEGLO ;
 
 
 S NP=0,TAB=$P($T(TAB),";;",2) F %W=1:1 S GL=$P(TAB,",",%W) Q:GL=""  S PREF="%ZGEGL",NP=NP+1 D TR
 S X0="ZL %ZGEGL1 ZR +1 ZI ""%ZGEGL1 ;;""_NP_"";""_%N ZS %ZGEGL1" X X0 D ^ZD S DAT=$P(%DAT,"/",3)_$P(%DAT,"/",2)_$P(%DAT,"/",1) F %U=1:1:NP S ^PROGMOD(DAT,"%ZGEGL"_%U)=1
 Q
TR S NBL=0,X0="ZR  ZI PREF_NP_"" ;;"" X X1"
 S X1="S T=""^""_GL_""("""""""")"" F %U=1:1 S T=$ZO(@T),%=(T=""""!(T[""^ROUTINE(""""%ZGEGL"")) X:% X3 Q:%  W !,T S %N=%N+1,VN=@T S LI="" ;;""_T_""=""_VN ZI LI S NBL=NBL+1 I NBL>40 S NBL=0 ZS @(PREF_NP) S NP=NP+1 ZR  ZI PREF_NP_"" ;;""",X3="ZS @(PREF_NP)"
 X X0 Q
RESTOR 
 S NB=0,$ZT="",Y0="ZL %ZGEGL1 S LIM=15,%N=+$P($P($T(+1),"";;"",2),"";"",2)",I=0 X Y0
 S %N=389
 S X0="ZL @(""%ZGEGL""_I) F J=2:1 S LI=$T(+J) Q:LI=""""  S LI=$P(LI,"";;"",2,500),RF=$P(LI,""="",1),VL=$P(LI,""="",2,500),@RF=VL,NB=NB+1"
LOP1 S I=I+1 U 0 W !,!,I,"<<<" G:I>LIM END1 X X0 G LOP1
END1 S X0="ZL @(""%ZGEGL9""_I) F J=2:1 S LI=$T(+J) Q:LI=""""  S LI=$P(LI,"";;"",2,500),RF=$P(LI,""="",1),VL=$P(LI,""="",2,500),@RF=VL,NB=NB+1",I=0
LOP S I=I+1 U 0 W !,!,I,"<<<" G:I>2 END X X0 G LOP
END 
 S ^%Z100=^%Z100(1),^%Z52=^%Z52(1),%ZWORD=^%ZWORD(1),^%ZPC=^%ZPC(1) Q
TAB ;;%ZGE,%Z52,%Z100,%ZWORD,%ZPC
 ;
 ;

