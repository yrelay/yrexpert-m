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

;%PBP5EC^INT^1^59547,73874^0
PTEC ;
 
 
 
 
 
 
 
 
 
 
 
 
INIT K PTEC N %FONC,%9TL
 D ^%PBPZGRA
 S %FONC="INIT",%PORT=0,%TERM=$S($D(^TABIDENT(WHOIS,"TYPECR")):^TABIDENT(WHOIS,"TYPECR"),1:"PT-100G") D ^%PBPZ
 S %FONC="PRENDRE" D ^%PBPZ
 S PTEC("EFFACEMENT")="",PTEC("TYPE DE LIGNE")=""
 D ^%PBPZALF Q
INIT2 K PTEC N %FONC
 S %FONC="INIT"
 S %PORT=^TABIDENT(WHOIS,"TABTRA")
 S %TERM=^TABIDENT(WHOIS,"TYPTAB") D ^%PBPZ
 S %FONC="PRENDRE" D ^%PBPZ
 S PTEC("EFFACEMENT")="",PTEC("TYPE DE LIGNE")=""
 Q
INIT3 K PTEC N %FONC
 S %FONC="INIT.DESSIN"
 S %PORT=^TABIDENT(WHOIS,"TABTRA")
 S %TERM=^TABIDENT(WHOIS,"TYPTAB") D ^%PBPZ
 S %FONC="PRENDRE" D ^%PBPZ
 S PTEC("EFFACEMENT")="",PTEC("TYPE DE LIGNE")=""
 Q
 
FIN K %PORT,PTEC,%TERM Q
 
CLEAR N %FONC S %FONC="CLEAR" D ^%PBPZ Q
 
 
POINT(%9X,%9Y,E) N %FONC D EFF(E) S %FONC="POINT" D ^%PBPZ Q
 
 
 
 
TEXTE(%9X,%9Y,%9STR,E,S) N %FONC D EFF(E)
 S %FONC="TAILLE",%9MOD=5E-1 D ^%PBPZ
 S %FONC="MOUV" D ^%PBPZ S %FONC="TEXT" D ^%PBPZ
 S %FONC="TAILLE" K %9MOD D ^%PBPZ
 Q
 
 
 
 
 
DROITE(%9X1,%9Y1,%9X2,%9Y2,E,%9TL,V) N %FONC
 D EFF(E),LIG(%9TL,V) S %FONC="SEGMENT" D:(%9TL'="I")!V ^%PBPZ Q
 
 
 
 
 
ARC(%9X,%9Y,%9R,%9AD,%9AF,E,%9TL,V) N %FONC
 D EFF(E),LIG(%9TL,V) S %FONC="ARC" D:(%9TL'="I")!V ^%PBPZ Q
 
 
 
 
CERCLE(%9X,%9Y,%9R,E,%9TL,V) N %FONC
 D EFF(E),LIG(%9TL,V) S %FONC="CERCLE" D:(%9TL'="I")!V ^%PBPZ Q
 
 
 
 
 
 
ELLIPSE(%9X,%9Y,%9PR,%9DR,%9I,E,%9TL,V) N %FONC
 D EFF(E),LIG(%9TL,V) S %FONC="ELLIPSE" D:(%9TL'="I")!V ^%PBPZ Q
 
 
 
 
 
 
 
DEMIE(%9X,%9Y,%9PR,%9DR,%9I,E,%9TL,V) N %FONC
 D EFF(E),LIG(%9TL,V) S %FONC="DEMIE" D:(%9TL'="I")!V ^%PBPZ Q
EFF(E) 
 S PTEC("EFFACEMENT")=E,%FONC=$S(E=1:"EFFACEMENT",1:"NORMAL") D ^%PBPZ Q
 
LIG(%9TL,V) 
 S:(%9TL="I")&V %9TL="P"
 S PTEC("TYPE DE LIGNE")=%9TL,%FONC="TYPLIGNE" D ^%PBPZ Q

