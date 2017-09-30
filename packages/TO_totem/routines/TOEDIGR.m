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

;TOEDIGR^INT^1^59547,74872^0
TOEDIGR ;
 
 S:'($D(^TOZE($I,"GRAPH"))) ^TOZE($I,"GRAPH")=0 G:^TOZE($I,"GRAPH")=0 FIN
QUES S IMPR=0 K ^TACOMPIL($I),^COMPILVU($I) S EFF="                                  ",%NN=1,%IMP=1,%PN=5 D CLEPAG^%VVIDEO,POCLEPA^%VVIDEO W $$^%QZCHW("Donnez l'article etudie ou le numero d'etude,(?) Liste") S DX=5,DY=3 X XY
 S DX=5,DY=3 X XY W $$^%QZCHW("Graphe pour : ")
READ S DX=19,DY=3 D ^%VLEC G:CTRLA=1 FIN G:(CTRLF=1)!(Y1="") RET1 S SFA=Y1 G:$E(SFA,$L(SFA))="?" LISFAB G IDSFA
RETOUR G:'($D(^[QUI]ANTETUDE(PPSFA,NUFA))) NONFAIT G:'($D(^[QUI]RAISON(NUFA,0))) QUES S OSFA=SFA,SFA=$P(SFA,"/",1)
 G:$D(^[QUI]EXPL(SFA))!($D(^[QUI]IMPLICI(SFA))!($D(^[QUI]ESSABAC(SFA))!$D(^[QUI]PHASE(SFA)))) OK G:'($D(^[QUI]ACOMMEB(SFA))) QUES S SFA=$P(^[QUI]ACOMMEB(SFA),"^",1)
OK I '($D(^COMPILVU($I,NUFA))) S ^COMPILVU($I,NUFA)=1,^TACOMPIL($I,%NN)=NUFA,%NN=%NN+1
 I %PN>22 S DX=0,DY=5 D CLEBAS^%VVIDEO S %PN=5
 S DX=2,DY=%PN,%PN=%PN+1 X XY W NUFA S DX=25 X XY W $$^%QZCHW("Nbre d'exemplaires : ") S DX=$X D ^%VLEC
OK3 I (CTRLA=1)!((CTRLF=1)!(Y1="")) W "0" K ^TACOMPIL($I,%NN-1),^COMPILVU($I,NUFA) G AIJ
 S (%9NEX,PCH)=Y1 D TO^%QZNBN1 I '(ISNUM) X XY W "                         " X XY W 0 S Y1="" G OK3
