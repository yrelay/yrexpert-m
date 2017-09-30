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

;TO3FOFOS^INT^1^59547,74870^0
TO3FOFOS ;
 
TT2 W "$" I $D(@NOMTAB@(B2,B3,B4,B5))=10 G TT22
 I (@NOMTAB@(B2,B3,B4,B5)["$")!(@NOMTAB@(B2,B3,B4,B5)[":") S RS=@NOMTAB@(B2,B3,B4,B5) D ^%VKMULC,@ADR
 G END
TT22 S BI=-1 F WWU=0:0 S BI=$N(@NOMTAB@(B2,B3,B4,B5,BI)) Q:BI=-1  I (@NOMTAB@(B2,B3,B4,B5,BI)["$")!(@NOMTAB@(B2,B3,B4,B5,BI)[":") S %NOM=$P(NOMTAB,")",1)_",B2,B3,B4,B5)" D ^%VKMULNG,@ADR G END
 K BI,WWW G END
TT3 W "$" I $D(@NOMTAB@(B2,B3,B4))=10 G TT32
 I @NOMTAB@(B2,B3,B4)["$" S RS=@NOMTAB@(B2,B3,B4) D ^%VKMULC,@ADR
 G END
TT32 S BI=-1 F WWU=0:0 S BI=$N(@NOMTAB@(B2,B3,B4,BI)) Q:BI=-1  I @NOMTAB@(B2,B3,B4,BI)["$" S %NOM=$P(NOMTAB,")",1)_",B2,B3,B4)" D ^%VKMULNG,@ADR G END
 K BI,WWW G END
TT4 W "$" I $D(@NOMTAB@(B2))=10 G TT42
 I @NOMTAB@(B2)["$" S RS=@NOMTAB@(B2) D ^%VKMULC,@ADR
 G END
TT42 S BI=-1 F WWU=0:0 S BI=$N(@NOMTAB@(B2,BI)) Q:BI=-1  I @NOMTAB@(B2,BI)["$" S %NOM=$P(NOMTAB,")",1)_",B3)" D ^%VKMULNG,@ADR G END
 K BI,WWW G END
TT1 W "$" I $D(@NOMTAB@(B2,B3))=10 G TT12
 I (@NOMTAB@(B2,B3)["$")!(@NOMTAB@(B2,B3)[":") S RS=@NOMTAB@(B2,B3) D ^%VKMULC,@ADR
 G END
TT12 S BI=-1 F WWU=0:0 S BI=$N(@NOMTAB@(B2,B3,BI)) Q:BI=-1  I (@NOMTAB@(B2,B3,BI)["$")!(@NOMTAB@(B2,B3,BI)[":") S %NOM=$P(NOMTAB,")",1)_",B2,B3)" D ^%VKMULNG,@ADR G END
 K BI,WWW G END
TTT1 W "$" I $D(@NOMTAB@(B2,B3))=10 G TT12
 I (@NOMTAB@(B2,B3)["$")!($P(@NOMTAB@(B2,B3),"^",1)'="") S RS=@NOMTAB@(B2,B3) D ^%VKMULC,@ADR
 G END
TTT12 S BI=-1,%NOM=$P(NOMTAB,")",1)_",B2,B3)" D ^%VKMULNG I (%RS(1)'="")!(%RS(18)["$") D @ADR
 K BI,WWW G END
TTT3 W "$" I $D(@NOMTAB@(B2,B3,B4))=10 G TT32
 I (@NOMTAB@(B2,B3,B4)["$")!(@NOMTAB@(B2,B3,B4)[":") S RS=@NOMTAB@(B2,B3,B4) D ^%VKMULC,@ADR
 G END
TTT32 S BI=-1 F WWU=0:0 S BI=$N(@NOMTAB@(B2,B3,B4,BI)) Q:BI=-1  I (@NOMTAB@(B2,B3,B4,BI)["$")!(@NOMTAB@(B2,B3,B4,BI)[":") S %NOM=$P(NOMTAB,")",1)_",B2,B3,B4)" D ^%VKMULNG,@ADR G END
 K BI,WWW G END
TT5 W "$" I $D(@NOMTAB@(B2,B3,B4,B5,B6))=10 G TT51
 I (@NOMTAB@(B2,B3,B4,B5,B6)["$")!(@NOMTAB@(B2,B3,B4,B5,B6)[":") S RS=@NOMTAB@(B2,B3,B4,B5,B6) D ^%VKMULC,@ADR
 G END
TT51 S BI=-1 F WWU=0:0 S BI=$N(@NOMTAB@(B2,B3,B4,B5,B6,BI)) Q:BI=-1  I (@NOMTAB@(B2,B3,B4,B5,B6)["$")!(@NOMTAB@(B2,B3,B4,B5,B6)[":") S %NOM=$P(NOMTAB,")",1)_",B2,B3,B4,B5,B6)" D ^%VKMULNG,@ADR G END
 K BI,WWU G END
END Q

