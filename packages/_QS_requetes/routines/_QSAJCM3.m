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

;%QSAJCM3^INT^1^59547,73880^0
QSAJCM3() 
 
 
 
 
 
 I $L(INDIV,",")'=1 D ^%VZEAVT($$^%QZCHW("Nom invalide : ne doit contenir aucune virgule...")) Q 0
 I REPI=$$LIENI^%QSGEL3 D ^%VZEAVT($$^%QZCHW("La creation d'un individu lien est interdite")) Q 0
 K ^M2($J)
 S ^M2($J,1)=$$^%QZCHW("Creation")_"^CREAT",^M2($J,2)=$$^%QZCHW("Duplication")_"^DUPLI"
 D POCLEPA^%VVIDEO
LOC O $I D ^%VQUIKMN(0,79,22,"^M2($J)",.ADRES,.CONTR)
 D POCLEPA^%VVIDEO
 G:ADRES="" FIN
 G @ADRES
FIN Q 0
DUPLI N IND,RIND2 S IND=$$CHOIX^%QSAJCM4
 G:IND="" FIN
 S RIND2=$S(PIL>1:$P(PIL(PIL-1),"^",5)_",",1:"")_$$M^%QAX(IND)
 D POCLEPA^%VVIDEO S DX=0,DY=23 X XY W $$^%QZCHW("Un instant ") D ALL^%QSGEST2(REPI,RIND2,RIND) G END
CREAT D PA^%QSGESTI(REPI,RIND,"NOM",INDIV,1)
END 
 
 S MODE="A" Q 1

