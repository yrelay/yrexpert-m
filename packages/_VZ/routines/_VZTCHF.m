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

;%VZTCHF^INT^1^59547,74037^0
ZPGTCHF ;
 
 S %ICI=0 D LIST
QUES W *-1 D POCLEPA^%VVIDEO W "Frapper durement le numero choisi : " S DX=$X D ^%VLEC G:(CTRLA=1)!((CTRLF=1)!(Y1="")) FIN S CHX=Y1 G:CHX["?" MEM
 I '($D(^POSENR($I,CHX))) W " ??? " H 2 G QUES
 S LIG=$P(^POSENR($I,CHX),"^",1),TER=$P(^POSENR($I,CHX),"^",2)
 W " OK !",*27,"P0;1|",*27,"\"
 S %NOMTAB="^TCHFONC(LIG,TER",%ADR="TRAIT^%VZTCHF" D ^%VKGTENR
FIN Q
TRAIT S %B=%RS(1) Q:%B=""  S ASC=0 I (%B="10")!(%B["ASCI") S %CR=$C(13),ASC=1 G SUI
 S %DS=%B,%CD=13 D ^%QZNBA16 S %CR=%CV
SUI F %IJ=2:4:22 S LIB=%RS(%IJ),%COD=%RS(%IJ+1),%CH=$TR(%RS(%IJ+2),"~","^") I (%COD'="")&(%CH'="") S:ASC=1 %CHR=%CH D:ASC'=1 ^%QZNBASE D ^%VZTCPT
 Q
LIST D CLEPAG^%VVIDEO,^%VZCD(0,38,0,4,1,0,"Touches de fonction sur :")
 S DX=0,DY=6 X XY W "No",?5,"Ligne",?20,"Type terminal",?40,"No",?45,"Ligne",?60,"Type terminal",!,! K ^POSENR($I),^COMPILVU($I) S LIG=-1,NU=1,%W=1
 F %IK=1:1 S LIG=$N(^TCHFONC(LIG)) Q:LIG=-1  S TER=-1 F %IJ=1:1 S TER=$N(^TCHFONC(LIG,TER)) Q:TER=-1  D:LIG=$I C S P=((%W-1)#2)*40,DX=P,DY=$Y X XY W ?P,NU,?P+7,LIG,?P+23,TER,?P+38,"|" S ^POSENR($I,NU)=LIG_"^"_TER,NU=NU+1 W:(%W#2)=0 ! D NORM^%VVIDEO S %W=%W+1
 G FIN
C S ^COMPILVU($I,NU)=1 D BLD^%VVIDEO G FIN
MEM S CHX=$P(CHX,"?",1) I CHX'="" G ALOR
 I $D(^COMPILVU($I)) S CHX=$N(^COMPILVU($I,-1)) G ALOR
 D POCLEPA^%VVIDEO W "Donner le numero ! " H 2 G QUES
ALOR I '($D(^POSENR($I,CHX))) W " ??? " H 2 G QUES
 S REF=^POSENR($I,CHX),LIG=$P(REF,"^",1),TER=$P(REF,"^",2)
AFF D CLEPAG^%VVIDEO,^%VZCD(0,38,0,4,1,0,"Rappel des touches de fonction")
 S %ADR="RMEM^%VZTCHF",%NOMTAB="^TCHFONC(LIG,TER" D TETE,^%VKGTENR
 I %STOP=('(1)) D ^%VZEAVT("")
 Q:%ICI=1  D LIST G QUES
RMEM S PT=" ......................................................." F %IL=2:4:22 S LIB=%RS(%IL),%COD=%RS(%IL+1),%CHR=%RS(%IL+3) I LIB'="" W !,?7,LIB,$E(PT,1,(25-$X)-1),?25,%CHR S LI=LI+1 D:LI>22 NP Q:%STOP=1
 Q
TETE S DX=0,DY=6,MSG="Ligne "_LIG_"  Terminal "_TER D CLEBAS^%VVIDEO S DX=0,DY=6 X XY W ?6,"Libelle",?27,"Action",?78-$L(MSG),MSG,! S LI=$Y Q
NP D POCLEPA^%VVIDEO W $$L2^%QSLIB R *REP D TOUCHE^%INCCLAV(REP,.REP)
 G:(REP'=13)&(REP'=1) NP S:REP=1 %STOP=1
 S DX=0,DY=8 X XY D CLEBAS^%VVIDEO S LI=8 G FIN
ICI K  D CURRENT^%IS,CLEPAG^%VVIDEO S %ICI=1 I '($D(^TCHFONC($I))) D POCLEPA^%VVIDEO W "Pas de fonction prevue sur cette ligne [RETURN] " R *RET G END
 S LIG=$I,TER=$N(^TCHFONC($I,-1)) D AFF
END D CLEPAG^%VVIDEO Q

