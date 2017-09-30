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

;%EDC3^INT^1^59547,73868^0
%EDC3 ;
 
 
 
 
 
 
 N %PORT,%TERM,%9X,%9Y,%9X1,%9Y1,%9X2,%9Y2,%9EPA,%9T
 N MODECR,Y1
DEB D CLEPAG^%VVIDEO,^%VZCD0("EDITION D'UN FORMAT")
 S Y1=$$GET^%EDFDIA(.MODECR) Q:Y1=""
 D:MODECR ^%VZCD0("EDITION D'UN FORMAT")
 D POCLEPA^%VVIDEO W $$^%QZCHW("Edition en cours ... un instant")
 D DEB^%VTIME,ED(Y1)
 D ^%VZEAVT($$^%QZCHW("Duree")_" : "_$$DUREE^%VTIME)
 G DEB
 
 
 
ED(FORMAT) N %FONC,VALPLA S VALPLA=""
 N ADRF S ADRF(FORMAT)=0
 S %TERM=^TABIDENT(WHOIS,"TYPTAB"),%PORT=^TABIDENT(WHOIS,"TABTRA")
 K ^V($J,"%")
 
 
 K ^V($J,"GDX")
 I '($$^%EDPRLG) Q
 
 
 
 ;;D INIT^%EDCENVL,COOR^%EDCENVL | insere dans prologue
 D EDITE(FORMAT)
 D ^%EDEPLG
 
 
 
 K ^V($J,"%") U 0
 Q
 
EDITE(FORMAT) 
 I '($D(^[QUI]EDFORMAT(FORMAT))) D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("le format "_FORMAT_" est inconnu [RETURN]...") R *BID Q
 I '($D(^[QUI]EDFORMAT(FORMAT,"ORIENTATION"))) D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("l'orientation du format "_FORMAT_" n'est pas definie [RETURN]...") R *BID Q
 S:^[QUI]EDFORMAT(FORMAT,"ORIENTATION")="VERTICALE" %FONC="PORTRAIT" S:^[QUI]EDFORMAT(FORMAT,"ORIENTATION")="HORIZONTALE" %FONC="LANDSCAPE" D ^%PBPZ
 S (%9O,^V($J,"%","%ORIENTATION",1))=^[QUI]EDFORMAT(FORMAT,"ORIENTATION")
SUITE 
 N NOM,GLO,LIGNE,ARRET S GLO="^[QUI]EDFORMAT(FORMAT)",ARRET=0
 S NOM=-1 F J=0:0 S NOM=$N(@GLO@("%",NOM)) Q:NOM=-1  S:'($D(^V($J,"%",NOM,1))) ^V($J,"%",NOM,1)=""
 
 I '($D(ADRF(FORMAT))) S ADRF(FORMAT)=0
 N I,LIGNE S LIGNE=""
BOUCL S LIGNE=$O(@GLO@("COMP",LIGNE))
 G:ARRET FIN
 G:LIGNE="" FIN
 G:@GLO@("COMP",LIGNE)="" FIN
 X @GLO@("COMP",LIGNE)
 G BOUCL
 K ADRF(FORMAT)
FIN S %FONC="CHARGER.VARIABLES"
 D ^%PBPZ
 
 Q
 
EXT(FORMAT) 
 ;;; ---- pas question!! -- ceci est anti methodologique-->>I %TERM'="POSTSCRIPT" D EDITE(FORMAT) Q
 N %9OO
 
 D EDITE(FORMAT)
 
 Q
CXT 
 N %FONC
 
 
 
 
 S (^V($J,"%","%ORIENTATION",1),%9OO)=%9O
 Q

