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
;! Nomprog     : %SGPXIN                                                      !
;! Module      : Sauvegarde et restauration (SG)                              !
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

%SGPXIN ;
 
 
 
 N Y1,I,RES,MENU1,IOFI,OKOPEN,AVECLEX,MENU,NFIC,COM,CONTR,OB,%O
 N EOBJ,ESCHEM,MSQ,ENSCHX,WECR,EPRD
 N ESCHEM,NATRESTO
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
 S NATRESTO=$$UN^%QUCHOIP D END^%QUCHOIP
 I NATRESTO="AUTRES" D IN^TOGSSFOU Q
 I NATRESTO="SCHEMAS DE DONNEES" D RESTCHEM Q
 D CLEPAG^%VVIDEO
 Q
 
 
RESTCHEM 
 N ENSOBJ,Y1,I,RES,MENU1,MENU2,EXAM,NOTALL,OKRET,IOFI,OKLEC
 N ESCHEM,LCHX,ENSLOAD,EPRD
 N X,Y,Z,T,COM,NFIC,TYPE,ECRAS,WRITE,OBJ,RET,%II,ICOUR,LCH
 S ENSOBJ=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"OBJ") K @(ENSOBJ)
 S LCHX=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"CHX") K @(LCHX)
 S ESCHEM=$$CONCAS^%QZCHAD(LCHX,"SCHEMAS DE DONNEES")
 S ENSLOAD=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LD") K @(ENSLOAD)
 D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("RESTAURATIONS DE SCHEMAS"))
 S DX=4,DY=6 X XY W !,"nom du fichier : " R NFIC
 D OPENFILE^%SYSUTI1(NFIC,"R",.IOFI,.OKRET)
 Q:'(OKRET)
 S COM(1)=$$READ^%SYSUTI1(IOFI,.OKLEC)
 S COM(2)=$$READ^%SYSUTI1(IOFI,.OKLEC)
 U 0 S DX=4,DY=8 X XY W COM(1) S DY=9 X XY W COM(2)
 D CLOSE^%SYSUTI1(IOFI,"R")
MEN S MENU1(1)=$$^%QZCHW("OUI")_"^0",MENU1(2)=$$^%QZCHW("NON")_"^1"
 U 0 S DX=4,DY=10 X XY W $$^%QZCHW("Tous les elements ?")
 D ^%VQUIKMN(35,70,10,"MENU1",.NOTALL,.CONTR)
 I (CONTR="A")!(CONTR="F") Q
 S:NOTALL'=0 NOTALL=1
 U 0 S DX=4,DY=12 X XY W $$^%QZCHW("Ecrasement en cas d'existence ?")
 S MENU2(1)=$$^%QZCHW("TOUJOURS")_"^1",MENU2(2)=$$^%QZCHW("CONFIRMER")_"^2"
 S MENU2(3)=$$^%QZCHW("JAMAIS")_"^0"
 D ^%VQUIKMN(35,78,12,"MENU2",.ECRAS,.CONTR)
 I (CONTR="A")!(CONTR="F") Q
 S:ECRAS="" ECRAS=2
 G:'(NOTALL) TRAIT
 D LISCHEM^%SGPXIN2(NFIC,ENSOBJ)
 I $D(@ENSOBJ@("SCHEMAS DE DONNEES")) D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("SCHEMAS A RESTAURER")),INIT^%QUCHOIP($$CONCAS^%QZCHAD(ENSOBJ,"SCHEMAS DE DONNEES"),1,"",0,5,80,17),AFF^%QUCHOIP,^%QUCHOYP(ESCHEM),END^%QUCHOIP
 D CLEPAG^%VVIDEO
TRAIT D CHARGER^%SGPXIN2(NFIC,'(NOTALL),LCHX,ECRAS,1,ENSLOAD)
 Q

