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

;%EDDDIA^INT^1^59547,73869^0
%EDDDIA ;;05:04 PM  16 Sep 1992; ; 02 Jul 93 12:09 PM
 
 
 
 
 
 
 
 
 
SUPP N MOD,MODECR
 D CLEPAG^%VVIDEO,^%VZCD0("SUPPRESSION")
SUPPL S MOD=$$GET(.MODECR) Q:MOD=""
 D:MODECR ^%VZCD0("SUPPRESSION")
 I $$NOKOBJ^%INCOIN2("MODELE",MOD) Q
 D POCLEPA^%VVIDEO I '($$CONFIRM^%VZEOUI($$^%QZCHW("Voulez-vous toujours supprimer ")_MOD_" ? ")) G SUPPL
 D POCLEPA^%VVIDEO W $$^%QZCHW("OK ...") D SUPP^%EDDGEST(MOD),POCLEPA^%VVIDEO G SUPPL
 
 
 
 
DUPL N Y1,FIN,INIT,MODECR,CTRLA
DUPLL D CLEPAG^%VVIDEO,^%VZCD0("DUPLICATION D'UN MODELE")
 S INIT=$$GET(.MODECR) Q:INIT=""
 D:MODECR ^%VZCD0("DUPLICATION D'UN MODELE")
DUPLE D POCLEPA^%VVIDEO W $$^%QZCHW("Nom de la duplication : ") S DX=$X,DY=$Y D ^%VLEC
 Q:CTRLA!(Y1="")
 I $$EXISTE^%EDDGEST(Y1) D ^%VZEAVT($$^%QZCHW("Un modele de ce nom existe deja ... refuse")) G DUPLE
 D POCLEPA^%VVIDEO W $$^%QZCHW("Duplication en cours ...") D DUPL^%EDDGEST(WHOIS,QUI,INIT,WHOIS,QUI,Y1)
 D POCLEPA^%VVIDEO W $$^%QZCHW("Duplication terminee ...") Q
 
 
 
 
 
 
GET(ECRMOD) N MOD,ZZZ,CONNU,MESGET,Y1,NY1,CTR,VDEF
 S ECRMOD=0,ZZZ=0
 S VDEF=$S($D(^[QUI]RQSDON("REM","LEC",$J,$P($ZPOS,"^",2),1)):^[QUI]RQSDON("REM","LEC",$J,$P($ZPOS,"^",2),1),1:"")
 I VDEF'="",'($$EXISTE^%EDDGEST(VDEF)) S VDEF=""
 S MESGET=$$^%QZCHW("Modele : ")
G2 D CLFEN^%VVIDEO(0,10,2,78)
 S Y1=""
 D LIRE2^%VREAD(MESGET,VDEF,0,78,10,9,"","",.CTR,.Y1)
 Q:CTR'="" "" Q:Y1="" ""
 S CONNU=0 S:Y1="?" Y1=""
 S NY1=$$SEARCHE^%LXABR(Y1,"^[QUI]EDMOD",.ECRMOD,.CONNU)
 I CONNU=0 D ^%VZEAVT($$^%QZCHW("Modele inconnu")) G G2
 Q:NY1="" ""
 I NY1'=Y1 S DX=1,DY=10 X XY W MESGET_NY1 H 5E-1 S Y1=NY1
 S ^[QUI]RQSDON("REM","LEC",$J,$P($ZPOS,"^",2),1)=Y1
 Q Y1
 ;

