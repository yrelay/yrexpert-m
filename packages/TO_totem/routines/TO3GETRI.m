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

;TO3GETRI^INT^1^59547,74870^0
TO3GETRI ;
 
 
 D ^TO4TRIFI Q
 
 D GETNIV S NARTI=1,NUI=-1 F IU=0:0 S NUI=$N(^NIVPAR($I,ARTI,NUI)) Q:NUI=-1  S NIVE=^NIVPAR($I,ARTI,NUI),^ORDNIV($I,ARTI,-(NIVE),NUI)=1
TRAIT S NUM=1,NIV="" F IU=0:0 S NIV=$O(^ORDNIV($I,ARTI,NIV)) G:NIV="" FIN S PARTR=-1 F IT=0:0 S PARTR=$N(^ORDNIV($I,ARTI,NIV,PARTR)) Q:PARTR=-1  D ALORS
ALORS S NUIMP=-1,TABIMP="^[QUI]IMPLICI(ARTI,PARTR)"
 F IY=0:0 S NUIMP=$N(@TABIMP@(NUIMP)) Q:NUIMP=-1  I ('($D(^[QUI]NONTRI(ARTI,PARTR,NUIMP))))&('($D(^[QUI]IMPLICI(ARTI,PARTR,"DEDUIT")))) S ^[QUI]TRI(ARTI,NARTI)="("""_ARTI_""","""_PARTR_""","""_NUIMP_""")",NARTI=NARTI+1
FIN Q
GETNIV K ^NIVPAR($I,ARTI) S NIV=2,ADR="TRAIT2^TO3GETRI",NOMTREE="^[QUI]TREEIMP(ARTI" D ^%QCAGTU1 G FIN
TRAIT2 S DATAC=@NOM D ^TO3GREF
 S NIVPAR=%PR-1,^NIVPAR($I,ARTI,DATAC)=$S('($D(^NIVPAR($I,ARTI,DATAC))):NIVPAR,1:$S(^NIVPAR($I,ARTI,DATAC)<NIVPAR:NIVPAR,1:^NIVPAR($I,ARTI,DATAC))) G FIN

