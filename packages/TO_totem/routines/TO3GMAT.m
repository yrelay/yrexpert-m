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

;TO3GMAT^INT^1^59547,74870^0
TO3GMAT ;
 
 K GMT
 
 Q:$D(^KLNTOT($J))
 
 Q:$D(^[QUI]TOTG("TO3PHAS1",YA,"MATIERE"))
 Q:^TOZE($I,"MATIERE")=0  K ^RAIS($I),^CPTEUR($I),^ORDEVAL($I) S %LIEU=$$^%QZCHW("Matiere") D ^TO3WLIEU S $ZT=^TOZE($I,"C") G:$D(^V($I,YA,"$ARGMAT")) FIN K FMATSEL
 S GMTS("STOPM")=0,GMTS("MMAX")=$S($D(^[QUI]MAXMAT(YA)):$P(^[QUI]MAXMAT(YA),"^",1),1:999)
 I $D(^V($I,YA,"FAMMAT")) S FMATSEL(TWREF,^V($I,YA,"FAMMAT"))=1 G END
 I $D(^V($I,YA,$$^%QZCHW("MATIERE"))) S FMATSEL(TWREF,^V($I,YA,$$^%QZCHW("MATIERE")))=1 G END
 S GMT("YF")=$P(^[QUI]TREEWORK(NUFA,0),"^",1)
 I $D(^VBIS($I,GMT("YF"),YA,$$^%QZCHW("MATIERE"))) S FMATSEL(TWREF,^VBIS($I,GMT("YF"),YA,$$^%QZCHW("MATIERE")))=1 G END
 I $D(^VBIS($I,GMT("YF"),YA,"FAMMAT")) S FMATSEL(TWREF,^VBIS($I,GMT("YF"),YA,"FAMMAT"))=1 G END
 K GMT("YF") G:'($D(^[QUI]MATIERE(YA))) ENDF
 S GMT("NCO")="",NTABN="FAMILLE MATIERE",NCLE=2,PNUM=1,NFOR=0,GMT("NCO")="",PARA=$$^%QZCHW(" "),GMT("CONDIT")=0
LOPAR S GMT("NCO")=$O(^[QUI]MATIERE(YA,GMT("NCO"))) G:GMT("NCO")="" END
 S GMT("PRX")="("""_YA_""","""_GMT("NCO")_""")",SOURCE=$E(GMT("PRX"),2,$L(GMT("PRX"))-1) D TESCOND S %ABEND=0 G LOPAR
TESCOND 
RETERR Q:%ABEND=1
 S RBIS=GMT("PRX") D ^TOTSDEFA("MATIERE") K RBIS
 G:'(TSDEF) FIN
 K TSDEF
 S $ZT=^TOZE($I,"C")
 G:'($D(@("^[QUI]EXPRLONG("_SOURCE_",""C"")"))) NOLO
 S %TBL="^[QUI]EXPRLONG("_SOURCE_",""C"")" D GET^TOCHEXPR
 G:%ERR YAERR
 S GMT("CONDIT")=RES1
 G ROLO
NOLO S GMT("ATEST")="^[QUI]CMATIERE"_GMT("PRX"),@("GMT(""CONDIT"")="_@GMT("ATEST"))
ROLO K %TBL G:GMT("CONDIT")=0 FIN
 S CONTAB="^[QUI]AMATIERE"_GMT("PRX"),$ZT="",PRX=GMT("PRX") D ^TOMATADM K PRX Q
FIN Q
END K GMT,SOURCE,RBIS,TSDEF,%TBL,CONTAB,NTABN,NCLE,PNUM,NFOR,PARA I $D(FMATSEL(TWREF)) D GMAT2
 G ENDF
ENDF K GMT,TAMSF,TAMF,TAM,SFMAT,GMT2,CONTAB,ZZ Q
YAERR S xxx=zzz Q
GMAT2 K GMT2 S NTABN="SOUS-FAMILLE MATIERE",NCLE=4,PNUM=1,F1=17,NFOR=1,NTRI=""
 S GMT2("VIRGB")=NVIRG,GMT2("NOMBIS")=NOM,GMT2("ADR2")=ADR,FMS=-1,GMT2("%FMS")=FMS
LOOP S GMT2("%FMS")=$N(FMATSEL(TWREF,GMT2("%FMS"))) G:GMT2("%FMS")=-1 DNE S FMS=GMT2("%FMS") D TRAIT G:GMTS("STOPM")=1 DNE G LOOP
TRAIT S %ABEND=0 I '($D(^[QUI]MATSTOCK(FMS))) G TTT
 S GMT2("MATAS")=FMS,^V($I,YA,$$^%QZCHW("MATIERE"))=GMT2("MATAS"),MSS=GMT2("MATAS"),GMT2("SEP")="."
 S FMS=$P(GMT2("MATAS"),GMT2("SEP"),1),SFMAT=FMS_GMT2("SEP")_$P(GMT2($$^%QZCHW("MATAS")),GMT2("SEP"),2)
 D ^TO3GPMAT Q:%ABEND=1  S MATSEL(TWREF,GMT2("MATAS"),1)=1_"^"_GMT2("MATAS")_"^"_GMT2("MATAS") D AFFMAT Q
TTT K GMTS("OOSTOP") S:$D(STOP) GMTS("OOSTOP")=STOP S NOMTAB="^[QUI]SELMAT("""_YA_""","""_FMS_"""",ADR="^TO3GMAT3" D ^%VTENR S:$D(GMTS("OOSTOP")) STOP=GMTS("OOSTOP") Q
AFFMAT S @%TBEV@("CARDMAT")=@%TBEV@("CARDMAT")+1 S:@%TBEV@("CARDMAT")'<GMTS("MMAX") GMTS("STOPM")=1 S DE=22,FI=DE D ^%ABNETTO S DX=0,DY=22 X XY W $$^%QZCHW("Matiere selectionne pour "),YA,$$^%QZCHW(" : "),GMT2($$^%QZCHW("MATAS")) Q
NIF S DX=0,(DE,FI)=22 D ^%ABNETTO Q
DNE S NVIRG=GMT2("VIRGB"),NOM=GMT2("NOMBIS"),ADR=GMT2("ADR2") K GMT2,GMTS,%RS,MSS,FMS,B3,B4 Q

