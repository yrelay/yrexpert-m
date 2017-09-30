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

;%QMCPOR2^INT^1^59547,73876^0
QMCPOR2 ;
 
 
TRTL(CH,T,TRTL) 
 N TRT
 S TRT=$P(CH,T,2)
 I TRT="" Q
 S @TRTL@(TRT)=""
 Q
TRTCO(CH,T,TRT,WHOIS2,QUI2) 
 N TXT
 S TXT=$P(CH,T,2)
 S NO=$ZP(@TRT@(1,""))+1
 S @TRT@(1,NO)=TXT
 Q
TRTSO(CH,T,TRT,WHOIS2,QUI2) 
 N TXT
 S TXT=$P(CH,T,2)
 S NO=$ZP(@TRT@(2,""))+1
 S @TRT@(2,NO)=TXT
 Q
TRTF(CH,T,TRT,WHOIS2,QUI2) 
 N NOMTRT,COMM,ACTI,OKANA
 S NOMTRT=$P(CH,T,2)
 S COMM=$$CONCAS^%QZCHAD(TRT,1)
 S ACTI=$$CONCAS^%QZCHAD(TRT,1)
 D KTRT^%QMCPZ(WHOIS2,QUI2,NOMTRT)
 S OKANA=$$CREERTRT^%QMCPZ(WHOIS2,QUI2,NOMTRT,COMM,ACTI,0)
 
 K @(TRT)
 Q
 
PASSE1(CH,T,COOR,TRTL,STOP,WHOIS2,QUI2) 
 N TEMP,ERR,ECRASE,ECR
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"PASSE1")
 S ERR=$$CONCAS^%QZCHAD(TEMP,"ERR")
 K @(TEMP)
 S ECR=0
 
 D VERIF^%QMCPOR1(WHOIS2,QUI2,COOR,ERR,.ECRASE,0) S ECR=ECR!ECRASE
 
 D ECRTRT^%QMCPOR1(WHOIS2,QUI2,TRTL,ERR,.ECRASE,0) S ECR=ECR!ECRASE
 
 I ECR=1 D AFFERR^%QMCPZ(ERR,$$^%QZCHW("recuperation")),POCLEPA^%VVIDEO I '($$MES^%VZEOUI($$^%QZCHW("voulez vous continuer la recuperation"),"N")) S STOP=1 K @(TEMP) Q
 D ON^%VZEATT
 
 D VERIF^%QMCPOR1(WHOIS2,QUI2,COOR,ERR,ECRASE,1)
 D ECRTRT^%QMCPOR1(WHOIS2,QUI2,TRTL,ERR,.ECRASE,1)
 K @(TEMP)
 Q

