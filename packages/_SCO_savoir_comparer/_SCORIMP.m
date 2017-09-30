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

;%SCORIMP^INT^1^59547,73888^0
SCORIMP ;
 
 
 
 
 
 
 
 
 
 
 
 N ENSEM,Y1,I,RES,MENU1,PORT
AFF D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("IMPRESSION DE REGLES"))
 S MENU1(1)=$$^%QZCHW("SELECTION")_"^SEL"
 S MENU1(2)=$$^%QZCHW("TOUS")_"^TOUS"
DIAL2 D ^%VQUIKMN(23,78,22,"MENU1",.AD,.CONTR)
 I (CONTR="A")!(CONTR="F") Q
 I AD'="" G @AD
 G DIAL2
TOUS 
 D ALL G AFF
 
SEL 
 D LEC G AFF
 
LEC S DX=0,DY=5 D CLEBAS^%VVIDEO
 S DX=0,DY=10 X XY W $$^%QZCHW(" DOMAINE : ") S DX=$X D ^%VLEC
 S ENSEM="^ENSDOM($J)"
 Q:(Y1="")!CTRLA  G:"*?"'[$E(Y1,$L(Y1)) GO
SELEC 
 K @(ENSEM)
 D INIT^%QUCHOIP("^[QUI]SCOMPREG",1,"",0,5,80,17),AFF^%QUCHOIP
 D ^%QUCHOYP(ENSEM) I '($D(@ENSEM)) Q
 D IMPSEL(ENSEM)
 D END^%QUCHOIP
 Q
GO I $D(^[QUI]SCOMPREG(Y1)) D DOM(Y1) Q
 I '($D(^[QUI]SCOMPREG(Y1))) D POCLEPA^%VVIDEO W $$^%QZCHW("Il n'existe pas de regles pour le domaine ")_Y1 H 2 G LEC
IMPSEL(LISTE) 
 D POCLEPA^%VVIDEO
 Q:'($$MES^%VZEOUI($$^%QZCHW("Confirmez-vous la selection ? "),"O"))
 S PORT=$$PORT
 O PORT U PORT
 S D="" F I=0:0 S D=$O(@ENSEM@(D)) Q:D=""  D DOM(D)
 Q
FIN U PORT W # C PORT
 Q
 
ALL 
 N DOM,TYP,AT,OR,V1,V2,I,GLO,ADR
 S PORT=$$PORT
 O PORT U PORT
 S GLO="^[QUI]SCOMPREG",ADR="LOOPD"
 S DOM=""
LOOPD 
 I DOM'="" U PORT W !,!,!,!
 S DOM=$O(@GLO@(DOM))
 G:(DOM="")!(DOM="z") FIN
 D TOP
 S TYP=""
LOOPT S TYP=$O(@GLO@(DOM,TYP))
 G:TYP="" @ADR
 S AT=""
LOOPAT S AT=$O(@GLO@(DOM,TYP,AT))
 G:AT="" LOOPT
 D TOPAT
 S OR=""
LOOPOR S OR=$O(@GLO@(DOM,TYP,AT,OR))
 G:OR="" LOOPAT
 I TYP="EGALITE" S (V1,V2)="" D IMP(DOM,TYP,AT,OR,V1,V2,GLO) G LOOPOR
 S V1=""
LOOPV1 S V1=$O(@GLO@(DOM,TYP,AT,OR,V1))
 G:V1="" LOOPOR
 S V2=""
LOOPV2 S V2=$O(@GLO@(DOM,TYP,AT,OR,V1,V2))
 G:V2="" LOOPV1
 D IMP(DOM,TYP,AT,OR,V1,V2,GLO)
 G LOOPV1
 
DOM(DOM) 
 
 
 N AT,OR,V1,V2,I,GLO,ADR,PORT,TYP
 S PORT=$$PORT O PORT U PORT
 S GLO="^[QUI]SCOMPREG",ADR="FIN",TYP=""
 D TOP
 G LOOPT
 
