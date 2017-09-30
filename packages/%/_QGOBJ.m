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

;%QGOBJ^INT^1^59547,73876^0
%QGOBJ ;
 
 
 
 
AFFOBJ I GROSEL="" D POCLEPA^%VVIDEO,BLD^%VVIDEO W "Veuillez selectionner un",%eg," ",%ngro,", SVP." D ^%VSQUEAK H 2 D NORM^%VVIDEO S RETOUR=-1 Q
 S LI=$Y Q:'($D(^PAG($J,PAG,LI)))
 
 S RETOUR=$$AFFECT2(^PAG($J,PAG,LI),GROSEL)
 Q
 
 
AFFECT(OBJET,GROSEL) 
 I $D(@GROAFF@(OBJET))>9 D POCLEPA^%VVIDEO,BLD^%VVIDEO W %nind," deja affecte",%ei," a ",$O(@GROAFF@(OBJET,"")),"  " D ^%VSQUEAK H 2 D NORM^%VVIDEO S DX1=2,DY1=LI Q 1
 S @GROUPE@(1,GROSEL,"OBJET",OBJET)=1,@GROAFF@(OBJET,GROSEL)="",SG=GROSEL,OBJ=^PAG($J,PAG,LI),ATTR=^ATTR($J,"O",6) D OBJ^%QGEVASG,ALS^%QGPAG
 I AFFLIST S LIG=LI D BLD^%VVIDEO,AFLIG^%QGPAG,NORM^%VVIDEO S DX1=2,DY1=LI+1 S:LI=NDLG DY1=NDLG Q 2
 S LIEF=LI D EFLIG^%QGPAG S DX1=2,DY1=LI+1 S:LI=NDLG DY1=NDLG Q 2
 
 
 
AFFECT2(OBJET,GROSEL) 
 N QNT,REFRESH
 S REFRESH=0
 I $D(@GROAFF@(OBJET,GROSEL)),@GROAFF@(OBJET,GROSEL)>0 D POCLEPA^%VVIDEO,BLD^%VVIDEO W %nind," deja affecte",%ei," a ",GROSEL,"  " D ^%VSQUEAK H 2 D NORM^%VVIDEO S DX1=2,DY1=LI Q 1
 S:'($D(@GROAFF@(OBJET))) @GROAFF@(OBJET)=0
 S QNT=@GRLISTE@(OBJET,"NB")-@GROAFF@(OBJET)
 I QNT=0 D POCLEPA^%VVIDEO,BLD^%VVIDEO W %nind," deja affecte" D ^%VSQUEAK H 2 D NORM^%VVIDEO S DX1=2,DY1=LI Q 1
 I QNT'=1 S QNT=$$GETQNT^%QGQNT(OBJET,GROSEL,QNT),REFRESH=1 I QNT=0 S DX1=2,DY1=LI D SCREESH^%QGECRAN Q 1
 S @GROUPE@(1,GROSEL,"OBJET",OBJET)=1,@GROAFF@(OBJET,GROSEL)=$S($D(@GROAFF@(OBJET,GROSEL)):@GROAFF@(OBJET,GROSEL)+QNT,1:QNT),SG=GROSEL,OBJ=^PAG($J,PAG,LI),ATTR=^ATTR($J,"O",6) D OBJ^%QGEVASG,ALS^%QGPAG
 S @GROAFF@(OBJET)=@GROAFF@(OBJET)+QNT
 I AFFLIST S LIG=LI D BLD^%VVIDEO,AFLIG^%QGPAG,NORM^%VVIDEO S DX1=2,DY1=LI+1 S:LI=NDLG DY1=NDLG
 I '(AFFLIST) S LIEF=LI D EFLIG^%QGPAG S DX1=2,DY1=LI+1 S:LI=NDLG DY1=NDLG
 D:REFRESH SCREESH^%QGECRAN
 Q 2
 
 
RAPPEL S RETOUR=1
 I GROSEL="" D POCLEPA^%VVIDEO,BLD^%VVIDEO W "Veuillez selectionner un",%eg," ",%ngro,", SVP." D ^%VSQUEAK H 2 D NORM^%VVIDEO S RETOUR=-1 Q
 S DX1=2,DY1=$Y,LI=DY1 Q:'($D(^PAG($J,PAG,LI)))  I $D(@GROAFF@(^PAG($J,PAG,LI)))=0 D POCLEPA^%VVIDEO,BLD^%VVIDEO W "non encore affecte",%ei,"." D NORM^%VVIDEO,^%VSQUEAK H 2 Q
 
 S RETOUR=$$RETIR2(^PAG($J,PAG,LI),GROSEL)
 Q
 
RETIR(OBJ,GROSEL) 
 S SG=$O(@GROAFF@(OBJ,"")) K @GROUPE@(1,SG,"OBJET",OBJ),@GROAFF@(OBJ,SG) S ATTR=^ATTR($J,"O",6) D SUPOBJ^%QGEVASG
 S LIG=LI D AFLIG^%QGPAG,APD^%QGPAG Q 2
 
RETIR2(OBJ,GROSEL) 
 N SG
 S SG=GROSEL
 I $D(@GROAFF@(OBJ,GROSEL)),@GROAFF@(OBJ,GROSEL)>0 G RR2
 D POCLEPA^%VVIDEO,BLD^%VVIDEO W "n'appartient pas au lot courant",%ei,"." D NORM^%VVIDEO,^%VSQUEAK H 2 Q 1
RR2 S @GROAFF@(OBJ)=@GROAFF@(OBJ)-@GROAFF@(OBJ,GROSEL)
 S ATTR=^ATTR($J,"O",6) D SUPOBJ^%QGEVASG
 S @GROAFF@(OBJ,GROSEL)=0
 K @GROUPE@(1,GROSEL,"OBJET",OBJ)
 S LIG=LI D AFLIG^%QGPAG,APD^%QGPAG Q 2
 ;
 ;
 ;

