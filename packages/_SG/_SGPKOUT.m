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

;%SGPKOUT^INT^1^59547,73891^0
%SGPKOUT ;;08:22 PM  2 Sep 1992; ; 02 Jul 93  2:36 PM
 
 
 
 
 
 N Y1,I,RES,MENU1,IOFI,OKOPEN,AVECLEX,MENU,NFIC,COM,CONTR,OB,%O
 N EOBJ,ETTL,EMOD,EFOR,ERQS,EPSV,MSQ,ENSCHX,WECR,EPRD,MES,RESSTO
 S WECR=1
 S EOBJ=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LFOR") K @(EOBJ)
 S ENSCHX=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"CHX") K @(ENSCHX)
 S ETTL=$$CONCAS^%QZCHAD(EOBJ,"TTL"),EMOD=$$CONCAS^%QZCHAD(EOBJ,"MOD")
 S EFOR=$$CONCAS^%QZCHAD(EOBJ,"FOR"),ERQS=$$CONCAS^%QZCHAD(EOBJ,"RQS")
 S EPSV=$$CONCAS^%QZCHAD(EOBJ,"PSV"),EMSQ=$$CONCAS^%QZCHAD(EOBJ,"MSQ")
 S EPRD=$$CONCAS^%QZCHAD(EOBJ,"PRD")
AFF K @(EOBJ),@(ENSCHX)
 D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("SAUVEGARDE DE CONNAISSANCE"))
 S (@ENSCHX@("TRAITEMENTS"),@ENSCHX@("MODELES"),@ENSCHX@("FORMATS"),@ENSCHX@("REQUETES"),@ENSCHX@("PASSERELLES SUITE DE VALEURS"),@ENSCHX@("MASQUES DE SAISIE"),@ENSCHX@("PREDICATS"))=""
 K @(EOBJ)
 D INIT^%QUCHOIP(ENSCHX,1,"",0,5,80,17),AFF^%QUCHOIP
 D ^%QUCHOYP(EOBJ),END^%QUCHOIP
 I $D(@EOBJ@("TRAITEMENTS")) D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("TRAITEMENTS A SAUVEGARDER")),INIT^%QUCHOIP("^[QUI]TTL",1,"",0,5,80,17),AFF^%QUCHOIP,^%QUCHOYP(ETTL),END^%QUCHOIP
 I $D(@EOBJ@("MODELES")) D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("MODELES A SAUVEGARDER")),INIT^%QUCHOIP("^[QUI]EDMOD",1,"",0,5,80,17),AFF^%QUCHOIP,^%QUCHOYP(EMOD),END^%QUCHOIP
 I $D(@EOBJ@("FORMATS")) D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("FORMATS A SAUVEGARDER")),INIT^%QUCHOIP("^[QUI]EDFORMAT",1,"",0,5,80,17),AFF^%QUCHOIP,^%QUCHOYP(EFOR),END^%QUCHOIP
 I $D(@EOBJ@("REQUETES")) D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("REQUETES A SAUVEGARDER")),INIT^%QUCHOIP("^[QUI]RQS1",1,"",0,5,80,17),AFF^%QUCHOIP,^%QUCHOYP(ERQS),END^%QUCHOIP
 I $D(@EOBJ@("PASSERELLES SUITE DE VALEURS")) D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("PASSERELES SV A SAUVEGARDER")),INIT^%QUCHOIP("^[QUI]LKY2",1,"",0,5,80,17),AFF^%QUCHOIP,^%QUCHOYP(EPSV),END^%QUCHOIP
 I $D(@EOBJ@("MASQUES DE SAISIE")) D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("MASQUES DE SAISIE A SAUVEGARDER")),INIT^%QUCHOIP("^[QUI]RQSGLO(""SR"",""DEF"")",1,"",0,5,80,17),AFF^%QUCHOIP,^%QUCHOYP(EMSQ),END^%QUCHOIP
 I $D(@EOBJ@("PREDICATS")) D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("PREDICATS A SAUVEGARDER")),INIT^%QUCHOIP("^[QUI]RQSGLO(""PRED"")",1,"",0,5,80,17),AFF^%QUCHOIP,^%QUCHOYP(EPRD),END^%QUCHOIP
LECFICH 
 D CLEPAG^%VVIDEO
 S NFIC=WHOIS_".ARC",CTR="" D LIRE2^%VREAD("Nom du fichier : ",NFIC,2,40,6,7,"","",.CTR,.NFIC) Q:CTR'=""
 S COM="" D LIRE2^%VREAD("Commentaire    : ",COM,2,75,8,9,"","",.CTR,.COM)
 ;;I $D(@EOBJ@("MASQUES DE SAISIE")) S AVECLEX=0 G SUITE
 S MENU1(1)=$$^%QZCHW("OUI")_"^1",MENU1(2)=$$^%QZCHW("NON")_"^0"
 U 0 S DX=3,DY=12 X XY W $$^%QZCHW("Sauvegarde des mots du lexique associes ?")
 D ^%VQUIKMN(50,70,12,"MENU1",.AVECLEX,.CONTR)
 I (CONTR="A")!(CONTR="F") Q
 S:AVECLEX'=0 AVECLEX=1
SUITE S RESSTO=$$FILE(NFIC,ETTL,EMOD,EFOR,ERQS,EPSV,EMSQ,EPRD,AVECLEX,COM,WECR,.MES)
 I '(RESSTO) D ^%VZEAVT(MES) G LECFICH
 Q
 
 
FILE(NFIC,ETTL,EMOD,EFOR,ERQS,EPSV,EMSQ,EPRD,AVECLEX,COM,WECR,MES) 
 N IOFI,OKOPEN,OB,%O
 D OPENFILE^%SYSUTI1(NFIC,"W",.IOFI,.OKOPEN)
 I '(OKOPEN) S MES=$$^%QZCHW("probleme sur l'ouverture du fichier") Q 0
 D WRITE^%SYSUTI1(IOFI,$$^%QZCHW("sauvegarde de")_" "_WHOIS_" "_$$^%QZCHW("le")_" "_$$DATE^%QMDATE_" a "_$$HEURE^%QMDATE_"(version 1.1)")
 D WRITE^%SYSUTI1(IOFI,COM_$S('($D(^INCONNE("SAVE"))):"",^INCONNE("SAVE")="YXP":$C(0)_$$CODE^%INCOIN2,1:""))
 S OB="" F %O=1:1 S OB=$O(@ETTL@(OB)) Q:OB=""  D t^%SGPKOU3
 S OB="" F %O=1:1 S OB=$O(@EMOD@(OB)) Q:OB=""  D m^%SGPKOU3
 S OB="" F %O=1:1 S OB=$O(@EFOR@(OB)) Q:OB=""  D f^%SGPKOU3
 S OB="" F %O=1:1 S OB=$O(@ERQS@(OB)) Q:OB=""  D r^%SGPKOU3
 S OB="" F %O=1:1 S OB=$O(@EPSV@(OB)) Q:OB=""  D psv^%SGPKOU3
 S OB="" F %O=1:1 S OB=$O(@EMSQ@(OB)) Q:OB=""  D msq^%SGPKOU3
 S OB="" F %O=1:1 S OB=$O(@EPRD@(OB)) Q:OB=""  D prd^%SGPKOU3
 D:AVECLEX LEX^%SGPKOU2
 D WRITE^%SYSUTI1(IOFI,""),WRITE^%SYSUTI1(IOFI,"")
 D CLOSE^%SYSUTI1(IOFI,"W")
 Q 1

