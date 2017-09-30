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

;TO3GMACH^INT^1^59547,74870^0
TO3GMACH ;
 
 
 Q:$D(^KLNTOT($J))
 
 Q:'($D(^PHASADM($I,NUFA,TWREF,"MAC",0)))
 S GM="GMACH" K GM S NTABN="SELECTION MACHINE",NCLE=4,PNUM=1,NFOR=0,NTRI="",PARA=$$^%QZCHW(" "),GM("CONDIT")=0
 S GM("VIRGB")=NVIRG,GM("NOMBIS")=NOM,GM("ADR2")=ADR,GM("SMF")=-1,TBO="^GLOETUD($I,NUFA,TWREF,""SELMAC"",%N11)",%N11=0
LFM S GM("SMF")=$N(FMATSEL(TWREF,GM("SMF"))) G:GM("SMF")=-1 END
 S GM("RFM")=FMATSEL(TWREF,GM("SMF")),GM("TY")=$P(GM("RFM"),"|",3),GM("TH")=$P(GM("RFM"),"|",2)
 S GM("TH")=$S($A(GM("TH"))<32:"???",1:GM("TH")),GM("S1")=$P(GM("RFM"),"|",1),(GM("%CFMS"),FMS)=GM("SMF"),%N11=0,GM("MFIC")=$$^TOFISFAM("^[QUI]MACSEL("""_YA_""","""_GM("S1")_""")",GM("S1"),GM("SMF")) S:GM("MFIC")="" GM("MFIC")=FMS
 K GM("RFM") G:$D(^[QUI]MACSEL(YA,GM("S1"),GM("MFIC"))) TRAIT
 I GM("TY")="S" S TAMPON(GM("SMF"))=GM("TH") G RLFM
 S GM("SFMAT")=GM("S1"),SFMA2=GM("S1"),(MSS,^V($I,YA,$$^%QZCHW("%MACHINE")))=FMS D:GM("TY")'["?" ^TO3GPMAC S MATSEL(GM("TH"),GM("SMF"))=1 G RLFM
RLFM K ^PHASADM($I,NUFA,TWREF,"MAC",0,NMA,"CH",FMS) G LFM
TRAIT S %ABEND=0,GM("FER")=""""_YA_""","""_GM("S1")_""","""_GM("MFIC")_"""",GM("FERP")="("_GM("FER")_")",GM("SFMAT")=GM("S1"),SFMA2=GM("S1"),(MSS,^V($I,YA,$$^%QZCHW("%MACHINE")))=FMS,TSVU=1 D ^TO3GPMAC,TESCOND
 G:%N10=0 LFM S %N11=1 D TESCOND G:TSVU=1 RLFM G LFM
TESCOND S NTABN="SELECTION MACHINE",NCLE=4,PNUM=1,NFOR=0
RETERR Q:%ABEND=1  S $ZT=^TOZE($I,"C")
 S GM("PLUS")=-1,GM("CONDIT")="",TC="^[QUI]CMACSEL"_GM("FERP"),TSVU=1 F RR=0:0 S GM("PLUS")=$N(@TBO@(YA,GM("S1"),GM("MFIC"),GM("PLUS"))) Q:GM("PLUS")=-1  D T2 Q:GM("CONDIT")=1
 Q
T2 S GM("CONDIT")=0,(GM("PRX"),RBIS)="("_GM("FER")_","""_GM("PLUS")_""")",TSDEF=1,SOURCE=$E(GM("PRX"),2,$L(GM("PRX"))-1) I %N11=1 D ^TOTSDEFA("MACSEL") I '(TSDEF) S TSVU=0 Q
 D ATEST Q:GM("CONDIT")=0  D AFFECT Q
ATEST S GM("ECHEC")=1,GM("ATEST")="^[QUI]CMACSEL"_GM("PRX") G:'($D(@("^[QUI]EXPRLONG("_SOURCE_",""C"")"))) NOLO S %TBL="^[QUI]EXPRLONG("_SOURCE_",""C"")" D GET^TOCHEXPR G:%ERR YAERR S GM("CONDIT")=RES1 G ROLO
NOLO S @("GM(""CONDIT"")="_@GM("ATEST"))
ROLO Q
AFFECT S GM("MACHEC")=0 S:'($D(TAUX)) TAUX=0 S:$A(TAUX)<32 TAUX=0 S MATSEL(TAUX,MSS)=1 K ^PHASADM($I,NUFA,TWREF,"MAC",0,NMA,"CH",FMS)
 S DE=22,FI=DE D ^%ABNETTO S DX=0,DY=22 X XY W $$^%QZCHW("Machine selectionnee pour "),YA,$$^%QZCHW(" : "),MSS Q
FIN S DX=0,(DE,FI)=22 D ^%ABNETTO Q
END S NVIRG=GM("VIRGB"),NOM=GM("NOMBIS"),ADR=GM("ADR2") K GM,%TBL,%ERR,TAUX,FMS,MSS
 Q
 
TAMPON S TAMPON(FMS)=1,GM("MACHEC")=0 Q
YAERR S xxx=zzz Q

