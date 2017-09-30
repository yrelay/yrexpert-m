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

;TOVAPFOR^INT^1^59547,74876^0
TOVAPFOR ;
 
 K TVP S:'($D(LLB)) LLB=0 K ^EVERROR($I) I EXP="" D SUITE G DNE
 I (EXP'[":")!('($D(^[QUI]EXPLICI($P(EXP,":",1))))) D SUITE G DNE
 S TVP("EXPP")=$P(EXP,":",2),RS=EXPP,%CAR="," D ^%QZCHNBC S DX=5,DY=18 X XY W:LLB=0 $$^%QZCHW("Sous-etude de """),$P(EXP,":",1),"""" S TVP("DDYY")=$Y F TVP("%UU")=1:1:%NBCAR+1 S EXP=$P(TVP("EXPP"),",",TVP("%UU")) I EXP'="" D SUITE S TVP("DDYY")=$Y
DNE K XDP,T,LOCA,MA,MI,VFOR,TVP,ITEM Q
SUITE S DX=5,DY=$S($D(TVP("DDYY")):TVP("DDYY")+1,1:18),PCH=EXP X XY D TO^%QZNBN1 G DNE:ISNUM
 S %EXDOL=$S(EXP["$":1,1:0),XDP="("_EXP_")" D ^%ABRECPO,^TOPARFOR
 S TVP("WI")=-1,TVP("WJ")=1
 F TVP("WJJ")=1:1 S TVP("WI")=$N(VFOR(TVP("WI"))) Q:TVP("WI")=-1  S ITEM=VFOR(TVP("WI")) G:(ITEM="?")&(TGRIL["NOM") PINT I ITEM'="?" D ^TO3DEFVA I '(ISNUM) D:$D(^PILARG($I)) TARG^TO3DEFVA D TRAIT
 K XDP,T,LOCA,MA,MI,VFOR Q
PINT W:LLB=0 !,?10,$$^%QZCHW(" ? ==> Quantite fournie par l'operateur ") Q
TRAIT S TVP("NITEM")=-1 F TVP("UU")=1:1 S TVP("NITEM")=$N(^TABITEM($I,TVP("NITEM"))) Q:TVP("NITEM")=-1  D TRAITS
 Q
TRAITS S TVP("RIT")=^TABITEM($I,TVP("NITEM")),TVP("ITEMF")=$P(TVP("RIT"),"~",1),TVP("VAPA")=$P(TVP("RIT"),"~",2)
 W:LLB=0 ?(((TVP("WJ")-1)#2)*40)+5,TVP("ITEMF")," = "
 I TVP("VAPA")["??" S ^EVERROR($I,TVP("ITEMF"))=1 D BLD^%VVIDEO,REV^%VVIDEO,BLK^%VVIDEO
 W:LLB=0 TVP("VAPA") D NORM^%VVIDEO I (TVP("WJ")#2)=0 W:LLB=0 !
 S TVP("WJ")=TVP("WJ")+1 Q

