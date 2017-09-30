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

;%QSCANEV^INT^1^59547,73880^0
RQSCANEV ;
 
 
 
 
REQ2(A) 
 N R,T S R="" Q $$R2C(A)
R2C(A) S T=$$RED^%ANA(A,"TYPE")
 G:T="COMPARATEUR.BINAIRE" CB
 G:T="COMPARATEUR.TERNAIRE" COMP3
 G:T="OPERATEUR" OPB
 G:T="ATTRIBUT" AT
 G:T="NOM" ID
 G:T="CHAINE" CH
 G:T="NOMBRE" NB
 D POCLEPA^%VVIDEO,^%VZEAVT($$^%QZCHW("RQSCANEV ... Type de noeud inattendu : ")_T) Q
COMP3 Q $$REQ3(A)
CB Q "("_$$R2C($$RED^%ANA(A,1))_$$RED^%ANA(A,"TEXTE")_$$R2C($$RED^%ANA(A,2))_")"
AT Q $$R2C($$RED^%ANA(A,1))
OPB Q "("_$$R2C($$RED^%ANA(A,1))_$$RED^%ANA(A,"TEXTE")_$$R2C($$RED^%ANA(A,2))_")"
CH Q """"_$$RED^%ANA(A,"TEXTE")_""""
NB Q $$RED^%ANA(A,"TEXTE")
 
REQ3(A) 
 N D,ED1,ED2,EG,G,O,R,T S R="",O=$$RED^%ANA(A,"TEXTE"),G=$E(O,1,1),D=$E(O,2,2),G=$S(G="[":"'<",G="]":">"),D=$S(D="[":"<",D="]":"'>")
 S EG=$$R2C($$RED^%ANA(A,1)),ED1=$$R2C($$RED^%ANA($$RED^%ANA(A,2),1)),ED2=$$R2C($$RED^%ANA($$RED^%ANA(A,2),2)) Q "("_EG_G_ED1_")&("_EG_D_ED2_")"
 
 
 
 
 
 
 
 
 
 
GO(A,OB,B,LA) 
SGO N A1,%A1,OK S OK=1,A1=-1 F %A1=0:0 S A1=$N(LA(A1)) Q:A1=-1  S LA(A1)=$$^%QSCALVA(B,OB,A1),OK=LA(A1)'="" Q:'(OK)
 Q:'(OK) "0"
GOSU Q $$REQ2(A)
SGOS N A1,%A1,OK S OK=1,A1=-1 F %A1=0:0 S A1=$N(LA(A1)) Q:A1=-1  S OK=LA(A1)'="" Q:'(OK)
 Q:'(OK) "0" G GOSU
 
 
 
GO2(A,OB,B) N I,J,LA S LA=$$RED^%ANA(A,"LATT") D POCLEPA^%VVIDEO W LA
 F I=1:1 S J=$P(LA,",",I) Q:J=""  S LA(J)=""
 G SGO
 
 
 
GO3(A,OB,B,VI) N I,J,LA,OK,V S LA=$$RED^%ANA(A,"LATT")
 S OK=1 F I=1:1 S J=$P(LA,",",I) Q:J=""  S (LA(J),V)=$$^%QSCALVA(B,OB,J) D:VI AFEN^%TLACTIV(J_$S(V'="":" = "_V,1:$$^%QZCHW(" inconnu"))) S OK=V'="" Q:'(OK)
 Q:'(OK) "0" G GOSU
 
 
 
 
 
GO4(A,OB,B,VI) N A1,%A1,I,J,LA,OK S LA=$$RED^%ANA(A,"LATT")
 S OK=1 F I=1:1 S J=$P(LA,",",I) Q:J=""  S (LA(J),V)=$$^%QSCALVA(B,OB,J) D:VI AFEN^%TLACTIV(J_$S(V'="":" = "_V,1:$$^%QZCHW(" inconnu"))) S OK=V'="" Q:'(OK)
 Q:'(OK) "" Q $$R2C(A)
 
 
 
GO5(A,OB,B,VI) N I,J,LA,OK,V S LA=$$RED^%ANA(A,"LATT")
 S OK=1 F I=1:1 S J=$P(LA,",",I) Q:J=""  S (LA(J),V)=$$^%QSCALVA(B,OB,J) D:VI AFEN^%TLCREAT(J_$S(V'="":" = "_V,1:$$^%QZCHW(" inconnu"))) S OK=V'="" Q:'(OK)
 Q:'(OK) "0" G GOSU

