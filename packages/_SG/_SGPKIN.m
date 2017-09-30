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

;%SGPKIN^INT^1^59547,73890^0
%SGPKIN ;;09:08 AM  9 Sep 1993; ; 02 Jul 93  2:48 PM
 
 
 
AFF N NFIC
 D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("RESTAURATION DE CONNAISSANCE"))
 S DX=4,DY=6 X XY W !,"nom du fichier : " R NFIC
 G AFF3
AFF2(NFIC) 
 D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("RESTAURATION DE CONNAISSANCE"))
 S DX=4,DY=6 X XY W !,"nom du fichier : "_NFIC
AFF3 N ENSOBJ,Y1,I,RES,MENU1,MENU2,EXAM,NOTALL,OKRET,IOFI,OKLEC
 N ETTL,EREQ,EFOR,EMOD,EREQ,EPSV,EMSQ,LCHX,ENSLOAD,EPRD
 N X,Y,Z,T,COM,TYPE,ECRAS,WRITE,OBJ,RET,%II,ICOUR,LCH
 N LC,CA,GLO,VG,CODE,GCODE,OKCODE
 S ENSOBJ=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"OBJ") K @(ENSOBJ)
 S LCHX=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"CHX") K @(LCHX)
 S ETTL=$$CONCAS^%QZCHAD(LCHX,"TRT"),EMOD=$$CONCAS^%QZCHAD(LCHX,"MOD")
 S EFOR=$$CONCAS^%QZCHAD(LCHX,"FOR"),EREQ=$$CONCAS^%QZCHAD(LCHX,"REQ")
 S EPSV=$$CONCAS^%QZCHAD(LCHX,"PSV"),EMSQ=$$CONCAS^%QZCHAD(LCHX,"MSQ")
 S EPRD=$$CONCAS^%QZCHAD(LCHX,"PRD")
 S ENSLOAD=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LD") K @(ENSLOAD)
 D OPENFILE^%SYSUTI1(NFIC,"R",.IOFI,.OKRET)
 
 I '(OKRET) D RESTPBF^%SGPDKSF(NFIC) Q
 S COM(1)=$$READ^%SYSUTI1(IOFI,.OKLEC)
 
 I $P(COM(1)," ",1)="archivage" D CLOSE^%SYSUTI1(IOFI,"R"),RESTD^%SGPDKSF(NFIC) Q
 
 I $P(COM(1)," ",1)'="sauvegarde" D CLOSE^%SYSUTI1(IOFI,"R"),RESTSF^%SGPDKSF(NFIC) Q
 S COM(2)=$$READ^%SYSUTI1(IOFI,.OKLEC)
 S CODE=$P(COM(2),$C(0),2),COM(2)=$P(COM(2),$C(0))
 S GCODE=$$TEMP^%SGUTIL
 
 S OKCODE=1
 D:OKCODE PROLREST^%INCOIN2(GCODE)
 U 0 S DX=4,DY=8 X XY W COM(1) S DY=9 X XY W COM(2)
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
 S RET="LEC^%SGPKIN",EXAM=1
LEC S TYPE=$$READ^%SYSUTI1(IOFI,.OKLEC)
 G:TYPE="TRAITEMENT" INTRT^%SGPKIN2 G:TYPE="MODELE" INMOD^%SGPKIN2 G:TYPE="FORMAT" INFOR^%SGPKIN2 G:TYPE="REQUETE" INREQ^%SGPKIN2 G:TYPE="PASSERELLE SUITE DE VALEURS" INPSV^%SGPKIN2
 G:TYPE="MASQUE DE SAISIE" INMSQ^%SGPKIN3
 G:TYPE="PREDICAT" INPRD^%SGPKIN3
 G:TYPE="MOTS UTILISES" INLEX^%SGPKIN2
 
 D CLOSE^%SYSUTI1(IOFI,"R")
 I $D(@ENSOBJ@("TRAITEMENTS")) D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("TRAITEMENTS A RESTAURER")),INIT^%QUCHOIP($$CONCAS^%QZCHAD(ENSOBJ,"TRAITEMENTS"),1,"",0,5,80,17),AFF^%QUCHOIP,^%QUCHOYP(ETTL),END^%QUCHOIP
 I $D(@ENSOBJ@("MODELES")) D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("MODELES A RESTAURER")),INIT^%QUCHOIP($$CONCAS^%QZCHAD(ENSOBJ,"MODELES"),1,"",0,5,80,17),AFF^%QUCHOIP,^%QUCHOYP(EMOD),END^%QUCHOIP
 I $D(@ENSOBJ@("FORMATS")) D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("FORMATS A RESTAURER")),INIT^%QUCHOIP($$CONCAS^%QZCHAD(ENSOBJ,"FORMATS"),1,"",0,5,80,17),AFF^%QUCHOIP,^%QUCHOYP(EFOR),END^%QUCHOIP
 I $D(@ENSOBJ@("REQUETES")) D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("REQUETES A RESTAURER")),INIT^%QUCHOIP($$CONCAS^%QZCHAD(ENSOBJ,"REQUETES"),1,"",0,5,80,17),AFF^%QUCHOIP,^%QUCHOYP(EREQ),END^%QUCHOIP
 I $D(@ENSOBJ@("PASSERELLES SUITE DE VALEURS")) D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("PASSERELLES SV A RESTAURER")),INIT^%QUCHOIP($$CONCAS^%QZCHAD(ENSOBJ,"PASSERELLES SUITE DE VALEURS"),1,"",0,5,80,17),AFF^%QUCHOIP,^%QUCHOYP(EPSV),END^%QUCHOIP
 I $D(@ENSOBJ@("MASQUES DE SAISIE")) D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("MASQUES A RESTAURER")),INIT^%QUCHOIP($$CONCAS^%QZCHAD(ENSOBJ,"MASQUES DE SAISIE"),1,"",0,5,80,17),AFF^%QUCHOIP,^%QUCHOYP(EMSQ),END^%QUCHOIP
 I $D(@ENSOBJ@("PREDICATS")) D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("PREDICATS A RESTAURER")),INIT^%QUCHOIP($$CONCAS^%QZCHAD(ENSOBJ,"PREDICATS"),1,"",0,5,80,17),AFF^%QUCHOIP,^%QUCHOYP(EPRD),END^%QUCHOIP
 D CLEPAG^%VVIDEO
 D OPENFILE^%SYSUTI1(NFIC,"R",.IOFI,.OKRET)
 S COM(1)=$$READ^%SYSUTI1(IOFI,.OKLEC)
 S COM(2)=$$READ^%SYSUTI1(IOFI,.OKLEC)
