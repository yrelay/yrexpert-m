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

;%QMEAAC1^INT^1^59547,73877^0
%QMEAAC1 ;
 
 
UC(RAFF,BA,INDIV,VA,LIG) 
 N STOP,VL,RG,%I,GOOD,VAL
 
 I (VA="")&($D(@DES@(LIG,"VDEF"))=1) S VA=@DES@(LIG,"VDEF") G FOK
 
 I VA="?" G LEG
 
 I (VA="HELP")!(VA="help") D HELP G FNOK
 
 D NORMALIS^%QZNBN1(.VA)
 I $D(@DES@(LIG,"VDEF"))=1 G:VA=@DES@(LIG,"VDEF") FOK
 
 S VAL=$$S1^%QZCHAD(VA)
 S STOP=0,VL="",GOOD=1
 
 F %I=1:1 S VL=$O(@DES@(LIG,"VL",VL)) Q:(VL="")!(STOP=1)  S RG=@DES@(LIG,"VL",VL),GOOD=$$EVAL(VAL,RG) S:GOOD=1 STOP=1
 G:GOOD=1 FOK G:GOOD=0 FNOK
FOK Q 1
FNOK Q 0
LEG 
 N P,VL,%I,CHL,LISTE
 S LISTE=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(LISTE)
 D CLFEN^%VVIDEO(XG1,YG1,LV1,LH1)
 S DX=XG1+15,DY=YG1 X XY
 D BLD^%VVIDEO,REV^%VVIDEO W $$^%QZCHW("VALEURS LEGALES") D NORM^%VVIDEO
 S VL="" F %I=1:1 S VL=$O(@DES@(LIG,"VL",VL)) Q:VL=""  D STLEG
 D INIT^%QUCHOIP(LISTE,1,"",XG1,YG1+1,LH1,LV1-1)
 D AFF^%QUCHOIP
L0 S VA=$$UN^%QUCHOIP I VA="" G FL
 S P=$E(VA,1) I (((P="<")!(P=">"))!(P="'"))!(P="[") D ^%VSQUEAK G L0
FL D END^%QUCHOIP K @(LISTE)
 I VA="" G FNOK
 G FOK
STLEG 
 N OP,OP1,OP2
 S CHL=@DES@(LIG,"VL",VL),OP=$P(CHL," "),OP1=$P(CHL," ",2),OP2=$P(CHL," ",4)
 S:$E(OP1)="""" OP1=$E(OP1,2,$L(OP1)-1)
 S:$E(OP2)="""" OP2=$E(OP2,2,$L(OP2)-1)
 I OP="=" S @LISTE@(OP1)="" Q
 I OP2="" S @LISTE@(OP_" "_OP1)="" Q
 S @LISTE@(OP_" "_OP1_" , "_OP2)=""
 Q
 
AIDE(RAFF,BA,INDIV,LIG) 
HELP 
 N VAL,ORD,AFF
 S AFF=0
 S VAL=$S($D(@DES@(LIG,"AIDE","NOTE")):@DES@(LIG,"AIDE","NOTE"),1:"")
 S ORD=$S($D(@DES@(LIG,"AIDE","INDICE")):@DES@(LIG,"AIDE","INDICE"),1:"")
 I (VAL="")!(ORD="") D ^%VZEAVT($$^%QZCHW("Pas de note d'aide pour cet attribut")) Q
 D AFF^%QSNOTE2(XG1,YG1,LH1,LV1,RP,S,"NOTE",VAL,ORD,BA,INDIV,RAFF)
 Q
 
