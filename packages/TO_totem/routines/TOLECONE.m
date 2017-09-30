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

;TOLECONE^INT^1^59547,74872^0
TOLECONE ;
 
 S Y1="" I '($D(SUB)) D CURRENT^%IS
 I '($D(ATT)) S ATT=10000
 S YG="",CTRLR="",CTRLF="",CTRLA="",CTRLE="",CTRLP="",CTRLL=""
 S PCX=DX X XY
 O 0
LEC R *X1:ATT I X1=-1 S Y1="" G END
 ;;DTM
 G:$$FLECHE^%INCCLAV(X1,.X1,.XG2,.XG3) DEL
 D TOUCHE^%INCCLAV(X1,.X1)
 ;;FINDTM
 ;;NONDTM
 
 ;;FINNONDTM
 G DEL:X1=127,ESC:X1=27
 G FIN:X1=13,CTRLR:X1=18,CTRLA:X1<2,CTRLE:X1=5,CTRLF:X1=6,CTRLP:X1=16,CTRLL:X1=12,REFUS:X1<32
 S YG=YG_$C(X1) W $C(X1) I $L(YG)>75 S X1=13 G FIN
 G FIN
DEL I ($X-1)<PCX D ^%VSQUEAK G LEC
 S DX=$X-1 X XY W " " S YG=$E(YG,1,$L(YG)-1) X XY G LEC
ESC ;;NONDTM
 
 
 
 ;;FINNONDTM
 ;;DTM
 G:MODTM REFUS
 R *XG2
 G:XG2=91 271
 R *XG3
 G REFUS
271 R *XG3
 G:(XG3<48)!(XG3>57) REFUS
272 R *XG3
 S XG3=$C(XG3)
 G:XG3="~" REFUS
 G 272
REFUS D ^%VSQUEAK G LEC
CTRLA I X1<2 S YG="",CTRLA=1 G END
CTRLF S CTRLF=1
FIN S Y1=YG
END U 0 K YG,PCX,XG2,XG3 Q
CTRLL S Y1="",CTRLL=1 G END
CTRLP S Y1="",CTRLP=1 G END
CTRLE S Y1="",CTRLE=1 G END
CTRLR S Y1="",CTRLR=1 G END
NONVT S %XLEC=X1,X1=27
 S XG2=91
 I %XLEC=8 S XG3=$A("D") G ESC+1
 I %XLEC=24 S XG3=$A("C") G ESC+1
 I %XLEC=11 S XG3=$A("B") G ESC+1
 I %XLEC=28 S XG3=$A("A") G ESC+1

