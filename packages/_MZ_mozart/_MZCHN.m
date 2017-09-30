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

;%MZCHN^INT^1^59547,73871^0
MOZCHN ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
CADRE 
 D NORM^%VVIDEO,CLEPAG^%VVIDEO X XY D 80^%VVIDEO
SAISNUM 
 D ^%VZCD0($$^%QZCHW("RENUMEROTATION"))
 N OK,NOPER,PAS,LONG S OK=0
 S DX=0,DY=7 D CLEBAS^%VVIDEO X XY
 D REV^%VVIDEO W $$^%QZCHW("A partir de l'operation numero : ") D NORM^%VVIDEO
 S DX=$X D ^%VLEC
 I Y1="" S OK=1 G FIN
 I '($$ADR^%QZNBN1(Y1)) D ^%VZEAVT("Le numero d'operation doit etre numerique") G CADRE
 S NOPER=Y1
 
 S DX=0,DY=11 D CLEBAS^%VVIDEO X XY
 D REV^%VVIDEO W $$^%QZCHW("Donnez le nouveau numero de l'operation : ") D NORM^%VVIDEO
 S DX=$X D ^%VLEC
 I Y1="" S Y1=NOPER+0
 I '($$ADR^%QZNBN1(Y1)) D ^%VZEAVT("Le numero d'operation doit etre numerique") G CADRE
 S NOPER2=Y1+0 G SAISPAS
SAISPAS 
 S DX=0,DY=16 D CLEBAS^%VVIDEO X XY
 D REV^%VVIDEO W $$^%QZCHW("Donnez le pas d'incrementation : ") D NORM^%VVIDEO
 S DX=$X D ^%VLEC
 I Y1="" S OK=1 G FIN
 I '($$ADR^%QZNBN1(Y1)) D ^%VZEAVT("Le pas d'incrementaion doit etre numerique") G SAISPAS
 S PAS=Y1+0
CHERCH 
 N NOP,TYP,LC,NLI
 S NLI="",OK=0
LOP S NLI=$O(@%TT@($J,0,NLI)) G:NLI="" FIN S LC=@%TT@($J,0,NLI),TYP=$P(LC,"^",1)+0 G LOP:TYP'=1 S LC=$P(LC,"^",2,999)
 S NOP=$$GETLBLAN^%VTLBLAN($P(LC,$C(1),1))
 G LOP:NOP'=NOPER
LOP1 S $P(LC,$C(1),1)=NOPER2
 S @%TT@($J,0,NLI)=TYP_"^ "_LC S:NLI=EDCL X=" "_LC
 S OK=1
INCR 
LOP2 S NLI=$O(@%TT@($J,0,NLI)) G:NLI="" FIN S LC=@%TT@($J,0,NLI),TYP=$P(LC,"^",1)+0 G LOP2:TYP'=1 S LC=$P(LC,"^",2,999)
 S NOPER2=NOPER2+PAS
LOP21 S $P(LC,$C(1),1)=NOPER2
 S @%TT@($J,0,NLI)=TYP_"^ "_LC
 S:NLI=EDCL X=" "_LC
 G LOP2
FIN 
 I '(OK) D ^%VZEAVT("Il n'existe pas d'operation dont le numero est : "_NOPER) G CADRE
 X ^MOZ("C",12,6)
 O 0
 D CLEPAG^%VVIDEO S %RENUM=1
 X XY D NORM^%VVIDEO,STAT^%MZWORD,NORM^%VVIDEO,RF^%MZED Q