UN(DOM,TYP,AT,O,V1,V2,G) 
 N PORT S PORT=$$PORT O PORT U PORT
 D TOP,TOPAT,IMP(DOM,TYP,AT,O,V1,V2,G)
 G FIN
IMP(D,T,A,O,V1,V2,G) 
 
 N I,NBL
 U PORT W ?5,$S(O="*":"pour tous les indices",1:"pour l'indice : "_O),!
 U PORT W ?10,$$REG(V1,V2),!
 G:T="EGALITE" FIMP
 
 U PORT W ?30,"[ "_$$^%QZCHW("SI")_" ]",!
 I '($D(@G@(D,T,A,O,V1,V2,"COND"))) U PORT W ?10,$$^%QZCHW("Aucune condition sur ce couple de valeurs"),! G ACT
 U PORT W $TR($J(" ",80)," ","-"),!
 S LIG="" F NBL=1:1 S LIG=$O(@G@(D,T,A,O,V1,V2,"COND",LIG)) Q:LIG=""  S L=@G@(D,T,A,O,V1,V2,"COND",LIG) D ECR(L)
 U PORT W $TR($J(" ",80)," ","-"),!
ACT 
 I '($D(@G@(D,T,A,O,V1,V2,"ACTION"))) G FIMP
 U PORT W ?30,"[ "_$$^%QZCHW("ACTION")_" ]",!
 U PORT W $TR($J(" ",80)," ","-"),!
 S SSDOM=$O(@G@(D,T,A,O,V1,V2,"ACTION",""))
 S TO=$S(SSDOM'="":@G@(D,T,A,O,V1,V2,"ACTION",SSDOM),1:"")
 U PORT W ":"_"  Domaine : "_SSDOM_$J(" ",(50-13)-$L(SSDOM))_"Taux d'accord : "_TO_$J(" ",(29-20)-$L(TO))_":",!
 U PORT W $TR($J(" ",80)," ","-")
FIMP U PORT W !
 Q
ECR(L) 
 I $L(L)'>76 U PORT W ": "_L,?78," :",! Q
 N L1
ECR0 S L1=$E(L,1,76) Q:L1=""
 U PORT W ": "_L1,?78," :",!
 S L=$E(L,77,9999)
 G ECR0
PORT() 
 S DX=0 X XY
 I '($D(^TABIDENT(WHOIS,"PRINTER"))) S PORT=0 Q PORT
 S PORT=^TABIDENT(WHOIS,"PRINTER") I PORT="" S PORT=0
 
 Q PORT
 
TOP 
 U PORT W ?20,$TR($J(" ",40)," ","#"),!
 U PORT W ?20,"#"_" "_$$^%QZCHW("Domaine")_" : "_DOM,?59,"#",!
 U PORT W ?20,$TR($J(" ",40)," ","#"),!
 Q
TOPAT 
 U PORT W $TR($J(" ",80)," ","="),!
 U PORT W "="_" "_$$^%QZCHW("Attribut")_" : "_AT,?79,"=",!
 U PORT W $TR($J(" ",80)," ","="),!
 U PORT W ?2,$$^%QZCHW("Regles de comparaison"),!
 U PORT W ?2,"---------------------",!,!
 Q
REG(V1,V2) 
 N M
 I T="EGALITE" S M=$$^%QZCHW("Egalite stricte") G FREG
 I V1="*" G REG1
 I V2="*" G REG2
 S M=V1_" "_$$^%QZCHW("domine")_" "_V2 G FREG
REG1 I V2="*" S M=$$^%QZCHW("qq soient les valeurs reference et cible, la condition est evaluee") G FREG
 S M=$$^%QZCHW("(*) toute valeur reference domine la valeur cible")_" "_V2 G FREG
REG2 S M=$$^%QZCHW("la valeur reference")_" "_V1_" "_$$^%QZCHW("domine (*) toute valeur cible") G FREG
FREG Q M

