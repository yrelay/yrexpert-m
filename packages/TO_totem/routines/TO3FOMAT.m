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

;TO3FOMAT^INT^1^59547,74870^0
TO3FOMAT ;
 
 K ^[QUI]FTOCTREV(ARTI) S YA=ARTI
 S NUARG=1,TABFICT="^[QUI]FLIMPLI",TABIMP="^[QUI]FLIMPLI",ADR="PREPA^TO3FOFOT"
RECABR S ETUD="IMPL",%RSMIN=18,NOMTAB="^[QUI]FLIMPLI(ARTI)",FONTAB="^[QUI]FIMPMA"_%DTC_"(ARTI",F1=18,NFOR=1,NCLE=3,PNUM=2
 S B2=-1 F UUV=0:0 S B2=$N(^[QUI]FLIMPLI(ARTI,B2)) Q:B2=-1  S B3=-1 F VVU=0:0 S B3=$N(^[QUI]FLIMPLI(ARTI,B2,B3)) Q:B3=-1  D TT1
FIN K %CAR,%NBCAR,%RS,%RSMIN,B2,B3,B4,B5,EXPARG,FOR,FTAB,NOMTAB,NUARG,POSF,PVIR,RF,RS,TABFICT,WRE,WT Q
END Q
TT1 W "$" I $D(@NOMTAB@(B2,B3))=10 G TT12
 I @NOMTAB@(B2,B3)["$" S RS=@NOMTAB@(B2,B3) D ^%VKMULC,@ADR
 G END
TT12 S BI=-1 F WWU=0:0 S BI=$N(@NOMTAB@(B2,B3,BI)) Q:BI=-1  I @NOMTAB@(B2,B3,BI)["$" S %NOM=$P(NOMTAB,")",1)_",B2,B3)" D ^%VKMULNG,@ADR G END
 K BI,WWW G END

