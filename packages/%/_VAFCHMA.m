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

;%VAFCHMA^INT^1^59547,74033^0
GEAFCHMA(VV) 
 D DEF(ICC,VV) W @%GLS@(%PG,%BP,"AFF",ICC) G FIN
DEF(IJ,VJ) 
DEFJ S %DX=^MASQUE(SCR,"DESCC",%PI,IJ,2),%DY=^MASQUE(SCR,"DESCC",%PI,IJ,3)
 S LIB=^MASQUE(SCR,"DESCC",%PI,IJ,1) G DEFS:LIB="",DEFS:'($D(@%GLS@("LIB",LIB))) S PAG=""
LPG S PAG=$O(@%GLS@("LIB",LIB,%DY,%BP,PAG)) G DEFS:PAG=""
 S IT=@%GLS@("LIB",LIB,%DY,%BP,PAG),ITI=$P(IT,"^",2),ITG=$P(IT,"^",3),ITD=$P(IT,"^",4),DX=$P(IT,"^",5),ITV=$P(IT,"^",1)
 S @%GLS@("POS",PAG,%BP,%DY,DX)=VJ
 S @%GLS@(PAG,%BP,"VAL",ITI)=VJ,@%GLS@(PAG,%BP,"AFF",ITI)=@%GLS@(PAG,%BP,"MOD",ITI)_$$^%VCADFLD(VJ,DX,%DY,ITG,ITD)_$$NORM^%VVIDEO1,@%GLS@("LIB",LIB,%DY,%BP,PAG)=VJ_"^"_ITI_"^"_ITG_"^"_ITD_"^"_DX G LPG
DEFS D ECR(IJ) S MODA=$S($D(^MASQUE(SCR,"DESCC",%PI,IJ,"MODAFF")):^MASQUE(SCR,"DESCC",%PI,IJ,"MODAFF"),1:""),MOD=$$XY^%VVIDEO1(%DX,%DY) X:MODA'="" "ZL %VMODMAS D @MODA"
 S @%GLS@("POS",%PG,%BP,%DY,%DX)=VJ
 S @%GLS@(%PG,%BP,"VAL",IJ)=VJ,@%GLS@(%PG,%BP,"AFF",IJ)=MOD_$$^%VCADFLD(VJ,%DX,%DY,LXG,LXD)_$$NORM^%VVIDEO1,@%GLS@(%PG,%BP,"MOD",IJ)=MOD
 S:LIB'="" @%GLS@("LIB",LIB,%DY,%BP,%PG)=VJ_"^"_IJ_"^"_LXG_"^"_LXD_"^"_%DX Q
ECR(IK) I $D(^MASQUE(SCR,"DESCC",%PI,IK,"ESPACE")) S LXG=^MASQUE(SCR,"DESCC",%PI,IK,"ESPACE"),LXD=$P(LXG,",",2),LXG=$P(LXG,",",1)
 G FIN
 S:'($D(%LIXG)) %LIXG=0 S:'($D(%LIXD)) %LIXD=79 S LXG=%LIXG,LXD=%LIXD
FIN Q
ADR(IJ,VJ,%PI,%BP,%PG) 
 N LIB,DY G DEFJ

