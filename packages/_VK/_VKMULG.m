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

;%VKMULG^INT^1^59547,74035^0
MULTGLO ;
 
 
 D CLE
BG S STOP=0 K %NUM S DEB=1,%NOM=NOMTAB_"(",IFLAG=0,AB="AB" F J=1:1:NBCLE S @(AB_J)="" I $D(VALCLE(J)) S @(AB_J)=VALCLE(J)
 G:'($D(@NOMTAB)) FIN D DECOMP S AB="B" F ZZ1=1:1:NBCLE S @("B"_ZZ1)=@("AB"_ZZ1)
L F %P=DEB:1:NBCLE S @("V="_AB_%P),VP="V",C=%NOM_VP_")",(E,@("B"_%P))=$N(@C) S:@("AC"_%P)="" @("ACC"_%P)=$E(E,1) S AC=$S(@("AC"_%P)="":"ACC",1:"AC") G:(@("B"_%P)=-1)!($E(@("B"_%P),1,@("L"_%P))'=@(AC_%P)) S S @("%NOM"_%P)=%NOM,%NOM=%NOM_("B"_%P)_","
 S %NOM=$E(%NOM,1,$L(%NOM)-1)_")" D ^%VOLDNOM(%NOM,.OLDNOM,.OLDFULL) I $D(@%NOM)=10 D ^%VKMULNG S %NOM=@("%NOM"_%P),DEB=NBCLE,AB="B" D @ADR G FIN:STOP=1,C3
 
 S RS=@%NOM,%NOM=@("%NOM"_%P),DEB=NBCLE,AB="B" D ^%VKMULC,@ADR G FIN:STOP=1,C3
S I %P=1,(B1=-1)!('($D(%NUM2(%P)))) S IFLAG=-2 G FIN
 I $D(%NUM2(%P)),@("B"_%P)'=-1 D ^%VMULENT S DEB=%P G C3
 F UU=%P:1:NBCLE S @("B"_UU)=@("AB"_UU) S:$D(%NUM(UU)) %NUM2(UU)=1
 S:%P'=1 %P=%P-1 S AB="B",DEB=%P,%NOM=@("%NOM"_%P) G L
 Q
DECOMP F Z1=1:1:NBCLE D TRAIT
 Q
 
 
 
TRAIT S ISNUM=0,(%PCH,SCH)=@(AB_Z1) I $E(SCH,$L(SCH))="." S %PCH=$E(%PCH,1,$L(%PCH)-1) I %PCH'["." D ^%QZNBN1 I ISNUM S %PCH=SCH
 D:'(ISNUM) ^%QZNBN1 S @("L"_Z1)=$L(SCH) I ISNUM S @("AC"_Z1)=SCH,@("AB"_Z1)=$S(SCH'[".":SCH-1,1:"?") D:@("AB"_Z1)="?" DEC S %NUM(Z1)=1,%NUM2(Z1)=1 Q
 S @("AC"_Z1)=SCH S:SCH'="" AM=$E(SCH,@("L"_Z1)),AN=$C($A(AM)-1),@("AB"_Z1)=$E(SCH,1,@("L"_Z1)-1)_AN_$C(122) I SCH="" S @("AB"_Z1)="-1",@("AC"_Z1)="",@("L"_Z1)=1
 Q
DEC S LDEC=$L($P(SCH,".",2)),DEC=1 F ZZ=1:1:LDEC S DEC=DEC*10
 S DEC=1/DEC,@("AB"_Z1)=SCH-DEC K DEC,LDEC,ZZ Q
C3 G L
GOLDNOM(%NOM,OLDNOM,OLDFULL) 
 D ^%VOLDNOM(%NOM,.OLDNOM,.OLDFULL)
 Q
FIN Q
ECRI W !,B1 Q
CLE I NOMTAB="^[QUI]RDV" S NBCLE=6 G FINCLE
 I NOMTAB="^[QUI]DOS" S NBCLE=3 G FINCLE
 I NOMTAB="^[QUI]RQSREQ" S NBCLE=2 G FINCLE
 S TAB=$P(NOMTAB,"(",1)_"(",NEX=-1,NBCLE=0 F DD=0:0 S TABN=TAB_NEX_")",NN=$N(@TABN) Q:NN=-1  S TAB=TAB_""""_NN_""",",NBCLE=NBCLE+1
FINCLE Q
TEST K VALCLE W !,"Global : " R NOMTAB Q:NOMTAB=""  S NK=1
KK W !,"Cle No ",NK," : " R VALCLE(NK) G:$A(VALCLE(NK))=1 TEST G KKK:$A(VALCLE(NK))=6 S NK=NK+1 G KK
KKK K VALCLE(NK) S ADR="ECRI" D ^%VKMULG G TEST

