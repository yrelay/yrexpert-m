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

;LKNMTX0^INT^1^59547,74867^0
LKNMTX0 ;
 
 
 
 
 
 
 
 
BQS(M,TYPE) 
 N ER,X,SEL,TEMP,APP,H,MSG,REC,MARQUE,BASE,EXTERNE,CTR,SUPPORT,ABORT,GR
 N EXTBANDE,IO,LISTE,LBASE1
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"BQS")
 S SEL=$$CONCAS^%QZCHAD(TEMP,"SEL")
 S DATA=$$CONCAS^%QZCHAD(TEMP,"DATA")
 S EXTERNE=$$CONCAS^%QZCHAD(TEMP,"EXTERNE")
 S EXTBANDE=$$CONCAS^%QZCHAD(TEMP,"EXTBANDE")
 K @(TEMP)
 S MSG=""
 S GR(1)=$$LK1^LKMZ(TYPE)
 S GR(2)=$$LK2^LKMZ(TYPE)
 S GR(3)=$$LK3^LKMZ(TYPE)
 S GR(5)=$$LK5^LKMZ(TYPE)
 S GR(6)=$$LK6^LKMZ(TYPE)
 S APP=$$APP(TYPE),H=$H
 D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("passerelle")_" "_$S(TYPE["PV":$$^%QZCHW("attribut valeur"),1:$$^%QZCHW("suite de valeurs")),0)
BQS1 D LIRE1^%VREAD($$^%QZCHW("Sortie")_" : ","",0,23,.CTR,.REC)
 I REC="?" S REC=$$^%QUCHOIS(GR(1),"")
 I (CTR="A")!(REC="") K @(TEMP) Q
 D ON^%VZEATT
 I TYPE="XPV" S MSG=$$NM^LKNMVER(TYPE,.GR,REC,EXTERNE,EXTBANDE,.SUPPORT,.IO,.BASE)
 I TYPE="XEC" S MSG=$$NM^LKNMVER(TYPE,.GR,REC,EXTERNE,EXTBANDE,.SUPPORT,.IO,.BASE)
 I MSG'="" D ^%VZEAVT(MSG) K @(TEMP) Q
 S SUPPORT(1)=$S(SUPPORT="F":$$^%QZCHW("fichier"),1:$$^%QZCHW("bande"))
 D ^%VZCDB($$^%QZCHW("Ecriture")_" "_SUPPORT(1),0)
 
 I SUPPORT="B" G BQS3
 
BQS2 D LIRE1^%VREAD($$^%QZCHW("Fichier")_" : ","",0,23,.CTR,.IO)
 I (CTR="A")!(IO="") K @(TEMP) Q
 
 I MSG'="" D ^%VZEAVT(MSG) G BQS2
 
BQS3 S LBASE1(BASE)=""
 S LISTE=$$SEL^%QS0SEL1("LBASE1",$$^%QZCHW("Quelle liste a ecrire"))
 I LISTE="" K @(TEMP) Q
 S MSG=$$VERL^LKNMVER(LISTE)
 I MSG'="" D ^%VZEAVT(MSG) Q
 D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("recherche des valeurs ds DKBMS"),0)
 D ON^%VZEATT
 D ^LKNMGO(APP,"A1",H,TYPE,LISTE,BASE,$$CONCAS^%QZCHAD(EXTERNE,"S"))
 
 S BASE=$O(@EXTERNE@("S",""))
 F I=0:0 Q:BASE=""  D LOOP S BASE=$O(@EXTERNE@("S",BASE))
 
 I M="S" S BASE=$O(@EXTERNE@("S","")) F I=0:0 Q:BASE=""  K ^[QUI]LK(APP,BASE,H) S BASE=$O(@EXTERNE@("S",BASE))
 K @(TEMP)
 Q
 
LOOP I SUPPORT="F" D OUT^LKFIC(APP,BASE,H,IO)
 I SUPPORT="B" S ABORT=$$ECRIRE1^LKPRIM(APP,BASE,H,IO,"ASCIIST","PHYMN^LKMNTX1",EXTBANDE) I ABORT'=0 Q
 Q
APP(TYPE) 
 I TYPE="XPV" Q "XPV"
 I TYPE="XEC" Q "XEC"
 Q
TEST D BQS("X","XEC")
 Q
TEST1 D BQS("X","XPV")
 Q

