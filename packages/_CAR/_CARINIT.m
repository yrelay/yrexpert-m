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

;%CARINIT^INT^1^59547,73867^0
%CARINIT ;
 
 
 N SUPER,GLOBAT,ESSAI,GLOERR,RESF
 
 I $$LANCE D ^%VZEAVT($$^%QZCHW("ACTIVATION IMPOSSIBLE (CARROUSEL DEJA LANCE)")) Q
 S GLOBAT="^CARGBA",GLOERR="^CARGERR",GLOETA="^CARGETA"
 K @(GLOERR),@(GLOETA)
 
 F I="SUPER","NBESSAI","LAPS" I '($D(@GLOBAT@(I))) D ^%VZEAVT($$^%QZCHW("ACTIVATION IMPOSSIBLE (IL MANQUE DES PARAMETRES)")) G FIN
 
 S @GLOBAT=1
 
 
 D ^%CARECH
 
 S SUPER=@GLOBAT@("SUPER")
 
 G:'(SUPER) NORMAL
 
 
 S RESF=$$FORK^%SYSCARU("^%CARSUP",1,"","",1)
 D:'(RESF) ^%VZEAVT($$^%QZCHW("IMPOSSIBLE DE LANCER LE SUPERVISEUR")) G FIN
 Q
 
 
NORMAL 
 S ESSAI=@GLOBAT@("NBESSAI")
RETRY I ESSAI<1 D ^%VZEAVT($$^%QZCHW("IMPOSSIBLE DE LANCER LE SCHEDULER")) G FIN
 S RESF=$$FORK^%SYSCARU("^%CARBA",1,"","",1)
 
 I '(RESF) H @GLOBAT@("LAPS") S ESSAI=ESSAI-1 G RETRY
 Q
 
 
 
FIN S @GLOBAT=0 Q
 
 
STOP 
 N GLOBAT
 S $ZT="ERRSTP"
 S GLOBAT="^CARGBA"
 I @GLOBAT@("SUPER") D STOPSUP^%CARJOBE
 D STOPSCH^%CARJOBE
 D STOPALL^%CARJOBE
ERRSTP S @GLOBAT=0
 Q
 
 
 
LANCE() 
 N GLOBAT,VAL
 S GLOBAT="^CARGBA"
 Q:'($D(@GLOBAT)#10) 0 S VAL=@GLOBAT Q VAL

