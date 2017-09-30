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

;%HXECLAT^INT^1^59547,73869^0
HXECLAT(T,BASE,I,NOM,VALTOT) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N ATTR,C,CODE,J1,J2,L,LB,LI,NA,NI,SYN,TOT,VALT,REPONSE
 S REP=$$NOMINT^%QSF(BASE),CODE=$$COD^%QAX
 S SYN=$$S^%QAX(I)
 D CLEPAG^%VVIDEO,^%VZCD0($$^%QZCHW("Eclatement de ")_I)
NOMBRE 
 D QUES(8,.NI,$$^%QZCHW("Nombre d'individus generes par l'eclatement")_" ? ") Q:NI=""
 I '($$ADR^%QZNBN1(NI)) D ^%VZEAVT($$^%QZCHW("Entrez un entier !")) G NOMBRE
 I NI=0 D ^%VZEAVT($$^%QZCHW("Le nombre d'individus doit etre superieur a 0")) G NOMBRE
LISTE 
 D QUES(10,.LI,$$^%QZCHW("Liste des attributs d'eclatement")_" ? ") Q:LI=""
 I LI="?" D ^%VZEAVT($$^%QZCHW("Liste d'attributs separes par des virgules !")) G LISTE
 S NA=0
TESTL 
 S J1=1
LEX1 G:LI["," MESSL
 D ADR^%LXABR(LI,.C,.ATTR) S:C=1 LI=ATTR
 I C=0 D ^%VZEAVT(LI_" est inconnu au lexique") G LISTE
 I C>1 D ^%VZEAVT(LI_" est ambigu au lexique") G LISTE
 S J1=('($D(^[QUI]RQSLIEN(REP,LI))))&$$AIR^%QSGEST5(REP,I,LI)
 I J1 S NA=NA+1,L(NA)=LI G GEN
MESSL I J1=0 D ^%VZEAVT($$^%QZCHW("Mauvaise liste ! ")) G LISTE
 S NA=NA+1,L(NA)=$P(LI,",",1),LI=$P(LI,",",2,100)
LEX2 D ADR^%LXABR(L(NA),.C,.ATTR) S:C=1 L(NA)=ATTR
 I C=0 D ^%VZEAVT(L(NA)_" est inconnu au lexique") G LISTE
 I C>1 D ^%VZEAVT(L(NA)_" est ambigu au lexique") G LISTE
 S J1=('($D(^[QUI]RQSLIEN(REP,L(NA)))))&$$AIR^%QSGEST5(REP,I,L(NA))
 I J1=0 G MESSL
 G TESTL
 
GEN 
 S (J1,J2)=1
 I T="UNITE.DE.COMPTE" S TOT=0 G BGEN
 S DX=1,DY=12 D CLEBAS^%VVIDEO
 S TOT=$$MES^%VZEOUI($$^%QZCHW("Voulez-vous modifier la valeur de ")_T_" ("_VALTOT_") ? ","O") Q:TOT=-1
 
BGEN S @NOM@(J1)=I_"."_J2
 I '($$IR^%QSGEST5(REP,@NOM@(J1))) S J2=J2+1,J1=J1+1 G:J1=(NI+1) INDIV0 G BGEN
 S J2=J2+1
 G BGEN
 
INDIV0 S J1=1
 D PARTA
INDIV 
 D POCLEPA^%VVIDEO,RECOP^%QSGEST2(REP,I,@NOM@(J1),.LB) I CODE'="" D INS^%QAX(CODE,@NOM@(J1),SYN_"."_J1)
 D MAJLIEN^%QSGEST2(REP,I,@NOM@(J1),.LB)
 S MODEL=$$MODEL^%QSMODEL I $D(^RQSMOD5(MODEL,REP)) D @("^"_$P(^RQSMOD5(MODEL,REP),"^",1)_"("""_REP_""","""_@NOM@(J1)_""")")
 
 S DX=10,DY=16 D CLEBAS^%VVIDEO W $$^%QZCHW("Individu ")_J1_" ("_@NOM@(J1)_") "
 S J2=1
 G:TOT=0 ATTRI
TOT 
 D QUES(18,.VALT,$$^%QZCHW("Valeur de")_" "_T_" ? ") G:(VALT="")!('($$ADR^%QZNBN1(VALT))) TOT
 D SAH^%QSGESTI(REP,@NOM@(J1),T)
 D PA^%QSGESTI(REP,@NOM@(J1),T,VALT,1)
ATTRI 
 G:L(J2)=T SUITE
 D QUES(20,.REPONSE,$$^%QZCHW("Valeur de")_" "_L(J2)_" ? ") G:REPONSE="" ATTRI
 I '($$FINT^%QMDAUC(REP,L(J2),.REPONSE)) D ^%VZEAVT($$^%QZCHW("Saisie incorrecte")) G ATTRI
 D SAH^%QSGESTI(REP,@NOM@(J1),L(J2))
 D PA^%QSGESTI(REP,@NOM@(J1),L(J2),REPONSE,1)
SUITE S J2=J2+1
 I J2=(NA+1) S J2=1,J1=J1+1 G:J1=(NI+1) FIN G INDIV
 G ATTRI
FIN 
 D SX^%QSGESTK(REP,I)
 Q
 
PARTA 
 N %S,SUF
 S SUF="" F %S=0:0 S SUF=$O(^RQSAUTOR(WHOIS,SUF)) Q:SUF=""  S:SUF'="z" LB($$NOMINT^%QSF(SUF))=""
 Q
 
QUES(DY,VALEUR,MES) 
 N CT
 S DX=1 D CLEBAS^%VVIDEO
 D LIRE2^%VREAD(MES,"",1,RM-4,DY+1,DY-1,"","",.CT,.VALEUR)
 Q
 
TEST N NOM,R,I
A W !,"Repertoire : " R R Q:R=""
B W !,"Individu : " R I G:I="" A G:'($$IR^%QSGEST5(R,I)) B
C W !,"Attribut de totalisation : " R A G:A="" B G:'($$AIR^%QSGEST5(R,I,A)) C
 D HXECLAT(A,R,I,"NOM") B  Q

