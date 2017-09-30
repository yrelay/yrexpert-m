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

;%QGPAG^INT^1^59547,73876^0
%QGPAG ;
GRPAG 
CREPAG D MSG^%VZEATT("Constitution des pages") S I=1,PAG=1,LI=6,NBPAG=$S(ARRET="FIN":1,1:ARRET)
LCPG G:$D(@GROUPE@("LISTE2",I))=0 FLCPG S ^PAG($J,PAG,LI)=@GROUPE@("LISTE2",I),LI=LI+1,I=I+1 G:LI<21 LCPG
PLCPG G:'($D(@GROUPE@("LISTE2",I))) FLCPG G:(ARRET'="FIN")&(PAG=NBPAG) FLCPG S PAG=PAG+1,LI=6 S:ARRET="FIN" NBPAG=PAG G LCPG
FLCPG S PAG=1 Q
CREPAD K ^PAD($J) S ^PAD($J,0)=5,GRO=-1,PAD=1,NBPAD=1,LI=6
LCPD S GRO=$N(@GROUPE@(1,GRO)) G:GRO=-1 FLCPD D:LI=21 PLCPD S ^PAD($J,PAD,LI)=GRO,^PAD($J,0)=LI,LI=LI+1 G LCPD
PLCPD S PAD=PAD+1,NBPAD=PAD,LI=6 Q
FLCPD S PAD=1 Q
APG D CUROF^%VVIDEO S LI=5,DX=1,DY=3,PATXT="page "_PAG_"/"_NBPAG_"   " X XY W PATXT
LAPG S LI=$N(^PAG($J,PAG,LI)) G:LI=-1 FAPG
 S (NDLG,LIEF)=LI,SEL=$S('($D(@GROAFF@(^PAG($J,PAG,LI)))):0,1:@GROAFF@(^PAG($J,PAG,LI))) D:SEL BLD^%VVIDEO S LIG=LI D AFLIG D:SEL NORM^%VVIDEO
 G LAPG
FAPG S LIEF2=LIEF+1 F LIEF=LIEF2:1:20 D EFLIG
 D CURON^%VVIDEO Q
APD D CUROF^%VVIDEO S:'($D(GROSEL)) GROSEL="" S LI=5,DX=41,DY=3,PATXT="page "_PAD_"/"_NBPAD_"   " X XY W PATXT
LAPD S LI=$N(^PAD($J,PAD,LI)) G:LI=-1 FAPD S (LIEF,NDLD)=LI,NYSD=LI+1
 S (%GR,GR)=^PAD($J,PAD,LI),LID=LI S:GR=GROSEL LIS=LI D:GR=GROSEL BLD^%VVIDEO D AFLID,NORM^%VVIDEO G LAPD
FAPD S LIEF2=LIEF+1 F LIEF=LIEF2:1:20 D EFLID
 D CURON^%VVIDEO Q
ALS Q:'($D(LIS))  S LID=LIS,(%GR,GR)=GROSEL D BLD^%VVIDEO,AFLID,NORM^%VVIDEO Q
CLEG D CUROF^%VVIDEO F LIEF=6:1:20 D EFLIG
 D CURON^%VVIDEO Q
CLED D CUROF^%VVIDEO F LIEF=6:1:20 D EFLIG
 D CURON^%VVIDEO Q
EFLIG 
 S DX=3,DY=LIEF X XY W $J("",37) Q
EFLID 
 S DX=42,DY=LIEF X XY W $J("",36) Q
AFLIG N OBJ,NUM
 S OBJ=^PAG($J,PAG,LIG)
 
 S NUM=$S(ZOOM:@GROAFF@(OBJ,GROZOOM),'($D(@GROAFF@(OBJ))):@GRLISTE@(OBJ,"NB"),1:@GRLISTE@(OBJ,"NB")-@GROAFF@(OBJ))
 S NUM=$S(NUM>99:NUM_" ",NUM>9:" "_NUM_" ",1:"  "_NUM_" ")
 
 S DX=2,DY=LI X XY W $J("",37) X XY W NUM_OBJ
 I ^ATTR($J,"O",ATAF)="AFFECTATION" S A="@GROAFF@(^PAG($J,PAG,LIG))" W " (",$S('($D(@A)):"sans",1:@A),")" Q
 W:^ATTR($J,"O",ATAF)'="" " (",$$PI^%QGCALVA(^PAG($J,PAG,LIG),^ATTR($J,"O",ATAF)),")" Q
 
AFLID 
 
 S DX=42,DY=LID X XY W $J("",36) S DX=43 X XY W %GR," (",^GRV($J,%GR,ATAFG),")" Q

