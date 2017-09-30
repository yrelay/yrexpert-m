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

;%DLMACHI^INT^1^59547,73868^0
%DLMACHI ;
 
 
 
 
 
 
 
 
 
TRANS 
 N REPMA,MA,JOUR,ATCHA,CHA,JDEB,JFIN,MACTRAN,JDEB2,JFIN2,JOURFIN,LIG,M
 D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("Transfert des charges Description -> Repertoire"),0)
 S REPMA=$$MACH^%DLCON2
 S ATCHA=$$CHARGE^%DLCON2
 S CTR="",JDEB="",JFIN=""
TRDD S DX=0,DY=3 D CLEBAS^%VVIDEO
 S M="     "_$$^%QZCHW("Transferer depuis le (aammjj ou *)")_" : "
 D LIRE2^%VREAD(M,JDEB,0,RM-4,4,4,"","",.CTR,.JDEB)
 Q:CTR'=""
 S LIG=6,JDEB=$$GETLBLAN^%VTLBLAN(JDEB)
 I JDEB="*" S JDEB2="",JFIN2="" G TRMA
 I JDEB="" S (JDEB2,JDEB)=$$DATENO3^%QMDATE($H),DX=$L(M)+1,DY=5 X XY W JDEB G TRDF
 S JDEB2=$$CONTD(JDEB)
 G:JDEB2="" TRDD
TRDF S M="     "_$$^%QZCHW("Jusqu'au             (aammjj ou *)")_" : "
 D LIRE2^%VREAD(M,JFIN,0,RM-4,6,6,"","",.CTR,.JFIN)
 G:CTR'="" TRDD
 S LIG=8,JFIN=$$GETLBLAN^%VTLBLAN(JFIN)
 I JFIN="*" S JFIN2="" G TRMA
 I JFIN="" S (JFIN2,JFIN)=$$DATENO3^%QMDATE($H),DX=$L(M)+1,DY=7 X XY W JFIN G TRMA
 S JFIN2=$$CONTD(JFIN)
 I JFIN2="" G TRDF
 G:'($$INFD(JDEB,JFIN)) TRDF
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
 S JOURFIN=$S(JFIN2="":999999,1:JFIN2)
 G:MACTRAN="*" ALLMA
 S MA=MACTRAN
 D TRANSEM
 G TRDD
 
ALLMA S MA=""
BTRMA S MA=$O(^[QUI]MACAP(MA))
 G:(MA="")!(MA="z") TRDD
 D TRANSEM
 G BTRMA
 
TRANSEM 
 S JOUR=$S(JDEB2="":"",1:$ZP(^[QUI]MACAP(MA,JDEB2)))
 S JOURFIN=$S(JFIN2="":999999,1:JFIN2)
BTRSEM S JOUR=$O(^[QUI]MACAP(MA,JOUR))
 Q:JOUR=""
 Q:JOUR>JOURFIN
 S CHA=$P(^[QUI]MACAP(MA,JOUR),"^",2)+0
 X XY W MA," ",JOUR," ",CHA
 D:'($$IR^%QSGE5(REPMA,MA)) PA^%QSGESTI(REPMA,MA,"NOM",MA,1)
 D PA^%QSGESTI(REPMA,MA,ATCHA,CHA,JOUR)
 S DY=DY+1 I DY=21 S DY=3 D CLEBAS^%VVIDEO
 G BTRSEM
 
 
 
EPUR 
 N REPMA,MA,JOUR,ATCHA,CHA,CTR,M,JDEB,JDEB2,JFIN,JFIN2,LIG,JOURFIN
 D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("Epuration des charges dans les descriptions des machines et le repertoire"),0)
 S DX=10,DY=10 X XY D BLD^%VVIDEO
 W $$^%QZCHW("Les charges affectees aux machines pour les jours")
 S DY=11 X XY
 W $$^%QZCHW("entre les 2 dates que vous allez saisir vont etre")
 S DY=12 X XY W $$^%QZCHW("detruites") R *CTR
 D ^%VSQUEAK,NORM^%VVIDEO
 S CTR="",JDEB="",JFIN=""
EPDD S DX=0,DY=3 D CLEBAS^%VVIDEO
 S M="     "_$$^%QZCHW("Epurer depuis le (aammjj ou *)")_" : "
 D LIRE2^%VREAD(M,JDEB,0,RM-4,4,4,"","",.CTR,.JDEB)
 Q:CTR'=""
 S LIG=6
 I JDEB="*" S JDEB2="",JFIN2="" G EPMA
 I JDEB="" S (JDEB2,JDEB)=$$DATENO3^%QMDATE($H),DX=$L(M)+1,DY=5 X XY W JDEB G EPDF
 S JDEB2=$$CONTD(JDEB)
 G:JDEB2="" EPDD
