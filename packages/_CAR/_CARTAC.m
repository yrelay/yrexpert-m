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

;%CARTAC^INT^1^59547,73867^0
%CARTAC(NUMECH) 
 
 
 
 N GLOETA,GLOECH,ETA,ACTI,WH,TRT,LISTE,DATDEB,DATFIN
 S GLOETA="^CARGETA",GLOECH="^CARGECH"
 F ETA="PLANIFIE","ATTENTE","INTERROMPU","LANCE","FINI" Q:$D(@GLOETA@(ETA,NUMECH))
 S ACTI=@GLOECH@("ECH",NUMECH,"ACT")
 
 D CLEPAG^%VVIDEO
 S DX=2,DY=2 X XY W $$^%QZCHW("TACHE NUMERO : ")_ACTI
 S DX=50 X XY W $$^%QZCHW("ETAT ")_ETA
 S DX=2,DY=3 X XY W $$^%QZCHW("ECHEANCE ")_NUMECH
 S WH=@GLOECH@("ACT",ACTI,"WHOIS"),TRT=@GLOECH@("ACT",ACTI,"TRT"),LISTE=@GLOECH@("ACT",ACTI,"LISTE")
 S DY=4,DX=4 X XY W $$^%QZCHW("Pour le service ")_WH
 S DY=5,DX=4 X XY W $$^%QZCHW("activation du traitement ")_TRT
 S DY=6,DX=4 X XY W $$^%QZCHW("sur la liste ")_LISTE
 G:(ETA="ATTENTE")!(ETA="PLANIFIE") FIN
 S DATDEB=@GLOECH@("ECH",NUMECH,"DATDEB"),DATFIN=@GLOECH@("ECH",NUMECH,"DATFIN")
 S DY=8,DX=4 X XY W $$^%QZCHW("date de debut ")_DATDEB
 S DY=9,DX=4 X XY W $$^%QZCHW("date de fin ")_DATFIN
 G:ETA'="INTERROMPU" FIN
 I $D(@GLOECH@("ECH",NUMECH,"TEXT")) S DY=11,DX=4 X XY W $$^%QZCHW("cause de l'interruption")_@GLOECH@("ECH",NUMECH,"TEXT")
FIN D ^%VZEAVT("")
 Q

