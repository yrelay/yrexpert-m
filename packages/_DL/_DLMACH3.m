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

;%DLMACH3^INT^1^59547,73868^0
%DLMACH3 ;
 
 
 
 
 
 
 
 
 
 
TRANSQU 
 N RMAC,MAC,JOUR,ATCHARG,CHA,JDEB,JFIN,MACTRAN,JDEB2,JFIN2,JOURFIN,LIG,M
 N NS,P1,P2,VAL,LIB,EXMACH
 D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("Transfert des charges Repertoire -> Description"),0)
 S DX=10,DY=10 X XY D BLD^%VVIDEO
 W $$^%QZCHW("Cette manipulation a pour effet de reinitialiser les charges")
 S DY=11 X XY
 W $$^%QZCHW("a partir des informations contenues dans le repertoire des")
 S DY=12 X XY W $$^%QZCHW("machines")
 D ^%VSQUEAK,NORM^%VVIDEO R *CTR
 S CTR="",JDEB="",JFIN=""
TRDD S DX=0,DY=3 D CLEBAS^%VVIDEO
 S M="     "_$$^%QZCHW("Transferer depuis le (aammjj ou *)")_" : "
 D LIRE2^%VREAD(M,JDEB,0,RM-4,4,4,"","",.CTR,.JDEB)
 Q:CTR'=""
 S LIG=6,JDEB=$$GETLBLAN^%VTLBLAN(JDEB)
 I JDEB="*" S JDEB2="",JFIN2="" G TRMA
 I JDEB="" S (JDEB2,JDEB)=$$DATENO3^%QMDATE($H),DX=$L(M)+1,DY=5 X XY W JDEB G TRDF
 S JDEB2=$$CONTD^%DLMACHI(JDEB)
 G:JDEB2="" TRDD
TRDF S M="     "_$$^%QZCHW("Jusqu'au             (aammjj ou *)")_" : "
 D LIRE2^%VREAD(M,JFIN,0,RM-4,6,6,"","",.CTR,.JFIN)
 G:CTR'="" TRDD
 S LIG=8,JFIN=$$GETLBLAN^%VTLBLAN(JFIN)
 I JFIN="*" S JFIN2="" G TRMA
 I JFIN="" S (JFIN2,JFIN)=$$DATENO3^%QMDATE($H),DX=$L(M)+1,DY=7 X XY W JFIN G TRMA
 S JFIN2=$$CONTD^%DLMACHI(JFIN)
 I JFIN2="" G TRDF
 G:'($$INFD^%DLMACHI(JDEB,JFIN)) TRDF
TRMA D LIRE2^%VREAD("     "_$$^%QZCHW("Machine")_"                          (*) : ","",0,RM-4,LIG,LIG,"","",.CTR,.MACTRAN)
 I CTR'="" G:LIG=6 TRDD G TRDF
 S MACTRAN=$$GETLBLAN^%VTLBLAN(MACTRAN)
 I MACTRAN="" D ^%VSQUEAK G TRMA
 I MACTRAN'="*",'($D(^[QUI]DESMACH(MACTRAN))) D ^%VZEAVT($$^%QZCHW("Machine inconnue")_"...") G TRMA
 D POCLEPA^%VVIDEO
 S M=$S(MACTRAN="*":$$^%QZCHW("TOUTES les machines"),1:$$^%QZCHW("Machine")_" "_MACTRAN)_" "
 S M=M_$S(JDEB="*":$$^%QZCHW("pour TOUTES les charges"),1:$$^%QZCHW("entre le")_" "_JDEB2_" "_$$^%QZCHW("et le")_" "_JFIN2)
 S OK=$$MES^%VZEOUI(M,"O")
 D POCLEPA^%VVIDEO
 G:'(OK) TRDD
 S DX=0,DY=3
 S ATCHARG=$$CHARGE^%DLCON2
 S RMAC=$$MACH^%DLCON2,EXMAC=$$RMACH^%DLCON2
 S JOURFIN=$S(JFIN2="":999999,1:JFIN2)
 S LIB=$$^%QZCHW("Initialisation depuis le repertoire")_" "_EXMAC
 S DX=0,DY=3 X XY D CLEBAS^%VVIDEO
 G:MACTRAN="*" ALLMA
 S MAC=MACTRAN
 D TRANSEM
 G TRDD
 
ALLMA S MAC=""
BMACG S MAC=$O(^[QUI]MACAP(MAC))
 G:MAC="" TRDD
 G:MAC="z" TRDD
 D TRANSEM
 G BMACG
 
TRANSEM X XY W $$^%QZCHW("Machine")," ",MAC
 S DY=DY+1 I DY>22 S DX=0,DY=3 D CLEBAS^%VVIDEO
 S VAL=""
BTRAN1 S VAL=$$NXTRIAV^%QSTRUC8(RMAC,MAC,ATCHARG,VAL)
 Q:VAL=""
 S JOUR=$S(JDEB2="":"",1:$$PRVRIAVO^%QSTRUC8(RMAC,MAC,ATCHARG,VAL,DEB2))
BTRAN2 S JOUR=$$NXTRIAVO^%QSTRUC8(RMAC,MAC,ATCHARG,VAL,JOUR)
 G:JOUR="" BTRAN1
 I $$CONTD^%DLMACHI(JOUR)="" D ^%VSQUEAK X XY W "  ",JOUR," -> ",$$^%QZCHW("Forme incorrecte") R *CTR S CTR="",DY=DY+1 I DY>22 S DX=0,DY=3 D CLEBAS^%VVIDEO G BTRAN2
 G:JOUR>JOURFIN BTRAN1
 X XY W "  ",$$^%QZCHW("Le")," ",JOUR," ",$$^%QZCHW("charge de")," ",VAL
 S DY=DY+1 I DY>22 S DX=0,DY=3 D CLEBAS^%VVIDEO
 I '($D(^[QUI]MACAP(MAC,JOUR))) S P1="",P2="^^^" G TRAN3
 S CH=^[QUI]MACAP(MAC,JOUR)
 S P2=$P(CH,"^",3,6),P1=$P(CH,"^")
 K ^[QUI]MACAP(MAC,JOUR)
TRAN3 K ^[QUI]MACOP(MAC,JOUR)
 S ^[QUI]MACAP(MAC,JOUR)=P1_"^"_VAL_"^"_P2
 S ^[QUI]MACOP(MAC,JOUR,EXMAC,1,LIB)=VAL_"^"
 G BTRAN2

