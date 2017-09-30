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

;%VAFIMAS^INT^1^59547,74034^0
GEAFIMAS(SS,PG,TB) 
 S %GLS=$S($D(@TB@("%GLS")):@TB@("%GLS"),1:"^VAL($I,SS)")
 S:'($D(%BP)) %BP=1
 O $I S PI=$S(^MASQUEC(SS):((PG-1)#^MASQUEC(SS))+1,1:PG) G MAS:'($D(^MASQUE(SS,"LIB",PI)))
 S LIB=""
LIB S LIB=$O(^MASQUE(SS,"LIB",PI,LIB)) G:LIB="" MAS S DY=""
LDY S DY=$O(^MASQUE(SS,"LIB",PI,LIB,DY)) G LIB:DY="",LIB:'($D(@%GLS@("LIB",LIB,DY,%BP)))
 S IT=^MASQUE(SS,"LIB",PI,LIB,DY),ITP=$P(IT,"^",1),ITX=$P(IT,"^",2),ITG=$P(IT,"^",3),ITD=$P(IT,"^",4)
 S VV=$P(@%GLS@("LIB",LIB,DY,%BP,$O(@%GLS@("LIB",LIB,DY,%BP,""))),"^",1) D ADR^%VAFCHMA(ITP,VV,PI,%BP,PG) G LDY
MAS S LIM=$S($D(^MASQUE(SS,"DESC",PI,"POSITION")):^MASQUE(SS,"DESC",PI,"POSITION"),1:"-1,-1,80,24") D ^%VEFFSCR($P(LIM,",",1),$P(LIM,",",2),$P(LIM,",",3),$P(LIM,",",4))
 S %V=$S(($D(^MASQUEC(SS,PI))#10)=1:^MASQUEC(SS,PI),1:0)
 F %U=1:1:%V W ^MASQUEC(SS,PI,%U)
 S PC=$S($D(@TB@(PG)):PG,1:PI),%V=@TB@(PC)
 F %U=1:1:%V W @TB@(PC,%U)
FIN Q
CONT(SS,PG,BP,TB) 
 S %GLS=$S($D(@TB@("%GLS")):@TB@("%GLS"),1:"^VAL($I,SCR)")
 O $I S %U="" F %V=1:1 S %U=$O(@%GLS@(PG,BP,"AFF",%U)) Q:%U=""  W @%GLS@(PG,BP,"AFF",%U)
 G FIN

