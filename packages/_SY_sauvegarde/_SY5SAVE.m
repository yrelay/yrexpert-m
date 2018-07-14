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
;! HL001 ! HL     ! 01/01/01 ! Erreur %GTM-E-INVCMD -> $ZT="G ..."            !
;! HL002 ! HL     ! 26/08/12 ! ZN n'existe par pour GTM                       !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%SY5SAVE^INT^1^59547,73892^0
%SY5SAVE ;;09:30 AM  8 Jun 1993; 25 Jun 92  2:48 PM ; 08 Jun 93  9:36 AM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
GO(GLO,FIC,PAR,COMMENT) 
 N IOF,G,%G,DCOUR
 S IOF=FIC
 
 I (GLO'="^%GSET(")_$J_")" K ^%GSET($J) S G="" F %G=0:0 S G=$O(@GLO@(G)) Q:G=""  S ^%GSET($J,G)=@GLO@(G)
 S DCOUR=$P($ZPOS,"^",2)SPACE
 ;HL002 ZN PAR
 S ZN=$$ZGBLDIR^%GTM(PAR)
 O IOF:(MODE="W"):10 E  G ERRGO
 D auto^%gsave(IOF,0,1,COMMENT)
 S $ZT=""
 C IOF
 ;HL002 ZN DCOUR
 S ZN=$$ZGBLDIR^%GTM(DCOUR)
 Q 1
;HL002 ERRGO S $ZT="" C IOF ZN DCOUR Q 0
ERRGO S $ZT="" C IOF S ZN=$$ZGBLDIR^%GTM(DCOUR) Q 0
 
 
GI(FIC,PAR) 
 N IOF,DCOUR
 S IOF=FIC
 
 S DCOUR=$P($ZPOS,"^",2)SPACE
 %HL002 ZN PAR
 S ZN=$$ZGBLDIR^%GTM(PAR)
 O IOF:(MODE="R"):10 E  G ERRGI
 D auto^%gload(IOF,0,1,"A",0,0)
 S $ZT=""
 C IOF
 ;HL002 ZN DCOUR
 S ZN=$$ZGBLDIR^%GTM(DCOUR)
 Q 1
;HL002 ERRGI S $ZT="" C IOF ZN DCOUR Q 0
ERRGI S $ZT="" C IOF S ZN=$$ZGBLDIR^%GTM(DCOUR) Q 0
 ;

