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

;LKSEL^INT^1^59547,74867^0
LKSEL ;
 
 
 
 
 
 
SEL(NOM) Q $$SELECT(NOM)
 
 
 
 
 
 
 
 
 
 
SELECT(NOM,SEL,TI,M) N CHOIX,RWH S:($D(TI)#10)=0 TI="" S:($D(M)#10)=0 M=""
 D CLEPAG^%VVIDEO D:TI'="" ^%VZCD0(TI),INIT^%QUCHOIP(NOM,1,1,1,5,75,18)
 D:TI="" INIT^%QUCHOIP(NOM,1,1,1,0,75,22)
 D AFF^%QUCHOIP
 I M="" F RWH=1:0 D S Q:(CHOIX="")!(CHOIX=-1)
 I M'="" F RWH=1:1:1 D S Q:(CHOIX="")!(CHOIX=-1)
 D END^%QUCHOIP
 D CLEPAG^%VVIDEO
 Q
S S CHOIX=$$UN^%QUCHOIP
 I (CHOIX'="")&(CHOIX'=-1) S @SEL@(CHOIX)=@NOM@(CHOIX)
 Q
AFF(NOM) Q $$AFFICH(NOM)
 
 
 
 
 
 
 
 
AFFICH(NOM) N CHOIX
 D CLEPAG^%VVIDEO
 D INIT^%QUCHOIP(NOM,1,1,1,0,75,19)
 D AFF^%QUCHOIP
 D POCLEPA^%VVIDEO W "[RETURN]" R:^TOZE($I,"ATTENTE") CHOIX
 D END^%QUCHOIP
 D CLEPAG^%VVIDEO
 Q 1
 ;
 ;

