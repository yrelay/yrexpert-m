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

;%ABMULGT^INT^1^59547,73864^0
%ABMULGT ;
 
 K %NUM S DEB=1,%NOM=NOMTAB_"(",NPT=0,IFLAG=0,AB="AB" K A S ICX=0 F J=1:1 Q:'($D(^[QU]SCRC(SCR,J)))  I $D(^[QU]SCRC(SCR,J))=11 S @(AB_(NPT+1))=RESUL(J),CLE(NPT+1)=J,NPT=NPT+1
 D DECOMP S AB="B" F ZZ1=1:1:NPT S @("B"_ZZ1)=@("AB"_ZZ1)
L F %P=DEB:1:NPT S @("V="_AB_%P),VP="V",C=%NOM_VP_")",(E,@("B"_%P))=$N(@C) S:@("AC"_%P)="" @("ACC"_%P)=$E(E,1) S AC=$S(@("AC"_%P)="":"ACC",1:"AC") G:(@("B"_%P)=-1)!($E(@("B"_%P),1,@("L"_%P))'=@(AC_%P)) S S @("%NOM"_%P)=%NOM,%NOM=%NOM_("B"_%P)_","
 S %NOM=$E(%NOM,1,$L(%NOM)-1)_")",OLDNOM=%NOM I $D(@%NOM)=10 D RES^%ABLONGE S %NOM=@("%NOM"_%P),DEB=NPT,AB="B" G FIN
 E  S RS=@%NOM F IW=1:1:NPT S RESUL(CLE(IW))=@("B"_IW)
 D RES^%ABAUGET S %NOM=@("%NOM"_%P),DEB=NPT,AB="B" G FIN
S I %P=1,(B1=-1)!('($D(%NUM2(%P)))) S IFLAG=-2 G FIN
 I $D(%NUM(%P)),@("B"_%P)'=-1 D ^%VMULENT S DEB=%P G C3
 F UU=%P:1:NPT S @("B"_UU)=@("AB"_UU) S:$D(%NUM(UU)) %NUM2(UU)=1
 S:%P'=1 %P=%P-1 S AB="B",DEB=%P,%NOM=@("%NOM"_%P) G L
 Q
DECOMP F Z1=1:1:NPT D TRAIT
 Q
TRAIT S SCH=@(AB_Z1),SSCH=SCH+0,@("L"_Z1)=$L(SCH) I SSCH=SCH S @("AC"_Z1)=SCH,@("AB"_Z1)=SCH-1,%NUM(Z1)=1,%NUM2(Z1)=1 Q
 S @("AC"_Z1)=SCH S:SCH'="" AM=$E(SCH,@("L"_Z1)),AN=$C($A(AM)-1),@("AB"_Z1)=$E(SCH,1,@("L"_Z1)-1)_AN_$C(122) I SCH="" S @("AB"_Z1)="-1",@("AC"_Z1)="",@("L"_Z1)=1
 Q
C3 G L
FIN Q
TEST S SCR=$$^%QZCHW("RENDEZ-VOUS"),NOMTAB="^[QUZR]RDV"

