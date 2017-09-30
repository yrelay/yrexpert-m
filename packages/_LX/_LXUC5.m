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

;%LXUC5^INT^1^59547,73871^0
%LXUC5 ;
 
 
 
 
NUPAIMP G NUPAIMP^%LXUCB
 
NUPAMAT G NUPAMAT^%LXUCB
NUCOND G NUCOND^%LXUCB
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
FORS Q:RESUL(IC)=""  Q:RESUL(IC)[","  Q:RESUL(IC)["~"  Q:RESUL(IC)["$"  S EXP=RESUL(IC) D ^TOPARENT I REFUSE>0 D M("Mauvais parenthesage") G FIN
 S TAB(IC)=$J("",$L(RESUL(IC))),ICC=IC D AFFICHE S TAB(IC)=EXP D AFFICHE G FIN
 G FIN
BRAQ S BRAQ=RESUL(IC) G:RESUL(IC-1)'="[]" ABR
 S REFUSE=0,BRAQ=RESUL(IC),BRAQG=$P(BRAQ,",",1),BRAQD=$P(BRAQ,",",2) I (BRAQG="")!(BRAQD="") S REFUSE=1 G FIN
 I BRAQG>BRAQD S %PCH=BRAQG D ^%QZNBN1 S IG=ISNUM,%PCH=BRAQD D ^%QZNBN1 S ID=ISNUM,PI=IG*ID I PI S REFUSE=1
ABR G:^TOZE($I,"L")=0 FIN S CHP="B",BRAQG=$P(BRAQ,",",1),BRAQD=$P(BRAQ,",",2)
 S YART="TOLEX" I YART="" S REFUSE=1 G FIN
 F PCH=BRAQG,BRAQD I PCH'="" S (PCH,PARA,%PCH)=$$GETLBLAN^%VTLBLAN(PCH) D ^%QZNBN1 I '(ISNUM) D ^%LXABR,^%LXUC3
 G FIN
PARAVIDE G PARAVIDE^%LXUCB
SAUT G SAUT^%LXUCB
EXPL Q:RESUL(IC)'=""
 Q:%AJM'="A"
 S TABUC=$S(IBMPC:"^[QUI]EXPLICI",1:"^[QUI]EXPLICITE")
 D ^TORDEXP S FRESU(IC)=RESUL(IC) G FIN
NUMAT S TABUC="^[QUI]MATIERE" D ^TORDEXP G FIN
NUSMAT D ^TORDMAT G FIN
FAMAT S REFUSE=0 G FIN
OPER D ^TOUCOPER G FIN
ORDPH D ^TORDOPER G FIN
EXIEX G EXIEX^%LXUCB
SYN G SYN^%LXUCB
SYNS G SYNS^%LXUCB
EXIMP S REFUSE=0,ART=RESUL(1)
 I ART="" S REFUSE=1 G FIN
 S PARA=RESUL(IC) Q:PARA=""
 D EXIOP G:REFUSE=1 FIN
 I IBMPC,$D(^[QUI]IMPLICI(ART,PARA)) S REFUSE=1 D ^%VZEAVT($$^%QZCHW(""" ")_PARA_$$^%QZCHW(" "" est deja le libelle d 'un parametre IMPLICITE : Libelle refuse !!"))
 I '(IBMPC),$D(^[QUI]IMPLICITE(ART,PARA)) S REFUSE=1 D ^%VZEAVT($$^%QZCHW(""" ")_PARA_$$^%QZCHW(" "" est deja le libelle d 'un parametre IMPLICITE : Libelle refuse !!"))
 G SYN
EXIOP 
OPS S PARA=RESUL(IC),REFUSE=0 F IT=$$^%QZCHW("%MACHINE"),"%PHASE","%OPERATION" G END:PARA=IT
 I $P(PARA,"'",2)=$$^%QZCHW("%MACHINE") S PARA=$P(PARA,"'",1)
 I '($$OKLEX^%LXUCA($P(PARA,"'"),.MESAGER)) S REFUSE=1 D M(MESAGER)
 K MESAGER
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
EXIAPH S REFUSE=0 Q:$D(^[QUI]PHASE(RESUL(IC)))
 I IBMPC,$D(^[QUI]EXPLICI(RESUL(IC)))!$D(^[QUI]EXPLICI(RESUL(IC))) G EXIAP2
 I '(IBMPC),$D(^[QUI]EXPLICIT(RESUL(IC)))!$D(^[QUI]EXPLICIT(RESUL(IC))) G EXIAP2
 S REFUSE=1 Q
EXIAP2 D M("ATTENTION !!! Cet article n'a pas de phase") Q
 
M(M) D ^%VZEAVT($$^%QZCHW(M)) Q

