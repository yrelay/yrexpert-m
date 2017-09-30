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

;TO3AUTPH^INT^1^59547,74869^0
TO3AUTPH ;
 
 S $ZT="",BLOCPH=0 G:'($D(^[QUI]BLOCPHAS(YA,PH,OG,OP))) END S SSET=$P(^[QUI]PHASE(YA,PH,OG,OP),"^",25),YASSET=$P(SSET,":",1) I YASSET["]" S USER=$P($P(YASSET,"]",1),"[",2),YASSET=$P(YASSET,"]",2)
 I ('($D(^[QUI]EXPLICI(YASSET))))&(('($D(^[QUI]IMPLICI(YASSET))))&(('($D(^[QUI]ESSABAC(YASSET))))&('($D(^[QUI]PHASE(YASSET)))))) G END
 S BLOCPH=1 D EXBPH G:%ABEND=1 FIN S NBL=^CPTBLOC($I),^CPTBLOC($I)=NBL+1,^BLOC($I,-(NBL),1)=NUFA_"^"_TWREF_"^PH^"_USER_"^"_PH_"^"_OP_"^"_OG_"^"_^[QUI]TVPAR(NUFA,TWREF,$$^%QZCHW("QUANTITE")),^BLOC($I,-(NBL),2)=GYA
FIN S %TABTV="^[QUI]TVPAR(NUFA,TWREF)",%TABRA="^[QUI]RAISON(NUFA,TWREF)" K NBL,GYA,USER Q
EXBPH K DON S TACP="^[QUI]BLOCPHAS("""_YA_""","""_PH_""","""_OG_""","""_OP_""")",GYA=YASSET_":" S:'($D(USER)) USER=""
 S NUEX=0 F WWE=0:0 S NUEX=$N(@TACP@(NUEX)) Q:NUEX=-1  D AFF G:%ABEND=1 END
END K TACP,WWE,NUEX,DON Q
AFF S $ZT=^TOZE($I,"A")
RETERR Q:%ABEND=1  S AFFECT=@TACP@(NUEX),@("DON(NUEX)="_AFFECT),GYA=GYA_DON(NUEX)_"/" Q

