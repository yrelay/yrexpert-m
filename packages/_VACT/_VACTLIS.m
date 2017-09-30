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
;! HL002 ! HL     ! 28/08/09 ! Invalid command keyword encountered            !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%VACTLIS^INT^1^59547,74033^0
%VACTLIS ;
 
 G FIN
 ;;@X ^TOLISRAM(2) D ^%VACTDRI Q
 ;;@X ^TOLISRAM(4) S (%M,MENU)=%PROG,@G@(%M,0)=$P($T(FUN),";;",2),@G@(%M,"AFF",0)=$$^%QZCHW("Abandon")_$J("",60-$L($$^%QZCHW("Abandon")))_"^"_0,@G@(%M,"AFF",0,"EQU")=0 S LI=1 F %U=1:1 S LIG=$T(FUN+%U) Q:$P(LIG,";;",2)=""  S C=$T(FUNC+%U) D INT^%VACTLIS
 ;;@S ^GLOMENU($I,%PROG,"AFF")="19^5^75^1"
 ;;@S %S=0 F %U=1:1 S %Q=$E(%A,%U) Q:%Q=""  D PIL^%VACTLIS Q:%S=1
 ;;@S %AC=$S($D(^TABIDENT(WHOIS,"INTERDIT","MOD",$I)):0,1:1),%CP=$S($D(^TABIDENT(WHOIS,"INTERDIT","COMP",$I)):0,1:1),%EX=$S($D(^TABIDENT(WHOIS,"INTERDIT","EXEC",$I)):0,1:1) S G="^GLOMENU($I)" K @G@(%PROG) 
 ;;@S DXG=1,DYH=6,LV=12,LH=77,BLD=1 D:'^TOZE($I,"NEWCADRE") CARS^%VVIDEO S DXG=1,DYH=18,LV=4,LH=77,BLD=0 D CARS^%VVIDEO Q
FIN S ^TOLISRAM=$P($T(+6),";;@",2),^TOLISRAM(1)=$P($T(+4),";;@",2)
 S ^TOLISRAM(2)=$P($T(+5),";;@",2),^TOLISRAM(3)=$P($T(+7),";;@",2)
 S ^TOLISRAM(4)=$P($T(+8),";;@",2),^TOLISRAM(5)=$P($T(+9),";;@",2)
 Q
INT I (LIG["AJOUT")!((LIG["CREATION")!($P(LIG,";;",4)["MOD")),%AC=0 G END
 I (LIG["COMPREHENSION")!($P(LIG,";;",4)["COMP"),%CP=0 G END
 I $P(LIG,";;",4)["EXEC",%EX=0 G END
 S LIG1=$P(LIG,"~",2) I LIG1'="",LIG1["$$" G:$$LIG END
 I LIG1'="",LIG1'["$$" S:'($D(@LIG1)) @LIG1=1 G:@LIG1=0 END
 S ^GLOMENU($I,MENU,LI)=" "_LIG,LIB=$P(LIG,";;",2),^GLOMENU($I,MENU,"AFF",LI)=LIB_$J("",60-$L(LIB))_"^"_LI,^GLOMENU($I,MENU,"AFF",LI,"EQU")=LI,^GLOMENU($I,MENU,"AFF",LI,"COM")=$P(C,";;",2),LI=LI+1 G END
PIL I %Q>0,%Q?.N,$D(^GLOMENU($I,%PROG,%Q)) S A=^GLOMENU($I,%PROG,%Q) I A'="" S %PROGET=$P($P(A,";;",3),"/",1),B="" D:$P($P(A,";;",3),"/",2)'="" ^%INCUPA G:B="???" END S ^TOLISRAM($I,100)="~"_%PROGET_^TOLISRAM($I,100),%PROG=$P(%PROGET,"^",2) G END
 S %S=1
END Q
LIG() N A
 ;HL002 S $ZT="ER^%VACTLIS"
 ;S $ZT="D ER^%VACTLIS"
 S @("A="_LIG1)
 Q '(A)
ER() Q 0

