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

;TO3MODET^INT^1^59547,74870^0
TO3MODET ;
 
QUES S %IMP=0 D CLEPAG^%VVIDEO,POCLEPA^%VVIDEO W $$^%QZCHW("Donnez l'article etudie ou le numero d'etude,(?) Liste") S DX=5,DY=3 X XY W $$^%QZCHW("Modif. de l'etude  : ") R SFA G:(SFA="")!($A(SFA)<32) FIN G:$E(SFA,$L(SFA))="?" LISFAB G IDSFA
RETOUR G:'($D(^[QUI]ANTETUDE(PPSFA,NUFA))) NONFAIT G:'($D(^[QUI]RAISON(NUFA,0))) QUES S OSFA=SFA,SFA=$P(SFA,"/",1)
 G:$D(^[QUI]EXPL(SFA))!($D(^[QUI]IMPLICI(SFA))!($D(^[QUI]ESSABAC(SFA))!$D(^[QUI]PHASE(SFA)))) RET1 G:'($D(^[QUI]ACOMMEB(SFA))) QUES S SFA=$P(^[QUI]ACOMMEB(SFA),"^",1)
RET1 S NSFA=0
TITRE S DX=5,DY=0,MSG=$P(@("^[QUI]TREEWORK(NUFA,"_NSFA_")"),"^",4) D INVDEO^%VZEAVT
SAISIE S X="S PG=""TO3MEMOD"" ZL @PG ZR FUN S FUN=""FUN ;;ETUDE ""_NUFA ZI FUN ZS @PG" X X S BATCH=0 D ^TO3MEMOD Q
 ;;****************
NONFAIT S DY=DY+2 X XY D ^%VSQUEAK,POCLEPA^%VVIDEO W $$^%QZCHW("Cet article n'a jamais ete fabrique !!") H 2 G QUES
IDSFA I $D(^[QUI]TREEWORK(SFA)) S NUFA=SFA,SFA=$P(^[QUI]TREEWORK(NUFA,0),"^",4),PPSFA=$P(SFA,"/",1) G RETOUR
 G NONFAIT
FIN D CLEPAG^%VVIDEO Q
LISFAB K VALCLE D CLEPAG^%VVIDEO W ?25,$$^%QZCHW("LISTE DES ARTICLES DEJA FABRIQUES"),!,! S ARFA=$P(SFA,"?",1),NOMTAB="^[QUI]ANTETUDE",VALCLE(1)=ARFA,VALCLE(3)=0,ADR="ARFAB^TO3MODET" D ^%VKMULG G:STOP=1 QUES D POCLEPA^%VVIDEO W $$^%QZCHW("FIN") R *RET D CLEPAG^%VVIDEO G QUES
ARFAB Q:B3'=0  W !,%RS(1),?64,B2 I $Y=20 D ALORS S:CONT=0 STOP=1
 Q
ALORS 
 D POCLEPA^%VVIDEO W $$^%QZCHW("(S)uite,(F)in ") R *EA D TOUCHE^%INCCLAV(EA,.EA)
 I $C(EA)="F" S CONT=0 D CLEPAG^%VVIDEO G END
 D CLEPAG^%VVIDEO S CONT=1 Q
END Q
FUN ;;ETUDE TOTM85060026

