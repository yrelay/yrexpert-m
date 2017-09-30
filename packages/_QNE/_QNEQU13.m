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

;%QNEQU13^INT^1^59547,73879^0
QNEQU13 ;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
AFFOBJ1(LISTIND,LMN,INDCOUR,AFF,ACUMUL) 
 Q $$AFFOBJ(@VT@("ETUDE"),@VT@("INCOMPL"),@VT@("TAL"),@VT@("TAG"),@VT@("LIND"),@VT@("INSEPL"),@VT@("LH"),@VT@("LG"),@VT@("CYCLE"),@VT@("INSEPI"),@VT@("LLISTEN"),@VT@("TEMPS"),@VT@("MODAF"),@VT@("DMULT"),LISTIND,LMN,INDCOUR,INDAF,.AFF,ACUMUL)
 
AFFOBJ(ETUDE,INCOMPL,TAL,TAG,LIND,INSEPL,LH,LG,C,INSEPI,LLISTEN,TEMPS,MODAF,DMULT,LISTIND,LMN,INDCOUR,INDAF,AFF,ACUMUL) 
 N INFO,CINSIND,BASEL,CLM,A,VCYCLE,VINCOMP,ER,MULT,ABANDON,INDAF,NAFF,OK
 S INDAF=$$AFIN^%QFGRACT(LISTIND,INDCOUR)
 
 S ABANDON=0,NAFF=0
 S AFF=(TAL'="")!(TAG'="")
 S (VCYCLE,VINCOMP)=0,OK=1
 S ER="",BASEL=$$BASE^%QSGEST7(LIND)
 S CLM=$$^%QSCALVA("L0",LMN,TEMPS)
 S INFO="$$^%QSCALVA("""_BASEL_""",IND,TEMPS)"
 S (MULT(1),MULT(2))=$$^%QSCALVA("L0",LMN,"EFFECTIF.POSTE")
 I (MULT(1)+0)<1 S (MULT(1),MULT(2))=1
 
 S CINSIND=$$CINSIND^%QNEQUI9(INFO,TEMPS,INDCOUR,INSEPI,INSEP)
 
 I (CINSIND+CLM)>(C*MULT(1)) Q:$$MULT ER
 
 I $D(@INCOMPL@(LMN,INDCOUR)) S VINCOMP=1,OK=0,ER=INDAF_" "_$$^%QZCHW("est incompatible avec")_" "_$$AFGR^%QFGRACT(LMN) I '(AFF) Q ER
 I (TAG="")&(TAL="") D DMULT Q ""
 
 D ZERO^%QSGE11(LIND)
 D STOCK^%QSGES11(LIND,INDCOUR)
 S A=$$^%QNEQUI5(LISTIND,ETUDE,TAL,TAG,LIND,INSEPL,LH,LG,C,CLM,CINSIND,INDCOUR,INSEPI,LMN,LLISTEN,MODAF,OK,VCYCLE,VINCOMP,DMULT,NAFF,.MULT,.ER,.ABANDON)
 I ABANDON S ER=$$^%QZCHW("abandon du traitement  sur")_" "_INDAF
 I '(ABANDON),A=0,ER="" S ER=$$^%QZCHW("le savoir faire interdit l'affectation de")_" "_INDAF
 
 I A=0,'(VINCOMP) S ER=$$USER(ER,.MULT)
 I ER'="" Q ER
 D DMULT
 Q ""
 
MULT() 
 I '($D(@INSEPI@(INDCOUR))) G MULTNO
 S MULT(2)=((CLM+CINSIND)\C)+1
 I MULT(2)>DMULT G MULTNO
 S OK=1
 Q 0
 
MULTNO S VCYCLE=1,OK=0
 S ER=$$^%QZCHW("le cycle est atteint par")_" "_INDAF_" "_$$^%QZCHW("multiplicite")_" "_MULT(1)
 
 I '(AFF) S ER=$$USER(ER,.MULT) I ER'="" Q 1
 S OK=1
 Q 0
DMULT 
 D ADDA^%QS0(LMN,"EFFECTIF.POSTE",MULT(2)) S MULT(1)=MULT(2)
 Q
 
USER(ER,MULT) 
 N DY,CTR,MU,DX
 D ^%VZEAVT(ER)
 S DX=0,DY=22 X XY
 I '($$MES^%VZEOUI($$^%QZCHW("Souhaitez vous forcer le placement ?"),"N")) Q ER
 S MU=MULT(2)
 D LIRE2^%VREAD($$^%QZCHW("votre multiplicite")_" : ",MU,0,RM-1,DY+1,DY-1,"","$$UC1^%QNEQU13",.CTR,.MU)
 I CTR="A" Q ER
 S MULT(2)=MU
 Q ""
UC1(MU,REAF) 
 S REAF=0
 I '($$ENTP^%QZNBN(MU)) D ^%VZEAVT(MU_" "_$$^%QZCHW("la multiplicite doit etre un entier positif")) Q 0
 Q 1

