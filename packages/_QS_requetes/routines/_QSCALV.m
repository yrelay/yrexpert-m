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

;%QSCALV^INT^1^59547,73880^0
QSCALV(BASED,BASE,OBJET,ATT,GL,TYP) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N G1,T1,I,OD,OR,REPD,G2,J,OR2,L,CARD,REPD,PERES,LAST,FISTON
 S GL=0,TYP=0,FISTON=0
 I ((BASE="")!(OBJET=""))!(ATT="") Q
 
 S REPD=$$REPD^%QSGEL2(BASE,BASED)
 I BASED="" D H Q
 I BASE=REPD D SAME Q
 I $$PERE^%QSGES17(REPD,BASE)=1 D SAME2 Q
 I $$PERE^%QSGES17(BASE,REPD)=1 S FISTON=1
 D MV^%QSCALVA(BASE,OBJET,BASED,.G1,.T1)
 I (G1=0)!(T1=0) S GL=0,TYP=0 Q
 
 S CARD=0
 S OR=$O(G1(""))
 F I=0:0 Q:OR=""  D T S OR=$O(G1(OR))
 S GL=CARD
 Q
T S OD=G1(OR)
 I FISTON S OD=$$NOMFILS^%QSGES10(BASE,OBJET,REPD,OD)
 D MV^%QSCALVA(REPD,OD,ATT,.G2,.TYP)
 S OR2=$O(G2(""))
 F CARD=CARD:1 Q:OR2=""  S GL(CARD)=OR2_"^"_G2(OR2),OR2=$O(G2(OR2))
 Q
H D ASC^%QSGES17(BASE,"PERES")
 S LAST=$ZP(PERES("")),PERES(LAST+1)=BASE,GL=0
 F I=LAST+1:-1:1 Q:GL'=0  D TH
 Q
TH S REPD=PERES(I)
 D MV^%QSCALVA(REPD,$$NOMPERES^%QSGES10(OBJET,I),ATT,.GL,.TYP)
 S OR=$O(GL(""))
 F I=0:0 Q:OR=""  S GL(OR)=OR_"^"_GL(OR),OR=$O(GL(OR))
 Q
SAME D MV^%QSCALVA(BASE,OBJET,ATT,.GL,.TYP)
 S OR=$O(GL(""))
 F I=0:0 Q:OR=""  S GL(OR)=OR_"^"_GL(OR),OR=$O(GL(OR))
 Q
SAME2 D MV^%QSCALVA(REPD,$$NOMPERES^%QSGES10(OBJET,$$RANG^%QSGES17(REPD)),ATT,.GL,.TYP)
 S OR=$O(GL(""))
 F I=0:0 Q:OR=""  S GL(OR)=OR_"^"_GL(OR),OR=$O(GL(OR))
 Q
TEST X ^CBL
 S BASED="PREVISION",BASE="ARTICLE"
 S OBJET=100400
 S ATT="CLIENT"
 D ^%QSCALV(BASED,BASE,OBJET,ATT,.GL,.TYP)
 Q
TEST1 X ^BTL
 S BASED="OPERATION",BASE="P2",OBJET="ARC10,TOLE",ATT="MACHINE"
 D ^%QSCALV(BASED,BASE,OBJET,ATT,.GL,.TYP)
 Q
TEST2 X ^BTL
 S BASED="",BASE="P1",OBJET="ARC10,TOLE,OPE3",ATT="DATE.CONTRACTUELLE"
 D ^%QSCALV(BASED,BASE,OBJET,ATT,.GL,.TYP)
 X ^BTL
 S BASED="",BASE="P1",OBJET="ARC10,TOLE,OPE3",ATT="POIDS.COMMANDE"
 D ^%QSCALV(BASED,BASE,OBJET,ATT,.GL,.TYP) B
 X ^BTL
 S BASED="",BASE="P1",OBJET="ARC10,TOLE,OPE3",ATT="NOM"
 D ^%QSCALV(BASED,BASE,OBJET,ATT,.GL,.TYP) B
 Q
TESX X ^MCA
 D ^%QSCALV("OPERATION.MOZART","MOZ","GAM.100","MACHINE",.GL,.TYP)
 Q

