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

;TO3GIVBP^INT^1^59547,74870^0
TO3GIVBP ;
 
 S GOG=^TBSBP($I,"OG"),GNUFA=^TBSBP($I,"NUFA"),GTWREF=^TBSBP($I,"TWREF"),NUREF=0,INUFA=NUFA
PHAS S NPH=-1 F UU=0:0 S NPH=$N(^[QUI]PHAS(INUFA,NUREF,NPH)) Q:NPH=-1  S ANPH=NPH D NET,SUIT
 G COUT
SUIT S OP=^[QUI]PHAS(INUFA,NUREF,NPH),^[QUI]PHAS(GNUFA,GTWREF,GOG_"."_ANPH)=$P(OP,"/",1)_"/"_GOG_"."_ANPH,^[QUI]RAISON(GNUFA,GTWREF,GOG_"."_ANPH)=INUFA_"|"_^[QUI]RAISON(INUFA,NUREF,NPH)
 I $D(^[QUI]RAISON(INUFA,NUREF,OP)) S ^[QUI]RAISON(GNUFA,GTWREF,$P(OP,"/",1)_"/"_GOG_"."_ANPH)=INUFA_"|"_^[QUI]RAISON(INUFA,NUREF,OP)
 G FIN
COUT S NPH=-1 F UU=0:0 S NPH=$N(^[QUI]COUT(INUFA,NUREF,NPH)) Q:NPH=-1  S ANPH=$P(NPH,"/",2) D NET S ^[QUI]COUT(GNUFA,GTWREF,$P(NPH,"/",1)_"/"_GOG_"."_ANPH)=^[QUI]COUT(INUFA,NUREF,NPH)
DUREE S NPH=-1 F UU=0:0 S NPH=$N(^[QUI]DUREE(INUFA,NUREF,NPH)) Q:NPH=-1  S ANPH=$P(NPH,"/",2) D NET S ^[QUI]DUREE(GNUFA,GTWREF,$P(NPH,"/",1)_"/"_GOG_"."_ANPH)=^[QUI]DUREE(INUFA,NUREF,NPH)
SECT S NPH=-1 F UU=0:0 S NPH=$N(^[QUI]SECT(INUFA,NUREF,NPH)) Q:NPH=-1  S ANPH=$P(NPH,"/",2) D NET S ^[QUI]SECT(GNUFA,GTWREF,$P(NPH,"/",1)_"/"_GOG_"."_ANPH)=^[QUI]SECT(INUFA,NUREF,NPH)
CONS S NPH=-1
 F UU=0:0 S NPH=$N(^[QUI]CONS(INUFA,NUREF,NPH)) Q:NPH=-1  S ANPH=$P(NPH,"/",2) D NET,CONS1
 G FIN
CONS1 S ^[QUI]CONS(GNUFA,GTWREF,$P(NPH,"/",1)_"/"_GOG_"."_ANPH)=^[QUI]CONS(INUFA,NUREF,NPH)
 I $D(^[QUI]RAISON(INUFA,NUREF,NPH)) S ^[QUI]RAISON(GNUFA,GTWREF,$P(NPH,"/",1)_"/"_GOG_"."_ANPH)=INUFA_"|"_^[QUI]RAISON(INUFA,NUREF,NPH)
FIN Q
NET I $E(ANPH,$L(ANPH))'=0 G FIN
 S ANPH=ANPH\10 G NET

