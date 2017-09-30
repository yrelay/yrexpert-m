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

;TOTBACKA^INT^1^59547,74875^0
TOTBACKA ;;12:17 PM  13 Apr 1989
 
 
 
BACK K ^L($J) S ^L($J,1)=%ART,^L($J,1,%ART)=%DOM,^L($J,1,%ART,%DOM)=%IMPL,(^L($J,$$^%QZCHW("HAUT")),^L($J,$$^%QZCHW("BAS")))=1 K ^[QUI]BACKIMPL S ^[QUI]BACKIMPL("BUT","BUT","BUT",0,%ART,%DOM,%IMPL)=""
 F %P=1:1 S P=^L($J,$$^%QZCHW("BAS")) Q:^L($J,$$^%QZCHW("HAUT"))<P  S A=^L($J,P),D=^L($J,P,A),I=^L($J,P,A,D),^L($J,$$^%QZCHW("BAS"))=P+1 D T1
FIN K A,A2,%A2,D,D2,%D2,DEFA,DEFI,F,%F,I,^L($J),P Q
 
T1 S F=-1 F %F=1:1 S F=$N(^[QUI]SENSFICH(A,1,D,I,F)) Q:F=-1  S D2=-1 F %D2=1:1 S D2=$N(^[QUI]SENSFICH(A,0,D,F,"BES",D2)) Q:D2=-1  S A2=-1 F %A2=1:1 S A2=$N(^[QUI]SENSFICH(A,0,D,F,"BES",D2,A2)) Q:A2=-1  D T2
 Q
T2 S I2=-1 F %I2=1:1 S I2=$N(^[QUI]SENSFICH(A,0,D,F,"BES",D2,A2,I2)) Q:I2=-1  D T3
 Q
T3 I '($D(^L($J,"TRAI",A2,D2,I2))) S P=^L($J,$$^%QZCHW("HAUT"))+1,^L($J,P)=A2,^L($J,P,A2)=D2,^L($J,P,A2,D2)=I2,^L($J,$$^%QZCHW("HAUT"))=P,^L($J,"TRAI",A2,D2,I2)=""
 S ^[QUI]BACKIMPL(A,D,I,F,A2,D2,I2)="" Q
 
TEST W !,$$^%QZCHW("Article : ") R %ART Q:%ART=""
 W !,$$^%QZCHW("Domaine : ") R %DOM Q:%DOM=""
 W !,$$^%QZCHW("Parametre :") R %IMPL Q:%IMPL=""
 D BACK Q

