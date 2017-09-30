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

;%MZMAJ4^INT^1^59547,73872^0
MOZMAJ4 ;
 
 
 
 
 
 
LIEN(NLI) 
 I '($D(^MOZLIEN($J,NLI))) Q
 D MSG^%VZEATT(SAVIDC_" : mise a jour des liens ...")
 N TEMP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 N ATTLIEN,ATTLIEN2
 S ATTLIEN=$$CONCAS^%QZCHAD(TEMP,"ATTLIEN") K @(ATTLIEN)
 S ATTLIEN2=$$CONCAS^%QZCHAD(TEMP,"ATTLIEN2") K @(ATTLIEN2)
 S LIEN="" F %U=0:0 S LIEN=$O(^[QUI]RQSQUAL($$OI^%MZQS,LIEN)) Q:LIEN=""  D AFFECT
 
 S LIEN=""
LIEN1 S LIEN=$O(^MOZLIEN($J,NLI,LIEN)) G DELLIEN:LIEN=""
 S ORDRE="",REP=$$REPD^%QSGEL2($$OI^%MZQS,LIEN)
LIEN2 S ORDRE=$O(^MOZLIEN($J,NLI,LIEN,ORDRE)) G LIEN1:ORDRE=""
 I $D(NEIL(LIEN,ORDRE)) G LIEN3
 D PA^%QSGESTI(REP,ORDRE,"NOM",ORDRE,1),ADDS^%QSGEST3($$OI^%MZQS,GAM_","_SAVIDC,LIEN,REP,ORDRE)
LIEN3 K NEIL(LIEN,ORDRE) D ATTRI
 G LIEN2
 
 
DELLIEN 
 S LIEN="" F %U=0:0 S LIEN=$O(NEIL(LIEN)) G FIN:LIEN="" S ORDRE="" F %U=0:0 S ORDRE=$O(NEIL(LIEN,ORDRE)) Q:ORDRE=""  D SUPS^%QSGEST3($$OI^%MZQS,GAM_","_IDC,LIEN,REP,ORDRE) K NEIL(LIEN,ORDRE)
 
ATTRI 
 
 Q:'($D(^MOZLIEN2($J,NLI)))
 N INDLIEN,INDICE,ATT,VAL S INDLIEN=$$NOML^%QSGES20(GAM_","_IDC,ORDRE,LIEN,ORDRE)
 S ATT=""
ATTRI1 S ATT=$O(^MOZLIEN2($J,NLI,INDLIEN,ATT)) G DELATT:ATT="" S INDICE=""
ATTRI2 S INDICE=$O(^MOZLIEN2($J,NLI,INDLIEN,ATT,INDICE)) G ATTRI1:INDICE="" S VAL=^MOZLIEN2($J,NLI,INDLIEN,ATT,INDICE)
 I $D(@ATTLIEN2@($$LIENI^%QSGEL3,INDLIEN,ATT)) G ATTRI3
 D PA^%QSGESTI($$LIENI^%QSGEL3,INDLIEN,ATT,VAL,INDICE)
ATTRI3 K ^MOZLIEN2($J,NLI,INDLIEN,ATT,INDICE),@ATTLIEN2@($$LIENI^%QSGEL3,INDLIEN,ATT)
 G ATTRI2
 Q
 
FIN 
 K ^MOZLIEN($J,NLI),^MOZLIEN2($J,NLI)
 Q
 
 
AFFECT2 
 N INTER
 D PATOUCH^%QSGES19(.ATTLIEN)
 
 D COP^%QSCALVA($$LIENI^%QSGEL3,INDLIEN,.ATTLIEN2)
 
 S INTER="" F %U=0:0 S INTER=$O(@ATTLIEN@(INTER)) Q:INTER=""  K @ATTLIEN2@($$LIENI^%QSGEL3,INDLIEN,INTER)
 Q
 
 
AFFECT 
 I '($$AIR^%QSGE5($$OI^%MZQS,GAM_","_IDC,LIEN)) Q
 
 N TYPE,TABLIEN
 S TABLIEN=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TABLIEN") K @(TABLIEN)
 D MVG^%QSCALVA($$OI^%MZQS,GAM_","_IDC,LIEN,TABLIEN,.TYPE)
 I TYPE<3 G FAFF
 S ORDRE="" F %U=0:0 S ORDRE=$O(@TABLIEN@(ORDRE)) Q:ORDRE=""  S NEIL(LIEN,@TABLIEN@(ORDRE))=""
FAFF K @(TABLIEN) Q
 
 
DELATT 
 N AS,AS2,AS3 S AS=""
DELATT1 S AS=$O(@ATTLIEN2@($$LIENI^%QSGEL3,INDLIEN,AS)) Q:AS=""  S AS2=""
DELATT2 S AS2=$O(@ATTLIEN2@($$LIENI^%QSGEL3,INDLIEN,AS,AS2)) G DELATT1:AS2="" S AS3=""
DELATT3 S AS3=$O(@ATTLIEN@($$LIENI^%QSGEL3,INDLIEN,AS,AS2,AS3)) G DELATT2:AS3="" D PS^%QSGESTI($$LIENI^%QSGEL3,INDLIEN,AS,AS2,AS3)
 G DELATT3

