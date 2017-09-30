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

;%DLMACH5^INT^1^59547,73868^0
DLMACH5 ;
 
 
 
 
 
 
 N REPMA,MA,JOUR,ATCHA,CHA,JDEB,JFIN,MACTRAN,JDEB2,JFIN2,JOURFIN,LIG,M
 N REPACT,ATLAN,LAN,STAD,OPER,ORD,GLOER,LACT,ERR,CPTER
 D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("Mise a jour des ACTIVITEs"),0)
 S GLOER=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"ERR")
 K @(GLOER)
 S @GLOER=0
 S REPMA=$$MACH^%DLCON2,REPACT="ACTIVITE"
 I $$NOMLOG^%QSF("ACTIVITE")="" D ERR2($$^%QZCHW("Le repertoire de nom interne ""ACTIVITE"" est inexistant")) G FIN
 S ATCHA=$$CHARGE^%DLCON2,ATLAN=$$RLAN^%DLCON2
 S LACT=$$LIEN1^%QSGEL2(REPMA,REPACT,2)
 S CTR="",JDEB="",JFIN=""
TRDD S ERR=0,DX=0,DY=3 D CLEBAS^%VVIDEO
 S M="     "_$$^%QZCHW("Transferer depuis le (aammjj ou *)")_" : "
 D LIRE2^%VREAD(M,JDEB,0,RM-4,4,4,"","",.CTR,.JDEB)
 G:CTR'="" FIN
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
 D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("Mise a jour des ACTIVITEs"),0)
 S DX=0,DY=3
 S JOURFIN=$S(JFIN2="":999999,1:JFIN2)
 S DX=0,DY=3
 G:MACTRAN="*" ALLMA
 S MA=MACTRAN
 D TRANSEM
 
AFFER S CPTER=@GLOER+1
 I ERR=0 S @GLOER@(CPTER)="   "_M_" : "_$$^%QZCHW("pas d'erreur"),CPTER=CPTER+1
 S @GLOER@(CPTER)="   ",CPTER=CPTER+1
 S @GLOER@(CPTER)="--------",CPTER=CPTER+1
 S @GLOER@(CPTER)="   ",@GLOER=CPTER
 G TRDD
 
FIN I @GLOER=0 S @GLOER@(1)="   "_$$^%QZCHW("Aucun transfert")
 D AFFERR^%QULIMZ(GLOER,$$^%QZCHW("Mise ajour des ACTIVITEs"))
 K @(GLOER)
 Q
 
ALLMA S MA=""
BTRMA S MA=$O(^[QUI]MACOP(MA))
 G:(MA="")!(MA="z") AFFER
 D TRANSEM
 G BTRMA
 
TRANSEM 
 D DESTRUC(MA,JDEB2,JFIN2)
 S JOUR=$S(JDEB2="":0,1:$ZP(^[QUI]MACOP(MA,JDEB2)))
 S JOURFIN=$S(JFIN2="":999999,1:JFIN2)
BJOU S JOUR=$O(^[QUI]MACOP(MA,JOUR))
 Q:JOUR=""
 Q:JOUR>JOURFIN
 X XY W MA," ",JOUR
 S DY=DY+1 I DY=21 S DY=3 D CLEBAS^%VVIDEO
 S INJOUR=MA_","_JOUR
 S MSG=""
 I $$CREER^%QSGEIND(REPACT,INJOUR,JOUR,1,.MSG) D ERR(MA,JOUR,MSG) G BJOU
 S LAN=""
BLAN S LAN=$O(^[QUI]MACOP(MA,JOUR,LAN))
 G:LAN="" BJOU
 S STAD=""
BSTAD S STAD=$O(^[QUI]MACOP(MA,JOUR,LAN,STAD))
 G:STAD="" BLAN
 S OPER=$O(^[QUI]MACOP(MA,JOUR,LAN,STAD,""))
 S CHA=$P(^[QUI]MACOP(MA,JOUR,LAN,STAD,OPER),"^")+0
 S ORD=LAN_"/"_STAD
 D PA^%QSGESTI(REPACT,INJOUR,ATCHA,CHA,ORD)
 D PA^%QSGESTI(REPACT,INJOUR,"STADE",STAD,ORD)
 D PA^%QSGESTI(REPACT,INJOUR,"OPERATION",OPER,ORD)
 D PA^%QSGESTI(REPACT,INJOUR,ATLAN,LAN,ORD)
 G BSTAD
 
DESTRUC(MACH,JDEB,JFIN) 
 N FILS,TYP
 S FILS=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"FILS")
 K @(FILS)
 D MVG^%QSCALVA(REPMA,MACH,LACT,FILS,.TYP)
 Q:@FILS=0
 S JOUR=$S(JDEB2="":0,1:$ZP(@FILS@(JDEB2)))
 S JOURFIN=$S(JFIN2="":999999,1:JFIN2)
BDEST S JOUR=$O(@FILS@(JOUR))
 G:JOUR="" FDEST
 G:JOUR>JOURFIN FDEST
 D SX^%QSGESTK(REPMA,MACH_","_JOUR)
 G BDEST
 
FDEST K @(FILS)
 Q
 
ERR(MACH,JOUR,MSG) 
 N CPT
 S CPT=@GLOER+1
 S @GLOER@(CPT)=MACH_" "_JOUR_" : "_MSG
 S @GLOER=CPT,ER=1
 Q
 
ERR2(MSG) 
 N CPT
 S CPT=@GLOER+1
 S @GLOER@(CPT)="   "_MSG
 S @GLOER=CPT,ER=1
 Q

