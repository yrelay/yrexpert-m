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

;%QSACTIV^INT^1^59573,35453^0
%QSACTIV(AR,BA,LD,AD,CD) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N SOUR,NIV,LIB,BAD,IND,NINT,OKECR
 S OKECR=$$GET^%SGVAR("ECR")
 K ^CXZ($J) S ^CXZ($J)=0,SOUR="",NIV=0,LIB=$$ZSUBST^%QZCHSUB(LD,"OBJET","CARD")
 I ($D(@LIB)#10)=1 S CD=@LIB G SCALC
 S NINT=$P(LIB,"(",2),NINT=$P(NINT,",",1),CD=$$^%QSCALVA("L0",NINT,"CARD")
SCALC S BAD=$$NOMINT^%QSF(BA) S:BAD="" BAD=BA
 D R(AR,BA,LD,LD,.BAD,.AD,.CD) Q
 
R(AR,BASE,LDEP,A22,BD,AD,CD) I ((AR="")!(AR=0))!(CD=0) Q
 N A,C,CA,SBD,I,SA,LDE,LDD,BDD,MJ,BDP1,BDP2,RS,TL
 S NIV=NIV+1,LDD=LDEP,BDD=BD,MJ=1
 S LDE=LDEP
 I $D(AD) S A=AD G SR
 S A=LDEP
SR S CA=CD
 N CALC S CALC=$$RED^%ANA(AR,"CALCUL")
 S:(CALC="PRECEDENCE")!(CALC="CRITERE") MJ=0,SBD=BD
 I CALC="CHEMIN" S RS=$$RED^%ANA(AR,"SOURCE") S:RS=$$RED^%ANA(AR,"DESTINATION") LDE=$$LISTIND^%QSGEST6(RS)
 S I=1
BOUCSR S SA=$$RED^%ANA(AR,I)
 G:(SA="")!(SA=0) FINSR
 D R(SA,BASE,LDE,.A22,.BD,.A,.CA)
 G:CA=0 FINSR
 S C(I,1)=CA,C(I,2)=A
 S:MJ=1 LDE=A
 S:MJ=0 @("BDP"_I)=BD,SOUR="",BD=SBD
 S I=I+1 G BOUCSR
FINSR I CA=0 S CD=0 Q
 
 S NIV=NIV-1
 I OKECR D POCLEPA^%VVIDEO W $$^%QZCHW("Calcul = "),CALC
 G:CALC="MICRO REQUETE" REQ^%QSACTI2
 G:CALC="INTERSECTION" INTER^%QSACTI2
 G:CALC="CHEMIN" CHEM^%QSACTI2
 G:CALC="VALORISATION" VAL^%QSACTI2
 G:CALC="CRITERE" CRIT^%QSACTI2
 G:CALC="$EXISTE" FONCT
 G:CALC="NON $EXISTE" NEGAT
 G:CALC="PRECEDENCE" PRECE
PRECE 
 N C1,C2,INV,F1,F2,L1,L2,%I,N,NCL,NOM,O,%O,OK,O2,%O2,ORD1,ORD2,PER,PERE,REP,SRC,NT,NCLANC,ANC,ISNUM1,ISNUM2
 S (N,^CXZ($J))=^CXZ($J)+1,AD="^CXZ($J,"_^CXZ($J)_")",CD=0,NT=0
 S REP=$$RED^%ANA(AR,"REPERTOIRE")
 S SRC=$$RED^%ANA(AR,"SOURCE")
 
 S NOM=$$LIENPF^%QSGEL2(REP,SRC)
 F %I=1,2 I @("BDP"_%I)'=SRC S C(%I,1)=$$CARD^%QSGEST5(SRC),C(%I,2)=$$LISTIND^%QSGEST6(SRC)
 S NCL=^[QUI]RQSNCLES(REP)+1
 S NCLANC=^[QUI]RQSNCLES(REP)
 I REP'=SBD S LDEP=$$LISTIND^%QSGEST6(REP)
 
 S PERE=REP
 S C1=C(1,1),C2=C(2,1)
 I C1<C2 S L1=C(1,2),L2=C(2,2),INV=0 G SPR
 S L1=C(2,2),L2=C(1,2),INV=1
SPR 
 S O="" F %O=0:0 S O=$O(@L1@(O)) Q:O=""  D PRECO
 S ^CXZ($J,N)=CD,BD=REP
 I OKECR D POCLEPA^%VVIDEO W $$^%QZCHW("Precedence --> "),CD,$$^%QZCHW(" individus") Q
 Q
PRECO S (O2,PER)=$P(O,",",1,NCL-1),NT=NT+1
 I OKECR D:(NT#100)=0 AFFPT(NT)
 Q:'($$IR^%QSGEST5(PERE,PER))  Q:$D(^CXZ($J,N,PER))
 S F1=$P(O,",",NCL),OK=0
 F %O2=0:0 S O2=$O(@L2@(O2)) Q:(O2="")!(("*"_O2)'[("*"_PER))  D TOK Q:OK
 Q:'(OK)
 
 I '($D(^CXZ($J,N,PER))) S ANC=$P(PER,",",1,NCLANC) I $D(@LDEP@(ANC)) S CD=CD+1,^CXZ($J,N,ANC)=""
 Q
TOK S F2=$P(O2,",",NCL)
 S ORD1=$$NXTRIAVO^%QSTRUC8(PERE,PER,NOM,F1,"") Q:ORD1=""
 S ORD2=$$NXTRIAVO^%QSTRUC8(PERE,PER,NOM,F2,"") Q:ORD2=""
 S ISNUM1=$$ADR^%QZNBN1(ORD1)
 S ISNUM2=$$ADR^%QZNBN1(ORD2)
 I INV=0 S OK=$S(ISNUM1&ISNUM2:ORD1<ORD2,ISNUM1:1,ISNUM2:0,1:ORD2]ORD1) Q
 S OK=$S(ISNUM1&ISNUM2:ORD2<ORD1,ISNUM1:0,ISNUM2:1,1:ORD1]ORD2) Q
 Q
FONCT 
 N AIND,ATTR,ANAL,BAS,BASI,LL,EXI
 S ANAL=$$RED^%ANA(AR,"ARBRE")
 S BAS=$$RED^%ANA(ANAL,"BASE"),BASI=$$NOMINT^%QSF(BAS)
 S AIND=$$RED^%ANA(ANAL,1),AIND=$$RED^%ANA(AIND,2),TIND=$$RED^%ANA(AIND,"TEXTE")
 S:TIND="" TIND=0
 S:BASI="" BASI=BAS
 S ATTR=$P($$RED^%ANA(ANAL,"LATT"),",",1)
 S ^CXZ($J)=^CXZ($J)+1,AD="^CXZ($J,"_^CXZ($J)_")"
 I BASI=BD D ^%QSEXIST(BD,LDE,ATTR,TIND,AD,.CD) G SFONCT
 S BD=BASI,LL=$$LISTIND^%QSGEST6(BASI)
 D ^%QSEXIST(BASI,LL,ATTR,TIND,AD,.CD)
SFONCT S @AD=CD
 I OKECR D POCLEPA^%VVIDEO W $$^%QZCHW("$EXISTE("),ATTR,") --> ",CD,$$^%QZCHW(" individus")
 Q
AFFPT(X) S DY=20,DX=30+((X\100)#45) X XY W "% " Q
 
NEGAT 
 N ADR,ANAL,ARBR,AIND,TIND,ATTR,CARD,BAS,BASI,LL
 S ANAL=$$RED^%ANA(AR,"ARBRE")
 S ARBR=$$RED^%ANA(ANAL,1),ARBR=$$RED^%ANA(ARBR,1)
 S BAS=$$RED^%ANA(ANAL,"BASE"),BASI=$$NOMINT^%QSF(BAS)
 S:BASI="" BASI=BAS
 S AIND=$$RED^%ANA(ARBR,2),TIND=$$RED^%ANA(AIND,"TEXTE")
 S:TIND="" TIND=0
 S ATTR=$P($$RED^%ANA(ANAL,"LATT"),",",1)
 S ^CXZ($J)=^CXZ($J)+1,ADR="^CXZ($J,"_^CXZ($J)_")"
 S ^CXZ($J)=^CXZ($J)+1
 S AD="^CXZ($J,"_^CXZ($J)_")"
 I BASI=BD D ^%QSEXIST(BD,LDE,ATTR,TIND,ADR,.CARD),^%QSCOMPL(LDE,ADR,AD,.CD) G SNEGAT
 S BD=BASI,LL=$$LISTIND^%QSGEST6(BASI)
 D ^%QSEXIST(BD,LL,ATTR,TIND,ADR,.CARD),^%QSCOMPL(LL,ADR,AD,.CD)
SNEGAT S @AD=CD
 I OKECR D POCLEPA^%VVIDEO W $$^%QZCHW("NON $EXISTE("),ATTR,") --> ",CD,$$^%QZCHW(" individus")
 Q

