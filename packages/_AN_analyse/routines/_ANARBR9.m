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

;%ANARBR9^INT^1^59547,73866^0
%ANARBR9 ;
 
 
 
 
 
COMPL K @(TEMPO) S @TEMPO@(1)="LIST",@TEMPO@(2)="R",@TEMPO@(3)="RES"
 S @TEMPO@(4)="LIST2",@TEMPO@(5)="ADRES",@TEMPO@(6)="ADRES2",@TEMPO@(7)="BL"
 S @TEMPO@(8)="BL2" D EMPV^%ANGEPIL(TEMPO)
 S POS=1,SA=A,A=$$RED(A,1) D EMPIL^%ANGEPIL("COMPL1^%ANARBR9") G INT^%ANARBR2
COMPL1 I (VAL="")!('(POS)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer nom de la liste")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 I '($$EX^%QSGEST7(VAL)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Liste inexistante")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 S LIST=VAL,ADRES=$$^%QSCALVA("L0",LIST,"ADRESSE") I ADRES="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible retrouver individus de la liste")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 S BL=$$^%QSCALVA("L0",LIST,"BASE") I BL="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible retrouver repertoire de la liste")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 S A=$$RED(SA,2) D EMPIL^%ANGEPIL("COMPL2^%ANARBR9") G INT^%ANARBR2
COMPL2 I '(POS) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible retrouver complement")) S VAL="" G DEPIL^%ANGEPIL
 S LIST2=VAL
 I LIST2="" S ADRES2=$$LISTIND^%QSGEST6(BL) G TCOMP
 S ADRES2=$$^%QSCALVA("L0",LIST2,"ADRESSE") I ADRES2="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible retrouver individus du complement")) S POS=0,VAL="" G DEPIL^%ANGEPIL
 S BL2=$$^%QSCALVA("L0",LIST2,"BASE") I BL2="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible retrouver repertoire du complement")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 I BL'=BL2 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Les listes contiennent des individus de nature differente")) S VAL="",POS=0 G DEPIL^%ANGEPIL
TCOMP S RES="",R=$$COMPL^%QS0COMP(LIST,ADRES,ADRES2,.RES)
 S VAL=RES G DEPIL^%ANGEPIL
 
 
UNION K @(TEMPO) S @TEMPO@(1)="TEMPOL",@TEMPO@(2)="SA",@TEMPO@(3)="I"
 S @TEMPO@(4)="NVL",@TEMPO@(5)="LIST",@TEMPO@(6)="%I",@TEMPO@(7)="MES"
 D EMPV^%ANGEPIL(TEMPO)
 S TEMPOL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMPOL)
 S POS=1,I=0,SA=A
FUN1 S I=I+1,A=$$RED(SA,I)
 G:A=0 FUNF D EMPIL^%ANGEPIL("FUN2^%ANARBR9") G INT^%ANARBR2
FUN2 G:(VAL="")!(POS=0) FUNER
 I '($$EX^%QS0(VAL)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("   Liste inexistante:")_VAL) G FUNER2
 S @TEMPOL@(VAL)="" G FUN1
FUNER D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer listes"))
FUNER2 K @(TEMPOL) S VAL="",POS=0 G DEPIL^%ANGEPIL
FUNF S MES=$$TSTUN^%QS0CALC(TEMPOL)
 I MES'="" D:MODAF ADD^%TLIFEN("LOG","  "_MES) G FUNER2
 I MODAF'=0 D POCLEPA^%VVIDEO W $$^%QZCHW("Union en cours ...") H 1
 S NVL=$$GEN^%QCAPOP("ZUN")
 D UNION^%QS0CALC(TEMPOL,NVL)
 I MODAF'=0 D POCLEPA^%VVIDEO W $$^%QZCHW("Union terminee --> ") D BLD^%VVIDEO W NVL D NORM^%VVIDEO
 S I=-1 F %I=0:0 S I=$N(@TEMPOL@(I)) Q:I=-1  D USE^%QS0(I)
 K @(TEMPOL)
 S VAL=NVL G DEPIL^%ANGEPIL
 
 
INTER K @(TEMPO) S @TEMPO@(1)="TEMPOL",@TEMPO@(2)="SA",@TEMPO@(3)="I"
 S @TEMPO@(4)="NVL",@TEMPO@(5)="LIST",@TEMPO@(6)="%I"
 D EMPV^%ANGEPIL(TEMPO)
 S TEMPOL=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMPOL)
 S NVL=$$GEN^%QCAPOP("ZIN"),POS=1,I=0,SA=A
FIN1 S I=I+1,A=$$RED(SA,I)
 G:A=0 FINF D EMPIL^%ANGEPIL("FIN2^%ANARBR9") G INT^%ANARBR2
FIN2 G:(VAL="")!(POS=0) FINER
 I '($$EX^%QS0(VAL)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("   Liste inexistante:")_VAL) G FINER2
 S @TEMPOL@(VAL)="" G FIN1
FINER D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer listes"))
FINER2 K @(TEMPOL) S VAL="",POS=0 G DEPIL^%ANGEPIL
FINF I MODAF'=0 D POCLEPA^%VVIDEO W $$^%QZCHW("Intersection en cours ...") H 1
 D INTERSECT^%QS0CALC(TEMPOL,NVL)
 I MODAF'=0 D POCLEPA^%VVIDEO W $$^%QZCHW("Intersection terminee --> ") D BLD^%VVIDEO W NVL D NORM^%VVIDEO
 S I=-1 F %I=0:0 S I=$N(@TEMPOL@(I)) Q:I=-1  D USE^%QS0(I)
 K @(TEMPOL)
 S VAL=NVL G DEPIL^%ANGEPIL
 
 
LOG K @(TEMPO) S @TEMPO@(1)="ARG",@TEMPO@(2)="VAL1",@TEMPO@(3)="SA",@TEMPO@(4)="EXPFONC"
 D EMPV^%ANGEPIL(TEMPO)
 S SA=A,A=$$RED(A,1) D EMPIL^%ANGEPIL("LOG1^%ANARBR9") G INT^%ANARBR2
LOG1 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer 1er argument")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 S VAL1=VAL
 S A=$$RED(SA,2) D EMPIL^%ANGEPIL("LOG2^%ANARBR9") G INT^%ANARBR2
LOG2 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer 2nd argument")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 I '($$VERIFLOG^%TLCAMTH(VAL1,VAL)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Argument(s) non numerique(s) ou, 2ieme arg <=0 ou =1")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 S VAL=$$LOGBN^%TLCAMTH(VAL1,VAL)
 G DEPIL^%ANGEPIL
 
 
LOGN K @(TEMPO) S @TEMPO@(1)="ARG",@TEMPO@(2)="EXPFONC" D EMPV^%ANGEPIL(TEMPO)
 S A=$$RED(A,1) D EMPIL^%ANGEPIL("LOGN1^%ANARBR9") G INT^%ANARBR2
LOGN1 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer argument")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 I '($$POSITIF^%TLCAMTH(VAL)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Argument non numerique ou non positif ou nul")) S VAL="",POS=0 G DEPIL^%ANGEPIL
 S VAL=$$LN^%TLCAMTH(VAL)
 G DEPIL^%ANGEPIL
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

