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

;%QULARBE^INT^1^59547,73885^0
%QULARBE ;;03:31 PM  10 Dec 1992; ; 10 Dec 92  6:55 PM
 
 
 
 
INIT(RACINE,LIEN) 
 N XNEXT,XEVPDS,TEMP,TRS,TPD,TPDV,NUMSTR,TOT,XXN,ATTTRI,TXPLO,MXPLO
 N LARGEUR,LONGUEUR,ATSTRI,PSTRI,PRFMAX,REP,TYPLIEN,REPD,TLIEN
 N STRUCT,TEMPO
 
 D LIENR^%QSGEL2(LIEN,.REP,.REPD)
 S TLIEN=$$TYPEL^%QSGES90(LIEN)
 S TPD=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"IK"),LARGEUR=0,LONGUEUR=0
 S NUMSTR=$$GEN^%QCAPOP("STR")
 S STRUCT=$$CONCAS^%QZCHAD(TPD,NUMSTR) K @(STRUCT)
 S TEMPO=$$TEMP^%SGUTIL
 S TRSDK=$$CONCAS^%QZCHAD(TEMPO,"T")
 S MXPLO="NORMAL"
 S TXPLO=2
 S PRFMAX=9999
 S PSTRI=1,XEVPDS=""
 S XEVPDS="S POIDS="_XEVPDS_"1"
 S XNEXT="S NEX=$$NXTRIAV^%QSTRUC8("""_REP_""",INDIV,"""_LIEN_""",NEX)"
 D INIT^%QULARBU(RACINE,XNEXT,XEVPDS,TRSDK,TXPLO,MXPLO,NUMSTR,PRFMAX)
 S X=0 F %X=1:1 S X=$$NEXT^%QULARBU(NUMSTR,X,.PDS) Q:X=0  I $L(X,",")>1 S @STRUCT@(%X)=REPD_"^"_$S(TLIEN'=2:@TRSDK@($P(X,",",$L(X,","))),1:RACINE_","_@TRSDK@($P(X,",",$L(X,","))))
 D NETTOIE^%QULARBU(NUMSTR)
 K @(TEMPO)
 Q NUMSTR
 
 
NEXT(NUMSTR,POS) 
 N TPD,TEMP,STRUCT
 S TPD=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"IK")
 S STRUCT=$$CONCAS^%QZCHAD(TPD,NUMSTR)
 S NEXT=$O(@STRUCT@(POS))
 Q NEXT
 
GETREP(NUMSTR,POS) 
 N TPD,STRUCT
 S TPD=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"IK")
 S STRUCT=$$CONCAS^%QZCHAD(TPD,NUMSTR)
 Q $P(@STRUCT@(POS),"^")
 
GETIND(NUMSTR,POS) 
 N TPD,STRUCT
 S TPD=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"IK")
 S STRUCT=$$CONCAS^%QZCHAD(TPD,NUMSTR)
 Q $P(@STRUCT@(POS),"^",2)
 
 
FIN(NUMSTR) 
 N TPD,TEMP
 S TPD=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"IK")
 S TEMP=$$CONCAS^%QZCHAD(TPD,NUMSTR)
 K @(TEMP)
 Q
 ;
 ;

