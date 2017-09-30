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

;%UTSTCP^INT^1^59547,74033^0
%UTSTCP ;;05:49 PM  10 Jul 1992; ; 10 May 93  4:46 PM
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
INORM N CTRL,EMUL,NFICH
 S (CTRL,EMUL)=""
 D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("IMPRESSION DE FICHIER DOS"))
 D LIRE2^%VREAD("Nom du fichier : ","",2,75,13,12,"","",.CTRL,.NFICH)
 Q:(CTRL="F")!(CTRL="A")
 Q:NFICH=""
 D NORMF(NFICH)
 Q
 
NORMF(fichier) 
 N I,X,OKRET,OKLEC,IOFI
 D OPENFILE^%SYSUTI1(fichier,"R",.IOFI,.OKRET)
 Q:'(OKRET)
 O 30
 F I=1:1 S X=$$READ^%SYSUTI1(IOFI,.OKLEC) Q:X=""  U 30 W X,!
 D CLOSE^%SYSUTI1(IOFI,"R")
 C 30
 Q
 
 
HP N CTRL,EMUL,NFICH
 S (CTRL,EMUL)=""
 D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("IMPRESSION DE FICHIER DOS"))
 D LIRE2^%VREAD("Nom du fichier : ","",2,75,13,12,"","",.CTRL,.NFICH)
 Q:(CTRL="F")!(CTRL="A")
 Q:NFICH=""
 D HPF(NFICH)
 Q
 
HPF(fichier) 
 N I,X,OKRET,OKLEC,IOFI
 D OPENFILE^%SYSUTI1(fichier,"R",.IOFI,.OKRET)
 Q:'(OKRET)
 O 30
 F I=1:1 S X=$$READ^%SYSUTI1(IOFI,.OKLEC) Q:X=""  U 30 W X
 D CLOSE^%SYSUTI1(IOFI,"R")
 C 30
 Q
 
BATCH(TRT,LISTE) 
 N RES,SAV
 Q:'($$EXISTE^%TLGEST(TRT))
 Q:'($$EX^%QS0(LISTE))
 S SAV=^TABIDENT(WHOIS,"TABTRA")
 S ^TABIDENT(WHOIS,"TABTRA")=32
 S RES=$$ACTIVL^%TLIACTI(TRT,LISTE,0,0)
 D REINIT^%EDPRLG
 D NORMF("print.tmp")
 S ^TABIDENT(WHOIS,"TABTRA")=SAV
 Q
 
INITEM 
 N EMUL,%EMUL
 S TEMP=$$TEMP^%SGUTIL K @(TEMP)
 S GLOB=$$CONCAS^%QZCHAD(TEMP,"EM")
 S CORRESP=$$CONCAS^%QZCHAD(TEMP,"CORR")
 
 
 
 
 S EMUL="" F %EMUL=0:0 S EMUL=$O(^%ENVIRON(EMUL)) Q:EMUL=""  S @GLOB@(EMUL)=""
 Q
 
GET(L,EM) 
 S EM=@CORRESP@($P(L," ")) Q
 
TETE D ^%VZCD(0,39,0,2,1,0,$$^%QZCHW("EMULATIONS")) Q
 
AFF D AFF^%QUCHOI4(ZZ)
 
CALA 
 D ^%VZEATT
 S ZZ=$ZP(^[QUI]QX($J))+1
 D CONSTAB(ZZ)
 S X=$$INI^%QUCHOI4(1,"",0,4,79,17,"    EMULATIONS                ",ZZ,0)
 D OFF^%VZEATT
 Q
 
CONSTAB(P) 
 N K,J,PR
 K ^[QUI]QX($J,P)
 S ^[QUI]QX($J,P,"LC",1)=30,^[QUI]QX($J,P,"LC",2)=30,^[QUI]QX($J,P,"LC",3)=4
 S PR="" F J=1:1 S PR=$O(@GLOB@(PR)) Q:PR=""  S ^[QUI]QX($J,P,"T",J,1)=$E(PR,1,30),@CORRESP@($E(PR,1,29))=PR I $D(@GLOB@(PR,1))#10 S ^[QUI]QX($J,P,"T",J,2)=$E(@GLOB@(PR,1),1,30) I $D(@GLOB@(PR,2))#10 S ^[QUI]QX($J,P,"T",J,3)="..."
 Q
 
 
 
VFICH N EMUL,TEMP,GLOB,CORRESP
 S EMUL=""
 D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("IMPRESSION VERS FICHIER"))
 D LECTEM(.EMUL)
 Q:EMUL=""
 Q:'($D(@GLOB@(EMUL)))
 S ^TABIDENT(WHOIS,"TABTRA")=32,$P(^TABIDENT(WHOIS),"^",10)=32
 S ^TABIDENT(WHOIS,"TYPTAB")=EMUL,$P(^TABIDENT(WHOIS),"^",11)=EMUL
 K @(TEMP)
 Q
 
VIMP N EMUL,TEMP,GLOB,CORRESP
 S EMUL=""
 D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("IMPRESSION VERS IMPRIMANTE"))
 D LECTEM(.EMUL)
 Q:EMUL=""
 Q:'($D(@GLOB@(EMUL)))
 S ^TABIDENT(WHOIS,"TABTRA")=30,$P(^TABIDENT(WHOIS),"^",10)=30
 S ^TABIDENT(WHOIS,"TYPTAB")=EMUL,$P(^TABIDENT(WHOIS),"^",11)=EMUL
 K @(TEMP)
 Q
 
 
LECTEM(EMUL) 
 N CTR,X,ZZ
 S (X,CTR)=""
 D INITEM
 D LIRE2^%VREAD("Emulation d'impression : ","",2,75,13,12,"","",.CTR,.EMUL)
 Q:(CTR="F")!(CTR="A")
 Q:EMUL=""
 I EMUL="?" D CLEPAG^%VVIDEO,TETE,CALA,AFF S X=$$UN^%QUCHOI4(ZZ) G ECREM
 I '($D(@GLOB@(EMUL))) D CLEPAG^%VVIDEO,TETE,CALA,AFF S X=$$UN^%QUCHOI4(ZZ)
ECREM Q:X=""
 D GET(X,.EMUL)
 Q
 
 
IMPFICH 
 N CTRL,EMUL,TEMP,GLOB,CORRESP,NFICH
 S (CTRL,EMUL)=""
 D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("IMPRESSION DE FICHIER DOS"))
 D LIRE2^%VREAD("Nom de fichier : ","",2,75,7,6,"","",.CTRL,.NFICH)
 Q:(CTRL="F")!(CTRL="A")
 Q:NFICH=""
 D LECTEM(.EMUL)
 Q:EMUL=""
 Q:'($D(@GLOB@(EMUL)))
 U 0
 D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("IMPRESSION DE FICHIER DOS"))
 S DX=3,DY=7 X XY W "Nom de fichier : "_NFICH
 S DX=3,DY=13 X XY W "Emulation d'impression : "_EMUL
 S DX=2,DY=22 X XY W "un instant ..."
 D:(EMUL="HP")!(EMUL="HP-KYO") HPF(NFICH)
 D:(EMUL="POSTSCRIPT")!(EMUL="KYO") NORMF(NFICH)
 K @(TEMP)
 Q
 ;

