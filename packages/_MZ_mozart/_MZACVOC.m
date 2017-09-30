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

;%MZACVOC^INT^1^59547,73871^0
MZACVOC ;
 
 
 
 
 D CLEPAG^%VVIDEO
 N GLO,X,Y
 S GLO="^[QUI]MOZ(""VOCABULAIRE"")"
 D ^%VZCDB("autorisation d'acces au vocabulaire de mozart",0)
DEB K Y
 S Y="25\BLH\3\\\Consulter,Ajouter,Supprimer"
 D ^%PKPOP
 G:(CTR="A")!(CTR="F") FIN
 G:CTR'="" DEB
 
 I X=1 D AFFI G DEB
 I X=2 D AJ,AFFI2 G DEB
 I X=3 D SUP,AFFI2 G DEB
 G DEB
 
FIN 
 Q
 
AFFI 
 
 I '($D(@GLO)) D ^%VZEAVT("aucun service") Q
 G AFF
AFFI2 
 I '($D(@GLO)) S DX=0,DY=5 D CLEBAS^%VVIDEO Q
 
AFF D BLD^%VVIDEO S DX=1,DY=6 X XY W $$^%QZCHW("utilisateur(s)")," :" D NORM^%VVIDEO
 D INIT^%QUCHOIP(GLO,1,"",20,5,20,10),AFF^%QUCHOIP
 D END^%QUCHOIP
 Q
 
AJ 
 
 S DX=0,DY=20 D CLEBAS^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW("Donnez le nom de l'utilisateur")_" : ","",1,RM-4,DY+1,DY-1,"","$$CTR^%MZACVOC",.CTR,.UTIL)
 S DX=0,DY=20 D CLEBAS^%VVIDEO
 Q:UTIL=""
 S @GLO@(UTIL)=""
 Q
 
CTR(Y1,REAF) 
 S REAF=0
 Q:Y1="" 1
 I '($D(^TABIDENT(Y1))) D ^%VZEAVT($$^%QZCHW("utilisateur inconnu")) Q 0
 Q 1
 
 Q
SUP 
 
 N UTIL
 S UTIL=$$UN^%PKCHOIX(GLO,60,5,10)
 Q:UTIL=""
 K @GLO@(UTIL)
 Q
 
AUTOR(UTIL) 
 I $D(^[QUI]MOZ("VOCABULAIRE",UTIL)) Q 1
 Q 0

