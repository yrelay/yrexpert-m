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

;%PSSAOP2^INT^1^59547,73874^0
%PSSAOP2 ;;06:53 PM  23 Dec 1991;
 
 
 
 
 
 
CHOIXDO(DO) 
 N ADRES,CONTR,LCOUR,FEN,TOTO,TEMP,TEMP2
 N LSEL,REP,OPCOMP,%O
 D ^%VZEATT
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"T") K @(TEMP)
 S FEN=$$CONCAS^%QZCHAD(TEMP,"FEN")
 S LIS=$$CONCAS^%QZCHAD(TEMP,"LIS")
 S OP="" F %O=0:0 S OP=$$NXTRIAV^%QSTRUC8("DOMAINE",DO,"OPERATEUR.LIE",OP) Q:OP=""  S @LIS@(DO_","_OP)=""
 S LCOUR="" D PFEN
CHX2 D CLEPAG^%VVIDEO,CADL,CADLL,AFFICH^%QUAPAGM
 S DX=0,DY=22 D CLEBAS^%VVIDEO
 D ^%QUAPAD($$^%QZCHW("CHOIX D'UN OPERATEUR"))
 S OP=$$UN^%QUAPAGM
 D END^%QUAPAGM
 K @(TEMP) Q OP
 
REAFI D CADL,CADLL Q
CADR D CLEPAG^%VVIDEO,CADL,CADLL,AFFICH^%QUAPAGM Q
CADL D ^%VZCD(0,39,0,2,0,0,$$^%QZCHW("OPERATEUR")) Q
CADLL S LCOUR=WHOIS_$$^%QZCHW(" sur ")_$I
 D CARSP^%VVIDEO(40,0,3,$S(TADTM=0:38,1:40),1)
 S DX=41,DY=1 X XY W $J("",$S(TADTM=0:35,1:38))
 S DX=60-($L(LCOUR)\2),DY=1 X XY
 D REV^%VVIDEO W LCOUR D NORM^%VVIDEO Q
 
PFEN S @FEN@("X")=0,@FEN@("Y")=3,@FEN@("L")=80,@FEN@("H")=19
 S @FEN@("LR")=40
 S @FEN@("B")="OPERATEUR",@FEN@("A")=LIS
 S @FEN@("ATT")=1,@FEN@("AFF")="REAFI^%PSSAOP2"
 
 
 
 
 
 S @FEN@("ECRAN")="CADR^%PSSAOP2"
 S @FEN@("PADLINE")="POCLEPA^%VVIDEO"
 D INIT^%QUAPAGM(FEN)
 Q
 ;

