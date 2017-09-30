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

;TOGBLOC^INT^1^59547,74872^0
TOGBLOC ;
 
 G:'($D(^BLOC($I))) FIN S ^CPTBLOC($I,"BLOC")=1,%LIEU=$$^%QZCHW("Sous-etudes") D ^TO3WLIEU
 K ^SAVAR($I),^BLOCVU($I) F IT="QUI","WHOIS","YA","YB",$$^%QZCHW("BATCH"),"TEMPO" S ^SAVAR($I,IT)=@IT
 D ^%QCAMEMS
LOOP K  D CURRENT^%IS S IT=-1 F Z=1:1 S IT=$N(^SAVAR($I,IT)) Q:IT=-1  S @IT=^SAVAR($I,IT)
 S NBL=$O(^BLOC($I,"")) G:NBL="" FBLOC G:$D(^BLOCVU($I,NBL)) FBLOC D TRAIT G LOOP
FBLOC D ^TOGETBLO
END S ^CPTBLOC($I,"BLOC")=0 D ^%QCAMEMR Q
TRAIT S ^BLOCVU($I,NBL)=1,BL1=^BLOC($I,NBL,1),BL2=^BLOC($I,NBL,2),USER=$P(BL1,"^",4),OQUI=QUI,QUI=$S(USER="":QUI,1:USER),YASSET=$P(BL2,":",1),REFID=$P(BL2,":",2),TYPB=$P(BL1,"^",3),QTE=$P(BL1,"^",8)
 K DON S %CAR="/",RS=REFID D ^%QZCHNBC S %NBCAR=%NBCAR+1 F IT=1:1:%NBCAR S DON(IT)=$P(RS,"/",IT)
 K RS,%NBCAR,IT
 S:QUI'=OQUI QUI=$S($D(^TABIDENT(QUI,$$^%QZCHW("MACHINE"))):^TABIDENT(QUI,$$^%QZCHW("MACHINE")),1:OQUI) D ^TORECBLO
 I %GAM=1 S ^BLOC($I,NBL,3)=INUFA_"^"_NUREF_"^"_QUI_"^"_TYPB G FINI
 D ^TOTPOP S ^BLOC($I,NBL,3)=NUFA_"^0^"_QUI_"^"_TYPB,(XART,YA)=ARTET,YB=YASSET,TWREF=0,^V($I,YA,$$^%QZCHW("QUANTITE"))=QTE,^[QUI]TREEWORK(NUFA,0)=YA_"^"_YB_"^"_QTE,^[QUI]TVPAR(NUFA,TWREF,$$^%QZCHW("QUANTITE"))=QTE D KILL,^TO3WNUFA,XXX^TOTEMIII
 Q
FINI S QUI=OQUI
KILL K QTE,TYPB,%GAM,%1EXIS,USER,REFID,YASSET,NBL,BL1,BL2,%NBCAR,IT,Z,ARTET,YASSET,RS,^ORDEVAL($I)
FIN Q

