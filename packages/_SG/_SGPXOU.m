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
;! Nomprog     : %SGPXOU                                                      !
;! Module      : SG (Sauvegarde diverse)                                      !
;! But         : Gérer les sauvegardes diverses                               !
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

%SGPXOU ;
 
 
 
 N Y1,I,RES,MENU1,IOFI,OKOPEN,AVECLEX,MENU,NFIC,COM,CONTR,OB,%O
 N EOBJ,ESCHEM,MSQ,ENSCHX,WECR,EPRD
 N ESCHEM
 S WECR=1
 S EOBJ=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LFOR") K @(EOBJ)
 S ENSCHX=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"CHX") K @(ENSCHX)
 S ESCHEM=$$CONCAS^%QZCHAD(EOBJ,"TTL")
AFF K @(EOBJ),@(ENSCHX)
 D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("SAUVEGARDE"))
 S (@ENSCHX@("SCHEMAS DE DONNEES"))=""
 S (@ENSCHX@("AUTRES"))=""
 K @(EOBJ)
 D INIT^%QUCHOIP(ENSCHX,1,"",0,5,80,17),AFF^%QUCHOIP
 D ^%QUCHOYP(EOBJ),END^%QUCHOIP
 I $D(@EOBJ@("AUTRES")) D CLEPAG^%VVIDEO,^%SGPXOU2 Q
 I $D(@EOBJ@("SCHEMAS DE DONNEES")) D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("SCHEMAS A SAUVEGARDER")),INIT^%QUCHOIP("^RQSMOD",1,"",0,5,80,17),AFF^%QUCHOIP,^%QUCHOYP(ESCHEM),END^%QUCHOIP
 D CLEPAG^%VVIDEO
 S NFIC=WHOIS_".ARC",CTR="" D LIRE2^%VREAD("Nom du fichier : ",NFIC,2,40,6,7,"","",.CTR,.NFIC) Q:CTR'=""
 S COM="" D LIRE2^%VREAD("Commentaire    : ",COM,2,75,8,9,"","",.CTR,.COM)
 
 
 
 
 
 D ARCHISCH(ESCHEM,NFIC,COM)
 Q
ARCHISCH(ESCHEM,NFIC,COM) 
 N OB,%O
 S AVECLEX=0
SUITE D OPENFILE^%SYSUTI1(NFIC,"W",.IOFI,.OKOPEN)
 I '(OKOPEN) D ^%VZEAVT($$^%QZCHW("probleme sur l'ouverture du fichier")) Q
 D WRITE^%SYSUTI1(IOFI,$$^%QZCHW("sauvegarde de")_" "_WHOIS_" "_$$^%QZCHW("le")_" "_$$DATE^%QMDATE_" a "_$$HEURE^%QMDATE_"(version 1.1)")
 D WRITE^%SYSUTI1(IOFI,COM)
 S OB="" F %O=1:1 S OB=$O(@ESCHEM@(OB)) Q:OB=""  D SCHEMA^%SGPXOU1(OB)
 D:AVECLEX LEX^%SGPKOU2
 D WRITE^%SYSUTI1(IOFI,""),WRITE^%SYSUTI1(IOFI,"")
 D CLOSE^%SYSUTI1(IOFI,"W")
 Q

