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

;TOWPTEX1^INT^1^59547,74876^0
TOWPTEX1 ;
 
QUES S IMPR=0 K ^TACOMPIL($I),^COMPILVU($I) S EFF="                                  ",%NN=1,%IMP=1,%PN=7 D CLEPAG^%VVIDEO S DXG=0,DXD=39,DYH=0,DYB=4,MSG=$$^%QZCHW("Edition de cliches"),GRAPH=1
 D TO4^%VZCD,POCLEPA^%VVIDEO W $$L23^%QSLIB2("Donnez le numero d'etude,(?) Liste, RETURN fin de liste") S DX=5,DY=6 X XY
 S DX=5,DY=6 X XY W $$^%QZCHW("Cliche pour : ")
READ S DX=19,DY=6 D ^%VLEC G:CTRLA=1 FIN G:(CTRLF=1)!(Y1="") RET1 S SFA=Y1 G:$E(SFA,$L(SFA))="?" LISFAB G IDSFA
RETOUR G:'($D(^[QUI]ANTETUDE(PPSFA,NUFA))) NONFAIT G:'($D(^[QUI]RAISON(NUFA,0))) QUES S OSFA=SFA,SFA=$P(SFA,"/",1)
 G:$D(^[QUI]EXPL(SFA))!($D(^[QUI]IMPLICI(SFA))!($D(^[QUI]ESSABAC(SFA))!$D(^[QUI]PHASE(SFA)))) OK G:'($D(^[QUI]ACOMMEB(SFA))) QUES S SFA=$P(^[QUI]ACOMMEB(SFA),"^",1)
OK I '($D(^COMPILVU($I,NUFA))) S ^COMPILVU($I,NUFA)=1,^TACOMPIL($I,%NN)=NUFA,%NN=%NN+1
 I %PN>22 S DX=0,DY=6 D CLEBAS^%VVIDEO S %PN=7
 S DX=10,DY=%PN,%PN=%PN+1 X XY W NUFA S DX=40 X XY W $$^%QZCHW("Nbre d'exemplaires : ") S DX=$X D ^%VLEC
OK3 I (CTRLA=1)!((CTRLF=1)!(Y1="")) W "0" K ^TACOMPIL($I,%NN-1),^COMPILVU($I,NUFA) G AIJ
 S PCH=Y1 D TO^%QZNBN1 I '(ISNUM) X XY W "                         " X XY W 0 S Y1="" G OK3
 S ^TACOMPIL($I,%NN-1)=NUFA_"^"_PCH
AIJ S DX=19,DY=6 X XY W EFF G READ
RET1 S DOLARI=$I K EFF G:'($D(^TACOMPIL($I))) FIN D IM
 S %NN=-1 F %QQ=1:1 S %NN=$N(^TACOMPIL(DOLARI,%NN)) Q:%NN=-1  S NUFA=$P(^TACOMPIL(DOLARI,%NN),"^",1),%NBE=$P(^TACOMPIL(DOLARI,%NN),"^",2) D WOR
 G FIN
WOR F %EXPL=1:1:%NBE D ^TOWPTEX2
 Q
NONFAIT S DY=DY+2 X XY D ^%VSQUEAK,POCLEPA^%VVIDEO W $$^%QZCHW("Cet article n'a jamais ete fabrique !!") H 2 S DX=26,DY=3 X XY W EFF G READ
IDSFA I $D(^[QUI]TREEWORK(SFA)) S NUFA=SFA,SFA=$P(^[QUI]TREEWORK(NUFA,0),"^",4),PPSFA=$P(SFA,"/",1) G RETOUR
 
 G NONFAIT
FIN C:IMPR'=0 IMPR D CLEPAG^%VVIDEO Q
LISFAB K VALCLE D CLEPAG^%VVIDEO W ?25,$$^%QZCHW("LISTE DES ARTICLES DEJA FABRIQUES"),!,! S ARFA=$P(SFA,"?",1),NOMTAB="^[QUI]ANTETUDE",VALCLE(3)=0,VALCLE(1)=ARFA,ADR="ARFAB^TOWPTEX1" D ^%VKMULG G:STOP=1 QUES D POCLEPA^%VVIDEO W $$^%QZCHW("FIN") R *RET D CLEPAG^%VVIDEO G QUES
ARFAB Q:B3'=0  W !,%RS(1),?64,B2 I $Y=20 D ALORS S:CONT=0 STOP=1
 Q
ALORS 
 D POCLEPA^%VVIDEO W $$^%QZCHW("(S)uite,(F)in ") R *EA I $C(EA)="F" S CONT=0 D CLEPAG^%VVIDEO G END
 D CLEPAG^%VVIDEO S CONT=1 Q
END Q
WHAT S ARRET=0,LU=SFA
WHATS S NUM=-1 F UU=0:0 S NUM=$N(^[QUI]DEJAFAB(SFA,NUM)) G:NUM=-1 WHATS D WHATQ Q:ARRET=1
WHATF Q
WHATQ S DX=26,DY=3,LLU=$L(LU) X XY F ZZ=1:1:LLU+5 W $$^%QZCHW(" ")
 X XY S LU=^[QUI]DEJAFAB(SFA,NUM) W LU," ? " S DX=$X+1 D ^%VLEC I (CTRLA=1)!((CTRLF=1)!(Y1="")) S DX=$X-4,ARRET=1,NUFA=^[QUI]DEJAFAB(SFA,NUM) X XY W "       "
 G WHATF
IM D POCLEPA^%VVIDEO W $$^%QZCHW("Ecran ou Imprimante ? ") R *%ECR S %ECR=$C(%ECR) G:(%ECR'=$$^%QZCHW("E"))&(%ECR'=$$^%QZCHW("I")) IM S IMPR=$S(%ECR=$$^%QZCHW("I"):^TABIDENT(WHOIS,"PRINTER"),1:0),^[QUI]CPTEUR("LSTAR")=0 K %ECR Q

