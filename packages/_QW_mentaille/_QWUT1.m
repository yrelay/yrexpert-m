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

;%QWUT1^INT^1^59547,73887^0
QWUT1 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
LPROD(GOAT,LPRODATT) 
 N RF,IF,AF,OF,SF,REPC,INDC,ATTC,ORDC,VALC,LIG
 S RF=""
F1 S RF=$O(@GOAT@(RF)) Q:RF=""
 S REPC=$E($S(RF="*":"*",1:$$NOMLOG^%QSF(RF))_"                    ",1,13)
 S IF=""
F2 S IF=$O(@GOAT@(RF,IF)) G:IF="" F1
 S INDC=$E(IF_"                    ",1,13)
 S AF=""
F3 S AF=$O(@GOAT@(RF,IF,AF)) G:AF="" F2
 S ATTC=$E(AF_"                    ",1,17)
 S OF=""
F4 S OF=$O(@GOAT@(RF,IF,AF,OF)) G:OF="" F3
 S SF=$ZP(@GOAT@(RF,IF,AF,OF,""))
 S VF=$$AFFI^%QMDAUC(RF,AF,@GOAT@(RF,IF,AF,OF,SF))
 S ORDC=$E(OF_"                    ",1,9)
 S VALC=$E(VF_"                    ",1,17)
 S LIG=REPC_" "_INDC_" "_ATTC_" "_ORDC_" "_VALC
 S @LPRODATT@(LIG)=""
 S @LPRODATT@(LIG,"R")=RF,@LPRODATT@(LIG,"I")=IF,@LPRODATT@(LIG,"A")=AF
 S @LPRODATT@(LIG,"O")=OF,@LPRODATT@(LIG,"V")=VF,@LPRODATT@(LIG,"S")=SF
 G F4
 
 
 
 
SHOWGLO(GBL) 
 N IND,GLO,GLR,REP,TYP
 S GLR=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"REP") K @(GLR)
 S GLO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GLO") K @(GLO)
 D CLEPAG^%VVIDEO,^%VZCDB($$^%QZCHW("Etat initial de l'etude")_" "_NOMETUDE,0)
 S TYP=$$REP
 
 I TYP=1 S (REP,IND)="*" D CONS G ATR
 
 D INIT^%QUCHOIP(GLR,1,"",0,3,20,7)
SH1 S DX=5,DY=2 X XY D REV^%VVIDEO X XY W $$^%QZCHW("Repertoire") D NORM^%VVIDEO
 D AFF^%QUCHOIP
 S REP=$$UN^%QUCHOIP I REP="" D END^%QUCHOIP G FIN
 S REP=$$NOMINT^%QSF(REP)
 D INIT^%QUCHOIP($$CONCAS^%QZCHAD(GBL,REP),1,"",21,3,58,7)
SH2 S DX=25,DY=2 X XY D REV^%VVIDEO X XY W $$^%QZCHW("Individus") D NORM^%VVIDEO
 D AFF^%QUCHOIP
SH3 S IND=$$UN^%QUCHOIP
 I IND="" D END^%QUCHOIP G SH1
ATR D CONS
 D INIT^%QUCHOIP(GLO,1,"",0,11,79,12)
 S DX=1,DY=10 X XY D REV^%VVIDEO X XY W $J("",4),$$^%QZCHW("Attribut"),$J("",18),$$^%QZCHW("Valeur"),$J("",25),$$^%QZCHW("Numero d'ordre"),$J("",2)
 D NORM^%VVIDEO,AFF^%QUCHOIP
 S X=$$UN^%QUCHOIP
 D END^%QUCHOIP
 I REP'="*" G SH3
FIN K @(GLO),@(GLR)
 Q
 
REP() 
 N %R,R
 S R=""
 F %R=0:0 S R=$O(@GBL@(R)) Q:R=""  S @GLR@($S(R="*":"*",1:$$NOMLOG^%QSF(R)))="" I R="*" Q
 Q R="*"
 
CONS 
 N A,O,V
 D ^%VZEATT
 K @(GLO)
 S A=""
C1 S A=$O(@GBL@(REP,IND,A)) I A="" D POCLEPA^%VVIDEO Q
 S O=""
C2 S O=$O(@GBL@(REP,IND,A,O)) G:O="" C1
 S V=$$AFFI^%QMDAUC(REP,A,@GBL@(REP,IND,A,O))
 S V=$E(A,1,25)_$J("",26-$L(A))_$E(V,1,33)_$J("",34-$L(V))_$E(O,1,13)_$J("",14-$L(O))
 S @GLO@(V)=""
 G C2

