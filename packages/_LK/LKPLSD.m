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

;LKPLSD^INT^1^59547,74867^0
LKPLSD ;;12:03 PM  16 Sep 1993; ; 16 Sep 93 12:03 PM
 
 
 
ACTIV(FILE) 
 N DEV,OK,LISRES,ENRG,ART,DAT,QTE,X
 
 S LISRES=$$GEN^%QCAPOP("ERR")
 S ADRESSE="^[QUI]RQS2("""_LISRES_""",""OBJET"")"
 D CREERL^%QS0XG1(LISRES,"ARTICLE",ADRESSE,"ERREUR","ERREUR")
 D OPENFILE^%SYSUTI1(FILE,"R",.DEV,.OK)
 Q:'(OK) LISRES
NXENRG S ENRG=$$READ^%SYSUTI1(DEV,.OK) G:'(OK) FIN
 S ART=$$GETLBLAN^%VTLBLAN($E(ENRG,18,27))
 G:ART="" NXENRG
 I '($$IR^%QSGE5("ARTICLE",ART)) S X=$$CREER^%QSGEIND("ARTICLE",ART,"",1,.MSG) D AJOUT^%QS0XG1(LISRES,ART)
 S DAT=$E(ENRG,34,39)
 S QTE=$$GETLBLAN^%VTLBLAN($E(ENRG,40,52))+0
 
 D PA^%QSGESTI("ARTICLE",ART,"QUANTITE.DEMANDEE",QTE,DAT)
 D PA^%QSGESTI("ARTICLE",ART,"DATE.RECUPERATION.PASSERELLE",$H,1)
 G NXENRG
FIN D CLOSE^%SYSUTI1(DEV,"R")
 Q LISRES

