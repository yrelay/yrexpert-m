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

;%QSCALV2^INT^1^59547,73880^0
QSCALV2(LIEND,BA,OBJ,ATT,IND) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N GL,G1,T1,TT,I,OD,ARRET,OR,REPD,VAL,G2,J,OR2,L,CARD,REPD,PERES,LAST,FISTON,BASED,REPX,ATTX,VALX
 I ATT="" Q ""
 S GL=0,FISTON=0,VAL="",ARRET=0
 S:'($D(IND)) IND=""
 G:LIEND'="" SUIT0
 I (BA="")!(OBJ="") Q ""
 S REPX=BA
 I IND'="" S VALX=$$^%QSCALIN(BA,OBJ,ATT,IND) G FINX
 I $$OAIR^%QSGE5(BA,OBJ,ATT,1) S VALX=$$^%QSCALIN(BA,OBJ,ATT,1) G FINX
 S VALX=$$^%QSCALVA(BA,OBJ,ATT) G FINX
SUIT0 G:$E(LIEND)'="%" SUIT
 S OBJ=$$^%QCAZG("CXT(LIEND,""OBJET"")"),(BA,REPX)=$$^%QCAZG("CXT(LIEND,""BASE"")")
 I ((BA="")!(OBJ=""))!(ATT="") Q ""
 I IND'="" S VALX=$$^%QSCALIN(BA,OBJ,ATT,IND) G FINX
 I $$OAIR^%QSGE5(BA,OBJ,ATT,1) S VALX=$$^%QSCALIN(BA,OBJ,ATT,1) G FINX
 S VALX=$$^%QSCALVA(BA,OBJ,ATT) G FINX
SUIT I (BA="")!(OBJ="") Q ""
 S REPD=$$^%QCAZG("^[QUI]RQSLIEN(BA,LIEND)")
 Q:REPD="" ""
 S (REPD,REPX)=$P(REPD,"^",2)
 S TT=$$TYPE^%QSGEST9(BA,LIEND)
 G:TT'=1 SUIT1
 S OBJ=$$NOMPERES^%QSGES10(OBJ,$$RANG^%QSGES17(REPD))
 I IND'="" S VALX=$$^%QSCALIN(REPD,OBJ,ATT,IND) G FINX
 I $$OAIR^%QSGE5(REPD,OBJ,ATT,1) S VALX=$$^%QSCALIN(REPD,OBJ,ATT,1) G FINX
 S VALX=$$^%QSCALVA(REPD,OBJ,ATT) G FINX
SUIT1 S:TT=2 FISTON=1
 S G1=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 K @(G1)
 D MVG^%QSCALVA(BA,OBJ,LIEND,G1,.T1)
 I (@G1=0)!(T1=0) S GL=0 Q ""
 S OR=$O(@G1@(""))
 F I=0:0 Q:OR=""  D T Q:ARRET  S OR=$O(@G1@(OR))
 S VALX=VAL G FINX
T S OD=@G1@(OR)
 I FISTON S OD=$$NOMFILS^%QSGES10(BA,OBJ,REPD,OD)
 I IND'="" S VAL=$$^%QSCALIN(REPD,OD,ATT,IND) G T1
 I $$OAIR^%QSGE5(REPD,OD,ATT,1) S VAL=$$^%QSCALIN(REPD,OD,ATT,1) G T1
 S VAL=$$^%QSCALVA(REPD,OD,ATT)
T1 S:VAL'="" ARRET=1
 Q
 
FINX Q $$AFFI^%QMDAUC(REPX,ATT,VALX)
 ;
 ;

