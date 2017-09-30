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

;JALTOUT^INT^1^59547,74867^0
JALTOUT(LISTE) 
 
 
 
 
 
 
 N ADR
 Q:'($$IR^%QSGEST5("L0",LISTE))
 Q:$$BASE^%QSGEST7(LISTE)'=$$ART^JALRPJ
 S ADR=$$^%QSCALVA("L0",LISTE,"ADRESSE")
 Q:'($D(@ADR))
 G GO
ADR(ADR) 
 
 
 
 G GO
 
 
GO N ARC,DTH,U,NBAJ,NBAV,QUANT,RAR,LRES,TEMP,NER
 S RAR=$$ART^JALRPJ
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GAMME")
 K @(TEMP)
 S QUANT=$$CONCAS^%QZCHAD(TEMP,"QUANT")
 S LRES=$$CONCAS^%QZCHAD(TEMP,"RESULT")
 S @LRES=0
 D SAIS
 S VISU=1,NBAJ=0,NBAV=0
 I VISU D CADRE
 S ARC="" F U=0:0 S ARC=$O(@ADR@(ARC)) Q:ARC=""  R:VISU *INTERRUP:0 D TOUCHE^%INCCLAV(INTERRUP,.INTERRUP) Q:INTERRUP=1  D JALUN
 D ^%VSQUEAK I VISU,INTERRUP=1 W *-1 D ^%VZEAVT("Jalonnement interrompu par decision de l'utilisateur")
 G FIN
JALUN S NBAV=NBAV+1
 S QU=@QUANT@(ARC)
 I VISU S BLD=1-$$^%QCAZG("BLD") D ^%VZCDB($$^%QZCHW("JALONNEMENT")_" :    "_RAR_" "_ARC_" "_$$^%QZCHW("Quantite")_" "_QU,0)
 
 S DATE=$$^%QSCALVA(RAR,ARC,"DATE.AU.PLUS.TARD") D TESTDAT
 G:DATE'="" GO2
 S DATE=$$^%QSCALVA(RAR,ARC,"DATE.CONTRACTUELLE") D TESTDAT
 G:DATE'="" GO2
 S DATE=$$^%QSCALVA(RAR,ARC,"DELAI.DEMANDE") D TESTDAT
 I DATE="" Q:'(VISU)  W $$XY^%VVIDEO1(1,22)_ARC_" : "_$$^%QZCHW("aucune date au plus tard n'est definie") G GO3
GO2 
 
 S DTH=$S($L(DATE)=4:$$SEMJOU(DATE),DATE["/":$$DH1^%QMDATE(DATE),1:$$DH31^%QMDATE(DATE))
 S DX=0,DY=21 X XY W "Date de fin consideree: ",DATE,$J("",20)
 D JAMT2^JALACT(ARC,DTH,QU,.MPO,.R,LRES) K MPO
 
 I VISU&R D POCLEPA^%VVIDEO W ARC_" : "_$$^%QZCHW($S(R=1:"pas de composant",R=2:"pas d'operation",R=3:"machine indefinie",R=4:"duree fabrication inconnue",R=5:"operation impossible a placer",1:"donnees incompletes")) Q
 G:(VISU=0)!(R=0) GO3
 
 
 
 
GO3 D:VISU ^%VZEAVT("")
 Q
FIN I VISU D AFFERR^%QULIMZ(LRES,$$^%QZCHW("Resultats du jalonnement"))
 K @(TEMP)
 D:VISU CURON^%VVIDEO Q
 
SEMJOU(DD) 
 Q $$HLUN^%QMDAK4(DD)+4
 
 
 
 
 
TESTDAT 
 S OK=0
 S:((DATE?2N1"/"2N1"/"2N)!(DATE?4N))!(DATE?6N) OK=1
 I '(OK) S DATE=""
 Q
 
SAIS 
 N A,ART,TEMPO
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TEMPO") K @(TEMPO)
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Saisie des quantites des articles"),0)
 S ART="" F A=1:1 S ART=$O(@ADR@(ART)) Q:ART=""  S @TEMPO@(A,ART)=""
 D SPEC^%QUSAIS2(TEMPO,0,2,79,20,0,"NUM^JALTOUT")
 F A=1:1 S ART=$O(@TEMPO@(A,"")) Q:ART=""  S @QUANT@(ART)=@TEMPO@(A,ART)
 Q
NUM(VAL) 
 I '($$ENTP^%QZNBN(VAL)) D ^%VZEAVT($$^%QZCHW("La quantite doit avoir une valeur entiere")) Q 0
 I VAL=0 D ^%VZEAVT($$^%QZCHW("La quantite ne doit pas etre nulle")) Q 0
 Q 1
 
CADRE D CLEPAG^%VVIDEO,CARSP^%VVIDEO(0,1,17,80,1),CUROF^%VVIDEO,BLK^%VVIDEO,BLD^%VVIDEO,POCLEPA^%VVIDEO W "Jalonnement en cours "_$$NORM^%VVIDEO1_$$L24^%QSLIB2_" pour arreter"
 Q
REAFI D CLEPAG^%VVIDEO,CADRE,^%VZCDB("Jalonnement : "_ARC,0)
 Q

