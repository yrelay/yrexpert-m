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

;JALGETJA^INT^1^59547,74867^0
JALGETJA(IDAR,OP,INTER) 
 
 
 
 
 
 
 
 
 N U,V,NO,M1,M2
 S %ARC=IDAR,%ARTI=$$^%QSCALVA($$ART^JALRPJ,IDAR,$$AG^JALRPJ),FT=$$^%QSCALVA($$ART^JALRPJ,IDAR,$$FAMILLE^JALRPJ)
 S:FT="" FT="*"
 F U=1:1 Q:'($D(OP(U)))
 S NO=U-1
 F U=1:1:NO-1 F V=U+1:1:NO S M1=OP(U,0),M2=OP(V,0) I (M1'="")&(M2'="") D ^PLJVALJA(FT,M1,M2,.J) S:'($D(J)) J=$$^%QCAZG("^[QUI]PLJALDEF")+0 S INTER(U,V)=J+0
 
 Q 1
 
 
GET(IDAR,OP,INTER,MAXDEL) 
 N U,V,NO,M1,M2
 S %ARC=IDAR,%ARTI=$$^%QSCALVA($$ART^JALRPJ,IDAR,$$AG^JALRPJ),FT=$$^%QSCALVA($$ART^JALRPJ,IDAR,$$FAMILLE^JALRPJ)
 S:FT="" FT="*"
 F U=1:1 Q:'($D(OP(U)))
 S NO=U-1,MAXDEL=0
 F U=1:1:NO-1 S V=U+1,M1=OP(U,0),M2=OP(V,0) I (M1'="")&(M2'="") D ^PLJVALJA(FT,M1,M2,.J) S:'($D(J)) J=$$^%QCAZG("^[QUI]PLJALDEF")+0 S INTER(U,V)=J+0,MAXDEL=MAXDEL+J
 
 Q 1

