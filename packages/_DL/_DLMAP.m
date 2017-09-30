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

;%DLMAP^INT^1^59547,73868^0
JLMAP ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
GRAPH(REP,OBJ,DESOP,GRAPH,LISRES) 
 Q:LISRES=""
 N SOM,SUIV,I,LIB,LET
 S LIB=$$^%QZCHW("Jalon entre")_" ",LET=$$^%QZCHW("et")
 S I=$S($D(@LISRES):@LISRES+1,1:1)
 S @LISRES@(I)=" "
 S @LISRES@(I+1)=REP_" "_OBJ_" : "_$$^%QZCHW("graphe des operations")
 S @LISRES@(I+2)=$TR($J("",$L(@LISRES@(I+1)))," ","-")
 S @LISRES@(I+3)=" "
 S I=I+3
 S SOM=""
BGRA1 S SOM=$O(@GRAPH@(SOM))
 G:SOM="" GRAPF
 S SUIV=""
BGRA2 S SUIV=$O(@GRAPH@(SOM,SUIV))
 G:SUIV="" BGRA1
 S I=I+1
 S @LISRES@(I)=LIB_@DESOP@(SOM)_" "_LET_" "_@DESOP@(SUIV)_" : "_@GRAPH@(SOM,SUIV)
 G BGRA2
 
GRAPF S @LISRES=I
 Q
 ;

