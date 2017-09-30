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
;! HL002 ! HL     ! 26/08/12 ! Tester ouverture du fichier                    !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;TOGSSFRE^INT^1^59547,74872^0
TOGSSFRE ;;05:03 PM  22 Mar 1993 ; 22 Mar 93  5:50 PM
 
 
 
 
 
 
 
 
 
 
LIREPOCH(FILE,GLOPOCH) 
 N OKOPEN,IOFI,ENRG,%E,NOMEX,LEX,LMC,LMT
 D OPENFILE^%SYSUTI1(FILE,"R",.IOFI,.OKOPEN)
 IF '(OKOPEN) K @GLOPOCH Q ;HL002 Tester ouverture du fichier
 S LEX=$L("^EXPLICI(""")
 S LMC=$L("^DESMACH(""")
 S LMT=$L("^IMPMAT(""")
 F %E=0:0 S ENRG=$$READ^%SYSUTI1(IOFI,.OKLEC) Q:'(OKLEC)  D TRTENRG
 D CLOSE^%SYSUTI1(IOFI,"R")
 Q
TRTENRG
 I $E(ENRG,1,LEX)="^EXPLICI(""" S NOMEX=$P(ENRG,"""",2) S:NOMEX'="" @GLOPOCH@("ART",NOMEX)=""
 I $E(ENRG,1,LMC)="^DESMACH(""" S NOMEX=$P(ENRG,"""",2) S:NOMEX'="" @GLOPOCH@("MAC",NOMEX)=""
 I $E(ENRG,1,LMT)="^IMPMAT(""" S NOMEX=$P(ENRG,"""",2) S:NOMEX'="" @GLOPOCH@("MAT",NOMEX)=""
 Q

