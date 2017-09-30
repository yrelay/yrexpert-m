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

;TOIMPGRI^INT^1^59547,74872^0
TOIMPGRI ;
 
 S IMPR=^TABIDENT(WHOIS,"PRINTER") O IMPR U IMPR W #
BBB S LI=0,SCR1=SCR_",COMMENT" I $D(^%SCRE(SCR,"TITRE")) S TT=^%SCRE(SCR,"TITRE") D ^%QMDAK0 S DX=3,DY=0,LL=$$^%QZCHW("Le ")_%DAT_$$^%QZCHW(" a ")_HEURE W !,?40-($L(LL)\2),LL,!,!,!,?40-$L(TT\2),TT
SUITE K ^ECR($I) S LI=LI+1 G:LI>23 END W !
 F ICC=1:1 Q:'($D(^%SCRE(SCR1,ICC)))  S DY=^%SCRE(SCR1,ICC,3) I DY=LI S DX=^%SCRE(SCR1,ICC,2),C=^%SCRE(SCR1,ICC,1),LC=$L(C)-1 F ZY=0:1:LC S ^ECR($I,DX+ZY,$$^%QZCHW("C"))=$E(C,ZY+1)
BEG F ICC=1:1:^%SCRE(SCR) D LOP
 S DX=-1 F ZZ=1:1 S DX=$N(^ECR($I,DX)) Q:DX=-1  S T=-1 F ZW=1:1 S T=$N(^ECR($I,DX,T)) Q:T=-1  S DDXX=DX#77 D:DDXX=0 SAUTL U IMPR W ?DDXX,^ECR($I,DX,T)
 G SUITE
SAUTL Q:DX=0
 U IMPR W !
 Q
LOP 
 G END:'($D(^%SCRE(SCR,ICC)))
 S DY=^%SCRE(SCR,ICC,3) I DY=LI S DX=^%SCRE(SCR,ICC,2),C=^%SCRE(SCR,ICC,1)_RESUL(ICC),LC=$L(C)-1 F ZY=0:1:LC S ^ECR($I,DX+ZY,"L")=$E(C,ZY+1) K:$D(^ECR($I,DX+ZY,"C")) ^ECR($I,DX+ZY,"C")
 Q
END K ZZ,ZW,ZY,^ECR($I) C IMPR Q

