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

;LKNMGO^INT^1^59547,74867^0
LKNMGO(APP,NODE,DATE,TYPE,LISTE,BASE,STRUCT) 
 
 
 
 
 N O,I,BLKI,PILE,ROOT,O1,BASE1,TEMP,ADRLIS,OKECR
 S OKECR=$$GET^%SGVAR("ECR")
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S PILE=$$CONCAS^%QZCHAD(TEMP,"PILE")
 K @(TEMP)
 S ADRLIS=$$ADRLIS^%QSGEST7(LISTE)
 I (ADRLIS=0)!(ADRLIS="") Q
 S BLKI=1
 S ROOT=$$CONCAT^%QZCHAD("^[QUI]LK",$$S1^%QZCHAD(APP))
 
 
 K @(ROOT)
 D INITFI^%QCASTA(PILE)
 S O=$O(@ADRLIS@(""))
 F I=0:0 Q:O=""  D T1 S O=$O(@ADRLIS@(O))
 K @(TEMP)
 Q
T1 D PUSH^%QCASTA(PILE,O_"^"_BASE)
 F I=0:0 Q:$$PILEVIDE^%QCASTA(PILE)  S O1=$$POP^%QCASTA(PILE),BASE1=$P(O1,"^",2),O1=$P(O1,"^",1) D ^LKNMWRIT(TYPE,BASE1,O1,STRUCT,ROOT,DATE),INCR
 Q
INCR S BLKI=BLKI+1 I OKECR S DX=0,DY=23 X XY W $$^%QZCHW("Nombre d'enregistrements ecrits = "),BLKI
 Q
 ;
 ;

