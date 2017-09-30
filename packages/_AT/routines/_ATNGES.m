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

;%ATNGES^INT^1^59547,73866^0
%ATNGES ;;10:10 AM  28 Oct 1992; ; 28 Oct 92 11:05 AM
 
 
 
 
EXISTE(ATN) 
 Q $D(^[QUI]RQSGLO("ATN",ATN))
 
 
 
 
CM N MODECR,REPATN,MOD
CML D CLEPAG^%VVIDEO,^%VZCD0("MODIFICATION")
 S MOD=$$GET(.MODECR) Q:MOD=""
 D:MODECR ^%VZCD0("MODIFICATION")
 D POCLEPA^%VVIDEO
 D CARGEN^%ATNSDEF(MOD)
 D EDITE^%ATNSAI(MOD) G CML
 
 
 
 
CREAT N MODECR,REPATN,MOD,MESGET,VDEF,CTR,Y1
CR1 D CLEPAG^%VVIDEO,^%VZCD0("CREATION")
 S MESGET=$$^%QZCHW("ATN : ")
CR2 D CLFEN^%VVIDEO(0,10,2,78)
 S Y1="",VDEF=""
 D LIRE2^%VREAD(MESGET,VDEF,0,78,10,9,"","",.CTR,.Y1)
 Q:CTR'=""  Q:Y1=""
 S MOD=Y1
 I $$EXISTE(MOD) D ^%VZEAVT($$^%QZCHW("Un ATN de meme nom existe deja")) G CR2
 D CARGEN^%ATNSDEF(MOD)
 D EDITE^%ATNSAI(MOD) G CR1
 
 
 
 
 
 
 
SUPP N MODECR,REPATN,MOD
 D CLEPAG^%VVIDEO,^%VZCD0("SUPPRESSION")
SUPPL S MOD=$$GET(.MODECR) Q:MOD=""
 D:MODECR ^%VZCD0("SUPPRESSION")
 D POCLEPA^%VVIDEO I '($$CONFIRM^%VZEOUI($$^%QZCHW("Voulez-vous toujours supprimer ")_MOD_" ? ")) G SUPPL
 D POCLEPA^%VVIDEO
 D ON^%VZEATT
 D SUPPI(MOD),OFF^%VZEATT G SUPPL
 
 
 
 
SUPPI(ATN) 
 K ^[QUI]RQSGLO("ATN",ATN)
 Q
 
 
 
 
 
 
 
GET(ECRMOD) N MOD,ZZZ,CONNU,MESGET,Y1,NY1,CTR,VDEF,LATN,LATND,ATN,%A,REPATN
 S ECRMOD=0,ZZZ=0,TND=0,REPATN="ATN"
 S VDEF=$S($D(^[QUI]RQSDON("REM","LEC",$J,$P($ZPOS,"^",2),1)):^[QUI]RQSDON("REM","LEC",$J,$P($ZPOS,"^",2),1),1:"")
 I VDEF'="",'($$EXISTE(VDEF)) S VDEF=""
 S MESGET=$$^%QZCHW("ATN : ")
G2 D CLFEN^%VVIDEO(0,10,2,78)
 S Y1=""
 D LIRE2^%VREAD(MESGET,VDEF,0,78,10,9,"","",.CTR,.Y1)
 Q:CTR'="" "" I Y1="" Q ""
 S CONNU=0 S:Y1="?" Y1=""
 S NY1=$$SEARCHE^%LXABR(Y1,"^[QUI]RQSGLO(""ATN"")",.ECRMOD,.CONNU)
 I CONNU=0 D ^%VZEAVT($$^%QZCHW("ATN inconnu")) G G2
 I NY1="" Q ""
 I NY1'=Y1 S DX=1,DY=10 X XY W MESGET_NY1 H 5E-1 S Y1=NY1
 S ^[QUI]RQSDON("REM","LEC",$J,$P($ZPOS,"^",2),1)=Y1
 Q Y1
 ;
 ;

