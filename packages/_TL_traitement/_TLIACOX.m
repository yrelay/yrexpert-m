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

;%TLIACOX^INT^1^59547,74029^0
%TLIACOX ;;07:10 PM  28 Oct 1993; ; 02 Nov 93  9:53 AM
 
 
 
 
 
 
 
 D MEMX^%QCAMEM
 K (QUI)
 D MKX
 D ALL
 S ^TOZE(QUI,"ROUTINES")=1
 K (QUI)
 D RMEMX^%QCAMEM
 Q
MKX 
 F LBL="X0","X02","X11","X12","X20","X21","X22","X3","X30","X31","X32","X33","X34","X35","X5","X61","X62","X63","X64" S CH=$T(@LBL),CH=$P(CH,";;",2,9999),CH=$$GETLBLAN^%VTLBLAN(CH),@(LBL_"=CH")
 Q
TT K ^TEST
 
 S ^TEST("MESURE.CREATION.INDIVIDU")="",^("ELIMINER.INDIVIDU")=""
 S PREF="xtrt",MAX=4096,ETRT="^TEST"
 X X0
 Q
ALL K ^TEST,^REF(QUI)
 S PREF="Y"_QUI,MAX=4096,ETRT="^[QUI]TTL"
 X X0
 Q
 
X0 ;;S NBROUT=0,TOTIEL=-1 S TRT="" F %E=0:0  S TRT=$O(@ETRT@(TRT)) Q:TRT=""  W !,TRT X X02,X11,X12
 
X02 ;;S NBROUT=NBROUT+1,NBROU=$s(NBROUT<10:"000",NBROUT<100:"00",NBROUT<1000:"0",1:"")_NBROUT S ROUT=PREF_NBROU w !,"  ",ROUT ZR  ZI ROUT_" ;;" S TOT=$L(ROUT)+3 ZI " ;"_TRT S TOT=TOT+$L(TRT)+2
 
 
 
X11 ;;F IREG=1:1 Q:'$D(^[QUI]RQSDON("COMPTRT",TRT,IREG))  S TXREG=^[QUI]TTL(TRT,2,IREG) X X20 I $E(TXREG)'=":" X X21,X22
X12 ;;ZI " G ENDBLK^%TLIACOP" ZS @ROUT
 
 
 
X20 ;;S LBL=IREG S TXTP=LBL_" ;"_TXREG X X63 S ^REF(QUI,TRT,IREG,1)=LBL_"^"_ROUT I $E(TXREG)'=":" S PLUS=0 S TXTP=" S (PARCO(""REG""),PAREXE(""REG""))="_IREG_" K V" X X64
X21 ;;S TXTP=" D CLEAR^%SYSUTI1 X ISCTRLA I CTRLA S @(""ABANDON=""_$$GET^%SGVAR(""CTRLATRT"")) G:ABANDON FIN^%TLIACOP" X X64
X22 ;;F IEL=1:1 Q:'$D(^[QUI]RQSDON("COMPTRT",TRT,IREG,IEL))  S TOTIEL=TOTIEL+1,TXT=^[QUI]RQSDON("COMPTRT",TRT,IREG,IEL) X X30,X31,X32,X33,X34,X35
 
 
 
 
 
X30 ;;S ^REF(QUI,TRT,IREG,IEL)=LBL_"+"_(PLUS+1)_"^"_ROUT 
 
X31 ;;I TXT["DEROUT" S TXTP=" S PARCO(""IEL"")="_IEL X X61
X32 ;;S TXTP=$S(TOTIEL#10=0:" X EXEVISU(EXEVISU(4)) "_TXT,1:" "_TXT) X X61
X33 ;;I TXT["PAREXE(""TRT"")" S TXTP=" I PARCO(""TRT"")'=PAREXE(""TRT"") S V(-1)=$$AFF^%TLOPT(""%"",$J,""%NOM.TRAITEMENT.COURANT"",1,PAREXE(""TRT""))" X X61
X34 ;;I TXT["PAREXE(""LIS"")" S TXTP=" I PARCO(""LIS"")'=PAREXE(""LIS"") S:PAREXE(""LIS"")'="""" V(-1)=$$AJCXT^%TLOPT(""%LISTE.COURANTE"",""L0"",PAREXE(""LIS""))" X X61
 
X35 ;;I TXT["DEROUT" S TXTP=" I DEROUT G @(""BLK""_DEROUT_""^%TLIACOP"")" X X61
 
 
X5 ;;ZS @ROUT
X61 ;;S TOT=TOT+$L(TXTP) X:TOT>MAX X62 S PLUS=PLUS+1 ZI TXTP
X62 ;;S NBROU=$s(NBROUT+1<10:"000",NBROUT+1<100:"00",NBROUT+1<1000:"0",1:"")_(NBROUT+1) ZI " G ^"_PREF_NBROU ZS @ROUT X X02 ZI LBL_" ; (suite)" S TOT=TOT+$L(LBL)+10 S PLUS=0
X63 ;;S TOT=TOT+$L(TXTP) ZI TXTP
X64 ;;S TOT=TOT+$L(TXTP) S PLUS=PLUS+1 ZI TXTP

