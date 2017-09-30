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

;%QGTRILI^INT^1^59547,73876^0
GRTRILIS ;
 D MSG^%VZEATT("tri de la liste initiale...")
 K @GROUPE@("LISTE"),@GROUPE@("LISTE2")
 S NBAT=0 F I=1:1:5 I ^ATTR($J,"O",I)'="" S NBAT=NBAT+1,^ATTR($J,"O",NBAT)=^ATTR($J,"O",I)
 F I=NBAT+1:1:5 S ^ATTR($J,"O",I)=""
 S ^[QUI]GRATT(NUFA)=^ATTR($J,"O",1)_"^"_^ATTR($J,"O",2)_"^"_^ATTR($J,"O",3)_"^"_^ATTR($J,"O",4)_"^"_^ATTR($J,"O",5)_"^"_^ATTR($J,"O",6),X="@GROUPE@(""LISTE"""
 F I=1:1:NBAT S X=X_",A("_I_")"
 S LISNOM=X_")",X=X_",OBJ)",OBJ=-1
LOOP S OBJ=$N(@GRLISTE@(OBJ)) G:OBJ=-1 FIN D LOOP2 G LOOP
LOOP2 S QUER=@GRLISTE@(OBJ)
 F I=1:1:NBAT S AT=^ATTR($J,"O",I) D VAL
 S @X="" Q
VAL I AT="%REPERTOIRE" S A(I)=$$NOMLOG^%QSF(QUER) S:A(I)="" A(I)="?" Q
 S A(I)=$$^%QSCALVA(QUER,OBJ,^ATTR($J,"O",I)) S:A(I)="" A(I)="?"
 Q
FIN S I=1,NOMTREE="@GROUPE@(""LISTE""",%TAD="LIST2^%QGTRILI" D ^%QCAGTU5
 S @GROUPE@("CARD")=I-1
 K @GROUPE@("LISTE")
 D POCLEPA^%VVIDEO
 Q
LIST2 S @GROUPE@("LISTE2",I)=%1C,I=I+1 Q

