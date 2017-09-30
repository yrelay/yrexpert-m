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

;%TLKEGL3^INT^1^59547,74029^0
TLKEGL3 ;
 
 
 
 
IMPR(GK,GU) 
 
 
 N TR,I,NO,GKA,GKT,GIMP,DATA,TRIE,A,M,T,L,I2,I3,I4,I5,R,GKAA,GKAF,GKTA,GKTF,TRIE1,TRIE2,ABORT,MSG
 S ABORT=0
 S MSG=$$^%QZCHW("Voulez-vous abandonner la consultation ?")
 W *-1
 D ^%VZEATT
 S GKA=$$CONCAS^%QZCHAD(GK,"ATTRIBUT"),GKT=$$CONCAS^%QZCHAD(GK,"TRAITEMENT")
 S GKAA=$$CONCAS^%QZCHAD(GKA,"ATTR"),GKAF=$$CONCAS^%QZCHAD(GKA,"FONC")
 S GKTA=$$CONCAS^%QZCHAD(GKT,"ATTR"),GKTF=$$CONCAS^%QZCHAD(GKT,"FONC")
 S GIMP=$$CONCAS^%QZCHAD(GK,"IMPRESSION"),DATA=$$CONCAS^%QZCHAD(GK,"FORMAT")
 S TRIE=$$CONCAS^%QZCHAD(GK,"ORDRE")
 S TRIE1=$$CONCAS^%QZCHAD(TRIE,"1"),TRIE2=$$CONCAS^%QZCHAD(TRIE,"2")
 K @(GIMP),@(DATA),@(TRIE)
 D INITD(DATA)
 I GU="" S TR="" F I=1:1 S TR=$O(@GKTA@(TR)) Q:(TR="")!ABORT  D IMPRT(GKAA,GKAF,GKTA,GKTF,TR,GIMP,DATA)
 I GU="" S TR="" F I=1:1 S TR=$O(@GKTF@(TR)) Q:(TR="")!ABORT  D IMPRT(GKAA,GKAF,GKTA,GKTF,TR,GIMP,DATA)
 I GU'="" S TR="" F I=1:1 S TR=$O(@GU@(TR)) Q:(TR="")!ABORT  D IMPRT(GKAA,GKAF,GKTA,GKTF,TR,GIMP,DATA)
 I ABORT G FIN
 S NO=0
 D CIMP(TRIE1,GIMP,.NO),CIMP(TRIE2,GIMP,.NO)
 D AFF(GIMP)
FIN K @(GIMP),@(DATA),@(TRIE)
 Q
 
CIMP(GL,GI,NO) 
 N A,R,T,L,M,I,I2,I3,I4,I5
 S A=""
 F I=1:1 S A=$O(@GL@(A)) Q:A=""  S R="" F I2=1:1 S R=$O(@GL@(A,R)) Q:R=""  S T="" F I3=1:1 S T=$O(@GL@(A,R,T)) Q:T=""  D BOUC2
 Q
BOUC2 S L="" F I4=1:1 S L=$O(@GL@(A,R,T,L)) Q:L=""  S M="" F I5=1:1 S M=$O(@GL@(A,R,T,L,M)) Q:M=""  S NO=NO+1,@GI@(NO)=@GL@(A,R,T,L,M)
 Q
 
IMPRT(GKA1,GKA2,GKT1,GKT2,TR,GIMP,DATA) 
 
 N AT,MOD,I,U,I2,LI,CH,ER,REP,U2
 S AT=""
 F I=1:1 S AT=$O(@GKT1@(TR,AT)) Q:(AT="")!ABORT  S REP="" F I2=1:1 S REP=$O(@GKT1@(TR,AT,REP)) Q:REP=""  S LI="" F U=1:1 S LI=$O(@GKT1@(TR,AT,REP,LI)) Q:LI=""  S MOD="" F U2=1:1 S MOD=$O(@GKT1@(TR,AT,REP,LI,MOD)) Q:MOD=""  D IMP2(TRIE1)
 S AT=""
 F I=1:1 S AT=$O(@GKT2@(TR,AT)) Q:(AT="")!ABORT  S REP="" F I2=1:1 S REP=$O(@GKT2@(TR,AT,REP)) Q:REP=""  S LI="" F U=1:1 S LI=$O(@GKT2@(TR,AT,REP,LI)) Q:LI=""  S MOD="" F U2=1:1 S MOD=$O(@GKT2@(TR,AT,REP,LI,MOD)) Q:MOD=""  D IMP2(TRIE2)
 Q
 
IMP2(GL) 
 
 
 N REA
 I $$ABEND(MSG,.REA) S ABORT=1 Q
 I REA=1 D ^%VZEATT
 S @DATA@("D",1,"D")=AT
 S @DATA@("D",3,"D")=TR,@DATA@("D",4,"D")=LI
 S:REP'=0 @DATA@("D",2,"D")=REP S:REP=0 @DATA@("D",2,"D")=" "
 S:MOD'=0 @DATA@("D",5,"D")=MOD S:MOD=0 @DATA@("D",5,"D")=" "
 S CH=$$^%QZCHFO(DATA,.ER) I ER Q
 S @GL@(AT,REP,TR,LI,MOD)=CH
 Q
TITRE N A,M,T,L,MSG,R,RM
 S A="Attribut",M="Mode",T="Traitement",L="Ligne",R="Repertoire"
 S MSG="   "_A_$$CAD(A,20)_R_$$CAD(R,20)_T_$$CAD(T,18)_L_$$CAD(L,6)_M_$$CAD(M,12)
 
 
 D ^%VZCDB(MSG,0)
 Q
CAD(V,N) Q $J("",N-$L(V))
 
INITD(GL) 
 S @GL@("S")=" "
 S @GL@("L")=77
 S @GL@("D",1,"T")=20,@GL@("D",2,"T")=20
 S @GL@("D",3,"T")=20,@GL@("D",4,"T")=4
 S @GL@("D",5,"T")=13
 
 
 
 
 Q
INITI(GL) 
 S @GL@("L")=132,@GL@("S")=" "
 S @GL@("D",1,"T")=37,@GL@("D",2,"T")=36
 S @GL@("D",3,"T")=37,@GL@("D",4,"T")=7
 S @GL@("D",5,"T")=15
 Q
AFF(IMP) 
 N DEB
 D CLEPAG^%VVIDEO
 
 D TITRE
 D CARSP^%VVIDEO(0,1,22,80)
 
 S DEB=1
 D REAFF^%QULIMO3(1,DEB,IMP,0,1,80,22)
 D VISU^%QULIMO(0,1,80,22,IMP,.DEB)
 
 
 Q
ADD S OK=0 Q
SUP S OK=0 Q
 
ABEND(MES,R) 
 
 
 N X,REP
 R *X:0 D TOUCHE^%INCCLAV(X,.X)
 I X'=1 S R=0 Q 0
 D POCLEPA^%VVIDEO
 S REP=$$MES^%VZEOUI(MES,"O")
 S R=1
 I (REP=0)!(REP=1) Q REP
 Q 0

