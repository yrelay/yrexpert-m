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
;! HL002 ! HL     ! 19/02/07 ! Manque le label YAERR                          !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;TOCTREVR^INT^1^59547,74871^0
TOCTREVR ;
 K CTR S CTR("NTRI")="",$ZT="",CTR("TB1")="^PHASADM($I,NUFA,TWREF,""TOCTREV"",0)",CTR("TB2")="^PHASADM($I,NUFA,TWREF,""TOCTREV"",1,%POR)"
 F CTR("TB")=CTR("TB1"),CTR("TB2") S CTR("MOD")=$S(CTR("TB")=CTR("TB1"):0,1:1),CTR("FIC")=-1 D LFIC1
LFIC1 S CTR("FIC")=$N(@CTR("TB")@(CTR("FIC"))) Q:CTR("FIC")=-1  S CTR("CTR")=@CTR("TB")@(CTR("FIC")) D LOPAR G LFIC1
FIN K CTR,EXPFONC Q
LOPAR S $ZT="",CTR("NTRI")=$P(CTR("CTR"),"^",2),CTR("PER")=$P(CTR("CTR"),"^",1),SOURCE=""""_YA_""","_CTR("NTRI"),CTR("TB3")="^[QUI]CTOCTREV(YA,"_CTR("NTRI")_")"
RETERR G:'($D(@("^[QUI]EXPRLONG("_SOURCE_",""C"")"))) NOLO S %TBL="^[QUI]EXPRLONG("_SOURCE_",""C"")" D GET^TOCHEXPR G:%ERR=1 YAERR S CTR("CONDIT")=RES1 G ROLO
NOLO S CTR("CATEST")=@CTR("TB3"),@("CTR(""CONDIT"")="_CTR("CATEST"))
ROLO G:CTR("CONDIT")=0 FINL S CTR("NF")="",CTR("TB3")="^[QUI]ATOCTREV(YA,"_CTR("NTRI")_")"
LNF S CTR("NF")=$O(@CTR("TB3")@(CTR("NF"))) G:CTR("NF")="" FINL S CTR("AFFECT")=@CTR("TB3")@(CTR("NF")) I CTR("AFFECT")="" G LNF
SIFON G:CTR("AFFECT")'["$$" FINL S CTR("ROUTI")="^TO"_$E($P(CTR("AFFECT"),"/",1),4,299),EXPFONC=CTR("AFFECT") D @CTR("ROUTI") G LNF
FINL K @CTR("TB")@(CTR("FIC")) Q:CTR("PER")[$$^%QZCHW("EPH")  S @CTR("TB1")@(CTR("FIC"))=CTR("CTR")
ERR Q
YAERR ;HL002
 W "ERREUR!!!" R *HL
