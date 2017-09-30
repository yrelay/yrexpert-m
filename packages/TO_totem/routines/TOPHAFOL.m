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

;TOPHAFOL^INT^1^59547,74874^0
TOPHAFOL ;
 
ABREV S PCHP=$P(PCH,"'",1),YAL=$P(PCH,"'",2),PCH=PCHP,YARTP=YART,YART=YAL D RECON G:IMPCTE=1 END S COMP=YAL D ^%ABSIDEN S YART=COMPID I '($D(^[QUI]FULL(COMPID))) S OARTI=ARTI,ARTI=COMPID D ^%ABPARAR S ARTI=OARTI K OARTI
 I $D(^[QUI]FULL(YART,PCH)) G SUI
 S ^UNKN($I,WB1,PCH_"'"_YAL,$E(PCH,1,2)_$R(10000))=1,^REFLATER($I,YA,YAL,PCH)=1,PCHCOMP=PCH_"'"_YAL D IMPB2
 I %TRAC=1 S VPOL(XPX)="^V($I,"""_YAL_""","""_PCH_""")",XPX=XPX+1 G END
 S AEXEC=0 G END
SUI S %RL=1
FIN S %RL=1,VPOL(XPX)="^V($I,"""_YAL_""","""_PCH_""")",XPX=XPX+1,^REFLATER($I,YA,YAL,PCH)=1,PCHCOMP=PCH D PHASBI^TOPHAFOR
 G END
RECON 
 S IMPCTE=0 G:(YAL=$$^%QZCHW("ARTICLE"))!((YAL=$$^%QZCHW("%MACHINE"))!((YAL=$$^%QZCHW("MATIERE"))!(YAL=$$^%QZCHW("PERE")))) SUIT I ('($D(^[QUI]FLIMPLI(WB1,YAL))))&('($D(^[QUI]EXPL(WB1,YAL)))) G SUIT
 S APCH=PCH,PCH=YAL,YARTT=YART,YART=YARTP,YART=YARTT,YAL=PCH,PCH=APCH
 I (YAL=$$^%QZCHW("MATIERE"))!(YAL=$$^%QZCHW("%MACHINE")) G SUIT
 S VPOL(XPX)="^[QUI]CONSTANT(^V($I,YA,"""_YAL_"""),"""_PCH_""")",IMPCTE=1,XPX=XPX+1
 S OYAL=YAL,OPCH=PCH,YAL=WB1,PCH=OYAL D:$D(^[QUI]RANG(WB1,PCH)) IMPB2 S YAL=OYAL,PCH=OPCH G END
SUIT I $D(^[QUI]CONSTANT(YAL,PCH)) S VPOL(XPX)="^[QUI]CONSTANT("""_YAL_""","""_PCH_""")",IMPCTE=1,XPX=XPX+1 G END
 I YAL=$$^%QZCHW("MATIERE") S VPOL(XPX)=$$^%QZCHW("^M($I,^V($I,YA,""MATIERE""),""")_PCH_""")",IMPCTE=1,XPX=XPX+1,YAL=WB1,PCH=$$^%QZCHW("MATIERE") D IMPB2
 I YAL=$$^%QZCHW("%MACHINE") S VPOL(XPX)=$$^%QZCHW("^S($I,^V($I,YA,""%MACHINE""),""")_PCH_""")",IMPCTE=1,XPX=XPX+1,YAL=WB1,PCH=$$^%QZCHW("%MACHINE") D IMPB2
 I YAL=$$^%QZCHW("ARTICLE") S VPOL(XPX)=$$^%QZCHW("^V($I,^V($I,YA,""ARTICLE""),""")_PCH_""")",YAL=$$^%QZCHW("ARTICLE"),IMPCTE=1,XPX=XPX+1 D ^%ABLIBTY G END
 I YAL=$$^%QZCHW("PERE") S VPOL(XPX)=$$^%QZCHW("^V($I,^V($I,YA,""PERE""),""")_PCH_""")",YAL=$$^%QZCHW("PERE"),IMPCTE=1,XPX=XPX+1 G END
 Q
END S YART=YARTP Q
UND S %RL=0,XLAX=0,AAPCH=PCH,PCH=YAL D:$D(^[QUI]RANG(WB1,YAL)) PHASBI^TOPHAFOR S PCH=AAPCH K AAPCH G END
IMPB2 S NOMBIS=1,WTB="^PARINDEF($I,NUFA,TWREF,YA,ABL,OG,OP)",%U3="^V($I,"""_YAL_""","""_PCH_""")",@WTB@(%U3)=1
FINI K WTB,%U1,%U3 S %TRAC=1 Q

