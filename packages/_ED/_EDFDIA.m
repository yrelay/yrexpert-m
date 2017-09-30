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

;%EDFDIA^INT^1^59547,73869^0
%EDFDIA ;;09:18 AM  17 Sep 1992; ; 02 Jul 93 12:10 PM
 
 
 
 
 
 
 
 
 
 
SUPP N MODL,MODECR
 D CLEPAG^%VVIDEO,^%VZCD0("SUPPRESSION")
SUPPL S MODL=$$GET(.MODECR) Q:MODL=""
 D:MODECR ^%VZCD0("SUPPRESSION")
 Q:$$NOKOBJ^%INCOIN2("FORMAT",MODL)
 D POCLEPA^%VVIDEO I '($$CONFIRM^%VZEOUI($$^%QZCHW("Voulez-vous toujours supprimer ")_MODL_" ? ")) G SUPPL
 D POCLEPA^%VVIDEO W $$^%QZCHW("OK ...") D SUPP^%EDFGEST(MODL),POCLEPA^%VVIDEO G SUPPL
 
 
 
 
 
DUPL N INIT,MODECR,CTRLA,Y1
DUPLL D CLEPAG^%VVIDEO,^%VZCD0("DUPLICATION D'UN FORMAT")
 S INIT=$$GET(.MODECR) Q:INIT=""
 D:MODECR ^%VZCD0("DUPLICATION D'UN FORMAT")
DUPLE D POCLEPA^%VVIDEO W $$^%QZCHW("Nom de la duplication")_" : " S DX=$X,DY=$Y D ^%VLEC
 Q:CTRLA!(Y1="")
 I $$EXISTE^%EDFGEST(Y1) D ^%VZEAVT($$^%QZCHW("Un format de ce nom existe deja ... refuse")) G DUPLE
 D POCLEPA^%VVIDEO W $$^%QZCHW("Duplication en cours ...") D DUPL^%EDFGEST(WHOIS,QUI,INIT,WHOIS,QUI,Y1)
 D POCLEPA^%VVIDEO W $$^%QZCHW("Duplication terminee ...") Q
 
 
 
 
 
MODI N MODECR,MODL
MODIL D CLEPAG^%VVIDEO,^%VZCD0("MODIFICATION D'UN FORMAT")
 S MODL=$$GET(.MODECR) Q:MODL=""
 D:MODECR ^%VZCD0("MODIFICATION D'UN FORMAT")
 D ^%EDFDIAL(MODL) G MODIL
 
 
 
 
 
 
 
 
 
GET(ECRMOD) N Y1,NY1,CTR,VDEF,MESGET,CONNU,ZZZ
 S ECRMOD=0,ZZZ=0
 S VDEF=$S($D(^[QUI]RQSDON("REM","LEC",$J,$P($ZPOS,"^",2),1)):^[QUI]RQSDON("REM","LEC",$J,$P($ZPOS,"^",2),1),1:"")
 I VDEF'="",'($$EXISTE^%EDFGEST(VDEF)) S VDEF=""
 S MESGET=$$^%QZCHW("Format")_" : "
G2 D CLFEN^%VVIDEO(0,10,2,78)
 S Y1=""
 D LIRE2^%VREAD(MESGET,VDEF,0,78,10,9,"","",.CTR,.Y1)
 Q:CTR'="" "" Q:Y1="" ""
 S CONNU=0 S:Y1="?" Y1=""
 S NY1=$$SEARCHE^%LXABR(Y1,"^[QUI]EDFORMAT",.ECRMOD,.CONNU)
 I CONNU=0 D ^%VZEAVT($$^%QZCHW("Format inconnu")) G G2
 Q:NY1="" ""
 I NY1'=Y1 S DX=1,DY=10 X XY W MESGET_NY1 H 5E-1 S Y1=NY1
 S ^[QUI]RQSDON("REM","LEC",$J,$P($ZPOS,"^",2),1)=Y1
 Q Y1
 ;

