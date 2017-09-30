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

;TO43COME^INT^1^59547,74871^0
TO43COME ;
 
 D ^%VKRSAV S OSCR=SCR I NOMTAB="^[QUI]REFANTET" S SCR="COMETUDE",RESUL(1)=NUFA,RESUL(2)=DAT,RESUL(3)=HEU,RESUL(5)="",IS="",IK=4 F %U=1:1 Q:$P(COM," ",%U)=""  S IS=IS_$P(COM," ",%U)_" " I $L(IS)>120 S RESUL(IK)=IS,RESUL(IK+1)=$P(COM," ",%U,500) G SUI
 I NOMTAB="^[QUI]CTACHCPT" S SCR="COMECOUT",RESUL(1)=DAT,RESUL(2)=HEU,IK=3
 S RESUL(IK)=COM
SUI S DX=0,DY=15 D CLEBAS^%VVIDEO,LOOP^%VAFIGRI,^%VAFISCR,^%VKMODIS G:ABENDSCR=1 FIN
 I NOMTAB="^[QUI]REFANTET" S DAT=RESUL(2),HEU=RESUL(3),COM=RESUL(4)_" "_RESUL(5)
 I NOMTAB="^[QUI]CTACHCPT" S DAT=RESUL(1),HEU=RESUL(2),COM=RESUL(3)
FIN S SCR=OSCR D ^%VKRRES I ABENDSCR'=1 D ^TO43STOC
 D ^%VAFIGRI,^%VAFISCR K IS,OSCR,IK,%U Q

