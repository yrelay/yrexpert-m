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

;%QMMODJ^INT^1^59547,73878^0
QMMODJ ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
STOFI(MODE,MODELE,NOFICHE,ART,AG,GO,MSG,ERR) 
 N ADCONF,GAMME,OP,GA,OG,ART1,GAMME1
 S MSG=""
 I ((((MODELE="")!(NOFICHE=""))!(ART=""))!(AG=""))!(GO="") Q 1
 S ADCONF=$$ADCONF
 
 D ADD^%VPRIN1(ERR,$$^%QZCHW("verification de la connection du jalonnement au schema")_" "_MODELE_" "_$$^%QZCHW("numero de fiche")_" "_NOFICHE)
 I (MODELE="")!(NOFICHE="") Q 1
 I ART="" W *
 I AG="" W *
 I GO="" W *
 I $$MODEL^%QSMODEL'=MODELE S MSG=$$^%QZCHW("le schema")_" "_MODELE_" "_$$^%QZCHW("n'est pas instale") Q 1
 I '($$EXREP^%QSGEL2(ART)) S MSG=ART_" "_$$^%QZCHW("n'est pas un nom de repertoire") D ADD^%VPRIN1(ERR,MSG)
 I '($$EXILIEN^%QSGEL2(AG)) S MSG=AG_" "_$$^%QZCHW("n'est pas nom de lien") D ADD^%VPRIN1(ERR,MSG)
 I '($$EXILIEN^%QSGEL2(GO)) S MSG=AG_" "_$$^%QZCHW("n'est pas nom de lien") D ADD^%VPRIN1(ERR,MSG)
 D LIENR^%QSGEL2(AG,.ART1,.GAMME)
 I ART1'=ART S MSG=AG_" "_$$^%QZCHW("n'est pas un lien de")_" "_ART_" "_$$^%QZCHW("mais de")_ART1 D ADD^%VPRIN1(ERR,MSG)
 D LIENR^%QSGEL2(GO,.GAMME1,.OP)
 I GAMME1'=GAMME S MSG=GO_" "_$$^%QZCHW("n'est pas un lien de")_" "_GAMME_" "_$$^%QZCHW("mais de")_GAMME1 D ADD^%VPRIN1(ERR,MSG)
 S GA=$$LIENI^%QSGEL4(AG)
 I GA="" S MSG=AG_" "_$$^%QZCHW("n'a pas de lien inverse") D ADD^%VPRIN1(ERR,MSG)
 S OG=$$LIENI^%QSGEL4(GO)
 I OG="" S MSG=GO_" "_$$^%QZCHW("n'a pas de lien inverse") D ADD^%VPRIN1(ERR,MSG)
 I MSG'="" W *
 D ADD^%VPRIN1(ERR,$$^%QZCHW("la connection du jalonnement au schema")_" "_MODELE_" "_$$^%QZCHW("numero de fiche")_" "_NOFICHE_" "_$$^%QZCHW("est correcte"))
 I '(MODE) Q 0
 K @ADCONF@(NOFICHE)
 S @ADCONF@(NOFICHE,"NOFICHE")=NOFICHE
 S @ADCONF@(NOFICHE,"ART")=ART
 S @ADCONF@(NOFICHE,"GAMME")=GAMME
 S @ADCONF@(NOFICHE,"OP")=OP
 S @ADCONF@(NOFICHE,"AG")=AG
 S @ADCONF@(NOFICHE,"GO")=GO
 S @ADCONF@(NOFICHE,"GA")=GA
 S @ADCONF@(NOFICHE,"OG")=OG
 S @ADCONF@(NOFICHE,"DESC")=ART_"/"_AG_"/"_GO
 Q 0
 
 
 
STOMO(MODE,MODELE,MSG,ERR) 
 
 
 
 
 
 
 
 N I,NOFICHE,ADGR,ART,AG,GO,CH,PB
 S ADGR=$$ADGR
 S PB=0
 S NOFICHE=$O(@ADGR@(MODELE,""))
 F I=0:0 Q:NOFICHE=""  D STOMO1 S NOFICHE=$O(@ADGR@(MODELE,NOFICHE))
 Q PB
STOMO1 S CH=@ADGR@(MODELE,NOFICHE)
 S ART=$P(CH,"^",1)
 S AG=$P(CH,"^",2)
 S GO=$P(CH,"^",3)
 S PB=PB!$$STOFI(MODE,MODELE,NOFICHE,ART,AG,GO,.MSG,ERR)
 Q
 
 
ADCONF() 
 Q $$TEMPS^%QZCHAD("E","PLJ","")
 
ADUSER() 
 Q $$TEMPS^%QZCHAD("B","PLJ","")
 
ADGR() 
 Q "^RQSMDL9(""APP"",""PLJ"")"
 
VERIF(MODE) 
 N PB,TEMP,MODELE,MSG,ERR
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"VERIF")
 S ERR=$$CONCAS^%QZCHAD(TEMP,"ERR")
 K @(TEMP)
 D ON^%VZEATT
 S MODELE=$$MODEL^%QSMODEL
 S PB=$$STOMO(0,MODELE,.MSG,ERR)
 I (PB=1)!(MODE=0) D VERIF1 K @(TEMP) Q
 S PB=$$STOMO(1,MODELE,.MSG,ERR)
 K @(TEMP)
 Q
VERIF1 
 D ^%QULIMZ(
 Q
 
 
CHARG(NOFICHE) 
 N ADCONF,ADUSER
 S ADCONF=$$ADCONF
 S ADUSER=$$ADUSER
 D GLOCOP^%QCAGLC($$CONCAT^%QZCHAD(ADCONF,NOFICHE),ADUSER)
 Q
 
CHOIX() 
 N ADCONF,ADUSER,TEMPS
 S ADCONF=$$ADCONF
 Q $$^%QUCHOIS(ADCONF,$$^%QZCHW("quelle connection du jalonnement"))
 
EXCONF() 
 N ADCONF
 S ADCONF=$$ADCONF
 Q $D(@ADCONF)'=0
 
EXUSER() 
 N ADUSER
 S ADUSER=$$ADUSER
 Q $D(@ADUSER)'=0
 
 
 
 
CONF() 
 
 
ART() 
 N ADUSER
 S ADUSER=$$ADUSER
 Q @ADUSER@("ART")
GAMME() 
 N ADUSER
 S ADUSER=$$ADUSER
 Q @ADUSER@("GAMME")
OP() 
 N ADUSER
 S ADUSER=$$ADUSER
 Q @ADUSER@("OP")
AG() 
 N ADUSER
 S ADUSER=$$ADUSER
 Q @ADUSER@("AG")
GA() 
 N ADUSER
 S ADUSER=$$ADUSER
 Q @ADUSER@("GA")
GO() 
 N ADUSER
 S ADUSER=$$ADUSER
 Q @ADUSER@("GO")
OG() 
 N ADUSER
 S ADUSER=$$ADUSER
 Q @ADUSER@("OG")
DESC() 
 N ADUSER
 S ADUSER=$$ADUSER
 Q @ADUSER@("DESC")
NOFICHE() 
 N ADUSER
 S ADUSER=$$ADUSER
 Q @ADUSER@("NOFICHE")
 ;

