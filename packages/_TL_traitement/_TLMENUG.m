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
;! HL002 ! HL     ! 02/07/12 ! PB caratères parasites terminal-gnome          !
;!-------!--------!----------!------------------------------------------------!
;!============================================================================!

;%TLMENUG^INT^1^59547,74030^0
%TLMENUG ;
 
 
 
 
 N AD,CONTR,R2,TTLM,UC,TEMP,TTLM1,LCOUR,FEN,FEN2,ICI,R
 S R=1
 S ICI="TLMENUG"
 
 S UC=$$TABID^%INCOIN("ORDINATEUR")
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 I UC="VAX" S TTLM="TTLM1",FEN="FEN2"
 I UC'="VAX" S TTLM=$$CONCAS^%QZCHAD(TEMP,"TTLM"),FEN=$$CONCAS^%QZCHAD(TEMP,"FEN")
 D MENU^%TLDIAL3(TTLM)
 S LCOUR=""
 D PFEN^%QS0DP,REAFI
DIAL D ^%VQUIKMN(0,80,22,TTLM,.AD,.CONTR)
 G:(CONTR="A")!(CONTR="F") ENDACT
 I AD'="" G @AD
 G DIAL
DIAL1 D:R2>0 POCLEPA^%VVIDEO
 D:R2=2 CLEPAG^%VVIDEO,CADL,CADLL G DIAL
 
ENDACT D END^%QUAPAGM
 K @(TEMP) Q
 
CADR D CLEPAG^%VVIDEO,CADL,CADLL,AFFICH^%QUAPAGM Q
CADL D ^%VZCD(0,39,0,2,0,0,"TRAITEMENTS sur LISTES") Q
CADLL D CARSP^%VVIDEO(40,0,3,$S(TADTM=0:38,1:40),1)
 ;HL002 S DX=41,DY=1 X XY W $J("",$S(TADTM=0:35,1:38))
 S DX=41,DY=1 X XY W $J("",$S(TADTM=0:35,1:37))
 S LCOUR=WHOIS_" sur "_$I
 S DX=60-($L(LCOUR)\2),DY=1 X XY D REV^%VVIDEO X XY W LCOUR
 D NORM^%VVIDEO Q
 
REAFF D REAFI,AFFICH^%QUAPAGM Q
REAFI D CLEPAG^%VVIDEO,CADL,CADLL Q
CREAT G CREAT^%TLDIALO
DUPLI G DUPLI^%TLDIALO
MODIF G MODIF^%TLDIALO
ANAL G ANAL^%TLDIALO
COMPIL G COMPIL^%TLDIALO
SUPPR G SUPPR^%TLDIALO
ACTIV2 G ACTIV2^%TLDIALO
ACTIV G ACTIV^%TLDIALO
IMPRIM G IMPRIM^%TLDIALO
PLUS G PLUS^%TLDIALO
MOINS G MOINS^%TLDIALO
PAGE G PAGE^%TLDIALO
REPER G REPER^%TLDIALO
MAPSF G MAPSF^%TLDIALO
RECH G RECH^%TLDIALO
SUBST G SUBST^%TLDIALO
ARBRE D ALLTRT^%QULELT,REAFI,AFFICH^%QUAPAGM G DIAL