ECH1 S DX=60 X XY W $$^%QZCHW("Echelle :         ") S DX=$X-9 D ^%VLEC
OK33 I (CTRLA=1)!(CTRLF=1) K ^TACOMPIL($I,%NN-1),^COMPILVU($I,NUFA) G AIJ
 S:Y1="" Y1=1 S %9ECHD=Y1 I %9ECHD["/" S %92=$P(%9ECHD,"/",1),%93=$P(%9ECHD,"/",2,500) I (%92?.N)&(%93?.N) S %9="S @(""%91=""_%9ECHD)" X %9 S %9ECHD=%91
 K %9,%91,%92,%93 S PCH=%9ECHD D TO^%QZNBN1 G:ISNUM=0 ECH1
 S ^TACOMPIL($I,%NN-1)=NUFA_"^"_%9NEX_"^"_%9ECHD
AIJ S DX=19,DY=3 X XY W EFF G READ
RET1 S DOLARI=$I K EFF G:'($D(^TACOMPIL($I))) FIN D IM Q:(CTRLA=1)!(CTRLF=1)
 D ^%AB3STAR S %NN=-1 F %QQ=1:1 S %NN=$N(^TACOMPIL(DOLARI,%NN)) Q:%NN=-1  S NUFA=$P(^TACOMPIL(DOLARI,%NN),"^",1),%NBE=$P(^TACOMPIL(DOLARI,%NN),"^",2),%9ECHD=$P(^TACOMPIL(DOLARI,%NN),"^",3) D WOR
 G FIN
WOR F %ZX=1:1:%NBE I $D(^[QUI]TREEWORK(NUFA)) S TWREF=0,YA=$P(^[QUI]TREEWORK(NUFA,0),"^",2),%9VER=1 D T1^TOPTRESG
 Q
NONFAIT S DY=DY+2 X XY D ^%VSQUEAK,POCLEPA^%VVIDEO W $$^%QZCHW("Cet article n'a jamais ete fabrique !!") H 2 S DX=26,DY=3 X XY W EFF G READ
IDSFA I $D(^[QUI]TREEWORK(SFA)) S NUFA=SFA,SFA=$P(^[QUI]TREEWORK(NUFA,0),"^",4),PPSFA=$P(SFA,"/",1) G RETOUR
 G NONFAIT
FIN D CLEPAG^%VVIDEO Q
LISFAB K VALCLE D CLEPAG^%VVIDEO W ?25,$$^%QZCHW("LISTE DES ARTICLES DEJA FABRIQUES"),!,! S ARFA=$P(SFA,"?",1),NOMTAB="^[QUI]ANTETUDE",VALCLE(3)=0,VALCLE(1)=ARFA,ADR="ARFAB^TOEDIGR" D ^%VKMULG G:STOP=1 QUES D POCLEPA^%VVIDEO W $$^%QZCHW("FIN") R *RET D CLEPAG^%VVIDEO G QUES
ARFAB Q:B3'=0  W !,%RS(1),?64,B2 I $Y=20 D ALORS S:CONT=0 STOP=1
 Q
ALORS 
 D POCLEPA^%VVIDEO W $$^%QZCHW("(S)uite,(F)in ") R *EA D TOUCHE^%INCCLAV(EA,.EA)
 I $C(EA)="F" S CONT=0 D CLEPAG^%VVIDEO G END
 D CLEPAG^%VVIDEO S CONT=1 Q
END Q
WHAT S ARRET=0,LU=SFA
WHATS S NUM=-1 F UU=0:0 S NUM=$N(^[QUI]DEJAFAB(SFA,NUM)) G:NUM=-1 WHATS D WHATQ Q:ARRET=1
WHATF Q
WHATQ S DX=26,DY=3,LLU=$L(LU) X XY F ZZ=1:1:LLU+5 W $$^%QZCHW(" ")
 X XY S LU=^[QUI]DEJAFAB(SFA,NUM) W LU," ? " S DX=$X+1 D ^%VLEC I (CTRLA=1)!((CTRLF=1)!(Y1="")) S DX=$X-4,ARRET=1,NUFA=^[QUI]DEJAFAB(SFA,NUM) X XY W "       "
 G WHATF
IM 
 D POCLEPA^%VVIDEO W $$^%QZCHW("Resultats sur (E)cran ou sur (T)able tracante ("),$$L23^%QSLIB2(""),") " S DX=$X D ^TOLECONE Q:CTRLA!CTRLF  G:(Y1'=$$^%QZCHW("E"))&(Y1'=$$^%QZCHW("T")) IM G @Y1
E S %PORT=$S($D(^TABIDENT(WHOIS,"ECRGRA")):^TABIDENT(WHOIS,"ECRGRA"),1:"0"),%TERM=$S($D(^TABIDENT(WHOIS,"TYPECR")):^TABIDENT(WHOIS,"TYPECR"),1:"PT-100G") G FIM
T S %PORT=$S($D(^TABIDENT(WHOIS,"TABTRA")):^TABIDENT(WHOIS,"ECRGRA"),1:"TXA3:"),%TERM=$S($D(^TABIDENT(WHOIS,"TYPTAB")):^TABIDENT(WHOIS,"TYPECR"),1:"RD-GL2") G FIM
FIM Q
CONC I IMPR'=0 D ^%AB3STAR S MSG=$$^%QZCHW($$PCONF^%INCASTO("NOMHOST")_" - YEXPERT ("_^INCONNE("VERSION")_")") W !,!,!,LSTAR,!,"|",?40-($L(MSG)\2),MSG,?79,"|",!,LSTAR,!
 G END

