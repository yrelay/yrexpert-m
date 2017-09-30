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

;%DLMACO1^INT^1^59547,73868^0
DLMACO1 ;
 
 
 
 
 
 N GLOERR,MAC,VERS,CONT,CERR,TEMP,MENU,CONTR,ADRES,GJOUR,JOUR
 N GLOP,LAN,STAD,OPE,CHARG,LIB1,LIB2,RESUL
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S GLOERR=$$CONCAS^%QZCHAD(TEMP,"ERR")
 S GJOUR=$$CONCAS^%QZCHAD(TEMP,"JOUR")
 S GLOP=$$CONCAS^%QZCHAD(TEMP,"MACOP")
 S MENU=$$CONCAS^%QZCHAD(TEMP,"MEN")
 S MENU2=$$CONCAS^%QZCHAD(TEMP,"MEN2")
 S CERR=1
 K @(TEMP)
 S @MENU="21^10^79"
 S @MENU@(1)=$$^%QZCHW("Activation")_"^ACT"
 S @MENU@(1,"COM")=$$^%QZCHW("Recherche des incoherences")
 S @MENU@(2)=$$^%QZCHW("Resultat")_"^RESUL"
 S @MENU@(2,"COM")=$$^%QZCHW("Visualisation du resultat de la recherche")
 S @MENU@(3)=$$^%QZCHW("Machine")_"^MACH"
 S @MENU@(3,"COM")=$$^%QZCHW("Acces a la description des machines")
 S @MENU@(4)=$$^%QZCHW("Charges/stades")_"^CHARGE"
 S @MENU@(4,"COM")=$$^%QZCHW("Acces aux charges et aux stades correspondants")
 S @MENU2="21^10^79"
 S @MENU2@(1)=$$^%QZCHW("Charge")_"^MACAP"
 S @MENU2@(1,"COM")=$$^%QZCHW("Acces a la charge")
 S @MENU2@(2)=$$^%QZCHW("Stades")_"^MACOP"
 S @MENU2@(2,"COM")=$$^%QZCHW("Acces aux stades correspondants a la charge")
MENU D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("Coherence de la description des machines"),0)
 S DX=0,DY=22
 D CLEBAS^%VVIDEO,^%VQUIKMN(1,80,22,MENU,.ADRES,.CONTR)
 G:(CONTR="A")!(CONTR="F") FIN
 G:ADRES'="" @ADRES
 D ^%VSQUEAK
 G MENU
 
ACT G COHER^%DLMACO2
 
RESUL G RESUL^%DLMACO2
 
MACH D ^%VCMS("DESMACH")
 G MENU
 
CHARGE K @(GJOUR)
 S MAC=$$TIT^%PKCHOIX("^[QUI]DESMACH",10,5,15,"",1)
 G:MAC="" MENU
 S JOUR=""
BCHAR1 S JOUR=$O(^[QUI]MACAP(MAC,JOUR))
 G:JOUR="" BCHAR2
 S @GJOUR@(JOUR)=""
 G BCHAR1
 
BCHAR2 S JOUR=$O(^[QUI]MACOP(MAC,JOUR))
 G:JOUR="" CHARG2
 S @GJOUR@(JOUR)=""
 G BCHAR2
 
CHARG2 S JOUR=$$TIT^%PKCHOIX(GJOUR,15,5,15,"",1)
 G:JOUR="" CHARGE
MENU2 D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("Machine")_" "_MAC_" "_$$^%QZCHW("Jour")_" "_JOUR,0)
 S DX=0,DY=22
 D CLEBAS^%VVIDEO,^%VQUIKMN(1,80,22,MENU2,.ADRES,.CONTR)
 G:(CONTR="A")!(CONTR="F") CHARG2
 G:ADRES'="" @ADRES
 D ^%VSQUEAK
 G MENU2
 
MACAP K RESUL
 S RESUL(1)=MAC,RESUL(2)=JOUR
 D POINT^%VCMS("DLMACAP","RESUL")
 G MENU2
 
MACOP K @(GLOP)
 S LAN="",STAD="",OPER=""
MACOP1 S LAN=$O(^[QUI]MACOP(MAC,JOUR,LAN))
 G:LAN="" MACOP4
 S LIB1=LAN_"  "
MACOP2 S STAD=$O(^[QUI]MACOP(MAC,JOUR,LAN,STAD))
 G:STAD="" MACOP1
 S LIB2=LIB1_STAD_"  "
MACOP3 S OPER=$O(^[QUI]MACOP(MAC,JOUR,LAN,STAD,OPER))
 G:OPER="" MACOP2
 S @GLOP@(LIB2_OPER_"  "_^[QUI]MACOP(MAC,JOUR,LAN,STAD,OPER))=""
 G MACOP3
 
MACOP4 S STAD=$$TIT^%PKCHOIX(GLOP,15,5,15,"",1)
 G:STAD="" MENU2
 K RESUL
 S RESUL(1)=MAC,RESUL(2)=JOUR,RESUL(3)=$P(STAD,"  ")
 S RESUL(4)=$P(STAD,"  ",2),RESUL(5)=$P(STAD,"  ",3)
 D POINT^%VCMS("DLMACOP","RESUL")
 G MENU2
 
FIN K @(TEMP)
 Q
 
MERR(MES) 
 S @GLOERR@(CERR)=MES
 S CERR=CERR+1
 X XY W MES
 X CONT
 Q

