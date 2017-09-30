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

;LKTXAVTE^INT^1^59547,74868^0
LKTXAVTE ;
 
 N RESUL,I,SOURCE,I,BLK,ARC,AVEX
 S RESUL="^LKTX" K @(RESUL)
 S SOURCE="^[QUI]LK(""AVEX"",""A1"",""53739,35076"",""DATA"",1)"
 S BLK=$O(@SOURCE@(""))
 F I=0:1 Q:BLK=""  D T1 S BLK=$O(@SOURCE@(BLK))
 Q
T1 N ENREG
 S ENREG=@SOURCE@(BLK)
 S ARC=$E(ENREG,12,18)
 S AVEX=$E(ENREG,6,11)
 S TYP=$E(ENREG,6,6)
 W !,BLK,?6,"AVEX",?12,AVEX,?31,"ARC",?36,ARC
 S @RESUL@("ARC",ARC)=$$^%QCAZG($$CONCAS^%QZCHAD(RESUL,"ARC,"_ARC))+1
 S @RESUL@("AVEX",AVEX)=$$^%QCAZG($$CONCAS^%QZCHAD(RESUL,"AVEX,"_AVEX))+1
 S @RESUL@("AVEX",AVEX,"ARC",ARC)=""
 S @RESUL@("AVEX",AVEX,"BLK",BLK)=""
 S @RESUL@("TYP",TYP)=$$^%QCAZG($$CONCAS^%QZCHAD(RESUL,"TYP,"_TYP))+1
 S @RESUL=$$^%QCAZG(RESUL)+1
 Q
TEST D ^LKTXAVTE Q
ARC N RESUL,ARC,I
 S RESUL="^LKTX(""ARC"")"
 S ARC=$O(@RESUL@(""))
 F I=0:1 Q:ARC=""  D ARC1 S ARC=$O(@RESUL@(ARC))
 Q
ARC1 W !,I," ARC ",ARC
 I $$IR^%QSGEST5("P0",ARC) Q
 D PA^%QSGESTI("P0",ARC,"NOM",ARC,1)
 D PA^%QSGESTI("P0",ARC,"EXP","CECI EST UN TEST AVEX",1)
 Q
TT S SOURCE="^[QUI]LK(""AVEX"",""A1"",""53739,35076"",""DATA"",1)"
 ;
 ;

