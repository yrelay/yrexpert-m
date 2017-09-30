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

;%QMDRSTA^INT^1^59547,73877^0
QMDRSTA ;
 
 
 
 
 
 
INST 
 N GLO,ROUINI,ROUSTO,PAG,X1,X2,X3,X4,REG,LIG,GLJO,GLHO
 D POCLEPA^%VVIDEO,BLD^%VVIDEO,BLK^%VVIDEO
 W $$^%QZCHW("Generation automatique des regimes calendaire standard"_"...")
 D NORM^%VVIDEO
 S GLO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 K @(GLO)
 S GLJO=$$CONCAS^%QZCHAD(GLO,"JOURS.FERIES")
 S GLHO=$$CONCAS^%QZCHAD(GLO,"HORAIRES")
 S ROUINI=$P("^%QMDRSTA","^",2)
 S ROUSTO=$P("^%QMDRSTT","^",2)
 S X1="ZR  ZL @ROUSTO X X2 X X3 X X4 ZL @ROUINI"
 S X2="S REG=$T(NOM),REG=$P(REG,"";;"",2)"
 S X3="F PAG=1:1 S LIG=$T(HORAIRE+PAG) Q:$$GETLBLAN^%VTLBLAN($P(LIG,"";;""))=""FERIES""  S @GLHO@(PAG)=$P(LIG,"";;"",2)"
 S X4="F PAG=1:1 S LIG=$T(FERIES+PAG) Q:LIG=""""  S @GLJO@(PAG)=$P(LIG,"";;"",2)"
 X X1
 Q:REG=""
 D AFFGLO
 K @(GLO)
 S ROUSTO=$P("^%QMDRST2","^",2) X X1 D AFFGLO K @(GLO)
 S ROUSTO=$P("^%QMDRST3","^",2) X X1 D AFFGLO K @(GLO)
 D POCLEPA^%VVIDEO
 D ^%VZEAVT($$^%QZCHW("Veuillez lancer une comprehension des regimes calendaire")_" "_"STANDARD, STANDARD.2.EQUIPES "_$$^%QZCHW("et")_" STANDARD.3.EQUIPES")
 Q
 
AFFGLO 
 S ^[QUI]PLCAREGI(REG)=""
 S PAG=""
BSTHO S PAG=$O(@GLHO@(PAG))
 G:PAG="" BSTFE
 S ^[QUI]PLCAHOJO(REG,PAG)=@GLHO@(PAG)
 G BSTHO
 
BSTFE S PAG=$O(@GLJO@(PAG))
 Q:PAG=""
 S ^[QUI]PLCAJOFE(REG,PAG)=@GLJO@(PAG)
 G BSTFE
 
 
 
GEN 
 N GLO,ROUINI,ROUSTO,PAG,X1,X2,REG,PROG,PSYS,GL2
 S GLO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"CAL.STAND")
 K @(GLO)
 S REG="STANDARD"
 S ROUINI=$P("^%QMDRSTA","^",2)
 S ROUSTO=$P("^%QMDRSTT","^",2)
 S @GLO@(1)=ROUSTO_" ;"_$$DATE^%QMDATE_"  Regime calendaire standard"
 S @GLO@(2)="NOM ;;"_REG
 S @GLO@(3)="HORAIRE ;;"
 S N=4
 S PAG=""
BHOJO S PAG=$O(^[QUI]PLCAHOJO(REG,PAG))
 G:PAG="" JOFE
 S @GLO@(N)=" ;;"_^[QUI]PLCAHOJO(REG,PAG)
 S N=N+1
 G BHOJO
 
JOFE S @GLO@(N)="FERIES ;;"
 S N=N+1
BJOFE S PAG=$O(^[QUI]PLCAJOFE(REG,PAG))
 G:PAG="" STOCAL
 S @GLO@(N)=" ;;"_^[QUI]PLCAJOFE(REG,PAG)
 S N=N+1
 G BJOFE
 
STOCAL S X1="D:SYS PARSYS ZR  X X2 ZS @ROUSTO ZR  ZL @ROUINI D:SYS PARPROG"
 S X2="S N="""" F %I=0:0 S N=$O(@GL2@(N)) Q:N=""""  ZI @GL2@(N)"
 S SYS=$E(ROUSTO)="%"
 S PROG=$$PCONF^%INCASTO("PROG")
 S PSYS=$$PCONF^%INCASTO("PSYS")
 S GL2="^["""_PROG_"""]"_$P(GLO,"^",2)
 X X1
 K @(GLO)
 Q
 
GEN2 N GLO,ROUINI,ROUSTO,PAG,X1,X2,REG,PROG,PSYS,GL2
 S GLO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"CAL.STAND") K @(GLO)
 S REG="STANDARD.2.EQUIPES"
 S ROUINI=$P("^%QMDRSTA","^",2),ROUSTO=$P("^%QMDRST2","^",2)
 S @GLO@(1)=ROUSTO_" ;"_$$DATE^%QMDATE_"  Regime calendaire standard 2 equipes"
 S @GLO@(2)="NOM ;;"_REG
 S @GLO@(3)="HORAIRE ;;"
 S N=4,PAG="" G BHOJO
 
 
GEN3 N GLO,ROUINI,ROUSTO,PAG,X1,X2,REG,PROG,PSYS,GL2
 S GLO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"CAL.STAND") K @(GLO)
 S REG="STANDARD.3.EQUIPES"
 S ROUINI=$P("^%QMDRSTA","^",2),ROUSTO=$P("^%QMDRST3","^",2)
 S @GLO@(1)=ROUSTO_" ;"_$$DATE^%QMDATE_"  Regime calendaire standard 2 equipes"
 S @GLO@(2)="NOM ;;"_REG
 S @GLO@(3)="HORAIRE ;;"
 S N=4,PAG="" G BHOJO
 
 
 
INSTAL D CLEPAG^%VVIDEO
 D ^%VZCDB($$^%QZCHW("Generation du regime standard"),0)
 G INST
 
PARSYS 
 D GOTO^%QCSCDIR(PSYS)
 Q
 
PARPROG 
 D GOTO^%QCSCDIR(PROG)
 Q
 ;
 ;
 ;

