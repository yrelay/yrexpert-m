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

;%TLOB17^INT^1^59547,74030^0
%TLOB17 ;;05:20 PM  26 Apr 1993; ; 26 Apr 93  5:39 PM
 
TRTMAP(TRT,BA,IND) 
 N TABC,DEROUL,R,MODAF,ETUDE,CTR,SIND,MODEX,DISMOD
 N TEMPO,ECHGL,ABANDON,ORIG,EXEC,NIVEAU,GLOETD,ETIQ,PARTIE,ARRET
 N HALT,TRLIS,TRBOUC
 S R=1,SIND=0
 S ARMAP=0
 D SET^%SGVAR("MAP",1)
 S PREF="TRT"
 S LISTE=$$GEN^%QCAPOP(PREF),ADRESSE="^[QUI]ZLIGTRAI("""_LISTE_""")"
 D CREERL^%QS0XG1(LISTE,BA,ADRESSE,"TRAITEMENT","AUTOMATIQUE")
 D AJOUT^%QS0XG1(LISTE,IND)
 S ETUDE=$$GEN^%QCAPOP("TTL")
 S MODAF=2
 S MODEX=2
 S DEROUL="PROCEDURAL"
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"PILE") K @(TEMPO)
 D INIT^%ANGEPIL
 S CXT("%","BASE")="%",CXT("%","OBJET")=$J
 S ORIG="TRAIT",EXEC="",NIVEAU=0,ABANDON=0,HALT=0,TRLIS=0,TRBOUC=0
 S GLOETD=$$CONCAS^%QZCHAD($$ADRESSE^%TLBAETD,ETUDE)
 S @GLOETD@("ETUDE")=ETUDE
 S @GLOETD@("DEROULEMENT")=DEROUL
 S @GLOETD@("TRAITEMENT")=TRT
 S @GLOETD@("LISTE")=LISTE
 S @GLOETD@("DATE")=$$DATE^%QMDATE_" "_$$HEURE^%QMDATE
 S @GLOETD@("HEURE.DEBUT")=$H,@GLOETD@("DUREE.EXECUTION")="0,0"
 S @GLOETD@("ATTRIBUT")=0
 S ETIQ="",PARTIE=""
 I $D(^BATCHMOD($J)),^BATCHMOD($J) S EXEC=0
 D EMPIL^%ANGEPIL("SORTIE^%TLOB17") G ^%TLBADEB
SORTIE 
 D EPIL^%ANGEPIL
 K @(TEMPO)
 D DEP^%SGVAR("MAP")
 D ELIML^%QS0XG1(LISTE)
 Q 1

