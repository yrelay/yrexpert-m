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

;%QSCOMP4^INT^1^59547,73881^0
RQSCOMP4 ;
 
 
 
 
M(M) D ^%VZEAVT Q
 
PASS 
 
 N ATET,L,M,MULT,N,NEG,NV,P,STOP,TET,TYP,V,VN
 S STOP=0
 S NEG=0
 F L=1:1:$ZP(^[QUI]RQS1(R,"CONTRAINTES","")) D TL Q:STOP
 Q
TL 
 G:$D(^[QUI]RQS1(R,"CONTRAINTES",L,"TETE")) OKTL
 S RESF=0,STOP=1
 D:^TOZE($I,"DEBUG") ^%VZEAVT($$^%QZCHW("Pas d'arbre d'analyse pour la ligne ")_I_$$^%QZCHW(" des criteres")) Q
OKTL S NEG=0
 S TET=^[QUI]RQS1(R,"CONTRAINTES",L,"TETE")
 S ATET=TET
 S TYP=$$RED^%ANA(TET,"TYPE")
 S MULT=$$RED^%ANA(TET,"MULTI") S:MULT="" MULT=0
OKTL2 G:TYP="COMPARATEUR.BINAIRE" BIN
 G:TYP="COMPARATEUR.TERNAIRE" BIN
 G:TYP="OPERATEUR" OP
 G:TYP="NEGATION" OPL
 G:TYP="FONCTION.LOGIQUE" FON
 G:TYP="OPERATEUR.PRECEDENCE" PREC
 S RESF=0,STOP=1
 D:^TOZE($I,"DEBUG") ^%VZEAVT($$^%QZCHW("RQSCOMP4...type de noeud innatendu : ")_TYP) Q
OP 
 
 N VALOP S VALOP=$$RED^%ANA(TET,"TEXTE")
 G:(VALOP="!")!(VALOP="&") BIN
 D:^TOZE($I,"DEBUG") ^%VZEAVT($$^%QZCHW("RQSCOMP4...operateur innatendu : ")_VALOP) Q
BIN Q:MULT=1
 S N=$$NEW^%ANA
 S V=$$RED^%ANA(TET,"VAR") S:V="" V="@"
 D SET^%ANA(N,"CALCUL","MICRO REQUETE")
 D SET^%ANA(N,"ARBRE",TET)
 S NV=TABIND(V)
 S P=$$RED^%ANA(NV,"FILS")+1
 D SET^%ANA(NV,"FILS",P)
 D SET^%ANA(NV,P,N)
 D SET^%ANA(N,"PERE",NV)
 Q
PREC Q
 
OPL S TYP=$$RED^%ANA(TET,"TEXTE")
 G:TYP="NON" OKOPL
 S RESF=0,STOP=1
 D:^TOZE($I,"DEBUG") ^%VZEAVT($$^%QZCHW("RQSCOMP4 ... type d'operateur logique inattendu : ")_TYP) Q
 
OKOPL S VN=$$RED^%ANA(TET,"VAR")
 S TET=$$RED^%ANA(TET,1)
 S TYP=$$RED^%ANA(TET,"TYPE")
 S NEG=1
 G OKTL2
 
FON S TYP=$$RED^%ANA(TET,"TEXTE")
 G:TYP="$EXISTE" OKFON
 S RESF=0,STOP=1
 D:^TOZE($I,"DEBUG") ^%VZEAVT($$^%QZCHW("RQSCOMP4 ... type de fonction logique inattendu : ")_TYP) Q
 
OKFON S N=$$NEW^%ANA
 S V=$S(NEG:VN,1:$$RED^%ANA(TET,"VAR")) S:V="" V="@"
 D SET^%ANA(N,"CALCUL",$S(NEG:"NON ",1:"")_"$EXISTE")
 D SET^%ANA(N,"ARBRE",ATET)
 S NV=TABIND(V)
 S P=$$RED^%ANA(NV,"FILS")+1
 D SET^%ANA(NV,"FILS",P)
 D SET^%ANA(NV,P,N)
 D SET^%ANA(N,"PERE",NV)
 Q

