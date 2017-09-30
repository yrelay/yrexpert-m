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

;%QSGESTJ^INT^1^59547,73882^0
%QSGESTJ ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
AFFER N MES,MES1,LL
 S MES1=$$^%QZCHW("impossible a stocker : cles trop longues")
 S LL=500-$L(MES1)
 I $L(%U7)>LL S MES=$E(%U7,1,LL) G AFFER2
 S MES=%U7_" ",LL=(LL-$L(%U7))-1
 I $L(%CUK)>LL S MES=MES_$E(%CUK,1,LL)_" " G AFFER2
 S MES=MES_%CUK_" ",LL=(LL-$L(%CUK))-1
 I $L(%UP)>LL S MES=MES_$E(%UP,1,LL)_" " G AFFER2
 S MES=MES_%UP_" ",LL=(LL-$L(%UP))-1
 I $L(%UV)>LL S MES=MES_$E(%UV,1,LL)_" " G AFFER2
 S MES=MES_%UV_" ",LL=(LL-$L(%UV))-1
 I $L(%UN)>LL S MES=MES_$E(%UN,1,LL)_" " G AFFER2
 S MES=MES_%UN_" "
AFFER2 D ^%VZEAVT(MES_MES1)
 Q
 
AFFER1(VAL) 
 N MES1,LL
 S MES1=$$^%QZCHW("impossible a stocker : cle trop longue")
 S LL=(500-$L(MES1))-1
 D ^%VZEAVT($E(VAL,1,LL)_" "_MES1)
 Q
 
ATTSPE(BASE,IND,ATT,OR) 
 
 N TYPA,TYPE
 S TYPE=$$TYPE2^%QSGEST9(BASE,ATT)
 
 I TYPE'=6 Q
 
 S TYPA=$$TYPMAJ^%QSGESPE(BASE,ATT)
 
 I TYPA="TEXTE" D SUPP^%QSNOTE3(BASE,IND,OR)
 I TYPA="HISTO" D SUPP^%QSNHIS1(BASE,IND,OR)
 Q
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
PASPEED(%U7,%CUK,%UP,%UV,%UN) 
 I $D(^TOZE($I,"CARSPE")),^TOZE($I,"CARSPE") S %U7=$$NET^%QZCHNET(%U7) Q:%U7=""  S %CUK=$$NET^%QZCHNET(%CUK) Q:%CUK=""  S %UP=$$NET^%QZCHNET(%UP) Q:%UP=""  S %UV=$$NET^%QZCHNET(%UV) Q:%UV=""  I %UN'=1 S %UN=$$NET^%QZCHNET(%UN) Q:%UN=""
 I WHOIS("ETUDE")'=0 D PA^%QXPGES2(WHOIS("ETUDE"),%U7,%CUK,%UP,%UV,%UN) Q
 I '($$KEYQRY^%SYSUTI1($L(%U7),$L(%CUK),$L(%UP),$L(%UV),$L(%UN))) D AFFER Q
 S:'($D(^[QUI]QUERYV(%U7))) ^[QUI]QUERYV(%U7)=0 S:'($D(^[QUI]QUERYV(%U7,%CUK))) ^[QUI]QUERYV(%U7)=^[QUI]QUERYV(%U7)+1
 S ^[QUI]QUERYV(%U7,%CUK,%UP,%UN)=%UV,^[QUI]QUERY2(%U7,%UP,%UV,%UN,%CUK)="",^[QUI]QUERY3(%U7,%CUK,%UN,%UP,%UV)="",^[QUI]QUERY4(%U7,%UV,%UP,%UN,%CUK)=""
 Q
 ;

