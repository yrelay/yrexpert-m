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
;! Description : GESTION MANUELLE DES INDIVIDUS                               !
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

;%QSGBASE^INT^1^59547,73881^0
QSGBASE ;
 
 
 
 
 N B,%B,BASE,BASI,LBASE,MODEL,OBJ,NIVREP
 S MODEL=$$MODEL^%QSMODEL
 I MODEL="" D ^%VZEAVT($$ERMODEL^%QSMODEL) Q
 I '($D(^[QUI]RQSAUTOR(WHOIS))) D ^%VZEAVT($$ERMODEL^%QSMODEL) Q
 S LBASE=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"0") K @(LBASE)
 D REPA^%QSGEST9(LBASE) K @LBASE@("LIEN")
 D CLEPAG^%VVIDEO,CAD
 D INIT^%QUCHOIP(LBASE,1,"",0,3,20,7)
 S NIVREP=@("^"_"QX($J)")
;Affiche les répertoires
L0 D AFF^%QUCHOIP
 S BASE=$$UN^%QUCHOIP G:BASE="" FIN S BASI=$$NOMINT^%QSF(BASE)
 I $$REPVID^%QSGEST5(BASI) D ^%VZEAVT($$^%QZCHW("Ensemble vide ")) G L0
 D INIT^%QUCHOIP($$LISTIND^%QSGEST6(BASI),1,"",21,3,59,7)
;Affiche les individus
L1 D AFF^%QUCHOIP
;Affiche les attributs
L2 S OBJ=$$UN^%QUCHOIP I OBJ="" D END^%QUCHOIP G L0
 K ^TEMPO($J)
 D MODEAF^%QSATTRI(OBJ,BASI,0,10,80,13,0,"REAFF^%QSGBASE"),SIGNAL
 K ^TEMPO($J)
 G L1
SIGNAL Q:MODEL=""  Q:'($D(^[QUI]RQSMOD5(MODEL,BASI)))
 D @("^"_$P(^[QUI]RQSMOD5(MODEL,BASI),"^",1)_"("""_BASI_""","""_OBJ_""")") Q
FIN D END^%QUCHOIP
 K @(LBASE)
 Q
CAD 
 D ^%VZCD(0,39,0,2,1,0,$$^%QZCHW("GESTION MANUELLE DES INDIVIDUS"))
 Q
 
REAFF N SZ
 D CLEPAG^%VVIDEO,CAD
 S SZ=Z
 S Z=^QX($J)-1 D REAFF^%QUCHOI2
 S Z=Z+1 D REAFF^%QUCHOI2
 S Z=SZ
 D REAFF^%QSATTR6
 Q

