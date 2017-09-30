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

;%PBREPAR^INT^1^59547,73874^0
PBREPAR ;
 
 
 
 
 
 
 N CHOIX
INIT 
 D CLEPAG^%VVIDEO,^%VZCDB("REPARATION DE DESSINS",0)
 D POCLEPA^%VVIDEO S DX=25 X XY S CHOIX=$$^%VZECH2("","integrite","consultation detaillee")
 I CHOIX="integrite" S VERIF=1 D INTE G INIT
 I CHOIX="consultation detaillee" D ^%PBCORR G INIT
 I CHOIX=1 Q
 G INIT
INTE 
 N OB,VER,VERIF,ERR,OK
DEB D CLEPAG^%VVIDEO,^%VZCDB("INTEGRITE D'UN DESSIN",0)
 S DX=0,DY=2 X XY W "nom du dessin : " R OB
 I OB="?" S OB=$$CHOIX("^[QUI]GRAPHE2"),DX=16,DY=2 X XY W OB
 I OB="" Q
 S DX=0,DY=4 X XY W "nom de la version : " R VER
 I VER="?" S VER=$$CHOIX("^[QUI]GRAPHE2(OB)"),DX=20,DY=4 X XY W VER
 I VER="" G DEB
 I '($D(^[QUI]GRAPHE2(OB,VER))) D ^%VZEAVT("DESSIN INCONNU") G DEB
 K ERR
 S VERIF=0
MEN D POCLEPA^%VVIDEO S DX=25 X XY S CHOIX=$$^%VZECH2("","verification","correction")
 I CHOIX="verification" S VERIF=1 G VERIF
 I CHOIX="correction" G CORR
 G DEB
 
VERIF 
 D MSG^%VZEATT($$^%QZCHW("verification en cours"))
 S NUM=0,OK=1
LOOP S NUM=$O(^[QUI]GRAPHE2(OB,VER,NUM))
 G:NUM="" FLOOP
 S NUM2=$O(^[QUI]GRAPHE2(OB,VER,NUM))
 G:NUM2="" FLOOP
 I NUM2'=(NUM+1) S OK=0 G FLOOP
 G LOOP
FLOOP 
 I '(OK) D ^%VZEAVT($$^%QZCHW("erreur d'integrite")) S ERR(OB,VER)=""
 G MEN
 
CORR 
 I '(VERIF) D ^%VZEAVT($$^%QZCHW("dessin non verifie")) G MEN
 I '($D(ERR(OB,VER))) D ^%VZEAVT($$^%QZCHW("inutile : pas d'erreurs trouvees a la verification")) G MEN
 S NUM=0
LOOP1 S NUM=$O(^[QUI]GRAPHE2(OB,VER,NUM))
 G:NUM="" FLOOP1
 S NUM2=$O(^[QUI]GRAPHE2(OB,VER,NUM))
 G:NUM2="" FLOOP1
 I NUM2'=(NUM+1) D RECOP(NUM)
 G LOOP1
FLOOP1 
 G MEN
 
RECOP(NU) 
 F I=1:1 S NU=$O(^[QUI]GRAPHE2(OB,VER,NU)) Q:NU=""  S ^[QUI]GRAPHE2(OB,VER,NU-1)=^[QUI]GRAPHE2(OB,VER,NU)
 S NU=$ZP(^[QUI]GRAPHE2(OB,VER,"")) K ^[QUI]GRAPHE2(OB,VER,NU)
 S ^[QUI]GRAPHE2(OB,VER)=^[QUI]GRAPHE2(OB,VER)-1
 Q
 
CHOIX(GLO) 
 N A
 D INIT^%QUCHOIP(GLO,"",1,55,6,23,14)
 D AFF^%QUCHOIP
 S A=$$UN^%QUCHOIP
 S DX=50,DY=6 D CLEBAS^%VVIDEO,NORM^%VVIDEO,END^%QUCHOIP
 Q A

