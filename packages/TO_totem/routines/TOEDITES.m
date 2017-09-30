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

;TOEDITES^INT^1^59547,74872^0
TOEDITES ;
 
 I $D(^TABIDENT(WHOIS,"INTERDIT","EXEC",$I)) S INT=$$^%QZCHW(" E X E C U T I O N ") D ^TONOEXEC Q
 D CLEPAG^%VVIDEO S DXG=0,DXD=38,DYH=0,DYB=4,GRAPH=1,MSG=$$^%QZCHW("Synthese d'etudes batch") D TO4^%VZCD
 K ^ETBATCH($I)
 S %NUBATCH=1,DX=0,DY=4
DEB1 S DX=0,DY=DY+1 X XY W $$^%QZCHW("Article : ") S DX=$X D ^%VLEC G:CTRLA=1 FIN G:(CTRLF=1)!(Y1="") QU S ARP=Y1,CONS=0
 I $D(^[QUI]PROBTEST(ARP)) W $$^%QZCHW(" (Consultation)") S CONS=1
GPAR S DX=40 X XY W $$^%QZCHW("Date : ") S DX=$X D ^%VLEC G:((CTRLA=1)!(CTRLF=1))!(Y1="") DEB1 I Y1="?" S ODY=DY D POCLEPA^%VVIDEO W $$^%QZCHW("Donner la date sous la forme AA/MM/JJ ou AA/MM ou AA    [RETURN] ") R *REP D POCLEPA^%VVIDEO S DY=ODY G GPAR
 D CTRDAT I REFUS=1 D ^%VSQUEAK S DX=40 X XY W "               " G GPAR
 S DX=47 X XY W "                  " X XY W DAAT D GETART G DEB1
QU G:'($D(^ETBATCH($I))) FIN D ^TOEDTGET,^TOEDTEDI
QU1 
FIN Q
GETART K ^TACOMPIL($I) G:CONS=0 CONS0 S CONS=ARP,NF=-1 F UY=0:0 S NF=$N(^[QUI]PROBTEST(ARP,NF)) Q:NF=-1  D GETAR1
 S ARP=-1 F UW=1:1 S ARP=$N(^TACOMPIL($I,ARP)) Q:ARP=-1  D GETAR4
 G FIN
GETAR4 K VALCLE S VALCLE(1)=ARP,VALCLE(2)=DAAT,VALCLE(3)=CONS,ADR="GETAR3^TOEDITES",NOMTAB="^[QUI]RESTEST" D ^%VKMULG
 G FIN
GETAR3 Q:B1'=ARP  Q:(CONS'="")&(B3'=CONS)  S ^ETBATCH($I,%NUBATCH)=""""_B1_""","""_B2_""","""_B3_""","""_B4_""","""_B5_"""",%NUBATCH=%NUBATCH+1
 Q
CONS0 S CONS="" G GETAR4
GETAR1 I $D(^[QUI]PROBTEST(ARP,NF))=1 S RS=^[QUI]PROBTEST(ARP,NF) D ^%VKMULC G GETAR2
 S %NOM="^[QUI]PROBTEST(ARP,NF)" D ^%VKMULNG
GETAR2 F UW=1:2:9 S UW1=UW+1 I $D(%RS(UW1)),%RS(UW1)'="" S ARP=$P(%RS(UW1),":",1),^TACOMPIL($I,ARP)=1
 G FIN
KILL I '(DTM) K (PIMEN,PIM,%1WW,BATCH,%NUBATCH,QUI,WHOIS,%PROGEX) G KILL1
 S TAB125=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TAB125") K @(TAB125)
 F I="PIMEN","PIM","%1WW","BATCH","%NUBATCH","QUI","WHOIS","%PROGEX","TAB125" S @TAB125@(I)=""
 D KEXMEM^%QCAMEM(TAB125) K TAB125
KILL1 D CURRENT^%IS,VARSYS^%QCSAP
 Q
CTRDAT K PP,QQ S REFUS=0 F UU=1:1:3 S PP(UU)=$P(Y1,"/",UU)
 D ZD^%QMDATE4 S QQ(1)=$P(%DAT,"/",3),QQ(2)=$P(%DAT,"/",2),QQ(3)=$P(%DAT,"/",1) S:(PP(2)="")&(PP(1)="") PP(2)=QQ(2) S:PP(1)="" PP(1)=QQ(1)
 S %PCH=PP(1) D ^%QZNBN1 G:'(ISNUM) REFUS
 I PP(2)'="" S %PCH=PP(2) D ^%QZNBN1 G:'(ISNUM) REFUS I (%PCH>12)!(%PCH<1) G REFUS
 I PP(3)'="" S %PCH=PP(3) D ^%QZNBN1 G:'(ISNUM) REFUS I (%PCH>31)!(%PCH<1) G REFUS
 F UU=1:1:3 S:$L(PP(UU))=1 PP(UU)=0_PP(UU)
 S DAAT=PP(1)_"/" F UU=2:1:3 S DAAT=DAAT_$S(PP(UU)="":"",1:PP(UU)_$S(UU=2:"/",1:""))
 K PP,QQ,UU,%CAR,RS Q
REFUS S REFUS=1 Q

