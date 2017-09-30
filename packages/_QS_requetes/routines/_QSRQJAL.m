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

;%QSRQJAL^INT^1^59547,73883^0
%QSRQJAL ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
MD(R,L,A1,VA1,A2,BI,BS) 
 N I,J,INDIV,OR,LISTE,CARD,VATT2,GLO,SOURCE,TL
 
 S DX=0,DY=23
 S CARD=0,SOURCE="JAL",TL="JAL"
 S LISTE=$$NOM^%QSGES11(TL)
 S GLO=$$STO^%QSGES11(LISTE)
 D POCLEPA^%VVIDEO
 D MD0
 D ^%QSGES11(R,LISTE,TL,CARD,SOURCE,"")
 Q LISTE
MD0 S OR=$O(^[QUI]QUERY2(R,A1,VA1,""))
 F J=0:0 Q:OR=""  D MD1 S OR=$O(^[QUI]QUERY2(R,A1,VA1,OR))
 Q
MD1 S INDIV=$O(^[QUI]QUERY2(R,A1,VA1,OR,""))
 F I=0:0 Q:INDIV=""  D MD2 S INDIV=$O(^[QUI]QUERY2(R,A1,VA1,OR,INDIV))
 Q
MD2 S VATT2=$$^%QSCALVA(R,INDIV,A2)
 Q:VATT2<BI  Q:VATT2>BS
 S @GLO@(INDIV)=""
 S CARD=CARD+1
 X XY W CARD
 Q
 
DM0 S VATT2=$$FIRST(R,A2,BI)
 F I=0:0 Q:VATT2>BS  D DM1 S VATT2=$O(^[QUI]QUERY2(R,A2,VATT2))
 Q
DM1 S INDIV=$O(^[QUI]QUERY2(R,A2,VATT2,1,""))
 F J=0:0 Q:INDIV=""  D DM2 S INDIV=$O(^[QUI]QUERY2(R,A2,VATT2,1,INDIV))
 Q
DM2 I $$^%QSCALIN(R,INDIV,A1)'=VA1 Q
 S @GLO@(INDIV)="",CARD=CARD+1 X XY W CARD
 Q
 
FIRST(R,A,V) I $D(^[QUI]QUERY2(R,A,V))'=0 Q V
 Q $O(^[QUI]QUERY2(R,A,V))
TEST W $$MD("P1","","MACHINE","L4","DATE.JALON",870101,870301)
 Q
TEST1 W $$MD("P1","","MACHINE","C8","DATE.JALON",871201,880301)
 Q

