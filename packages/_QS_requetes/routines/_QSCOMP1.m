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

;%QSCOMP1^INT^1^59547,73881^0
RQSCOMP1 ;
 
 
 
 
M(M) D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M)," [RETURN]" R *DX:^TOZE($I,"ATTENTE")
 D POCLEPA^%VVIDEO Q
 
PASS 
 
 N I,J,K,LVAR,M,NOEUD,REP,STOP,TET
 I '($D(^[QUI]RQS1(R,"BASE"))) S RESF=0,M="Repertoire de la requete manquant" D:^TOZE($I,"DEBUG") ^%VZEAVT($$^%QZCHW(M)) Q
 S REP=$$NOMINT^%QSF(^[QUI]RQS1(R,"BASE"))
 I REP="" S RESF=0 D:^TOZE($I,"DEBUG") ^%VZEAVT($$^%QZCHW("Impossible de calculer le nom interne du repertoire de la requete")) Q
 S NOEUD=$$NEW^%ANA
 D SET^%ANA(NOEUD,"INDIVIDU","@")
 D SET^%ANA(NOEUD,"REPERTOIRE",REP)
 D SET^%ANA(NOEUD,"CHEMIN","")
 D SET^%ANA(NOEUD,"CIBLE","")
 D SET^%ANA(NOEUD,"FILS",0)
 D SET^%ANA(NOEUD,"PERE",0)
 S TABIND("@")=NOEUD
 S STOP=0 F I=1:1:$ZP(^[QUI]RQS1(R,"VARIABLES","")) D TV Q:STOP
 Q:STOP
 S I=-1 F J=0:0 S I=$N(TABIND(I)) Q:I=-1  D TI
 S A=TABIND("@") Q
TI 
 Q:I="@"  S NOEUD=TABIND(I),TET=$$RED^%ANA(NOEUD,"VARPERE")
 S:TET="" TET="@" S M=TABIND(TET),K=$$RED^%ANA(M,"FILS")+1
 D SET^%ANA(NOEUD,"PERE",M),SET^%ANA(M,"FILS",K),SET^%ANA(M,K,NOEUD)
 S PAPA(I)=TET Q
TV 
 I '($D(^[QUI]RQS1(R,"VARIABLES",I,"TETE"))) S RESF=0,STOP=1 D:^TOZE($I,"DEBUG") ^%VZEAVT($$^%QZCHW("Pas d'arbre d'analyse pour la ligne ")_I_$$^%QZCHW(" des individus")) Q
 S TET=^[QUI]RQS1(R,"VARIABLES",I,"TETE")
 S LVAR=$$RED^%ANA(TET,"LVAR") F J=1:1 S K=$P(LVAR,",",J) Q:K=""  D TK
 Q
TK 
 S NOEUD=$$NEW^%ANA
 D SET^%ANA(NOEUD,"INDIVIDU",K)
 D SET^%ANA(NOEUD,"CHEMIN",$$RED^%ANA(TET,"CHEMIN"))
 D SET^%ANA(NOEUD,"REPERTOIRE",$$RED^%ANA(TET,"BASE"))
 D SET^%ANA(NOEUD,"CIBLE",$$RED^%ANA(TET,"CIBLE"))
 D SET^%ANA(NOEUD,"VARPERE",$$RED^%ANA(TET,"PERE"))
 D SET^%ANA(NOEUD,"FILS",0)
 S TABIND(K)=NOEUD
 Q

