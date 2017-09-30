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

;%LXNEW^INT^1^59547,73871^0
%LXNEW ;
 
 
 
 
 
 N RESUL,LEX,NBMOTS,NBRES
 S LEX="",NBMOTS=0,NBRES=0
 D CLEPAG^%VVIDEO
BOUCL S LEX=$O(^[QUI]TOLEX(LEX))
 G:(LEX="")!(LEX="z") FIN
 S NBMOTS=NBMOTS+1
 S:$D(^[QUI]ZSYSMORE(LEX)) NBRES=NBRES+1
 F I=1:1:8 S RESUL(I)=""
 W !,LEX
 S RESUL(1)=LEX
 
 G:'($D(^[QUI]TOLEXC(LEX))) UNITE
 S COM=^[QUI]TOLEXC(LEX)
 F I=1:1:5 S RESUL(I+1)=$P(COM,"^",I)
 
UNITE G:'($D(^[QUI]TOLEXU(LEX))) STOCK
 S RESUL(7)=$O(^[QUI]TOLEXU(LEX,""))
 G:RESUL(7)="" STOCK
 S RESUL(8)=$P(^[QUI]TOLEXU(LEX,RESUL(7)),"^")
 S ^[QUI]TOUNIT(RESUL(7),LEX)=RESUL(8)
 
STOCK S ^[QUI]TOLEX(RESUL(1))=RESUL(2)_"^"_RESUL(3)_"^"_RESUL(4)_"^"_RESUL(5)_"^"_RESUL(6)_"^"_RESUL(7)_"^"_RESUL(8)_"^"
 G BOUCL
FIN S ^[QUI]TOLEX=NBMOTS
 S ^[QUI]ZSYSMORE=NBRES
 Q
 ;