TRAIT S RET="SUITE^%SGPKIN",EXAM=0
SUITE S TYPE=$$READ^%SYSUTI1(IOFI,.OKLEC)
 G:TYPE="TRAITEMENT" INTRT^%SGPKIN2 G:TYPE="MODELE" INMOD^%SGPKIN2 G:TYPE="FORMAT" INFOR^%SGPKIN2 G:TYPE="REQUETE" INREQ^%SGPKIN2 G:TYPE="PASSERELLE SUITE DE VALEURS" INPSV^%SGPKIN2
 G:TYPE="MASQUE DE SAISIE" INMSQ^%SGPKIN3
 G:TYPE="PREDICAT" INPRD^%SGPKIN3
 G:TYPE="MOTS UTILISES" INLEX^%SGPKIN2
 D CLOSE^%SYSUTI1(IOFI,"R")
 
REAN 
 S ICOUR=0
 I $D(@ENSLOAD@("TRT")) S LCH=$$^%QZCHW("du traitement"),OBJ="" F I=0:0 S OBJ=$O(@ENSLOAD@("TRT",OBJ)) Q:OBJ=""  D PROLA S RES=$$^%TLIANAL(OBJ,0,0,.Y1) D EPILA
 I $D(@ENSLOAD@("MOD")) S LCH=$$^%QZCHW("du modele"),OBJ="" F I=0:0 S OBJ=$O(@ENSLOAD@("MOD",OBJ)) Q:OBJ=""  D PROLA S RES=$$^%EDMANAL(OBJ,0) D EPILA
 I $D(@ENSLOAD@("FOR")) S LCH=$$^%QZCHW("du format"),OBJ="" F I=0:0 S OBJ=$O(@ENSLOAD@("FOR",OBJ)) Q:OBJ=""  D PROLA S RES=$$^%EDFANAL(OBJ,0) D EPILA
 I $D(@ENSLOAD@("RQS")) S LCH=$$^%QZCHW("de la requete"),OBJ="" F I=0:0 S OBJ=$O(@ENSLOAD@("RQS",OBJ)) Q:OBJ=""  D PROLA S RES=$$ANALYSER^%QSINTER(OBJ) D EPILA
 I $D(@ENSLOAD@("PSV")) S LCH=$$^%QZCHW("de la passerelle"),OBJ="" F I=0:0 S OBJ=$O(@ENSLOAD@("PSV",OBJ)) Q:OBJ=""  D PROLA S RES='($$VALID^LKYVALI(OBJ,0)) D EPILA
 I $D(@ENSLOAD@("MSQ")) S LCH=$$^%QZCHW("du masque de saisie"),OBJ="" F I=0:0 S OBJ=$O(@ENSLOAD@("MSQ",OBJ)) Q:OBJ=""  D PROLA S RES=$$ACT^%SRVALID(OBJ,0) D EPILA
 I $D(@ENSLOAD@("PRD")) S LCH=$$^%QZCHW("du predicat"),OBJ="" F I=0:0 S OBJ=$O(@ENSLOAD@("PRD",OBJ)) Q:OBJ=""  D PROLA S RES=$$ANALYSE^%PSPRGES(OBJ) D EPILA
 
 D:OKCODE EPILREST^%INCOIN2(GCODE)
 Q
 
PROLA G:ICOUR>3 PROLAC
 S ICOUR=ICOUR+1
 S XX(ICOUR)=$E($$^%QZCHW("Analyse")_" "_LCH_" "_OBJ,1,65)
 F %II=1:1:ICOUR D LIGA(%II)
 Q
PROLAC F %II=1:1:3 S XX(%II)=XX(%II+1)
 S XX(4)=$E($$^%QZCHW("Analyse")_" "_LCH_" "_OBJ,1,65)
 F %II=1:1:4 D LIGA(%II)
 Q
EPILA S XX(ICOUR)=XX(ICOUR)_" ("_$S(RES:"OK",1:$$^%QZCHW("Probleme"))_")" D LIGA(ICOUR) Q
 
LIGA(I) U 0 S DX=4,DY=15+I X XY W $J(" ",74) X XY W XX(I) Q
 
TEST N XX
 S ICOUR=0
 S LCH=$$^%QZCHW("du traitement"),OBJ="" F I=0:1:10 S OBJ=$C($A("A")+I) D PROLA S RES=I#2 H 5E-1 D EPILA
 Q
 ;
 ;

