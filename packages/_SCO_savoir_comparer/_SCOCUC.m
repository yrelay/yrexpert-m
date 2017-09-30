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

;%SCOCUC^INT^1^59547,73888^0
SCOCUC ;
 
 
 
 
 
 
REP N REP
 S REFUSE=0
 S REP=$$GETLBLAN^%VTLBLAN(RESUL(IC))
REPC I REP="" D ^%VZEAVT($$^%QZCHW("Le repertoire doit etre defini...")) G REPER
 G:REP="?" REP2
 I $$NOMINT^%QSF(REP)="" D ^%VZEAVT($$^%QZCHW("Repertoire inconnu...")) G REPER
 G:RESUL(2)="" SREP
 G CONTREP2
SREP S RESUL(IC)=REP
 Q
REP2 
 D CHOIXREP^%SCOCUT
 S DX=0,DY=14 X XY D CLEBAS^%VVIDEO
 S RESUL(IC)=REP
 D ^%VAFISCR
 D REAFCIB^%SCOCDEF
 G:REP="" REPER
CONTREP2 I RESUL(2)="" S RESUL(IC)=REP Q
 I '($$IR^%QSGE5($$NOMINT^%QSF(REP),RESUL(2))) D ^%VZEAVT($$^%QZCHW("L'individu specifie est inexistant dans ce repertoire...")) G REPER
 Q
REPER S REFUSE=1
 Q
 
 
 
IND N IND,REPI
 S IND=$$GETLBLAN^%VTLBLAN(RESUL(IC)),REFUSE=0
 G:IND="" INDER
 I RESUL(1)="" D ^%VZEAVT($$^%QZCHW("Le repertoire doit etre defini...")) G INDER
 S REPI=$$NOMINT^%QSF(RESUL(1))
 I REPI="" D ^%VZEAVT($$^%QZCHW("Nom interne du repertoire inconnu...")) G INDER
 G:IND="?" IND2
 I '($$IR^%QSGE5($$NOMINT^%QSF(RESUL(1)),IND)) D ^%VZEAVT($$^%QZCHW("Individu inexistant...")) G INDER
 S RESUL(IC)=IND
 Q
IND2 D CHOIXIND^%SCOCUT
 S DX=0,DY=14 X XY D CLEBAS^%VVIDEO
 S RESUL(IC)=IND
 D ^%VAFISCR,REAFCIB^%SCOCDEF
 G:IND="" INDER
 Q
INDER S REFUSE=1
 Q
 
 
DESAC N DESAC
 S DESAC=$$GETLBLAN^%VTLBLAN(RESUL(IC)),REFUSE=0
 G:DESAC="" DESACER
 I '($$NUM^%QZNBN(DESAC)) D ^%VZEAVT($$^%QZCHW("Un nombre compris entre 0 et 1 est attendu...")) G DESACER
 I (DESAC<0)!(DESAC>1) D ^%VZEAVT($$^%QZCHW("Un nombre compris entre 0 et 1 est attendu...")) G DESACER
 S RESUL(IC)=DESAC
 Q
DESACER S REFUSE=1
 Q
 ;
 ;

