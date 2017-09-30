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

;%QS3BATC^INT^1^59547,73880^0
%QS3BATC ;
 
 
 
 
ADD(R) 
 S ^[QUI]RQSBATCH(R)="" Q
GOD 
LGO0 N BID,I,%I,N
 S N=0,I=-1 F %I=0:0 S I=$N(^[QUI]RQSBATCH(I)) Q:(I=-1)!(I="z")  S N=N+1
 I N=0 D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Aucune requete en attente ...")
 H 3 D POCLEPA^%VVIDEO Q
 D POCLEPA^%VVIDEO I $$MES^%VZEOUI($$^%QZCHW("Voulez-vous activer les requetes (")_N_$$^%QZCHW(") en attente ? : "),"O")'=1 Q
X79 D POCLEPA^%VVIDEO W $$^%QZCHW("OK c'est parti ...") G GO
GO 
 N RRRR,ENTREEW
 S RRRR=-1
B1 S RRRR=$N(^[QUI]RQSBATCH(RRRR)) G:(RRRR=-1)!(RRRR="z") F1 D:RRRR'="z" TR G B1
F1 Q
TR K VAR,CONT S NOLV=1,NOLC=1,REQ=RRRR
 S BASE=^[QUI]RQS1(RRRR,"BASE")
 S COMM=$S($D(^[QUI]RQS1(REQ,"COMM")):^[QUI]RQS1(REQ,"COMM"),1:"")
 F I=1:1 Q:'($D(^[QUI]RQS1(RRRR,"VARIABLES",I)))  S VAR(I)=^[QUI]RQS1(RRRR,"VARIABLES",I),VAR(I,"TETE")=^[QUI]RQS1(RRRR,"VARIABLES",I,"TETE")
 F I=1:1 Q:'($D(^[QUI]RQS1(RRRR,"CONTRAINTES",I)))  S CONT(I)=^[QUI]RQS1(RRRR,"CONTRAINTES",I),CONT(I,"TETE")=^[QUI]RQS1(RRRR,"CONTRAINTES",I,"TETE")
 D REAFF^%QSQUEST
 S Y1=^[QUI]RQS1(REQ,"BASE"),ENTREEW=$$NOMINT^%QSF(Y1) S:ENTREEW="" ENTREEW=Y1 S ENTREEW=$$LISTIND^%QSGEST6(ENTREEW)
 D GO^%QSGOREQ Q:RQSRESUL=""  D SUP(RRRR)
 D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Le resultat est dans ") D BLD^%VVIDEO W RQSRESUL," (",^[QUI]RQS2(RQSRESUL,"CARD"),") " D NORM^%VVIDEO H 1
 Q
SUP(R) K ^[QUI]RQSBATCH(R) Q
ALL 
 D POCLEPA^%VVIDEO W $$^%QZCHW("Cette operation risque de durer tres, tres longtemps") H 3
LA0 D POCLEPA^%VVIDEO I $$MES^%VZEOUI($$^%QZCHW("Voulez-vous reellement recalculer toutes les requetes ? :"),"N")'=1 Q
79 D POCLEPA^%VVIDEO W $$^%QZCHW("OK c'est parti ...") H 1 D ^%QCAGLK("^[QUI]RQSBATCH")
 S R="" F %R=0:0 S R=$N(^[QUI]RQS1(R)) Q:R=-1  S:(R'="z")&$D(^[QUI]RQS1(R,"BASE")) ^[QUI]RQSBATCH(R)=""
 G GO