EPDF S M="     "_$$^%QZCHW("Jusqu'au         (aammjj ou *)")_" : "
 D LIRE2^%VREAD(M,JFIN,0,RM-4,6,6,"","",.CTR,.JFIN)
 G:CTR'="" EPDD
 S LIG=8
 I JFIN="*" S JFIN2="" G EPMA
 I JFIN="" S (JFIN2,JFIN)=$$DATENO3^%QMDATE($H),DX=$L(M)+1,DY=7 X XY W JFIN G EPMA
 S JFIN2=$$CONTD(JFIN)
 I JFIN2="" G EPDF
EPMA D LIRE2^%VREAD("     "_$$^%QZCHW("Machine")_"                      (*) : ","",0,RM-4,LIG,LIG,"","",.CTR,.MACPUR)
 I CTR'="" G:LIG=6 EPDD G EPDF
 I MACPUR="" D ^%VSQUEAK G EPMA
 I MACPUR'="*",'($D(^[QUI]DESMACH(MACPUR))) D ^%VZEAVT($$^%QZCHW("Machine inconnue")_"...") G EPMA
 D POCLEPA^%VVIDEO
 S M=$S(MACPUR="*":$$^%QZCHW("TOUTES les machines"),1:$$^%QZCHW("Machine")_" "_MACPUR)_" "
 S M=M_$S(JDEB="*":$$^%QZCHW("pour TOUTES les charges"),1:$$^%QZCHW("entre le")_" "_JDEB2_" "_$$^%QZCHW("et le")_" "_JFIN2)
 S OK=$$MES^%VZEOUI(M,"O")
 D POCLEPA^%VVIDEO
 G:'(OK) EPDD
 S DX=0,DY=3
 S REPMA=$$MACH^%DLCON2,ATCHA=$$CHARGE^%DLCON2
 S DX=0,DY=3 D CLEBAS^%VVIDEO
 S JOURFIN=$S(JFIN2="":999999,1:JFIN2)
 G:MACPUR="*" ALLEPMA
 S MA=MACPUR
 D EPURSEM
 G EPDD
 
ALLEPMA 
 S MA=""
BEPMA S MA=$O(^[QUI]MACAP(MA))
 G:(MA="")!(MA="z") EPDD
 X XY W $$^%QZCHW("Machine")," ",MA
 S DY=DY+1 I DY=21 S DY=3 D CLEBAS^%VVIDEO
 D EPURSEM
 G BEPMA
 
EPURSEM 
 S JOUR=$S(JDEB2="":"",1:$ZP(^[QUI]MACAP(MA,JDEB2)))
BEPSEM S JOUR=$O(^[QUI]MACAP(MA,JOUR))
 G:JOUR="" BEPQUER
 G:JOUR>JOURFIN BEPQUER
 K ^[QUI]MACAP(MA,JOUR)
 K ^[QUI]MACOP(MA,JOUR)
 X XY W "   ",$$^%QZCHW("Description")," : ",JOUR
 S DY=DY+1 I DY=21 S DY=3 D CLEBAS^%VVIDEO
 G BEPSEM
 
BEPQUER S VAL=""
BEPQUV S VAL=$$NXTRIAV^%QSTRUC8(REPMA,MA,ATCHA,VAL)
 Q:VAL=""
 S JOUR=$S(JDEB2="":"",1:$$PRVRIAVO^%QSTRUC8(REPMA,MA,ATCHA,VAL,JDEB2))
BEPQU S JOUR=$$NXTRIAVO^%QSTRUC8(REPMA,MA,ATCHA,VAL,JOUR)
 G:JOUR="" BEPQUV
 G:JOUR>JOURFIN BEPQUV
 X XY W "   ",$$^%QZCHW("Repertoire")," : ",JOUR
 S DY=DY+1 I DY=21 S DY=3 D CLEBAS^%VVIDEO
 D PSO^%QSGESTI(REPMA,MA,ATCHA,JOUR)
 G BEPQU
 
CONTD(DAT) 
 N D
 S D=$$^%QMDAINT(DAT,3)
 G:D="" CONTDER
 G:D=DAT CONTDER
 Q DAT
 
CONTDER D ^%VZEAVT($$^%QZCHW("Date incorrecte"))
 Q ""
 
CONTD2(DAT) 
 N D
 S D=$$^%QMDAINT(DAT,3)
 Q:D="" ""
 Q:D=DAT ""
 Q DAT
 
INFD(DAT1,DAT2) 
 I DAT2<DAT1 D ^%VZEAVT($$^%QZCHW("2nde date inferieure a la 1ere")) Q 0
 Q 1
 ;

