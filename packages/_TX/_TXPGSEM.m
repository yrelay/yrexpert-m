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

;%TXPGSEM^INT^1^59547,74032^0
%TXPGSEM ;;06:34 PM  4 Jan 1993; ; 24 Jun 92  6:17 PM
 s deb=54787 ;; debut absolu 1er jan 89
 d totale(deb) q
totale(deb) ;;
 
 k ^[QUI]semaine,^[QUI]periode i '($d(VISU)) s VISU=6
 f %iiii=0:7:365*5 d gooday(deb) s deb=deb+7 w:VISU=6 !,!,deb," ",(%iiii\7)+1," ",da1," ",sem d store
 d CLEPAG^%VVIDEO
 i VISU=6 k VISU
 q
store s ^[QUI]semaine((%iiii\7)+1)=sem,^[QUI]periode(sem)=(%iiii\7)+1
 q
partiel ;;
 q
 
gooday(deb) ;;
 n da ;;,da1
 s da=$$PERM^%QMDATE($$DATEX^%QMDATE(deb))
 s da(1)=$p(da,"/",2),da(1)=$s($l(da(1))=1:"0"_da(1),1:da(1)),da(2)=$p(da,"/",1),da(2)=$s($l(da(2))=1:"0"_da(2),1:da(2)),da1=da(1)_"/"_da(2)_"/"_$p(da,"/",3),sem=$$15^%QMDATE1(da1)
 q
 ;
 ;

