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

;%QZCHGUI^INT^1^59547,73887^0
ZEXTRGUI(X,Y) 
 K @(Y),GC S GC=0,%U=0,NBG=0
LG S %U=%U+1,CC=$E(X,%U) G:CC="" FG G:CC'="""" NG
 I GC=0 S GC(%U)=1,GC=1
 S NBG=NBG+1 G LG
NG G LG:GC=0 I (NBG#2)=0 S %V=$ZP(GC("")),GC(%V)=%U-1,GC=0,NBG=0
 G LG
FG I GC=1 S %V=$ZP(GC("")),GC(%V)=%U-1,GC=0,NBG=0
 K TR S CH="" F %U=1:1 S CH=$O(GC(CH)) Q:CH=""  S %V=GC(CH),@Y@("LIB",%U)=$E(X,CH,%V),@Y@("POS",%U)=CH_"^"_%V,TR(CH)="",TR(%V)=$E(X,CH,%V)
 S GC="",%V=0,CC="X",CH="",%U=1,TR(999)=""
LS S CH=$O(TR(CH)) G:CH="" FS
 I TR(CH)="" S GC=GC_$E(X,%V,CH-1) G LS
 S GC=GC_"""%"_%U_"""",@Y@("SUB","%"_%U)=TR(CH),%U=%U+1,%V=CH+1 G LS
FS S @Y@("SUB")=GC
 Q
TEST W !,"A tester : " R EX Q:$A(EX)<32  D ^%QZCHGUI(EX,"TB") S %U="" F %V=1:1 S %U=$O(TB("LIB",%U)) Q:%U=""  W !,?10,"==> ",TB("LIB",%U)
 W !,?10,TB("SUB"),! G TEST

