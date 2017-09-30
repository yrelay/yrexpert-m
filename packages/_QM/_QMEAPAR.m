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

;%QMEAPAR^INT^1^59547,73877^0
QMEAPAR ;
 N VAL,CTR,GLOB,MSG,COEFR,BON,MAL,UTIL,TABC
 
 S COEFR=$O(^[QUI]QUERY3("ATTRIBUT","PARAMETRE.HEVEA",$I,"COEFF.REMANENCE",""))
 S BON=$O(^[QUI]QUERY3("ATTRIBUT","PARAMETRE.HEVEA",$I,"BONUS",""))
 S MAL=$O(^[QUI]QUERY3("ATTRIBUT","PARAMETRE.HEVEA",$I,"MALUS",""))
 S UTI=$O(^[QUI]QUERY3("ATTRIBUT","PARAMETRE.HEVEA",$I,"UTILISATION",""))
 S:COEFR="" COEFR=1
 S:BON="" BON=1
 S:MAL="" MAL=-5
 S:UTI="" UTI="EXPLOITANT"
 
 D CREER^%TLBAGF1("EVA",0,3,8,80,80,0,"",1,"")
 
 D CLEPAG^%VVIDEO,80^%VVIDEO
 D ^%VZCD(0,39,0,2,1,0,"PARAMETRES DE L'EVALUATION")
 D REAF^%TLBAGF1("EVA",0)
 
 D ADD^%TLBAGF3("EVA",$$^%QZCHW("Coefficient de remanence")_"    : "_COEFR,1)
 D ADD^%TLBAGF3("EVA",$$^%QZCHW("Bonus")_"                       : "_BON,2)
 D ADD^%TLBAGF3("EVA",$$^%QZCHW("Malus")_"                       : "_MAL,3)
 D ADD^%TLBAGF3("EVA",$$^%QZCHW("Mode d'utilisation")_"          : "_UTI,4)
 
BDCOF 
 D GET^%TLBAGF3("EVA",$$^%QZCHW("Coefficient de remanence")_"    : ",1,.COEFR,.CTR)
 I (CTR'="")!(COEFR="") S ABANDON=1 Q
 I '($$NUM^%QZNBN(COEFR)) D ^%VZEAVT($$^%QZCHW("Coefficient non numerique")) G BDCOF
 
BDBON 
 D GET^%TLBAGF3("EVA",$$^%QZCHW("Bonus")_"                       : ",2,.BON,CTR)
 I (BON="")!(CTR'="") S ABANDON=1 Q
 I '($$NUM^%QZNBN(BON)) D ^%VZEAVT($$^%QZCHW("Bonus non numerique")) G BDBON
 
BDMAL 
 D GET^%TLBAGF3("EVA",$$^%QZCHW("Malus")_"                       : ",3,.MAL,.CTR)
 I (MAL="")!(CTR'="") S ABANDON=1 Q
 I '($$NUM^%QZNBN(MAL)) D ^%VZEAVT($$^%QZCHW("Malus non numerique")) G BDMAL
 
BDUTI 
 D GET^%TLBAGF3("EVA",$$^%QZCHW("Mode d'utilisation")_"          : ",4,.UTI,.CTR)
 I (UTI="")!(CTR'="") S ABANDON=1 Q
 G:UTI'="?" BUTIC
 S TABC(1)="EXPLOITANT",TABC(2)="REDACTEUR"
 D POCLEPA^%VVIDEO
 S UTI=$$^%VZECHO("TABC")
 D POCLEPA^%VVIDEO
BUTIC I (UTI'="EXPLOITANT")&(UTI'="REDACTEUR") D ^%VZEAVT($$^%QZCHW("2 possibilites : EXPLOITANT ou REDACTEUR")) G BDUTI
 
FINPAR 
 D PA^%QSGESTI("ATTRIBUT","PARAMETRE.HEVEA","COEFF.REMANENCE",COEFR,$I)
 D PA^%QSGESTI("ATTRIBUT","PARAMETRE.HEVEA","BONUS",BON,$I)
 D PA^%QSGESTI("ATTRIBUT","PARAMETRE.HEVEA","MALUS",MAL,$I)
 D PA^%QSGESTI("ATTRIBUT","PARAMETRE.HEVEA","UTILISATION",UTI,$I)
 
 D TUER^%TLBAGF1("EVA")
 D CLEPAG^%VVIDEO
 Q
 
 
 
STAND(COEFR,BON,MAL,UTI) 
 D PA^%QSGESTI("ATTRIBUT","PARAMETRE.HEVEA","COEFF.REMANENCE",1,$I)
 D PA^%QSGESTI("ATTRIBUT","PARAMETRE.HEVEA","BONUS",1,$I)
 D PA^%QSGESTI("ATTRIBUT","PARAMETRE.HEVEA","MALUS",-5,$I)
 D PA^%QSGESTI("ATTRIBUT","PARAMETRE.HEVEA","UTILISATION","EXPLOITANT",$I)
 S COEFR=1,BON=1,MAL=-5,UTI="EXPLOITANT"
 Q
 
 
 
LEC(COEFR,BON,MAL,UTI) 
 S COEFR=$O(^[QUI]QUERY3("ATTRIBUT","PARAMETRE.HEVEA",$I,"COEFF.REMANENCE",""))
 S BON=$O(^[QUI]QUERY3("ATTRIBUT","PARAMETRE.HEVEA",$I,"BONUS",""))
 S MAL=$O(^[QUI]QUERY3("ATTRIBUT","PARAMETRE.HEVEA",$I,"MALUS",""))
 S UTI=$O(^[QUI]QUERY3("ATTRIBUT","PARAMETRE.HEVEA",$I,"UTILISATION",""))
 Q

