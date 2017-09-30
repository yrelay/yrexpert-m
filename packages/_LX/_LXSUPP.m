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

;%LXSUPP^INT^1^59547,73871^0
%LXSUPP ;
 
 
 
 
 
 
LEX() 
 
 I RESUL(1)="" Q 0
 I $D(^[QUI]ZSYSMORE(RESUL(1))) D ^%VZEAVT("Suppression interdite "_RESUL(1)_" est un mot reserve.") Q 0
 N PP
 K @(m("OLDN")),@(m("OLDF"))
 D ^%LXMAJB(OR(1))
 
 D SUPPTS(RESUL(1))
 
 S PP=$O(^[QUI]TOLEXU(RESUL(1),""))
 G:PP="" FIN
 K ^[QUI]TOLEXU(RESUL(1))
 K ^[QUI]TOUNIT(PP,RESUL(1))
 G FIN
 
SUPP(MOT) 
SUPP2 
 I MOT="" Q 0
 Q:$D(^[QUI]ZSYSMORE(MOT)) 2
SUPP3 N PP,SYN
 K ^[QUI]TOLEX(MOT)
 D ^%LXMAJB(MOT)
 
SUPP4 
 D SUPPTS(MOT)
 
SUPPU S PP=$O(^[QUI]TOLEXU(MOT,""))
 G:PP="" FIN
 K ^[QUI]TOLEXU(MOT)
 K ^[QUI]TOUNIT(PP,MOT)
 Q 1
 
SUPPMR(MOT) 
 Q:MOT="" 0
 G SUPP3
 
LEXS() 
 I (RESUL(1)="")!(RESUL(2)="") Q 0
 K @(m("OLDN")),@(m("OLDF"))
 K ^[QUI]TOSYNONY(RESUL(2),RESUL(1)) D ^%LXMAJB(RESUL(2))
 
FIN Q 1
 
SUPPS(MOT,SYNO) 
SUPPS2 
 Q:(MOT="")!(SYNO="")
 K ^[QUI]TOLEXS(MOT,SYNO)
 K ^[QUI]TOSYNONY(SYNO,MOT)
 D ^%LXMAJB(SYNO)
 Q
 
SUPPTS(MOT) 
SUPPTS2 
 Q:MOT=""
 N SYNO
 S SYNO=""
BSUPTS S SYNO=$O(^[QUI]TOLEXS(MOT,SYNO))
 Q:SYNO=""
 K ^[QUI]TOLEXS(MOT,SYNO),^[QUI]TOSYNONY(SYNO,MOT)
 D ^%LXMAJB(SYNO)
 G BSUPTS
 
LEXU() 
 I (RESUL(1)="")!(RESUL(2)="") Q 0
 K @(m("OLDN")),@(m("OLDF"))
 K ^[QUI]TOUNIT(RESUL(2),RESUL(1)) G FIN
 
MOD() 
 I $D(^[QUI]ZSYSMORE(OR(1))) D ^%VZEAVT("Modification interdite "_OR(1)_" est un mot reserve.") Q 0
 Q 1

