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

;%MZOPER^INT^1^59547,73872^0
MOZOPER(GAM) 
 
 
 
 
 
 
DEB I XOP'=2 D ^%VSQUEAK Q
 
 N LC,NLI,TYP,NPH,OP,SOP,INTER,IDC,TABLE,NLIS S TABLE="^ATTRI($J)"
 S NLI=EDCL
 S LC=^U($J,0,NLI),TYP=$P(LC,"^",1),LC=$P(LC,"^",2)
 S OP=$$TRSL($P(LC,$C(1),1))
LOOP S NLI=$ZP(^U($J,0,NLI)) Q:NLI=""  S LC=^U($J,0,NLI),TYP=$P(LC,"^",1),LC=$P(LC,"^",2) G LOOP:TYP'=1
 S NPH=$$TRSL($P(LC,$C(1),1)),NLIS=NLI
LOOP2 S NLI=$O(^U($J,0,NLI)) G FIN:NLI="" S LC=^U($J,0,NLI),TYP=$P(LC,"^",1),LC=$P(LC,"^",2) G LOOP2:TYP'=2
 S SOP=$S($D(SOP(NPH)):SOP(NPH)+1,1:1),SOP(NPH)=SOP+1,INTER=NPH_"."_$TR($J("",3-$L(SOP))," ",0)_SOP
 G SUITE:NLI=EDCL
 G LOOP2
SUITE S IDC=OP_"/"_INTER
 X XY D 80^%VVIDEO,CLEPAG^%VVIDEO,^%VZCD0($E(IDC,1,40))
 
 I '($$OVAIR^%QSGE5($$GI^%MZQS,GAM,$$LIEN^%MZQS,IDC,INTER)) D MESS("Operation inexistante ",20,10),MESS("vous avez peut-etre modifie les attributs",20,12),MESS("ACTION ou NUMERO.OPERATION ...",20,14) H 3 G FIN
 K @(TABLE) D RIA^%QSGE1($$OI^%MZQS,GAM_","_IDC,.TABLE)
 
 
 D INIT^%MZMAJ S %U="" F %V=0:0 S %U=$O(ATT(%U)) Q:%U=""  K @TABLE@(%U)
 K @TABLE@("COMMENTAIRE")
 S %U="" F I=1:1 S %U=$O(@TABLE@(%U)) Q:%U=""  S @TABLE@(I,%U)="" K @TABLE@(%U)
 K ATT
 I $$TABID^%INCOIN("ORDINATEUR")="PDP" D ALLEG
 I $$TABID^%INCOIN("ORDINATEUR")="IBM-PC" D ALLEG
 S ROUTAFF="REAF^%MZOPER"
 D SELECT^%QSATTRI(GAM_","_IDC,$$OI^%MZQS,1,6,77,16,TABLE)
 I $$TABID^%INCOIN("ORDINATEUR")="PDP" D RESTOR
 I $$TABID^%INCOIN("ORDINATEUR")="IBM-PC" D RESTOR
FIN 
 I $D(TABLE) K @(TABLE)
 X ^MOZ("C",12,6)
 O 0
 X XY D 80^%VVIDEO,CLEPAG^%VVIDEO
 D NORM^%VVIDEO,STAT^%MZWORD,NORM^%VVIDEO,RF^%MZED Q
MESS(M,DX,DY) 
 X XY W M
 Q
REAF 
 D CLEPAG^%VVIDEO,^%VZCD0($E(GAM,1,40)) X XY D 80^%VVIDEO,STAT^%MZWORD,RF^%MZED,REAFF^%QSATTR2
 Q
ALLEG 
 F I="ED","MOZ","%BF" S TAB135(I)=$S($D(@I)=1:@I,1:"")
 D INIT2^%QCAMEM,VAR^%QCAMEM("TAB135")
 K MOZ,ED,%BF,TAB135
 Q
RESTOR 
 D RVAR^%QCAMEM
 Q
TRSL(CH) 
TRSL1 S CH10=$E(CH,1) Q:CH10'=" " CH
 S CH=$E(CH,2,9999) G TRSL1

