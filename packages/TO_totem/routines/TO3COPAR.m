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

;TO3COPAR^INT^1^59547,74870^0
TO3COPAR ;
 
LOOP S:PCH2="" PCH2=0 S CD2="" I PCH2["'" S BES($$^%QZCHW("IMPLICI"),PCH2)=1,PCH3=PCH,PCH=PCH2 D ^TO3COPAL G FIN
 S PCH3=PCH,PCH=PCH2,RZZ=PCH D TO^%QZNBN1 S PCH=RZZ G:ISNUM=1 ISNUM G:$E(PCH,1)="""" ISNUM
 G:$D(^[QUI]FULL(WB1,PCH)) CD2 I (ETUD="NOME")&(WB2'["~") G TIL
 S XDP="("_PCH_")" D ^%ABRECPO,^TO3FORAB,^%ABRECON S CD2=EXT G CONDIT
TIL S CD2=""""_PCH_"""",PCHCOMP=PCH D ^%AB3KEMP S %BIL=PCH,%PYT=$$^%QZCHW("C") D ^%ABLIBTY G FIN
CD2 S BES($$^%QZCHW("IMPLICI"),PCH)=1,CONCUR=1,PCHCOMP=PCH D ^%AB3KEMP S CD2="^V($I,YA,"""_PCHCOMP_""")",%BIL=PCHCOMP,%PYT=$$^%QZCHW("P") D ^%ABLIBTY
CONDIT S %RL=0,XLAX=0 D:$D(^[QUI]RANG(WB1,PCHCOMP)) ^%AB3IMPI G FIN
ISNUM S CD2=PCH
FIN S PCH2=PCH,PCH=PCH3 Q
END Q
LITER I $E(PCH,$L(PCH))'="""" S PCH=PCH_""""
 S PCH=""""_PCH_"""" G ISNUM

