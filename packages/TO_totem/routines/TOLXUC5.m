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

;TOLXUC5^INT^1^59547,74873^0
TOLXUC5 ;
 
 
 
 
NUPAIMP S REFUSE=0 I RESUL(1)="" S REFUSE=1 G FIN
 I RESUL(IC)=$$^%QZCHW("SINON") G FIN
 S:'($D(^[QUI]CPTEUR("NUPAIMP",RESUL(1)))) ^[QUI]CPTEUR("NUPAIMP",RESUL(1))=0 L ^[QUI]CPTEUR("NUPAIMP",RESUL(1)) S PN=^[QUI]CPTEUR("NUPAIMP",RESUL(1)),PN=PN+1,^[QUI]CPTEUR("NUPAIMP",RESUL(1))=PN
 S TAB(IC)=PN,ICC=IC D AFFICHE L
 G FIN
NUPAMAT S REFUSE=0 I RESUL(1)="" S REFUSE=1 G FIN
 G:RESUL(IC)=$$^%QZCHW("SINON") FIN S:'($D(^[QUI]CPTEUR("NUPAMAT",RESUL(1)))) ^[QUI]CPTEUR("NUPAMAT",RESUL(1))=0 L ^[QUI]CPTEUR("NUPAMAT",RESUL(1)) S PN=^[QUI]CPTEUR("NUPAMAT",RESUL(1)),PN=PN+1,^[QUI]CPTEUR("NUPAMAT",RESUL(1))=PN
 S TAB(IC)=PN,ICC=IC D AFFICHE L
 G FIN
NUCOND S:'($D(^[QUI]CPTEUR("NUCOND"))) ^[QUI]CPTEUR("NUCOND")=0 L ^[QUI]CPTEUR("NUCOND") S PN=^[QUI]CPTEUR("NUCOND"),PN=PN+1,^[QUI]CPTEUR("NUCOND")=PN
 S TAB(IC)=PN,ICC=IC D AFFICHE L
 G FIN
AFFICHE D ^%VAFFICH Q
SECT S REFUSE=0 I (RESUL(IC-1)="")!(RESUL(IC)="") S REFUSE=1 Q
 I $D(^[QUI]SECTION(RESUL(IC-1),RESUL(IC))) S REFUSE=1
 G FIN
USET S REFUSE=0 I RESUL(IC)'="" S ANCSECT=RESUL(IC) Q
 I $D(ANCSECT) S RESUL(IC)=ANCSECT,TAB(IC)=ANCSECT
 E  S (TAB(IC),RESUL(IC))="GRENOBLE"
 S ICC=IC D AFFICHE G FIN
