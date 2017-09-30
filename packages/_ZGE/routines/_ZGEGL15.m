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

;%ZGEGL15^INT^1^59547,74037^0
%ZGEGL15 ;
 ;;^%ZPC(1)=W !,"edit routine : " R PGM I PGM'="" x ^%ZPC(2)
 ;;^%ZPC(2)=N (PGM) S PXIL=$$r^%m1("h",PGM) X ^%ZPC(2,$S(+PXIL=0:"R",+PXIL=53366:"F",1:"E")) 
 ;;^%ZPC(2,"E")=""
 ;;^%ZPC(2,"F")=S %F=1 X ^%ZPC(3)
 ;;^%ZPC(2,"R")=S %F=0 X ^%ZPC(2,"R",'$P(PXIL,",",4),'$P(PXIL,",",5)) I PGM'="" S ^TEMPORAI($J,"%ZGE2")=PGM X ^%ZPC(3) S PXIL=$$r^%m1("c",^TEMPORAI($J,"%ZGE2")) 
 ;;^%ZPC(2,"R",0,0)=S %F=0 ZL @PGM S PGM=$P($ZPOS,"^",2)
 ;;^%ZPC(2,"R",1,0)=S %F=0 w !,"routine sans source !!!" S PGM=""
 ;;^%ZPC(2,"R",0,1)=S %F=0 ZL @PGM S PGM=$P($ZPOS,"^",2)
 ;;^%ZPC(2,"R",1,1)=S %F=0 w !,"inconnue, creation (O/N) [N]" R %R S PGM=$S($E(%R)="o":PGM,$E(%R)="O":PGM,1:"") I PGM'="" ZR  ZI PGM_$C(9)_";;" ZS @PGM
 ;;^%ZPC(3)=W /CLR S (PXIL,^TEMPORAI($J,"%ZGE"))=$zdev("ixxlate",$I) U $I:ixxlate=PXIL+19 S %EDE=14,%EDI=13 K ^ZGEMEM($J) S ^ZGEMEM($J)=0 D ^%ZGEWORD U $I:ixxlate=^TEMPORAI($J,"%ZGE")

