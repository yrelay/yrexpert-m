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

;%SGNETQL^INT^1^59547,73890^0
%SGNETQL ;;07:07 PM  18 Oct 1993; ; 19 Nov 93  2:58 PM
 
 
 
 
 S REPS=$$TEMP^%SGUTIL
 S REPD=$$TEMP^%SGUTIL
 S QUAL=$$TEMP^%SGUTIL
 S INDL="",I=0,TOT=0,TOTERR=0
NEXT S INDL=$$NXTRI^%QSTRUC8("LIEN.I",INDL) Q:INDL=""
 W:'(I) ! W ?I*28,INDL S I=I+1 S:I=3 I=0
 S TOT=TOT+1
 S LIEN=$$^%QSCALIN("LIEN.I",INDL,"NOM.LIEN",1)
 I LIEN="" S erreur="lien inconnu" G SUP
 G:$D(@REPS@(LIEN)) VU
 I '($$EXILIEN^%QSGEL2(LIEN)) S @REPS@(LIEN)="" G VU
 D LIENR^%QSGEL2(LIEN,.RS,.RD) S @REPS@(LIEN)=RS,@REPD@(LIEN)=RD
 S @QUAL@(LIEN)=$$QUAL^%QSGEL2(RS,LIEN)
VU I @REPS@(LIEN)="" S erreur="lien inconnu" G SUP
 I @QUAL@(LIEN)=0 S erreur="lien non qualifie" G SUP
 S INDS=$$^%QSCALVA("LIEN.I",INDL,"SOURCE."_LIEN)
 I '($$IR^%QSGE5(@REPS@(LIEN),INDS)) S erreur="individu source inexistant" G SUP
 S INDD=$$^%QSCALVA("LIEN.I",INDL,"DESTINATION."_LIEN)
 I '($$IR^%QSGE5(@REPD@(LIEN),INDD)) S erreur="individu destination inexistant" G SUP
 G NEXT
 
SUP W !,INDL,"  :  ",erreur S I=0
 S TOTERR=TOTERR+1
 D SX^%QSGESTK("LIEN.I",INDL)
 G NEXT
QSGES20 
 S LIEN=""
QS2 S LIEN=$O(^[QUI]RQSGLO("QSGES20","LIEN.I",LIEN)) Q:LIEN=""
 G:$D(@REPS@(LIEN)) VU2
 I '($$EXILIEN^%QSGEL2(LIEN)) S @REPS@(LIEN)="" G VU2
 D LIENR^%QSGEL2(LIEN,.RS,.RD) S @REPS@(LIEN)=RS,@REPD@(LIEN)=RD
 S @QUAL@(LIEN)=$$QUAL^%QSGEL2(RS,LIEN)
VU2 I @REPS@(LIEN)="" S erreur="lien inconnu" G SUP2
 I @QUAL@(LIEN)=0 S erreur="lien non qualifie" G SUP2
 
 
SUP2 
 G QS2
 ;

