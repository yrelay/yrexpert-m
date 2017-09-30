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

;TO3GCOMP^INT^1^59547,74870^0
TO3GCOMP ;
 
FILS K TCP
 
 Q:$D(^[QUI]TOTG("TO3PHAS1",YA,"COMPOSANT"))
 S $ZT=^TOZE($I,"C"),%LIEU=$$^%QZCHW("Composants") D ^TO3WLIEU
 S NCOMP=-1,JJ=2,NTABN=$$^%QZCHW("COMPOSANTS"),NCLE=3,PNUM=2,F1=18,NFOR=1
 F ZX=0:0 S NCOMP=$N(^[QUI]NOMSRL(YA,NCOMP)) Q:%ABEND=1  Q:NCOMP=-1  S COMP=$P($P(^[QUI]NOMSRL(YA,NCOMP),",",2),"""",2),RFNOM=^[QUI]NOMSRL(YA,NCOMP) D ^TO3CEXIS D:'(EXIS) FILS2
FIN K TCP,COMP,COND,EXIS,JJ,NCOMP,QTF,RAIS,RFNOM,ZX Q
FILS2 
RETERR Q:%ABEND=1  S TCP("IND")="",SOURCE=RFNOM,TCP("REF")=$P(RFNOM,",",2,999),TCP("COMP")=$P(TCP("REF"),"""",2),TCP("FICH")=^[QUI]REPFICH(YA,"NOMENC",TCP("REF"))
 G:'($D(@("^[QUI]EXPRLONG("_SOURCE_",""C"")"))) NOLO S %TBL="^[QUI]EXPRLONG("_SOURCE_",""C"")" D GET^TOCHEXPR G:%ERR YAERR S CONDIT=RES1 G ROLO
NOLO S COND=@("^[QUI]CNOMENC("_RFNOM_")"),@("CONDIT="_COND)
ROLO S ^PHASADM($I,NUFA,TWREF,"ANCOMP",TCP("COMP"),TCP("FICH"))=1
 I CONDIT=1 D ^TO3SIM2 Q:%ABEND=1  Q:QTF=0  S (RAIS,^[QUI]RAISON(NUFA,TWREF,COMP,TWRF))="^[QUI]NOMENC("_RFNOM_")",^MINIRAIS(NUFA,TWRF)=RFNOM,$ZT=^TOZE($I,"C")
 Q
YAERR S zzz=xxx Q

