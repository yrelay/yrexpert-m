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

;%MZANAL^INT^1^59547,73871^0
MOZANAL ;
 
 K ^REF($J),V("MOZ") Q:('($D(^MOZ(WHOIS,"C","PARA"))))&('($D(^MOZ("STAND","C","PARA"))))  F %WU=1,2 G:('($D(^MOZ("C","L",%WU))))&('($D(^MOZ(WHOIS,"C","L",%WU)))) END
 S LI=-1 F %U=1:1 S LI=$N(@%TT@($J,0,LI)) G:LI=-1 END S X=@%TT@($J,0,LI),XOP=$P(X,"^",1),X=$P(X,"^",2,999) I XOP=1,(X'="u0")&((X'="u2")&(X'="u3")) G T1
T1 K ^LI1($J),%X S LIC=LI,%X(1)=$P(@%TT@($J,0,LIC),"^",2,999)
 K P S LI=$S($D(^MOZ(WHOIS,"C","PARA")):^MOZ(WHOIS,"C","PARA"),1:^MOZ("STAND","C","PARA")) F %U=1:1 S VP=$P(LI,",",%U) Q:VP=""  S P(VP)=""
 S %WU=1,TABI=$S($D(^MOZ(WHOIS,"C","L",%WU)):"^MOZ(WHOIS,""C"",""L"",%WU)",1:"^MOZ(""C"",""L"",%WU)") D T0 S %WU=2,TABI=$S($D(^MOZ(WHOIS,"C","L",%WU)):"^MOZ(WHOIS,""C"",""L"",%WU)",1:"^MOZ(""C"",""L"",%WU)"),LIK=LIC
LPL S LIK=$N(@%TT@($J,0,LIK)) G:LIK=-1 END S X=@%TT@($J,0,LIK),XOP=$P(X,"^",1),X=$P(X,"^",2,999) G LPL:(X="")!((XOP'=2)!((X="u0")!((X="u2")!(X="u3")))) S %X(2)=X D T0
 S LI=-1 F %U=1:1 S LI=$N(P(LI)) Q:LI=-1  S V("MOZ",LI)="" I P(LI)'="" S %WU=$P(P(LI),"/",1),PL=$P(P(LI),"/",2),V("MOZ",LI)=$P($E(%X(%WU),PL+2,999)," ",1)
 D ^%MZINEV G LPL
END K %X,%U,LI,ID,P,VP,%WU,TAB,TAB,PL Q
T0 S TAB=@TABI F %U=1:1 S LI=$P(TAB,"/",%U) Q:LI=""  S PL=$P(LI,",",2),LI=$P(LI,",",1) I $D(P(LI)) S P(LI)=%WU_"/"_PL
 Q

