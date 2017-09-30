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

;%ZGETENR^INT^1^59547,74037^0
%ZGETENR ;
 
 S %EXITAB=$P(%NOMTAB,"(",1),%EXK=$N(@%EXITAB@(-1)) G:(%EXK=-1)!((%EXK="z")!(%EXK="b")) FIN
 S %STOP=0 D CLE I %NBCLE'>0 S %IFLAG=-2 G FIN
 S %POSI=1,%NVIRG=0,%NAMTAB=$S(%NOMTAB["(":%NOMTAB_",",1:%NOMTAB),%DEB=1 F %Z1=0:0 S %POSI=$F(%NAMTAB,",",%POSI) Q:%POSI=0  S %NVIRG=%NVIRG+1
 S %DEB=%NVIRG+1,%APPAR=$P(%NOMTAB,"(",2) F %Z2=1:1:%NVIRG S (@("%B"_%Z2),@("%AB"_%Z2),@("%AC"_%Z2))=$P(%APPAR,",",%Z2)
 S %1NOM=$S(%NOMTAB["(":%NOMTAB_",",1:%NOMTAB_"("),%IFLAG=0,%AB="%AB" F %I=%DEB:1:%NBCLE S @("%AB"_%I)=-1,@("%AC"_1)=""
L F %RP=%DEB:1:%NBCLE S @("%V="_%AB_%RP),%VP="%V",C=%1NOM_%VP_")",(E,@("%B"_%RP))=$N(@C) G:@("%B"_%RP)=-1 S S @("%1NOM"_%RP)=%1NOM,%1NOM=%1NOM_("%B"_%RP)_","
 S %1NOM=$E(%1NOM,1,$L(%1NOM)-1)_")" S:($D(@%1NOM)=1)!($D(@%1NOM)=11) %1RS=@%1NOM D ^%VKMUL2:$D(@%1NOM)=10,^%VKMUC:$D(@%1NOM)'=10,@%ADR G:%STOP=1 FIN
 S %1NOM=@("%1NOM"_%RP),%DEB=%NBCLE,%AB="%B" G L
S I %RP=(%NVIRG+1) S %IFLAG=-2 G FIN
 F %U=%RP:1:%NBCLE S @("%B"_%U)=@("%AB"_%U)
 S:%RP'=1 %RP=%RP-1 S %AB="%B",%DEB=%RP,%1NOM=@("%1NOM"_%RP) G L
FIN Q
CLE S %TAB=$P(%NOMTAB,"(",1)_"(",%NEX=-1,%NBCLE=0
 F %DD=0:0 S %TABN=%TAB_%NEX_")",%NN=$N(@%TABN) Q:%NN=-1  S %TAB=%TAB_""""_%NN_""",",%NBCLE=%NBCLE+1
FINCLE Q

