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

;TOTBTDF3^INT^1^59547,74876^0
TOTBTDFS ;
 
 
 
 
 
 
 
 
 S:'($D(NBL)) NBL=8 S:'($D(NBNH)) NBNH=6
 K ^GRAPH($J),^L($J)
 S ^L($J,1)=%ART,^L($J,1,%ART)=%DOM,^L($J,1,%ART,%DOM)=%ATTR,(^L($J,$$^%QZCHW("HAUT")),^L($J,$$^%QZCHW("BAS")))=1
 F %P=1:1 S P=^L($J,$$^%QZCHW("BAS")) Q:^L($J,$$^%QZCHW("HAUT"))<P  S A=^L($J,P),D=^L($J,P,A),I=^L($J,P,A,D),^L($J,$$^%QZCHW("BAS"))=P+1 D T1
 S H=$P($H,",",2)\3600,M=($P($H,",",2)-(H*3600))\60,H=H_"H"_$S($L(M)=1:"0"_M,1:M)
 K TEXT
 S TEXT(1)=$$^%QZCHW("Le ")_%DAT_$$^%QZCHW(" a ")_H_$$^%QZCHW("      Savoir-Faire pour ")_WHOIS
 S TEXT(2)=$$^%QZCHW("               ")_%ART_"/"_%DOM_"/"_%ATTR D EXPL
 S TAB="^GRAPH($J)" D ^TOTBSARG
 
 D ^TOTBMAJT S %NOEUD=%ATTR
 D POCLEPA^%VVIDEO W $$^%QZCHW("Un instant ... preparation de l'arbre en cours") D CLEPAG^%VVIDEO,^%PBMGRA3
FIN K A,A2,%A2,^GRAPH($J),D,D2,%D2,DEFA,DEFI,F,%F,I,%I,LF,^L($J),NBL,NBNH,P,P2,RSIN,TAB,%NOEUD,X1,X2 Q
T1 K LF S F=-1 F %F=1:1 S F=$N(^[QUI]SENSFICH(A,1,D,I,F)) Q:F=-1  D T11
 Q
T11 S RSIN=$S('($D(^[QUI]REPFICH(A,D,""""_I_$$^%QZCHW(""",""SINON""")))):0,1:^[QUI]REPFICH(A,D,""""_I_$$^%QZCHW(""",""SINON"""))=F),RSIN=$S(RSIN=0:"R:",1:"RS:")
 S LF(F)="" I $N(^[QUI]SENSFICH(A,0,D,F,"BES",-1))=-1 S ^GRAPH($J,A_"/"_D_"/"_I)="ROND",^GRAPH($J,A_"/"_D_"/"_I,RSIN_A_"/"_F)="",^GRAPH($J,RSIN_A_"/"_F)="ANTI-TRIANGLE" Q
 S D2=-1 F %D2=1:1 S D2=$N(^[QUI]SENSFICH(A,0,D,F,"BES",D2)) Q:D2=-1  S A2=-1 F %A2=1:1 S A2=$N(^[QUI]SENSFICH(A,0,D,F,"BES",D2,A2)) Q:A2=-1  D T2
 Q
T2 S I2=-1 F %I2=1:1 S I2=$N(^[QUI]SENSFICH(A,0,D,F,"BES",D2,A2,I2)) Q:I2=-1  D T3
 Q
T3 I '($D(^L($J,"TRAI",A2,D2,I2))) S P=^L($J,$$^%QZCHW("HAUT"))+1,^L($J,P)=A2,^L($J,P,A2)=D2,^L($J,P,A2,D2)=I2,^L($J,$$^%QZCHW("HAUT"))=P,^L($J,"TRAI",A2,D2,I2)=""
 S ^GRAPH($J,A_"/"_D_"/"_I,RSIN_A_"/"_F)="",^GRAPH($J,RSIN_A_"/"_F,A2_"/"_D2_"/"_I2)="",^GRAPH($J,A_"/"_D_"/"_I)="ROND",^GRAPH($J,RSIN_A_"/"_F)="TRIANGLE"
 Q
EXPL 
 S P=-1
 F %P=0:0 S P=$N(^GRAPH($J,P)) Q:P=-1  S F=-1 F %F=0:0 S F=$N(^GRAPH($J,P,F)) Q:F=-1  I ('($D(^GRAPH($J,F))))&$F(F,$$^%QZCHW("IMPLICITE"),0) K ^GRAPH($J,P,F) S %CH=F,%OLD=$$^%QZCHW("IMPLICITE"),%NEW="EXPLICITE" D ^TONCSU S F=%NEWCH,^GRAPH($J,P,F)=""
 K %CH,F,%F,%NEW,%NEWCH,%OLD,P,%P Q
TEST D CLEPAG^%VVIDEO S DXG=0,DXD=39,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("ARBRES DE SF") D TO4^%VZCD
 S %AJCMS="",CMS=0,SCR="TOTBTDF3",NOMTAB="" D B^%VACTISC Q:ABENDSCR
 S %ART=RESUL(2),%DOM=RESUL(3),%ATTR=RESUL(4),NBL=$S(RESUL(5)'="":RESUL(5),1:10),NBNH=$S(RESUL(6)'="":RESUL(6),1:10)
 I (((RESUL(1)="")!(%ART=""))!(%DOM=""))!(%ATTR="") Q
 D POCLEPA^%VVIDEO W $$^%QZCHW("Un instant ... recherche du savoir-faire en cours") D TOTBTDFS,^%PBPZGRA,^%PBPZCLR,^%PBPZALF G TEST

