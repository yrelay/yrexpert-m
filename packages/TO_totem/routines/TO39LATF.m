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

;TO39LATF^INT^1^59547,74869^0
TO39LATF ;
 
ABREV S PCHP=$P(PCH,"'",1),YAL=$P(PCH,"'",2),PCH=PCHP,YARTP=YART,YART=YAL D RECON G:IMPCTE=1 END S COMP=YAL D ^%ABSIDEN S YART=COMPID I '($D(^[QUI]FULL(COMPID))) S OARTI=ARTI,ARTI=COMPID D ^%ABPARAR S ARTI=OARTI K OARTI
 I $D(^[QUI]FULL(YART,PCH)) G SUI
 S ^[QUI]UNKN(WB1,PCH_"'"_YAL,$E(PCH,1,2)_$R(10000))=ADEL_" "_FFF,^[QUI]REFLATER(WB1,YAL,PCH)=1,PCHCOMP=PCH_"'"_YAL D DEB^TO39KEMP S %BIL=PCH_$$^%QZCHW("(de ")_YAL_")",%PYT="UP" D ^%ABLIBTY S %BIL=YAL_"("_PCH_$$^%QZCHW(" de )"),%PYT=$$^%QZCHW("O") D ^%ABLIBTY
 I %TRAC=1 S VPOL(XPX)="^V($I,"""_YAL_""","""_PCH_""")",XPX=XPX+1 G END
 S AEXEC=0 G END
SUI S %RL=1
FIN S CONCUR=1,%RL=1,VPOL(XPX)="^V($I,"""_YAL_""","""_PCH_""")",XPX=XPX+1,^[QUI]REFLATER(WB1,YAL,PCH)=1,PCHCOMP=PCH_"'"_YAL D ^TO39KEMP S %BIL=PCH_$$^%QZCHW("(de ")_YAL_")",%PYT="P" D ^%ABLIBTY S %BIL=YAL_"("_PCH_$$^%QZCHW(" de)"),%PYT=$$^%QZCHW("O") D ^%ABLIBTY G END
RECON 
 S IMPCTE=0 G:(YAL=$$^%QZCHW("MATIERE"))!((YAL=$$^%QZCHW("%MACHINE"))!((YAL=$$^%QZCHW("ARTICLE"))!(YAL=$$^%QZCHW("PERE")))) SUIT I ('($D(^[QUI]FLIMPLI(WB1,YAL))))&('($D(^[QUI]EXPL(WB1,YAL)))) G SUIT
 S APCH=PCH,PCH=YAL,YARTT=YART,YART=YARTP,YART=YARTT,YAL=PCH,PCH=APCH
 I (YAL=$$^%QZCHW("MATIERE"))!(YAL=$$^%QZCHW("%MACHINE")) G SUIT
 S VPOL(XPX)="^[QUI]CONSTANT(^V($I,YA,"""_YAL_"""),"""_PCH_""")",IMPCTE=1,XPX=XPX+1,%BIL=YAL_"("_PCH_$$^%QZCHW(" de)"),%PYT="P" D ^%ABLIBTY S %BIL=PCH_$$^%QZCHW("(de ")_YAL_")",%PYT=$$^%QZCHW("C") D ^%ABLIBTY
 S PCHCOMP=YAL D ^TO39KEMP S OYAL=YAL,OPCH=PCH,YAL=WB1,PCH=OYAL,YAL=OYAL,PCH=OPCH G END
SUIT I $D(^[QUI]CONSTANT(YAL,PCH)) S VPOL(XPX)="^[QUI]CONSTANT("""_YAL_""","""_PCH_""")",IMPCTE=1,XPX=XPX+1,%BIL=PCH_$$^%QZCHW(" de ")_YAL,%PYT=$$^%QZCHW("C") D ^%ABLIBTY G END
 I YAL=$$^%QZCHW("MATIERE") S VPOL(XPX)=$$^%QZCHW("^M($I,^V($I,YA,""MATIERE""),""")_PCH_""")",IMPCTE=1,PCHCOMP=YAL,CONCUR=1 D ^TO39KEMP S %BIL=PCH_$$^%QZCHW("(de MATIERE)"),%PYT="P" D ^%ABLIBTY S XPX=XPX+1,YAL=WB1,PCH=$$^%QZCHW("MATIERE") D ^%AB3IMP2
 I YAL=$$^%QZCHW("%MACHINE") S VPOL(XPX)=$$^%QZCHW("^S($I,^V($I,YA,""%MACHINE""),""")_PCH_""")",IMPCTE=1,PCHCOMP=YAL,CONCUR=1 D ^TO39KEMP S %BIL=PCH_$$^%QZCHW("(de %MACHINE)"),%PYT="P" D ^%ABLIBTY S XPX=XPX+1,YAL=WB1,PCH=$$^%QZCHW("%MACHINE")
 I YAL=$$^%QZCHW("ARTICLE") S VPOL(XPX)=$$^%QZCHW("^V($I,^V($I,YA,""ARTICLE""),""")_PCH_""")",YAL=$$^%QZCHW("ARTICLE"),IMPCTE=1,XPX=XPX+1,%BIL=PCH_$$^%QZCHW("(de ARTICLE)"),%PYT=$$^%QZCHW("P") D ^%ABLIBTY G END
 I YAL=$$^%QZCHW("PERE") S VPOL(XPX)=$$^%QZCHW("^V($I,^V($I,YA,""PERE""),""")_PCH_""")",YAL=$$^%QZCHW("PERE"),IMPCTE=1,XPX=XPX+1,%BIL=PCH_$$^%QZCHW("(de PERE)"),%PYT=$$^%QZCHW("P") D ^%ABLIBTY G END
 Q
END S YART=YARTP Q
UND Q

