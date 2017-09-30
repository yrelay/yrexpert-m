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

;%HXISTUC^INT^1^59547,73869^0
HXISTUC ;
 
 
 
 
 
LIST 
 I RESUL(ICC)="?" D LISTATT2^%VYREP(BASI)
 Q
 
HIS 
 I RESUL(IC)="" S REFUSE=1 Q
 I RESUL(IC)="?" D ^%LXIQ("REAF^%QSUC") Q
 Q
 
ATT N LIEN,A,MOT
 I RESUL(ICC)="" S REFUSE=1 Q
 I RESUL(ICC)="?" D LISTATT2^%VYREP(BASI) Q
 S MOT=RESUL(ICC)
 
 S RESUL(ICC)=$$GETLBLAN^%VTLBLAN($P(MOT,"^",1))
 D EXIOP^%LXUC5 Q:REFUSE=1
 D CHBKPT^%LXUC5 Q:REFUSE=1
 D FULL^%LXUC4 Q:REFUSE=1
 
 S LIEN=$P(MOT,"^",2) G:LIEN="" SUITE
 I $$TYPE^%QSGEST9(BASI,LIEN)=0 D ^%VZEAVT($$^%QZCHW("L'attribut")_" "_LIEN_" "_$$^%QZCHW("n'est pas un attribut lien du repertoire ")_$$NOMLOG^%QSF(BASI)) G REFUS
 
SUITE 
 S REFUSE='($$AR^%QSGEST5(BASI,RESUL(ICC)))
 I REFUSE D ^%VZEAVT($$^%QZCHW("Attribut inexistant dans le repertoire ")_$$NOMLOG^%QSF(BASI)) G REFUS
 S RESUL(ICC)=$S(LIEN="":RESUL(ICC),1:RESUL(ICC)_"^"_LIEN)
 S TAB(ICC)=RESUL(ICC) D ^%VAFFICH
 S REFUSE=0 Q
REFUS 
 S TAB(ICC)=$J(" ",$L(MOT)) D ^%VAFFICH S REFUSE=1 Q
 
INT(N) 
 D INT^%QSUC
 S:$D(INTERV) @("INTERV"_N)=INTERV
 Q

