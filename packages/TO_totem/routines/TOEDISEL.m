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

;TOEDISEL^INT^1^59547,74872^0
TOEDISEL ;
 
 D CLEPAG^%VVIDEO S TIT=$$^%QZCHW("Edition selective") D ^TOGETART G:'($D(^TACOMPIL($I))) FIN K ^TVPAR($I)
 S DX=0,DY=6 D CLEBAS^%VVIDEO S NU=1 F UU=0:1 S LI=$P($T(FIC+UU),";;",2) Q:LI=""  F VV=1:1 S TB=$P(LI,",",VV) Q:TB=""  S LIB=$P(TB,"^",1),GR=$P(TB,"^",2) W ?((NU-1)#2)*40,$S(NU<10:$$^%QZCHW(" "),1:""),NU,?$X+3,LIB W:(NU#2)=0 ! S ^TVPAR($I,NU)=GR,NU=NU+1
 D POCLEPA^%VVIDEO W $$^%QZCHW("Votre choix (ex 1,4,3) : ") S DX=$X D ^%VLEC G:(CTRLA=1)!((CTRLF=1)!(Y1="")) FIN S ^TVPAR($I)=Y1,ROUTI="^%VMULTGE(.IFLAG)"
 S %NNU=-1
 F %U1=1:1 S %NNU=$N(^TACOMPIL($I,%NNU)) Q:%NNU=-1  S ARX=^TACOMPIL($I,%NNU),%WWAAX=^TVPAR($I) F %U2=1:1 S %NNI=$P(%WWAAX,",",%U2) Q:%NNI=""  I $D(^TVPAR($I,%NNI)) S SCR=^TVPAR($I,%NNI),NOMTAB="^[QUI]"_SCR I $D(^%SCRE(SCR)) S ROUTI="^%VMULTGE(.IFLAG)" D CORV^TOVERIF
FIN Q
FIC ;;Explicites^EXPLICI,Implicites^IMPLICI,Paramatres associes^EXPGIMP,Saisies multiples^ESSABAC,Composants^NOMENC,Phases^PHASE,Couts et temps^FORMULE,Consignes^OUTCONS,Dimensions a l'outil^DIMOUT,Parametres ignores^IGNORER
 ;;Matieres^MATIERE,Selections matieres^SELMAT,Descriptions matieres^MATSTOCK,Implicites matieres^IMPMAT,Descriptions machines^DESMACH,Explicites machines^PEXPMACH,Implicites machines^IMPMAC,Selections machines^MACSEL

