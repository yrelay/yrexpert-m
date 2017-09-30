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

;TOLEXUSE^INT^1^59547,74872^0
TOLEXUSE ;
 
 
 N P,%P,N1,%N1,N2,%N2,P2,%P2,AD,UC,MEN,CONTR,MEN1,MEN2,MEN3,TEMP
 D CLEPAG^%VVIDEO
 S UC=$$TABID^%INCOIN("ORDINATEUR")
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 I UC="VAX" S MEN2="MEN3"
 I UC'="VAX" S MEN2=$$CONCAS^%QZCHAD(TEMP,"MEN2")
 S @MEN2="21^10^79"
 S @MEN2@(1)=$$^%QZCHW("Recherche")_"^REC"
 S @MEN2@(1,"COM")=$$^%QZCHW("Mots utilises dans le Savoir-Faire et comparaison avec le lexique")
 S @MEN2@(2)=$$^%QZCHW("Affichage")_"^AFFICH"
 S @MEN2@(2,"COM")=$$^%QZCHW("Affichage des resultats de la recherche")
 D CLEPAG^%VVIDEO
DIA D ^%VQUIKMN(0,80,22,MEN2,.AD,.CONTR) G:(CONTR="A")!(CONTR="F") END
 I AD'="" G @AD
 D ^%VSQUEAK
 G DIA
 
REC S P=""
 D ^%QCAGLK("^[QUI]TOLEXUSE"),^%QCAGLK("^[QUI]TOLEXNUS")
 D CLEPAG^%VVIDEO
BP S P=$O(^[QUI]SENSFICH(P))
 G:(P="")!(P="z") VERIF
 S ^[QUI]TOLEXUSE(P,"ORIGINE",P)=""
 W !,P
 D IMPLI
 S N2=""
BN2 S N2=$O(^[QUI]SENSFICH(P,0,"IMPLICI",N2))
 G:N2="" BP
 S P2=""
BP2 S P2=$O(^[QUI]SENSFICH(P,0,"IMPLICI",N2,"BES","IMPLICI",P2))
 G:P2="" BN2
 S LEX="%VALABAD"
BLEX S LEX=$O(^[QUI]SENSFICH(P,0,"IMPLICI",N2,"BES","IMPLICI",P2,LEX))
 G:LEX="" BP2
 S ^[QUI]TOLEXUSE(LEX,"ORGINE",P)=""
 W !,"   ",LEX
 G BLEX
 
IMPLI S LEX="%VALABAD"
BIMPLI S LEX=$O(^[QUI]SENSFICH(P,1,"IMPLICI",LEX))
 Q:LEX=""
 S ^[QUI]TOLEXUSE(LEX,"ORIGINE",P)=""
 W !,"   ",LEX
 G BIMPLI
 
 
 
VERIF S MOT=""
 W !,!,!,!,"   VERIFICATION DES MOTS UTILISES",!,!
BMOT1 S MOT=$O(^[QUI]TOLEX(MOT))
 I (MOT="")!(MOT="z") D CLEPAG^%VVIDEO G AFFICH
 I '($D(^[QUI]TOLEXUSE(MOT))) S ^[QUI]TOLEXNUS(MOT)="" W !,"   ",MOT
 G BMOT1
 
 
AFFICH I UC="VAX" S MEN="MEN1"
 I UC'="VAX" S MEN=$$CONCAS^%QZCHAD(TEMP,"MEN")
 S @MEN="21^10^79"
 S @MEN@(2)=$$^%QZCHW("Mots du SF")_"^SF"
 S @MEN@(2,"COM")=$$^%QZCHW("Mots utilises dans le Savoir-Faire")
 S @MEN@(1)=$$^%QZCHW("Mots non utilises dans le SF")_"^NSF"
 S @MEN@(1,"COM")=$$^%QZCHW("Mots du lexique non utilises dans le Savoir-Faire")
 D CLEPAG^%VVIDEO
DIAL D ^%VQUIKMN(0,80,22,MEN,.AD,.CONTR) G:(CONTR="A")!(CONTR="F") END
 I AD'="" G @AD
 D ^%VSQUEAK
 G DIAL
 
END K @(TEMP)
 Q
 
SF D AFF("MOTS UTILISES DANS LE SAVOIR-FAIRE","^[QUI]TOLEXUSE")
 G DIAL
 
NSF D AFF("MOTS DU LEXIQUE NON UTILISES DANS LE SAVOIR-FAIRE","^[QUI]TOLEXNUS")
 G DIAL
 
 
AFF(LIB,GLO) 
 I $O(@GLO@(""))="" D ^%VZEAVT($$^%QZCHW("Ensemble vide...")) Q
 D CLEPAG^%VVIDEO
 S DX=10,DY=1 X XY D BLD^%VVIDEO W $$^%QZCHW(LIB) D NORM^%VVIDEO
 D INIT^%QUCHOIP(GLO,1,"",10,2,40,20),AFF^%QUCHOIP S X=$$UN^%QUCHOIP D END^%QUCHOIP
 D CLEPAG^%VVIDEO
 Q

