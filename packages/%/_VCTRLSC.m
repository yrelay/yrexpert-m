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

;%VCTRLSC^INT^1^59547,74034^0
%VCTRLSC ;
H() D ^%VHELPSC G FIN
R() N (RESUL,SCR) D CURRENT^%IS,VARSYS^%QCSAP,^%VAFIGRI,^%VAFISCR G FIN
P() K ^DEPFLD($I) D ZD^%QMDATE4 S ^DEPFLD($I)=RESUL(ICC),DEP=1 G FIN
D() I ($D(^DEPFLD($I))#10)'=1 K ^DEPFLD($I) D ^%VSQUEAK G FIN
 D ^%VCRIFLD($J("",$L(RESUL(ICC))),%XI,%YI,LXG,LXD) S IC=ICC,Y1=^DEPFLD($I) D ^%VCRIFLD(Y1,%XI,%YI,LXG,LXD) Q "ACQ"
E() S NIC=ICC-1
EFFN S NIC=$N(RESUL(NIC)) G:NIC=-1 EFFF S DX=^%SCRE(SCR,NIC,2)+$L(^%SCRE(SCR,NIC,1)),DY=^%SCRE(SCR,NIC,3),CRIC=RESUL(NIC),RESUL(NIC)="" K AFRESU(NIC),FRESU(NIC) S ES=$S($D(^%SCRE(SCR,NIC,"ESPACE")):^%SCRE(SCR,NIC,"ESPACE"),1:"-1,80")
 D ^%VCRIFLD($J("",$L(CRIC)),DX,DY,$P(ES,",",1),$P(ES,",",2)) G EFFN
EFFF S DX=^%SCRE(SCR,ICC,2)+$L(^%SCRE(SCR,ICC,1)),DY=^%SCRE(SCR,ICC,3) X XY
 G FIN
J() S ADX=$X,ADY=$Y,AICC=ICC D POCLEPA^%VVIDEO W "Impression en cours..." D ^%VIMPSCR,POCLEPA^%VVIDEO S ICC=AICC,DX=ADX,DY=ADY X XY G FIN
FIN Q "LOP3"

