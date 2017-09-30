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

;%QGPAG2^INT^1^59547,73876^0
GRPAG ;
CREPAG S MESS="[constitution des pages] " D DEBUT^ETOILE S I=1,PAG=1,LI=6,NBPAG=$S(ARRET="FIN":1,1:ARRET)
LCPG G:$D(@GROUPE@("LISTE2",I))=0 FLCPG S ^PAG($J,PAG,LI)=@GROUPE@("LISTE2",I),LI=LI+1,I=I+1 G:LI<21 LCPG
PLCPG G:'($D(@GROUPE@("LISTE2",I))) FLCPG D TOP^ETOILE G:(ARRET'="FIN")&(PAG=NBPAG) FLCPG S PAG=PAG+1,LI=6 S:ARRET="FIN" NBPAG=PAG G LCPG
FLCPG S PAG=1 D FIN^ETOILE Q
CREPAD K ^PAD($J) S ^PAD($J,0)=5,GRO=-1,PAD=1,NBPAD=1,LI=6
LCPD S GRO=$N(@GROUPE@(1,GRO)) G:GRO=-1 FLCPD D:LI=21 PLCPD S ^PAD($J,PAD,LI)=GRO,^PAD($J,0)=LI,LI=LI+1 G LCPD
PLCPD S PAD=PAD+1,NBPAD=PAD,LI=6 Q
FLCPD S PAD=1 Q
APG D CUROF^%VVIDEO S LI=5,DX=1,DY=3,PATXT="page "_PAG_"/"_NBPAG_"   " X XY W PATXT
LAPG S LI=$N(^PAG($J,PAG,LI)) G:LI=-1 FAPG S (NDLG,LIEF)=LI,SEL=$D(@GROAFF@(^PAG($J,PAG,LI))) D:SEL BLD^%VVIDEO S LIG=LI D AFLIG D:SEL NORM^%VVIDEO G LAPG
FAPG S LIEF2=LIEF+1 F LIEF=LIEF2:1:20 D EFLIG
 D CURON^%VVIDEO Q
APD D CUROF^%VVIDEO S:'($D(GROSEL)) GROSEL="" S LI=5,DX=41,DY=3,PATXT="page "_PAD_"/"_NBPAD_"   " X XY W PATXT
LAPD S LI=$N(^PAD($J,PAD,LI)) G:LI=-1 FAPD S (LIEF,NDLD)=LI D EFLID
 S (%GR,GR)=^PAD($J,PAD,LI),LID=LI D:GR=GROSEL BLD^%VVIDEO D AFLID,NORM^%VVIDEO G LAPD
FAPD S LIEF2=LIEF+1 F LIEF=LIEF2:1:20 D EFLID
 D CURON^%VVIDEO Q
ALS Q:'($D(LIS))  S LID=LIS,(%GR,GR)=GROSEL D BLD^%VVIDEO,AFLID,NORM^%VVIDEO Q
 
CLEG D CUROF^%VVIDEO F LIEF=6:1:20 D EFLIG
 D CURON^%VVIDEO Q
CLED D CUROF^%VVIDEO F LIEF=6:1:20 D EFLIG
 D CURON^%VVIDEO Q
EFLIG S DX=3,DY=LIEF X XY W "                                   " Q
EFLID S DX=43,DY=LIEF X XY W "                                   " Q
AFLIG S DX=3,DY=LI X XY W "                                    " X XY W ^PAG($J,PAG,LIG) I ^ATTR($J,"O",ATAF)="AFFECTATION" S A="@GROAFF@(^PAG($J,PAG,LIG))" W " (",$S('($D(@A)):"sans",1:@A),")" Q
 W:^ATTR($J,"O",ATAF)'="" " (",$S($D(^[QUI]QUERY3(QUER,^PAG($J,PAG,LIG),1,^ATTR($J,"O",ATAF))):$O(^[QUI]QUERY3(QUER,^PAG($J,PAG,LIG),1,^ATTR($J,"O",ATAF),"")),1:"?"),")" Q
AFLID S DX=43,DY=LID X XY S:^ATTR($J,"O",6)="" ATTR=@GROUPE@(1,%GR,"CARD") S:^ATTR($J,"O",6)'="" ATTR=^ATSG($J,%GR) W %GR," (",ATTR,")" Q

