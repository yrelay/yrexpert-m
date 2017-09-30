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
;! Nomprog     : %SGPDIN                                                      !
;! Module      : Sauvegarde (SG)                                              !
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

%SGPDIN ;
 
 
 
 
SGPDIN 
 N VRFREST,COM,NFIC,RENOMAGE
NFICH D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("RESTAURATION D'INDIVIDU"))
 
 S (NFIC,CTR)="" D LIRE2^%VREAD("Nom du fichier : ",NFIC,2,75,9,8,"","",.CTR,.NFIC)
 Q:(CTR="F")!(CTR="A")
 Q:NFIC=""
 G RENOMX
NFICH2(NFIC) 
 D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("RESTAURATION D'INDIVIDU"))
 U 0
 S DX=3,DY=8 X XY W "Nom du fichier : "_NFIC
RENOMX 
 S RENOMAGE="" D LIRE2^%VREAD("Renomage des individus ?(O/N) : ",RENOMAGE,2,40,11,10,"","",.CTR,.RENOMAGE)
 Q:(CTR="F")!(CTR="A")
 S RENOMAGE=$S((RENOMAGE="O")!(RENOMAGE="o"):1,1:0)
 S VRFREST=$$DVERIF(NFIC)
 
 I VRFREST="sauvegarde" D RESTK^%SGPDKSF(NFIC) Q
 
 I VRFREST="inconnu" D RESTSF^%SGPDKSF(NFIC) Q
 
 I '(VRFREST) D RESTPBF^%SGPDKSF(NFIC) Q
 U 0
 S DX=1,DY=14 X XY W COM(1)
 S DY=15 X XY W COM(2)
 S DX=2,DY=22 X XY W "un instant ..."
 D RESTDON^%SGPDIN2(NFIC,RENOMAGE,4)
 Q
 
 
 
DVERIF(NFIC) 
 N IOFI,OKRET
 D OPENFILE^%SYSUTI1(NFIC,"R",.IOFI,.OKRET)
 Q:'(OKRET) 0
 S COM(1)=$$READ^%SYSUTI1(IOFI,.OKLEC)
 
 I $P(COM(1)," ",1)="sauvegarde" D CLOSE^%SYSUTI1(IOFI,"R") Q "sauvegarde"
 
 I $P(COM(1)," ",1)'="archivage" D CLOSE^%SYSUTI1(IOFI,"R") Q "inconnu"
 S COM(2)=$$READ^%SYSUTI1(IOFI,.OKLEC)
 D CLOSE^%SYSUTI1(IOFI,"R")
 Q 1
 
 
ECRAS 
 D CLEPAG^%VVIDEO
 U 0 S DX=4,DY=12 X XY W $$^%QZCHW("Action en cas d'existence ?")
 S MENU2(1)=$$^%QZCHW("Suppression")_"^1",MENU2(2)=$$^%QZCHW("Fusion")_"^2"
 D ^%VQUIKMN(35,78,12,"MENU2",.ECRAS,.CONTR)
 I (CONTR="A")!(CONTR="F") Q
 U 0 S DX=4,DY=15 X XY W $$^%QZCHW("Action en cas d'existence ?")
 S MENU2(1)=$$^%QZCHW("Toujours")_"^1",MENU2(2)=$$^%QZCHW("Confirmer")_"^2",MENU2(3)=$$^%QZCHW("Jamais")_"^3"
 D ^%VQUIKMN(35,78,15,"MENU2",.ECRAS,.CONTR)
 I (CONTR="A")!(CONTR="F") Q
 Q

