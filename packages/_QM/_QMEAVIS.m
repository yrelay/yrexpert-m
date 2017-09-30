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

;%QMEAVIS^INT^1^59547,73878^0
QMEAVIS ;
 N BASI,IND,LIEN,NOMENC,PROFMX,%ABORT,TEMP,TEMPO
 S BASI="NOEUD.I",LIEN="TRANSITION"
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S NOMENC=$$CONCAS^%QZCHAD(TEMPO,"NOM.TRANSITION")
 S TEMP=$$CONCAS^%QZCHAD(TEMPO,"TEMPORAIRE")
 D CLEPAG^%VVIDEO
ASKN S DX=15,DY=3 X XY S IND=$$^%VZAME1($$^%QZCHW("Nom du noeud initial ? "))
 G:IND="" FIN
 I IND="?" S IND=$$^%QUCHOIX($$LISTIND^%QSGEST6(BASI),1,"",0,7,80,16) G:IND="" FIN G VISU
 I '($$IR^%QSGEST5(BASI,IND)) D ^%VZEAVT($$^%QZCHW("Noeud inexistant")) G ASKN
VISU K @(NOMENC)
 
 D ^%QMNF4(BASI,IND,LIEN,NOMENC,.PROFMX) I %ABORT G ARB2
 D ^%QMNF5(NOMENC,BASI,IND,LIEN,PROFMX)
 D CLEPAG^%VVIDEO,^%VZEATT
ARB2 K @(NOMENC)
 D CLEPAG^%VVIDEO
 G ASKN
FIN K @(TEMPO)
 Q

