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

;%TLBAGES^INT^1^59547,74028^0
TLBAGES ;
 
 
 N AD,CONTR,R2,TTLM,UC,TEMP,TTLM1,LCOUR,FEN,FEN2,ICI,R,ARMAP
 S DX=0,DY=22 D CLEBAS^%VVIDEO
 S R=1
 S ICI="TLMENUG"
 S UC=$$TABID^%INCOIN("ORDINATEUR")
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 I UC="VAX" S TTLM="TTLM1",FEN="FEN2"
 I UC'="VAX" S TTLM=$$CONCAS^%QZCHAD(TEMP,"TTLM"),FEN=$$CONCAS^%QZCHAD(TEMP,"FEN")
 S LCOUR="" D PFEN^%QS0DP
 
BMAP D CLEPAG^%VVIDEO,CADL,CADLL
 S R=$$^%TLBAMAP
 G:ARMAP'=1 BMAP
 
ENDACT D END^%QUAPAGM K @(TEMP) Q
 
CADR D CLEPAG^%VVIDEO,CADL,CADLL,AFFICH^%QUAPAGM Q
CADL D ^%VZCD(0,39,0,2,0,0,$$^%QZCHW("MISE AU POINT")) Q
CADLL S LCOUR=WHOIS_" sur "_$I
 D CARSP^%VVIDEO(40,0,3,40,1)
 S DX=41,DY=1 X XY W $J("",$S(IBMPC&MODTM:35,1:38))
 S DX=60-($L(LCOUR)\2),DY=1 X XY D REV^%VVIDEO W LCOUR D NORM^%VVIDEO Q
REAFF D CLEPAG^%VVIDEO,REAFI,AFFICH^%QUAPAGM Q
REAFI D CADL,CADLL Q

