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

;%QMEXED^INT^1^59547,73878^0
%QMEXED ;;04:21 PM  21 Oct 1992; ; 16 Jan 93 10:56 AM
 
 
 
EDITE(ATN) 
 N MN,ADRES,CONTR,MN2
 D CARGEN^%QMEXCAR(ATN,1)
 S MN=$$TEMP^%SGUTIL
 S MN2=$$TEMP^%SGUTIL
 S @MN="21^10^79"
 S @MN@(1)=$$^%QZCHW("Graphe")_"^GRAPHE"
 S @MN@(1,"COM")=$$^%QZCHW("Consultation et modification du reseau sous forme de graphe")
 S @MN@(2)=$$^%QZCHW("Noeuds")_"^NOEUD"
 S @MN@(2,"COM")=$$^%QZCHW("Acces aux noeuds du reseau")
 S @MN@(3)=$$^%QZCHW("Transition")_"^TRANS"
 S @MN@(3,"COM")=$$^%QZCHW("Acces aux transitions")
 S @MN@(4)=$$^%QZCHW("Saisies")_"^SAISIE"
 S @MN@(4,"COM")=$$^%QZCHW("Acces aux saisies")
 S @MN@(5)=$$^%QZCHW("Traitements")_"^TRAIT"
 S @MN@(5,"COM")=$$^%QZCHW("Acces aux traitements")
 S @MN@(6)=$$^%QZCHW("Caracteristiques")_"^CAR"
 S @MN@(6,"COM")=$$^%QZCHW("Modification des caracteristiques du reseau")
 G GO
GO0 D POCLEPA^%VVIDEO
GO D ^%VQUIKMN(0,80,22,MN,.ADRES,.CONTR)
 G:CONTR'="" FIN
 G @ADRES
 
FIN K @(MN),@(MN2)
 Q
 
GRAPHE D EDITE^%QMEXO1(ATN)
 G GO0
 
NOEUD D ^%QMEXNOE(ATN)
 G GO0
 
SAISIE D ^%QMEA
 G GO0
 
TRAIT D ^%TLMENUG
 G GO0
 
CAR D CARGEN^%QMEXCAR(ATN,1)
 G GO0
 
TRANS S DX=0,DY=20 D CLEBAS^%VVIDEO
 S @MN2="21^10^79"
 S @MN2@(1)=$$^%QZCHW("Ajout")_"^AJTR"
 S @MN2@(1,"COM")=$$^%QZCHW("Ajout de transitions")
 S @MN2@(2)=$$^%QZCHW("CMS")_"^CMSTR"
 S @MN2@(2,"COM")=$$^%QZCHW("Cons/mod/supp de transitions")
GI0 D POCLEPA^%VVIDEO
 D ^%VQUIKMN(0,80,22,MN2,.ADRES,.CONTR)
 G:CONTR'="" GO0
 G @ADRES
AJTR D ^%QMEXLCR G GI0
CMSTR D ^%QMEXLMO G GI0

