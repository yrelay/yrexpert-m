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

;TOLISRA2^INT^1^59547,74873^0
TOLISRAM ;
 
 G FIN
 X ^TOLISRAM(2) D ^TODRIVE2 Q
 X ^TOLISRAM(4) S (%M,MENU)=%PROG,@G@(%M,0)=$P($T(FUN),";;",2),@G@(%M,"AFF",0)=$$^%QZCHW("Abandon")_$J("",60-$L($$^%QZCHW("Abandon")))_"^"_0,@G@(%M,"AFF",0,"EQU")=0,LI=1 F %U=1:1 S LIG=$T(FUN+%U) Q:$P(LIG,";;",2)=""  S C=$T(FUNC+%U) D INT^TOLISRA2
 S ^GLOMENU($I,%PROG,"AFF")="19^5^75^1"
 S %S=0 F %U=1:1 S %Q=$E(%A,%U) Q:%Q=""  D PIL^TOLISRAM Q:%S=1
 S %AC=$S($D(^TABIDENT(WHOIS,"INTERDIT","MOD",$I)):0,1:1),%CP=$S($D(^TABIDENT(WHOIS,"INTERDIT","COMP",$I)):0,1:1),%EX=$S($D(^TABIDENT(WHOIS,"INTERDIT","EXEC",$I)):0,1:1),G="^GLOMENU($I)" K @G@(%PROG)
 S DXG=1,DYH=6,LV=12,LH=77,BLD=1 D CARS^%VVIDEO S DXG=1,DYH=18,LV=4,LH=77 D CARS^%VVIDEO Q
FIN S ^TOLISRAM=$T(+6),^TOLISRAM=$E(^TOLISRAM,2,299),^TOLISRAM(1)=$T(+4),^TOLISRAM(1)=$E(^TOLISRAM(1),2,299),^TOLISRAM(2)=$T(+5),^TOLISRAM(2)=$E(^TOLISRAM(2),2,299),^TOLISRAM(3)=$T(+7),^TOLISRAM(3)=$E(^TOLISRAM(3),2,299)
 S ^TOLISRAM(4)=$T(+8),^TOLISRAM(4)=$E(^TOLISRAM(4),2,599)
 S ^TOLISRAM(5)=$T(+9),^TOLISRAM(5)=$E(^TOLISRAM(5),2,599) Q
INT I (LIG["AJOUT")!((LIG["CREATION")!($P(LIG,";;",4)["MOD")),%AC=0 G END
 I (LIG["COMPREHENSION")!($P(LIG,";;",4)["COMP"),%CP=0 G END
 I $P(LIG,";;",4)["EXEC",%EX=0 G END
 S LIG1=$P(LIG,"~",2) I LIG1'="" S:'($D(@LIG1)) @LIG1=1 G:@LIG1=0 END
 S ^GLOMENU($I,MENU,LI)=" "_LIG,LIB=$P(LIG,";;",2),^GLOMENU($I,MENU,"AFF",LI)=LIB_$J("",60-$L(LIB))_"^"_LI,^GLOMENU($I,MENU,"AFF",LI,"EQU")=LI,^GLOMENU($I,MENU,"AFF",LI,"COM")=$P(C,";;",2),LI=LI+1 G END
PIL I %Q>0,%Q?.N,$D(^GLOMENU($I,%PROG,%Q)) S A=^GLOMENU($I,%PROG,%Q) I A'="" W " ",$P(A,";",2),! S %PROGET=$P($P(A,";;",3),"/",1) D ^%INCUPA G:B="???" END S ^TOLISRAM($I,100)="~"_%PROGET_^TOLISRAM($I,100),%PROG=$P(%PROGET,"^",2) G END
 S %S=1
END Q

