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

;%DLLFLUX^INT^1^59547,73868^0
%DLLFLUX(ETU,IMP) 
 
 
 
 
 
 
 
 
 
 
 N M,MC,C,I,OC,OC1,NOC,D,X,Y,ST,FLU,REPL,MACHI,ATTR,LIEN,LISMAC,U,GL,DER,DMI,DMA,LA,AD,DES
 
 S FLU=$$^%QSCALVA($$REP^%DLETUDE,ETU,"ATELIER") Q:FLU=""
 S ATTR=$$^%QSCALVA($$REP^%DLETUDE,ETU,"ATTRIBUT.TOTALISATION")
 I ATTR="" S ATTR="TEMPS.FABRICATION"
 S DES=IMP+1
 D ^%VZEATT
 
DEB K LISMAC,^LISFLUX($J),^OPEFLUX($J)
 S REPL=$$LAN^%DLCON2
 
 S LIEN=$$LIEN1^%QSGEL2(REPL,$$ART^%DLCON2,3)
 
 S MACHI=$$MACHINE^%DLCON2
 
 
LISMAC 
 S X=""
 F U=0:0 S X=$O(^[QUI]DLFLUX(FLU,"POINTS",X)) Q:X=""  S Y="" F U=0:0 S Y=$O(^[QUI]DLFLUX(FLU,"POINTS",X,Y)) Q:Y=""  S M="" F U=0:0 S M=$O(^[QUI]DLFLUX(FLU,"POINTS",X,Y,M)) Q:M=""  S LISMAC(M)=""
 D CUROF^%VVIDEO
 S LA=$$^%QSCALVA($$REP^%DLETUDE,ETU,"LISTE.LANCEMENTS")
 S AD=$$ADRLIS^%QSGEST7(LA)
 Q:(AD=0)!(AD="")
 S LA=""
BLAN 
 S LA=$O(@AD@(LA)) G:LA="" FIN
 
 S M=""
 S DER=$$PRVRIAO^%QSTRUC8(REPL,LA,$$DATEJAL^%DLCON2,"")
 
 S I=0
L1 I DES=0 R *ST:0 G ABORT:ST=1
 S I=I+1 G:I>DER BLAN
 
 I DES=0 W "."
 S M=$$^%QSCALIN(REPL,LA,MACHI,I) G L1:M="",L1:'($D(LISMAC(M)))
 
 S OC1=$$^%QSCALIN(REPL,LA,"NUMERO.OPERATION",I) G:OC1="" L1
 
 S C=$$^%QSCALVA(REPL,LA,LIEN)_","_$$^%QSCALVA(REPL,LA,"GAMME")
 
 S OC=C_","_$$^%QSCALIN($$GAMME^%DLCON2,C,$$GO^%DLCON2,OC1)
L2 I DES=0 R *ST:0 G ABORT:ST=1
 S NOC=$$^%QSCALIN(REPL,LA,"NUMERO.OPERATION",I+1) G L1:NOC=""
 
 S OC1=$$^%QSCALIN($$GAMME^%DLCON2,C,$$GO^%DLCON2,NOC) G L1:OC1=""
 
 S MC=$$^%QSCALIN(REPL,LA,MACHI,I+1)
 
 G L1:MC="",L1:'($D(LISMAC(MC)))
 S ^LISFLUX($J,M,MC)=$$^%QCAZG("^LISFLUX($J,M,MC)")+$$CALVA^%DLFGVAL(C_","_OC1,MC,ATTR)
 S ^OPEFLUX($J,M,OC)=""
 S ^OPEFLUX($J,MC,C_","_OC1)=""
 I DES=0 W "*"
 G L1
 
FIN D CURON^%VVIDEO
 S DMI=$$NXTRIAV^%QSTRUC8(REPL,LA,$$DATEJAL^%DLCON2,"")
 S DMA=$$PRVRIAV^%QSTRUC8(REPL,LA,$$DATEJAL^%DLCON2,"")
 S DMI=$$02^%QMDATE1(DMI)
 S DMA=$$02^%QMDATE1(DMA)
 D ^%DLFLDES("^LISFLUX($J)","^OPEFLUX($J)",FLU,DMI,DMA,"FLUX JALONNE, exprime en "_ATTR,DES)
 K ^LISFLUX($J),^OPEFLUX($J)
 Q
 
ABORT D ^%VZEAVT("Abandon par decision de l'utilisateur.") Q
 
 
 
EXI 
 N FLU
 S FLU=RESUL(ICC)
 I FLU="" Q
 I FLU'="?" S REFUSE='($D(^[QUI]DLFLUX(FLU))) D:REFUSE=1 ^%VZEAVT($$^%QZCHW("Schema de flux inconnu")) Q
 D AFF^%VYREP("^[QUI]DLFLUX")
 Q
 
 
 
EXT(ETU) 
 N M,MC,C,I,OC,OC1,NOC,D,X,Y,ST,FLU,REPL,MACHI,ATTR,LIEN,LISMAC,U,GL,DER,DMI,DMA,LA,AD,DES,EX
 D TIT
EXF 
 S DX=0,DY=8 D CLEBAS^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW("Schema de flux")_" : ","",8,RM-4,DY+1,DY-1,"","",.CTR,.FLU)
 Q:FLU=""
 I CTR'="" Q
 I FLU="?" S FLU=$$SELECT^%QSGEST6("^[QUI]DLFLUX") D TIT G:FLU="" EXF
 I '($D(^[QUI]DLFLUX(FLU))) D ^%VZEAVT($$^%QZCHW("Schema de flux inconnu")) G EXF
EXA 
 S DX=0,DY=12 D CLEBAS^%VVIDEO
 D LIRE2^%VREAD($$^%QZCHW("Attribut de totalisation")_" : ","",8,RM-4,DY+1,DY-1,"","",.CTR,.ATTR)
 I CTR'="" G EXF
 I ATTR="" S ATTR="TEMPS.FABRICATION" G EXE
 S EX=$$LEX^%LXSTOCK(ATTR,.ATTR)
 I EX=1 G EXE
 I EX=2 D ^%VZEAVT($$^%QZCHW("Attribut ambigu")) G EXA
 D ^%VZEAVT($$^%QZCHW("Attribut inconnu")) G EXA
 
EXE S DX=9,DY=12 X XY W $$^%QZCHW("Attribut de totalisation")," : ",ATTR
 D POCLEPA^%VVIDEO X XY W $$^%QZCHW("Taper CTRLA pour abandonner...")
 S DES=0
 G DEB
 
TIT D CLEPAG^%VVIDEO,^%VZCD0("REPRESENTATION DES FLUX JALONNES")
 Q

