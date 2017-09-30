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

;TO3EXBLP^INT^1^59547,74870^0
TO3EXBLP ;
 
 K DON S %GAM=0,TACP="^[QUI]BLOCPHAS("""_YA_""","""_PH_""","""_OG_""","""_OP_""")"
 S IDREC=YASSET,NUEX=-1
 F WWE=0:0 S NUEX=$N(@TACP@(NUEX)) Q:NUEX=-1  D AFF G:%ABEND=1 END
 G AFFS
AFF S $ZT=^TOZE($I,"A")
RETERR Q:%ABEND=1  S AFFECT=@TACP@(NUEX),@("DON(NUEX)="_AFFECT),IDREC=IDREC_"/"_DON(NUEX)
 Q
AFFS S REFID=IDREC,ARTCT=YASSET
 I $D(^[QUI]EXPLICI(YASSET)) S ARTET=YASSET G SS
 I $D(^[QUI]ACOMMEB(YASSET)) S ARTET=$N(^[QUI]ACOMMEB(YASSET,-1)) G SS
 S ARTET="???"
SS D EXIS^TO3RETUD I '(%1EXIS) G COMPAR
 S INUFA=-1 F ZZ=0:0 S INUFA=$N(@VEXI@(INUFA)) G:INUFA=-1 COMPAR S NUREF=-1 F DD=0:0 S NUREF=$N(@VEXI@(INUFA,NUREF)) Q:NUREF=-1  S %GAM=1 G END
FINDIT 
COMPAR D ^TO3SAVTR,^TO32REQU,^TO3RESTR
END K TACP,WWE,NUEX Q

