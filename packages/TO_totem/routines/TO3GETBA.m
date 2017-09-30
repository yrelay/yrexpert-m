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

;TO3GETBA^INT^1^59547,74870^0
TO3GETBA ;
 
DEB S OUT=0 K DON S DX=0,DY=22 X XY W $$^%QZCHW("Article [Art ou Art:p1/p2/...] "),!," - " S ZART=$P(^ETBATCH($I,%NUBATCH),"?",1),QTTE=$P(^ETBATCH($I,%NUBATCH),"?",2) W ZART S:ZART="" OUT=1 Q:OUT
 I $D(^[QUI]FULL($P(ZART,":",1))) S (YA,XART,YB)=$P(ZART,":",1) G DEB2
 S YYBB=$P(ZART,":",1) I '($D(^[QUI]ACOMMEB(YYBB))) S OUT=1 Q
 S (XART,YA)=$P(^[QUI]ACOMMEB(YYBB),"^",1),(PERE,YB)=YYBB
DEB2 K ^CSTEST($I) S ^CSTEST($I,$$^%QZCHW("ARTICLE"))=YB,^CSTEST($I,"TEST")=$P(^ETBATCH($I,%NUBATCH),"?",3) D INT^%QMDAK0 S ^CSTEST($I,"DEBUT")=HEURE,TAD=$P(%DAT,"/",3)_"/"_$P(%DAT,"/",2)_"/"_$P(%DAT,"/",1),^CSTEST($I,"DATE")=TAD
 S DX=60,DY=22 X XY W $$^%QZCHW("   Qte : "),QTTE
FIN Q

