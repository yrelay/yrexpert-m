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

;%SDSCIMP^INT^1^59547,73889^0
SDSCIMP ;
 
 
 
 
 
INIT(SOR) 
 
 N %r
 I SOR=0 S %TERM=^TABIDENT(WHOIS,"TYPECR"),%PORT=^TABIDENT(WHOIS,"ECRGRA")
 I SOR=1 S %TERM=^TABIDENT(WHOIS,"TYPTAB"),%PORT=^TABIDENT(WHOIS,"TABTRA")
 S %DESSIN=SOR
 
 D:(%PORT=0)!(%PORT=$I) CLEPAG^%VVIDEO,^%PBPZGRA
 
 
 
 
 
 S VALPLA=" "
 I '($$^%EDPRLG) Q
 
 S %FONC="INIT.DESSIN" D ^%PBPZ
 S %FONC="LANDSCAPE" D ^%PBPZ
 S ^V($J,"%","%ORIENTATION",1)=%9O
 S %FONC="PRENDRE" D ^%PBPZ
 Q
 
FIN(SOR) 
 I SOR=1 G FIMP
 
 D ^%VSQUEAK R *R
 S %FONC="CLEAR" D ^%PBPZ
 D ^%PBPZALF,CLEPAG^%VVIDEO
 K PTEC,ENVL
 Q
FIMP 
 
 
 
 
 D ^%EDEPLG
 Q
 
TRAIT(X,Y) 
 D INIT^%EDCENVL
 S ^V($J,"%","%X",1)=X
 S ^V($J,"%","%Y",1)=Y
 D COOR^%EDCENVL
 S %FONC="MOUV" D ^%PBPZ
 Q

