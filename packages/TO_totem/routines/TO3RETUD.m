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
;! Nomprog     : TO3RETUD                                                     !
;! Module      : TO3 (TOTEM Version 3)                                        !
;! But         : Réétude d'un étude                                                             !
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

;TO3RETUD^INT^1^59547,74870^0
TO3RETUD ;
 
CONS K ^EXPREF($I) S NU=2,NE=-1 F ZZ=1:1 S NE=$N(^[QUI]EXPLICI(ARTET,NE)) Q:NE=-1  S PAR=$N(^[QUI]EXPLICI(ARTET,NE,-1)),^EXPREF($I,PAR)=$S($P(REFID,"/",NU)="":$$^%QZCHW("TOUS"),1:$P(REFID,"/",NU)),NU=NU+1
 S RRR=""""_ARTCT_"""",PAR=-1 F ZZ=1:1 S PAR=$N(^EXPREF($I,PAR)) Q:PAR=-1  S RRR=RRR_","_""""_^EXPREF($I,PAR)_""""
 K NU,NE,ZZ,PAR G END
COMP S RRR=RRR_","_""""_NUFA_""","""_POSTREE_""""
 G END
AFF D CONS,COMP,ZD^%QMDATE4,INT^%QMDAK0 G:$L(RRR)>250 FIN S @("^[QUI]REFANTET("_RRR_")")=%DAT_"^"_HEURE G FIN
DEL D CONS,COMP G:$L(RRR)>250 FIN K @("^[QUI]REFANTET("_RRR_")") G FIN
EXIS S %1EXIS=0 D CONS S VEXI="^[QUI]REFANTET("_RRR_")"
 I $D(@VEXI) S %1EXIS=1
 G END
FIN K TYREF,^EXPREF($I),NU,NE,ZZ,ARTET,ARTCT,PAR,RRR,POSTREE,REFID
END Q

