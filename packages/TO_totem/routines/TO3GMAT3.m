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

;TO3GMAT3^INT^1^59547,74870^0
TO3GMAT3 ;
 
TRAIT2 K RS,%RS,%IID,%CAR
 S (RBIS,GMT3("PRX"))="("""_YA_""","""_FMS_""","""_B3_""","""_B4_""")",SOURCE=$E(GMT3("PRX"),2,$L(GMT3("PRX"))-1),^V($I,YA,$$^%QZCHW("MATIERE"))="TOTO" D ^TOTSDEFA("SELMAT") K ^V($I,YA,$$^%QZCHW("MATIERE")),RBIS G:'(TSDEF) FIN K TSDEF
MATSTOCK S SFMAT=B3,GMT3("LSFMAT")=$L(SFMAT),GMT3("AN")=$C($A($E(SFMAT,GMT3("LSFMAT")))-1),MSS=$E(SFMAT,1,GMT3("LSFMAT")-1)_GMT3("AN")_"z"
 F KH=0:0 S MSS=$N(^[QUI]MATSTOCK(MSS)) Q:(MSS=-1)!($E(MSS,1,GMT3("LSFMAT"))'=SFMAT)  I $D(^[QUI]MATSTOCK(MSS,FMS)) S ^V($I,YA,$$^%QZCHW("MATIERE"))=MSS,%ABEND=0 D ^TO3GPMAT I %ABEND'=1 D TESCOND G:GMTS("STOPM")=1 FIN
 G FIN
TESCOND S NTABN="SOUS-FAMILLE MATIERE",NCLE=4,PNUM=1,F1=17,NFOR=1,SOURCE=$E(GMT3("PRX"),2,$L(GMT3("PRX"))-1)
RETERR Q:%ABEND=1  S $ZT=^TOZE($I,"C") G:'($D(@("^[QUI]EXPRLONG("_SOURCE_",""C"")"))) NOLO S %TBL="^[QUI]EXPRLONG("_SOURCE_",""C"")" D GET^TOCHEXPR G:%ERR YAERR S GMT3("CONDIT")=RES1 G ROLO
NOLO S GMT3("ATEST")="^[QUI]CSELMAT"_GMT3("PRX"),@("GMT3(""CONDIT"")="_@GMT3("ATEST"))
ROLO K %TBL Q:GMT3("CONDIT")=0
 S $ZT=^TOZE($I,"A") G:'($D(@("^[QUI]EXPRLONG("_SOURCE_",""A"")"))) SIF1 S %TBL="^[QUI]EXPRLONG("_SOURCE_",""A"")" D GET^TOCHEXPR G:%ERR YAERR S AFFECT="%RESUL",%RESUL="RESI" G SIF2
SIF1 S AFFECT="^[QUI]ASELMAT"_GMT3("PRX")
SIF2 S @("MATSEL(TWREF,MSS,GMT3(""PRX""))="_@AFFECT),MATSEL(TWREF,MSS,GMT3("PRX"))=MATSEL(TWREF,MSS,GMT3("PRX"))_"^"_FMS_"^"_SFMAT
AFFMAT S @%TBEV@("CARDMAT")=@%TBEV@("CARDMAT")+1 S:@%TBEV@("CARDMAT")'<GMTS("MMAX") STOP=1,GMTS("STOPM")=1 S DE=22,FI=DE D ^%ABNETTO S DX=0,DY=22 X XY W $$^%QZCHW("Matiere selectionne pour "),YA,$$^%QZCHW(" : "),MSS Q
FIN K GMT3,%ERR S DX=0,(DE,FI)=22 D ^%ABNETTO Q
YAERR S xxx=zzz Q

