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

;%QSCALVU^INT^1^59547,73880^0
QSCALVU(LIEND,BA,OBJ,ATT,IND) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N GL,G1,T1,TT,I,OD,ARRET,OR,REPD,VAL,G2,J,OR2,L,CARD,REPD,PERES,LAST,FISTON,BASED
 I ATT="" Q ""
 S GL=0,FISTON=0,VAL="",ARRET=0
 S:'($D(IND)) IND=""
 G:LIEND'="" SUIT0
 I (BA="")!(OBJ="") Q ""
 Q:IND'="" $$^%QSCALIN(BA,OBJ,ATT,IND)
 Q:$$OAIR^%QSGE5(BA,OBJ,ATT,1) $$^%QSCALIN(BA,OBJ,ATT,1)
 Q $$^%QSCALVA(BA,OBJ,ATT)
SUIT0 G:$E(LIEND)'="%" SUIT
 S OBJ=$$^%QCAZG("CXT(LIEND,""OBJET"")"),BA=$$^%QCAZG("CXT(LIEND,""BASE"")")
 I ((BA="")!(OBJ=""))!(ATT="") Q ""
 Q:IND'="" $$^%QSCALIN(BA,OBJ,ATT,IND)
 Q:$$OAIR^%QSGE5(BA,OBJ,ATT,1) $$^%QSCALIN(BA,OBJ,ATT,1)
 Q $$^%QSCALVA(BA,OBJ,ATT)
SUIT I (BA="")!(OBJ="") Q ""
 S REPD=$$^%QCAZG("^[QUI]RQSLIEN(BA,LIEND)")
 Q:REPD="" ""
 S REPD=$P(REPD,"^",2)
 S TT=$$TYPE^%QSGEST9(BA,LIEND)
 G:TT'=1 SUIT1
 S OBJ=$$NOMPERES^%QSGES10(OBJ,$$RANG^%QSGES17(REPD))
 Q:IND'="" $$^%QSCALIN(REPD,OBJ,ATT,IND)
 Q:$$OAIR^%QSGE5(REPD,OBJ,ATT,1) $$^%QSCALIN(REPD,OBJ,ATT,1)
 Q $$^%QSCALVA(REPD,OBJ,ATT)
SUIT1 S:TT=2 FISTON=1
 S G1=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 K @(G1)
 D MVG^%QSCALVA(BA,OBJ,LIEND,G1,.T1)
 I (@G1=0)!(T1=0) S GL=0 Q ""
 S OR=$O(@G1@(""))
 F I=0:0 Q:OR=""  D T Q:ARRET  S OR=$O(@G1@(OR))
 Q VAL
T S OD=@G1@(OR)
 I FISTON S OD=$$NOMFILS^%QSGES10(BA,OBJ,REPD,OD)
 I IND'="" S VAL=$$^%QSCALIN(REPD,OD,ATT,IND) G T1
 I $$OAIR^%QSGE5(REPD,OD,ATT,1) S VAL=$$^%QSCALIN(REPD,OD,ATT,1) G T1
 S VAL=$$^%QSCALVA(REPD,OD,ATT)
T1 S:VAL'="" ARRET=1
 Q
 
NOMPROX(LIEND,BA,OBJ,ATT,IND) 
 
 
 
 
 
 
 
 
 
 
 
 N G1,T1,PP,TT,I,OD,ARRET,OR,REPD,VAL,G2,J,OR2,L,CARD,REPD,PERES,LAST,FISTON
 S GL=0,FISTON=0,VAL="",ARRET=0
 Q:LIEND="" OBJ
 Q:$E(LIEND)="%" $$^%QCAZG("CXT(LIEND,""OBJET"")")
 S REPD=$$^%QCAZG("^[QUI]RQSLIEN(BA,LIEND)")
 Q:REPD="" ""
 S REPD=$P(REPD,"^",2)
 S:'($D(IND)) IND=""
 S TT=$$TYPE^%QSGEST9(BA,LIEND)
 I TT=1 S PP=$$NOMPERES^%QSGES10(OBJ,$$RANG^%QSGES17(REPD)) Q:$$^%QSCALIN(REPD,PP,ATT,IND)'="" PP Q ""
 S:TT=2 FISTON=1
 S G1=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LIEN")
 K @(G1)
 D MVG^%QSCALVA(BA,OBJ,LIEND,G1,.T1)
 I (@G1=0)!(T1=0) S GL=0 Q ""
 S OR=$O(@G1@(""))
 F I=0:0 Q:OR=""  D T2 Q:ARRET  S OR=$O(@G1@(OR))
 K @(G1)
 Q VAL
T2 S OD=@G1@(OR)
 I FISTON S OD=$$NOMFILS^%QSGES10(BA,OBJ,REPD,OD)
 S VAL=$$^%QSCALIN(REPD,OD,ATT,IND)
 I VAL'="" S ARRET=1,VAL=OD
 Q
 
OBJPROX(LIEND,BA,OBJ) 
 
 
 
 
 
 
 
 
 
 
 N TT,OD,REPD
 Q:LIEND="" OBJ
 Q:$E(LIEND)="%" $$^%QCAZG("CXT(LIEND,""OBJET"")")
 S REPD=$$^%QCAZG("^[QUI]RQSLIEN(BA,LIEND)")
 Q:REPD="" ""
 S REPD=$P(REPD,"^",2),TT=$$TYPE^%QSGEST9(BA,LIEND)
 Q:TT=1 $$NOMPERES^%QSGES10(OBJ,$$RANG^%QSGES17(REPD))
 S OD=$$^%QSCALVA(BA,OBJ,LIEND)
 S:TT=2 OD=$$NOMFILS^%QSGES10(BA,OBJ,REPD,OD)
 Q OD
 
OBPROX2(LIEND,BA,OBJ,REP) 
 
 
 
 
 
 
 
 
 
 
 
 
 N OD,TT
 I LIEND="" S REP=BA Q OBJ
 I $E(LIEND)="%" S REP=$$^%QCAZG("CXT(LIEND,""BASE"")") Q $$^%QCAZG("CXT(LIEND,""OBJET"")")
 S REP=$$^%QCAZG("^[QUI]RQSLIEN(BA,LIEND)")
 Q:REP="" ""
 S REP=$P(REP,"^",2),TT=$$TYPE^%QSGEST9(BA,LIEND)
 Q:TT=1 $$NOMPERES^%QSGES10(OBJ,$$RANG^%QSGES17(REP))
 S OD=$$^%QSCALVA(BA,OBJ,LIEND)
 S:TT=2 OD=$$NOMFILS^%QSGES10(BA,OBJ,REP,OD)
 Q OD

