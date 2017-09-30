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

;TO3COPAL^INT^1^59547,74870^0
TO3COPAL ;
 
 S PCHP=$P(PCH,"'",1),YAL=$P(PCH,"'",2),PCH=PCHP
 S YARTP=YART,YART=YAL D RECON G:IMPCTE=1 END2 S COMP=YAL D ^%ABSIDEN S YART=COMPID I '($D(^[QUI]PAR(COMPID))) S OARTI=ARTI,ARTI=COMPID D ^%ABPARAR S ARTI=OARTI K OARTI
 I $D(^[QUI]FULL(YART,PCH)) G OK
 S ^[QUI]UNKN(WB1,PCH_"'"_YAL,$E(PCH,1,2)_$R(10000))=ADEL_" "_FFF,PCHCOMP=PCH_"'"_YAL D DEB^%AB3KEMP,^%AB3IMP2 S %BIL=PCH_$$^%QZCHW("(de ")_YAL_")",%PYT="UP" D ^%ABLIBTY S %BIL=YAL_"("_PCH_$$^%QZCHW(" de)"),%PYT=$$^%QZCHW("O") D ^%ABLIBTY
 I %TRAC=1 S CD2="^V($I,"""_YAL_""","""_PCH_""")" G FIN
 S CONDI=0 G FIN
OK S PCHCOMP=PCH,^[QUI]REFLATER(WB1,YAL,PCHCOMP)=1,%BIL=PCH_$$^%QZCHW("(de ")_YAL_")",%PYT="P" D ^%ABLIBTY S %BIL=YAL_"("_PCH_$$^%QZCHW(" de)"),%PYT=$$^%QZCHW("O") D ^%ABLIBTY
CD2 S CD2="^V($I,"""_YAL_""","""_PCHCOMP_""")"
FIN S %RL=1,YART=YARTP Q
RECON 
 S IMPCTE=0 G:(YAL=$$^%QZCHW("ARTICLE"))!((YAL=$$^%QZCHW("MATIERE"))!((YAL=$$^%QZCHW("%MACHINE"))!(YAL=$$^%QZCHW("PERE")))) TUIS I ('($D(^[QUI]FLIMPLI(WB1,YAL))))&('($D(^[QUI]EXPL(WB1,YAL)))) G TUIS
 S APCH=PCH,PCH=YAL,YARTT=YART,YART=YARTP,YART=YARTT,YAL=PCH,PCH=APCH
 I (YAL=$$^%QZCHW("MATIERE"))!(YAL=$$^%QZCHW("%MACHINE")) G TUIS
 S CD2="^[QUI]CONSTANT(^V($I,YA,"""_YAL_"""),"""_PCH_""")",IMPCTE=1,%BIL=YAL_"("_PCH_$$^%QZCHW(" de)"),%PYT="P" D ^%ABLIBTY S %BIL=PCH_$$^%QZCHW("(de ")_YAL_")",%PYT=$$^%QZCHW("C") D ^%ABLIBTY
 S OYAL=YAL,OPCH=PCH,YAL=WB1,PCH=OYAL D:$D(^[QUI]RANG(WB1,PCH)) ^%AB3IMP2 S YAL=OYAL,PCH=OPCH G END
TUIS I $D(^[QUI]CONSTANT(YAL,PCH)) S CD2="^[QUI]CONSTANT("""_YAL_""","""_PCH_""")",IMPCTE=1,%BIL=PCH_$$^%QZCHW(" de ")_YAL,%PYT=$$^%QZCHW("C") D ^%ABLIBTY G END
 I YAL=$$^%QZCHW("MATIERE") S CD2=$$^%QZCHW("^M($I,^V($I,YA,""MATIERE""),")_""""_PCH_""")",IMPCTE=1,%BIL=PCH_$$^%QZCHW("(de MATIERE)"),%PYT="P" D ^%ABLIBTY S YAL=YA,PCH=$$^%QZCHW("MATIERE") D ^%AB3IMP2 G END
 I YAL=$$^%QZCHW("%MACHINE") S CD2=$$^%QZCHW("^S($I,^V($I,YA,""%MACHINE""),")_""""_PCH_""")",IMPCTE=1,%BIL=PCH_$$^%QZCHW("(de %MACHINE)"),%PYT="P" D ^%ABLIBTY S YAL=YA,PCH=$$^%QZCHW("%MACHINE") D ^%AB3IMP2 G END
 I YAL=$$^%QZCHW("ARTICLE") S CD2=$$^%QZCHW("^V($I,^V($I,YA,""ARTICLE""),"""_PCH_""")"),YAL=$$^%QZCHW("ARTICLE"),IMPCTE=1,%BIL=PCH_$$^%QZCHW("(de ARTICLE)"),%PYT=$$^%QZCHW("P") D ^%ABLIBTY G END
 I YAL=$$^%QZCHW("PERE") S CD2=$$^%QZCHW("^V($I,^V($I,YA,""PERE""),""")_PCH_""")",YAL=$$^%QZCHW("PERE"),IMPCTE=1,%BIL=PCH_$$^%QZCHW("(de PERE)"),%PYT=$$^%QZCHW("P") D ^%ABLIBTY G END
 I YAL=$$^%QZCHW("REALISATION") S CD2=$$^%QZCHW("^V($I,""REALISATION"",""")_PCH_""")",IMPCTE=1 G END
END Q
UND S %RL=0,XLAX=0,AAPCH=PCH,PCH=YAL D:$D(^[QUI]RANG(WB1,YAL)) ^%AB3IMPI S PCH=AAPCH K AAPCH G END
END2 S YART=YARTP Q

