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

;%SGPDOUT^INT^1^59547,73890^0
%SGPDOUT ;
 
 
 
 
 N RET,RES,LISTEIND,LISTA,MODEARC,NFIC,COM,CTR
LSTIND D CLEPAG^%VVIDEO,AFF0
 S CTR="" D LIRE2^%VREAD("Nom de la liste des individus explicites a archiver : ","",2,75,7,6,"","",.CTR,.LISTEIND)
 Q:(CTR="F")!(CTR="A")
 Q:LISTEIND=""
 G:LISTEIND="?" LSTIND2
 G:LISTEIND="*" LSTATT
 G:'($$EX^%QS0(LISTEIND)) LSTIND
 G LSTATT
LSTIND2 S LLISTE=$$TEMP^%SGUTIL
 K @(LLISTE) S FEN=LLISTE
 D CLEPAG^%VVIDEO,PFEN^%QS0DP,AFFICH^%QUAPAGM
 S LISTEIND=$$UN^%QUAPAGM Q:LISTEIND=""
 D CLEPAG^%VVIDEO,AFF1
LSTATT D LIRE2^%VREAD("Nom de la liste des attributs liens: ","",2,75,9,8,"REAFLIL^%SGPDOUT","$$UCLA^%SGPDOUT",.CTR,.LISTA)
 Q:(CTR="F")!(CTR="A")
 
 D LIRE2^%VREAD("Mode d'archivage : ","",2,40,12,10,"REAFMA^%SGPDOUT","$$UCMODA^%SGPDOUT",.CTR,.MODEARC)
 Q:(CTR="F")!(CTR="A")
 
NFIC S NFIC=WHOIS_".ARC",CTR=""
 D LIRE2^%VREAD("Nom du fichier : ",NFIC,2,75,13,12,"","",.CTR,.NFIC)
 Q:(CTR="F")!(CTR="A")  Q:NFIC=""
 D LIRE2^%VREAD("Commentaire    : ","",2,75,18,15,"","",.CTR,.COM)
 D ON^%VZEATT
 S RES=$$ARCHIDON^%SGPDOU(LISTEIND,LISTA,MODEARC,NFIC,COM)
 D OFF^%VZEATT
 Q
 
 
AFF2 S DX=3,DY=9 X XY W "Nom de la liste des attributs liens : "_LISTA
AFF1 S DX=3,DY=7 X XY W "Nom de la liste des individus explicites a archiver : "_LISTEIND
AFF0 D ^%VZCD0($$^%QZCHW("ARCHIVAGE D'INDIVIDU"))
 Q
 
 
UCLA(LILA,REAF) 
 N Y
 S REAF=0
 G:LILA="??" UCLA2 G:LILA="?" UCLA1
 Q:LILA="" 1 Q:LILA="*" 1 Q:$$EX^%QMLILA(LILA) 1
UCLA1 S Y="23,12\YRLW\1\\\"
 S Y(1)="ensemble des liens a suivre"
 S Y(2)="   <nom d'une liste d'attribut>"
 S Y(3)="   [return] : aucun"
 S Y(4)="   ??       : choix d'une liste d'attributs"
 S Y(5)="   *        : tous les liens"
 D ^%PKPOP,^%VZEAVT("")
 S REAF=1 Q 0
UCLA2 S LILA=$$CHOIX^%QMLILAN,REAF=1
 Q:LILA="" 0 Q 1
 
 
REAFLIL D CLEPAG^%VVIDEO,AFF2 Q
 
 
 
UCMODA(MODEARC,REAF) 
 S REAF=0
 I (((MODEARC=1)!(MODEARC=2))!(MODEARC=3))!(MODEARC=4) Q 1
 S MODEARC="",REAF=1
 D PARAM^%PKPOP("23,12\RLW\1\\\1  attributs simples*,2  1+ liens presents dans la liste d'attributs*,3  2+ individus liens*,4  3+ GRAPPE d'individus lies")
 D ^%VZEAVT("")
 Q 0
 
 
REAFMA D CLEPAG^%VVIDEO,AFF2 Q

