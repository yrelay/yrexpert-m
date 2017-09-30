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

;TOP0ALLC^INT^1^59547,74873^0
TOP0ALLC ;
 
 K ^POSENR($I),^POSFUL($I),^TONCUM($I) S %NU=8,PAGE=1,ARC=-1,(TOCUM,TOTCUM)=0
 F NC=1:1 S ARC=$N(^[QUI]PSRLFILI(ARC)) Q:(ARC="z")!(ARC=-1)  D TRAIT
FIN S ^TONCUM($I,PAGE)=TOCUM,TOTCUM=TOTCUM+TOCUM,^TONCUM($I,"TOTAL")=TOTCUM
 K TOCUM,TONCUM,FICH,%NU,ARC,NC,NUMCLI Q
TRAIT S NUMCLI=$N(^[QUI]PSRLFILI(ARC,-1)) Q:NUMCLI=-1  Q:'($D(^[QUI]PSRLFILI(ARC,NUMCLI)))  S FICH=^[QUI]PSRLFILI(ARC,NUMCLI),^POSENR($I,PAGE,%NU)=ARC_"^"_$P(FICH,"^",2)_"^"_$P(FICH,"^",5)_"^"_$P(FICH,"^",7)_"^"_$P(FICH,"^",8),TOCUM=TOCUM+$P(FICH,"^",8)
 I %NU=8 S ^POSFUL($I,PAGE)=NUMCLI
 S %NU=%NU+1 S:%NU=22 TOTCUM=TOCUM+TOTCUM,^TONCUM($I,PAGE)=TOCUM,TOCUM=0,%NU=8,PAGE=PAGE+1 Q

