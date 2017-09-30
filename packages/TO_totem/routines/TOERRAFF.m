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

;TOERRAFF^INT^1^59547,74872^0
TOERRAFF ;
 
 D CLEPAG^%VVIDEO S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("Parametres deja evalues") D TO4^%VZCD K DXD,DXG,DYH,DYB,GRAPH,MSG D POCLEPA^%VVIDEO W $$^%QZCHW("Un instant...")
 K ^VARMEM($I) S %1=$T(VAR),%1=$P(%1,";;",2) F %2=1:1 S %3=$P(%1,",",%2) Q:%3=""  I $D(@%3) S ^VARMEM($I,%3)=@%3
 K %1,%2,%3 D ^%QCAMEMS K  D CURRENT^%IS,VARSYS^%QCSAP S %1=-1 F %2=1:1 S %1=$N(^VARMEM($I,%1)) Q:%1=-1  S @%1=^VARMEM($I,%1)
 S %1C="ART" I %TABTV'["TVPAR" S %1C="MAT"
 K ^TACOMPIL($I) S %2C="ART",%Y=8,%P=1,%TAB="^[QUI]ORDEVAL(NUFA,TWREF,""ART"")",%1=-1 F %2=1:1 S %1=$N(@%TAB@(%1)) Q:%1=-1  S %X=0 D AF S %11=-1 F %21=1:1 S %11=$N(@%TAB@(%1,%11)) Q:%11=-1  S %X=5 D AF2
 S %PA=%P S:'($D(^TACOMPIL($I,%2C,%PA))) %PA=%PA-1
 I %1C="MAT",$D(MSS) S %TAB="^ORDEVAL($I,TWREF,MSS)" G S1
 S %TAB="^[QUI]ORDEVAL(NUFA,TWREF,""MAT"")"
S1 S %2C="MAT",%Y=6,%P=1,%1=-1 F %2=1:1 S %1=$N(@%TAB@(%1)) Q:%1=-1  S %X=0 D AF S %11=-1 F %21=1:1 S %11=$N(@%TAB@(%1,%11)) Q:%11=-1  S %X=5 D AF2
 S %PM=%P S:'($D(^TACOMPIL($I,%2C,%PM))) %PM=%PM-1 S %P=1,%PI=$S(%1C["ART":%PA,1:%PM),%2C=" ......................................................." G PAGE
AF S %13=$P(@%TAB@(%1),"^",1) I (%13'["$ARG")&((%13'["%ARG")&(%13'["%VAL")) S ^TACOMPIL($I,%2C,%P,%Y,%X)=@%TAB@(%1) D INCR
 G Q
AF2 S %13=$P(@%TAB@(%1,%11),"^",1) I (%13'["$ARG")&((%13'["%ARG")&(%13'["%VAL")) S ^TACOMPIL($I,%2C,%P,%Y,%X)=@%TAB@(%1,%11) D INCR
 G Q
INCR S %Y=%Y+1 I %Y>21 S %P=%P+1,%Y=8
 G Q
Q Q
PAGE S DX=0,DY=6 X XY D CLEBAS^%VVIDEO S %1=$$^%QZCHW("Page ")_%P_"/"_%PI_"        "_YA,DY=6,DX=40-($L(%1)\2) X XY W %1
 S DY=-1 F %1=1:1 S DY=$N(^TACOMPIL($I,%1C,%P,DY)) Q:DY=-1  S DX=$N(^TACOMPIL($I,%1C,%P,DY,-1)) X XY S %12=^TACOMPIL($I,%1C,%P,DY,DX) W $E($P(%12,"^",1),1,40),$E(%2C,1,(50-$X)-1),?50," = ",$P(%12,"^",3)
QUES D POCLEPA^%VVIDEO W $$L17^%QSLIB1("CTRLF:Article <=> Matiere") S DX=$X D ^%VLEC G:CTRLA=1 FIN G:CTRLF=1 ARMT G:Y1="" QUES S %ADR=$S(Y1="=":"PLUS",Y1="+":"PLUS",Y1="-":$$^%QZCHW("MOINS"),1:"NUM") G @%ADR
PLUS S %1=%P+1 I '($D(^TACOMPIL($I,%1C,%1))) G QUES
 S %P=%1 G PAGE
MOINS S %1=%P-1 I '($D(^TACOMPIL($I,%1C,%1))) G QUES
 S %P=%1 G PAGE
NUM S PCH=Y1 D TO^%QZNBN1 I '(ISNUM) G QUES
 I '($D(^TACOMPIL($I,%1C,Y1))) G QUES
 S %P=Y1 G PAGE
ARMT S %1=$S(%1C="ART":"MAT",1:"ART") I '($D(^TACOMPIL($I,%1))) D POCLEPA^%VVIDEO W $$^%QZCHW("Non existant... [RETURN] ") R *%1 G QUES
 S %PI=$S(%1["ART":%PA,1:%PM),%1C=%1,%P=1 G PAGE
FIN W $$^%QZCHW(" Un instant...")
 D ^%QCAMEMR Q
VAR ;;NUFA,TWREF,MSS,QUI,WHOIS,%TABTV,YA
KILL ;;%1,%2,%13,%1C,%TAB,%X,%Y,%P,%2C,%11,%21,CTRLA,CTRLF,CTRLB,CTRLE,CTRLP,CTRLR,CTRLZ,Y1,%ADR,PCH,ISNUM,%PA,%PM,%PI

