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

;%CARSUP^INT^1^59547,73867^0
%CARSUP ;
 
 
 N TWAIT,GLOBAT,CTR,ESSAI,GLOERR,CPUSCHED,JSCHED,OLDCPU,WAITSUP
 N GLOBAT,RESF
 
 S $ZT="ERR^%CARSUP"
 S GLOBAT="^CARGBA"
 
 S @GLOBAT@("JOBSUPER")=$J
SUPER 
 
 S ESSAI=@GLOBAT@("NBESSAI")
RETRY I ESSAI<1 S @GLOBAT@("CR")=$$^%QZCHW("IMPOSSIBLE DE LANCER LE SCHEDULER") Q
 S RESF=$$FORK^%SYSCARU("%CARBA",1,"","",1)
 I '(RESF) H @GLOBAT@("LAPS") S ESSAI=ESSAI-1 G RETRY
 
 
 F %I=1:1:10000 Q:$D(@GLOBAT@("JOBSCHED"))
 G:%I=10000 ERR
 S JSCHED=@GLOBAT@("JOBSCHED")
 S WAITSUP=@GLOBAT@("SLEEP")*10
 S OLDCPU=$$CPU^%SYSCARU(JSCHED)
 
LOOP H WAITSUP
 I '($$EXISTE^%SYSCARU(JSCHED)) S @GLOBAT@("CR")=$$^%QZCHW("LE SCHEDULER S'EST ARRETE => RELANCE") G SUPER
 S CPU=$$CPU^%SYSCARU(JSCHED)
 I OLDCPU=CPU S @GLOBAT@("CR")=$$^%QZCHW("LE SCHEDULER EST BLOQUE => ARRET PUIS RELANCE") D STOPSCH^%CARJOBE G SUPER
 S OLDCPU=CPU
 
 G LOOP
 
 
ERR S $ZT=""
 S @GLOBAT@("CR")=$$^%QZCHW("PB SUR LE SUPERVISEUR :")_$ZE
 Q