EVAL(VA,REG) 
 N BON,OP,POS,CH,ICH,Q,VAL1,VAL2,NEG,X
 
 
 S X=VA,NEG=$E(REG)="'"
 S POS=1,Q=""""
 
 S OP=$P(REG," ")
 
 S VAL1=$P(REG," ",2)
 
 
 I (((((((((OP="[")!(OP="]"))!(OP="="))!(OP="<"))!(OP=">"))!(OP="'["))!(OP="']"))!(OP="'="))!(OP="'<"))!(OP="'>") Q $$EV1
 
 S VAL2=$P(REG," ",4)
 Q $$EVAL2(X,OP,VAL1,VAL2,NEG)
 
EV1() S $ZT="EV10"
 S @("BON="_X_OP_VAL1),$ZT="" Q BON
EV10 S $ZT="" Q 0
 
EVAL2(X,OP,VAL1,VAL2,NEG) 
 N G,D,RES,BON
 I NEG S OP=$E(OP,2,3)
 S G=$E(OP,1),D=$E(OP,2)
 S G=$S(G="]":">",1:"'<")
 S D=$S(D="]":"'>",1:"<")
 
 
 S BON=$$EV2
 S:NEG=1 BON='(BON)
 Q BON
EV2() S $ZT="EV20"
 S RES="("_X_G_VAL1_")&("_X_D_VAL2_")"
 S @("BON="_RES)
 S $ZT="" Q BON
EV20 S $ZT="" Q 0
 
POSIT(GL,HV,GLL,GLD) 
 N POS,LO,I,NBI,NOPAG,NOLIG,NBB,IE,LDON,POSL
 S I="",LO=0,NBI=0,NOPAG=1,NOLIG=$S(LV2'>3:1,1:2)
BPOS S I=$O(@GL@(I))
 I I="" G:HV="H" POSPAGH G POSPAGV
 S NBI=NBI+1
 D:HV="H" CONTLARG
 D:HV'="H" CONTHAUT
 G BPOS
 
CONTLARG 
 N L,LIBAT,ORD
 S ORD=$S('($D(@GL@(I,"ORD"))):"",1:@GL@(I,"ORD"))
 I $E(ORD)="%" S ORD=$$^%QSCALVA(CXT("%","BASE"),CXT("%","OBJET"),ORD)
 S L=@GL@(I,"LONGUEUR"),LIBAT=@GL@(I,"ATT")_$S(ORD="":"",ORD=1:"",1:"("_ORD_")")
 S:L<$L(LIBAT) L=$L(LIBAT)
 I ((LO+L)+(NBI*2))<LH2 S LO=LO+L,POS(NOPAG,NOLIG,I,"LARG")=L,POS(NOPAG,NOLIG,I,"LAT")=$L(LIBAT),POS(NOPAG,NOLIG,I,"LIBAT")=LIBAT,POS(NOPAG,NOLIG)=LO_"/"_NBI Q
 I ((NOLIG+4)<LV2)-1 S LO=L,NBI=1,NOLIG=NOLIG+4,POS(NOPAG,NOLIG,I,"LAT")=$L(LIBAT),POS(NOPAG,NOLIG,I,"LARG")=L,POS(NOPAG,NOLIG,I,"LIBAT")=LIBAT,POS(NOPAG,NOLIG)=LO_"/"_NBI Q
 S NOPAG=NOPAG+1,NOLIG=$S(LV2'>3:1,1:2),NBI=1,LO=L,POS(NOPAG,NOLIG,I,"LAT")=$L(LIBAT),POS(NOPAG,NOLIG,I,"LARG")=L,POS(NOPAG,NOLIG,I,"LIBAT")=LIBAT,POS(NOPAG,NOLIG)=LO_"/"_NBI
 Q
 
POSPAGH S NOPAG="" K @(GLD),@(GLL)
BPAG S NOPAG=$O(POS(NOPAG)) Q:NOPAG=""
 S NOLIG=""
NLIG S NOLIG=$O(POS(NOPAG,NOLIG)) G:NOLIG="" BPAG
 S LIGDO=$S((NOLIG+2)>LV2:NOLIG+1,1:NOLIG+2)
 S LO=$P(POS(NOPAG,NOLIG),"/"),NBI=$P(POS(NOPAG,NOLIG),"/",2)
 S PPOS=1,IE=""
BIE S IE=$O(POS(NOPAG,NOLIG,IE)) G:IE="" NLIG
 S POSL=PPOS
 S @GLL@(NOPAG,NOLIG,POSL)=POS(NOPAG,NOLIG,IE,"LIBAT"),@GLD@(NOPAG,LIGDO,PPOS,"ORD")=IE,@GLD@(NOPAG,LIGDO,PPOS,"LON")=POS(NOPAG,NOLIG,IE,"LARG")
 S PPOS=(PPOS+POS(NOPAG,NOLIG,IE,"LARG"))+2
 G BIE
 
CONTHAUT 
 N L,LIBAT,ORD
 S ORD=$S('($D(@GL@(I,"ORD"))):"",1:@GL@(I,"ORD"))
 I $E(ORD)="%" S ORD=$$^%QSCALVA(CXT("%","BASE"),CXT("%","OBJET"),ORD)
 S L=@GL@(I,"LONGUEUR"),LIBAT=@GL@(I,"ATT")_$S(ORD="":"",ORD=1:"",1:"("_ORD_")")
 S LAT=$L(LIBAT)
 
BOUCPOS I NOLIG'<(LV2-1) S NOPAG=NOPAG+1,NOLIG=$S(LV2'>3:1,1:2)
 I ((L+LAT)+3)<LH2 S POS(NOPAG,NOLIG,"ORD")=I,POS(NOPAG,NOLIG,"LARG")=L,POS(NOPAG,NOLIG,"LAT")=LAT,POS(NOPAG,NOLIG,"LIBAT")=LIBAT,POS(NOPAG,NOLIG,"POSAT")=1,POS(NOPAG,NOLIG,"POSVAL")=LAT+3,NOLIG=NOLIG+2 Q
 I (NOLIG+3)<(LV2-1) S POS(NOPAG,NOLIG,"ORD")=I,POS(NOPAG,NOLIG,"LAT")=LAT,POS(NOPAG,NOLIG,"LIBAT")=LIBAT,POS(NOPAG,NOLIG,"POSAT")=1,NOLIG=NOLIG+1,POS(NOPAG,NOLIG,"LARG")=L,POS(NOPAG,NOLIG,"POSVAL")=1,NOLIG=NOLIG+2 Q
 S NOPAG=NOPAG+1,NOLIG=$S(LV2'>3:1,1:2)
 G BOUCPOS
 Q
 
POSPAGV S NOPAG="" K @(GLD),@(GLL)
BPAG2 S NOPAG=$O(POS(NOPAG)) Q:NOPAG=""
 S NOLIG=""
NLIG2 S NOLIG=$O(POS(NOPAG,NOLIG)) G:NOLIG="" BPAG2
 S POSL=POS(NOPAG,NOLIG,"POSAT")
 S LIGDO=$S($D(POS(NOPAG,NOLIG,"POSVAL")):NOLIG,1:NOLIG+1)
 S @GLL@(NOPAG,NOLIG,POSL)=POS(NOPAG,NOLIG,"LIBAT")
 S PPOS=POS(NOPAG,LIGDO,"POSVAL")
 S IE=POS(NOPAG,NOLIG,"ORD")
 S @GLD@(NOPAG,LIGDO,PPOS,"ORD")=IE
 S @GLD@(NOPAG,LIGDO,PPOS,"LON")=POS(NOPAG,LIGDO,"LARG")
 S NOLIG=LIGDO
 G NLIG2