FORMUL S STOPUC=1,REFUSE=0,EXP=RESUL(IC) G:EXP="" FIN S STOPUC=0,XDP="("_EXP_")",OOICC=IC D ^%LXUC6,CLEPAG^%VVIDEO D:^TOZE($I,"SIMUL")=0 ^%VAFIGRI,^%VAFISCR S IC=OOICC
 I REFUSE=0 S ICC=IC,TAB(ICC)=EX,FRESU(ICC)=EXF D AFFICHE G:EX["$" DOL G FIN
 D POCLEPA^%VVIDEO W $$^%QZCHW("(L)exique/(B)Cons.breve/[RETURN]") R *RET S RET=$C(RET) D:RET=$$^%QZCHW("B") BREV D:RET=$$^%QZCHW("L") ^%LXUC7 S REFUSE=0,ICC=IC,DEJALU(IC)="",(IC,ICC)=IC-1,STOPUC=1 G FIN
FORS Q:RESUL(IC)=""  Q:RESUL(IC)[","  Q:RESUL(IC)["~"  Q:RESUL(IC)["$"  S EXP=RESUL(IC) D ^TOPARENT I REFUSE>0 D ^%VZEAVT($$^%QZCHW("Mauvais parenthesage")) G FIN
 S TAB(IC)=$J("",$L(RESUL(IC))),ICC=IC D AFFICHE S TAB(IC)=EXP D AFFICHE G FIN
 G FIN
BRAQ S BRAQ=RESUL(IC) G:RESUL(IC-1)'="[]" ABR
 S REFUSE=0,BRAQ=RESUL(IC),BRAQG=$P(BRAQ,",",1),BRAQD=$P(BRAQ,",",2) I (BRAQG="")!(BRAQD="") S REFUSE=1 G FIN
 I BRAQG>BRAQD S %PCH=BRAQG D ^%QZNBN1 S IG=ISNUM,%PCH=BRAQD D ^%QZNBN1 S ID=ISNUM,PI=IG*ID I PI S REFUSE=1
ABR G:^TOZE($I,"L")=0 FIN S CHP="B",BRAQG=$P(BRAQ,",",1),BRAQD=$P(BRAQ,",",2)
 S YART="TOLEX" I YART="" S REFUSE=1 G FIN
 F PCH=BRAQG,BRAQD I PCH'="" S (PCH,PARA,%PCH)=$$GETLBLAN^%VTLBLAN(PCH) D ^%QZNBN1 I '(ISNUM) D ^%LXABR,^%LXUC3
 G FIN
PARAVIDE S REFUSE=0 G:RESUL(IC)'="" FIN
 I ((((SCR="EXPLICI")!(SCR=$$^%QZCHW("IMPLICI")))!(SCR="IMPMAT"))!(SCR="IMPMAC"))!(SCR="PHASE") S LIMITE=20 G SAUT
 S LIMITE=$S(SCR="FORMULE":21,SCR="IMPTRIP":19,SCR="NOMENC":20,SCR=$$^%QZCHW("MATIERE"):18,SCR="SELMAT":20,SCR="OUTCONS":21,SCR="TOCTREV":19,SCR="PEXPMACH":26,SCR="DIMOUT":22,1:0)
SAUT F I1=IC:1:LIMITE S DEJALU(I1)=1,RESUL(I1)=""
 S (ICC,IC)=LIMITE,STOPUC=1 G FIN
EXPL Q:RESUL(IC)'=""  S TABUC="^[QUI]EXPLICI" D ^TORDEXP S FRESU(IC)=RESUL(IC) G FIN
NUMAT S TABUC="^[QUI]MATIERE" D ^TORDEXP G FIN
NUSMAT D ^TORDMAT G FIN
FAMAT S REFUSE=0 G FIN
OPER D ^TOUCOPER G FIN
ORDPH D ^TORDOPER G FIN
EXIEX S REFUSE=0,ART=RESUL(1) I ART="" S REFUSE=1 G FIN
 S PARA=RESUL(IC) Q:PARA=""  S NUM=-1
 F WZ=0:0 S NUM=$N(^[QUI]EXPLICI(ART,NUM)) Q:NUM=-1  S PAREX=$N(^[QUI]EXPLICI(ART,NUM,-1)) I PAREX=PARA S REFUSE=1 D ^%VZEAVT($$^%QZCHW(""" ")_PARA_$$^%QZCHW(" "" est deja le libelle d'un parametre EXPLICITE : Libelle refuse !!")) G FIN
SYN G:^TOZE($I,"L")=0 FIN G:'($D(^[QUI]TOSYNONY(PARA))) SYNS S SYN=$N(^[QUI]TOSYNONY(PARA,-1)) G:SYN=-1 FIN D ^%VZEAVT($$^%QZCHW(""" ")_PARA_$$^%QZCHW(" "" est synonyme de ")_SYN_$$^%QZCHW(" ==> Substitution")) S LPA=$L(PARA),CHN=""
 F UU=1:1:LPA S CHN=CHN_$$^%QZCHW(" ")
 S ICC=IC,TAB(ICC)=CHN D AFFICHE S TAB(ICC)=SYN D AFFICHE G FIN
SYNS D:'($D(^[QUI]TOLEX(RESUL(IC)))) ^%LXUC7 S:'($D(^[QUI]TOLEX(RESUL(IC)))) REFUSE=1 G FIN
EXIMP S REFUSE=0,ART=RESUL(1) I ART="" S REFUSE=1 G FIN
 S PARA=RESUL(IC) Q:PARA=""  D EXIOP G:REFUSE=1 FIN I $D(^[QUI]IMPLICI(ART,PARA)) S REFUSE=1 D ^%VZEAVT($$^%QZCHW(""" ")_PARA_$$^%QZCHW(" "" est deja le libelle d 'un parametre IMPLICITE : Libelle refuse !!"))
 G SYN
EXIOP 
OPS S PARA=RESUL(IC),REFUSE=0 F IT=$$^%QZCHW("%MACHINE"),"%PHASE","%OPERATION" G END:PARA=IT
 I $P(PARA,"'",2)=$$^%QZCHW("%MACHINE") S PARA=$P(PARA,"'",1)
 I $P(PARA,".",1)="" S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Un mot du lexique ne doit pas commencer par un point (= Separateur)")) G END
 F OP="%","*",":","^","+","-","_","/","\","#","<",">","&","!","=","$","[","]","@" I PARA[OP S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Veuillez ne pas mettre "" ")_OP_$$^%QZCHW(" "" ou autre seperateur (seul le ""."" est accepte)")) G END
 I $$ADR^%QZNBN1(PARA) S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Pas de numerique au lexique. Merci")) G END
 I $E(PARA)'?1A S REFUSE=1 D ^%VZEAVT($$^%QZCHW("Le premier caractere doit etre alphabetique. Merci")) G END
 G END
TBKPT I PARA=RESUL(IC) G END
 S LP=$L(RESUL(IC)),NUL="" F UU=1:1:LP S NUL=NUL_$$^%QZCHW(" ")
 S ICC=IC,TAB(IC)=NUL D AFFICHE S TAB(ICC)=PARA D AFFICHE G FIN
NUFIC D ^TO3OREGI G:REFUSE=1 FIN
 S VALE=-1 F WWQ=0:0 S VALE=$N(@NOMTAB@(RESUL(1),VALE)) Q:VALE=-1  I VALE'=RESUL(2),$D(@NOMTAB@(RESUL(1),VALE,RESUL(IC))) S %NOM="^[QUI]EXPGIMP(RESUL(1),VALE,RESUL(IC))" D ^TO3PUTPA G FIN
 G FIN
NUCNOM D ^TO3ORDNO G FIN
END Q
FIN K TAB Q
BREV S OICC=ICC D ^%LXCONS,^%VAFIGRI,^%VAFISCR S ICC=OICC,CTRLF=0 G FIN
IDTTOT D ^TOTPOP S ICC=IC,TAB(ICC)=NUFA D AFFICHE G FIN
CHBKPT S PARA=RESUL(IC) D ^%QZCHBT S ICC=IC,EFF="",LEFF=$L(RESUL(IC)) F RR=1:1:LEFF S EFF=EFF_$$^%QZCHW(" ")
 S TAB(ICC)=EFF D AFFICHE S TAB(ICC)=PARA D AFFICHE G FIN
DOL F DOL="$DESSINER","$SOMCP","$MAXCP","$MINCP","$MOYCP","$SIGMA1","$DMD","$EXISTE","$COUT","$DUREE","$MACHINE","$VARMECA" G:RESUL(IC)[DOL DOL1
 G FIN
DOL1 S FCT=$S(EXF["$SIGMA1":"$SIGMA1",EXF["$DESSINER":"$DESSINER",EXF["$SOMCP":"$SOMCP",EXF["$MAXCP":"$MAXCP",EXF["$MINCP":"$MINCP",EXP["$MOYCP":"$MOYCP",EXF["$DMD":"$DMD",1:"")
 S EXDOL=$S(EXF["$SIGMA1":"^TODOLSIG",(EXF["$SOMCP")!((EXF["$MAXCP")!((EXF["$MINCP")!((EXP["$MOYCP")!(EXF["$DESSINER")))):"^TODOLDMD(FCT)",EXF["$DMD":"^TODOLDMD(FCT)",EXF["$VARMECA":"^TOVARMEC",1:"^TODOLEXI") D @EXDOL K EXDOL S FRESU(ICC)=EXP G FIN
EXIAPH S REFUSE=0 Q:$D(^[QUI]PHASE(RESUL(IC)))  I ('($D(^[QUI]EXPLICIT(RESUL(IC)))))&('($D(^[QUI]EXPLICIT(RESUL(IC))))) S REFUSE=1 Q
 D ^%VZEAVT($$^%QZCHW("ATTENTION !!! Cet article n'a pas de phase")) Q

