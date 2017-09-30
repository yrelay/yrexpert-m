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

;%ABPTGOC^INT^1^59547,73864^0
%ABPTGOC ;
 
 S %9COU="^COURBE($I)",%9NBNO=%9NUM D ACQDON
FIN K %9NBNO,%9TLG,%9AXE,TYPU,%9GLT,%9OTLG,%9AXE,DEB Q
ARRET S DX=0,DY=6 D CLEBAS^%VVIDEO,POCLEPA^%VVIDEO,^%VSQUEAK W "Representation graphique impossible dans l'immediat..." H 2 G FIN
ACQDON Q:'($D(^[QUI]OCGRIL(%9NOMAB,"GRAPHE",%9TPAG,"P",4,%9TCOL)))
 S ^RGRDATA($I,%9NAMCOU,%9NBNO)=%9NAME_"^"_%9DATE
 S (TYPUX,@%9COU@(%9NAMCOU,%9NAME,%9DATE,"X","TYPE UNITE"))=^[QUI]OCGRIL(%9NOMAB,"GRAPHE",%9TPAG,"P",6,%9TCOL)
 S @%9COU@(%9NAMCOU,%9NAME,%9DATE,"X","UNITE")=^[QUI]OCGRIL(%9NOMAB,"GRAPHE",%9TPAG,"P",7,%9TCOL)
 S (TYPUY,@%9COU@(%9NAMCOU,%9NAME,%9DATE,"Y","TYPE UNITE"))=^[QUI]OCGRIL(%9NOMAB,"GRAPHE",%9TPAG,"P",8,%9TCOL) D TESTU G:FINCOU=1 ARRET
 S @%9COU@(%9NAMCOU,%9NAME,%9DATE,"Y","UNITE")=^[QUI]OCGRIL(%9NOMAB,"GRAPHE",%9TPAG,"P",9,%9TCOL)
 S %9TLG=-1,%9OTLG=-1 F %9GLT=1:1 S %9TLG=$N(^[QUI]OCGRIL(%9NOMAB,"GRAPHE",%9TPAG,"R",%9TLG)) Q:%9TLG=-1  S %9OTLG=%9TLG S:%9GLT=1 DEB=%9TLG-1 D TRAITPT
 S %9NBPTS=%9OTLG-DEB,@%9COU@(%9NAMCOU,%9NAME,%9DATE,"NBR.PTS")=%9OTLG-DEB S:%9NBPTS>%9MAXPT %9MAXPT=%9NBPTS
 S %9AXE="X",%9NOM=%9NAME D ^PTRPPV S %9AXE="Y" D ^PTRPPV,^PTRPOURC
 Q
TRAITPT Q:'($D(^[QUI]OCGRIL(%9NOMAB,"GRAPHE",%9TPAG,"R",%9TLG,%9TCOL)))
 S @%9COU@(%9NAMCOU,%9NAME,%9DATE,"X",%9TLG-DEB)=$P(^[QUI]OCGRIL(%9NOMAB,"GRAPHE",%9TPAG,"R",%9TLG,%9TCOL),"/",1)
 S @%9COU@(%9NAMCOU,%9NAME,%9DATE,"Y",%9TLG-DEB)=$P(^[QUI]OCGRIL(%9NOMAB,"GRAPHE",%9TPAG,"R",%9TLG,%9TCOL),"/",2)
 Q
TESTU I (TYPUX="ALPHANUM")&(TYPUY="ALPHANUM") S FINCOU=1 Q
 I (TYPUX="TEMPS")!(TYPUY="TEMPS") S FINCOU=1 Q
 I (TYPCOU="PL")&((TYPUX="ALPHANUM")!(TYPUY="ALPHANUM")) S FINCOU=1 Q
 I %9TUX'="ALPHANUM",(TYPUX'="ALPHANUM")&(TYPUX'=%9TUX) S FINCOU=1 Q
 I %9TUY'="ALPHANUM",(TYPUY'="ALPHANUM")&(TYPUY'=%9TUY) S FINCOU=1 Q
 S %9TUX=$S(TYPUX="ALPHANUM":TYPUX,1:%9TUX),%9TUY=$S(TYPUY="ALPHANUM":TYPUY,1:%9TUY) Q

