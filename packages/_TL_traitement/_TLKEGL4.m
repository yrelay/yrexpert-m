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

;%TLKEGL4^INT^1^59547,74029^0
TLKEGL4 ;
 
 
 
 
IMPRA(GK,GU,IMPR,DEV) 
 
 
 
 
 
 
 N AT,NF,I,NO,GKA,GIMP,DATA,TRIE,GKAA,GKAF,TRIE1,TRIE2,ABORT,MSG
 S ABORT=0
 S:IMPR=1 MSG=$$^%QZCHW("Voulez-vous abandonner l'impression ?")
 S:IMPR=0 MSG=$$^%QZCHW("Voulez-vous abandonner la consultation ?")
 W *-1
 D ^%VZEATT
 S GKA=$$CONCAS^%QZCHAD(GK,"ATTRIBUT")
 S GKAA=$$CONCAS^%QZCHAD(GKA,"ATTR"),GKAF=$$CONCAS^%QZCHAD(GKA,"FONC")
 S GIMP=$$CONCAS^%QZCHAD(GK,"IMPRESSION"),DATA=$$CONCAS^%QZCHAD(GK,"FORMAT")
 S TRIE=$$CONCAS^%QZCHAD(GK,"ORDRE")
 S TRIE1=$$CONCAS^%QZCHAD(TRIE,"1"),TRIE2=$$CONCAS^%QZCHAD(TRIE,"2")
 K @(GIMP),@(DATA),@(TRIE)
 D:IMPR=0 INITD^%TLKEGL3(DATA)
 D:IMPR=1 INITI^%TLKEGL3(DATA)
 I GU="" S AT="" F I=1:1 S AT=$O(@GKAA@(AT)) Q:(AT="")!ABORT  D VATT(GKAA,AT,GIMP,DATA,TRIE1)
 I GU="" S NF="" F I=1:1 S NF=$O(@GKAF@(NF)) Q:(NF="")!ABORT  D VATT(GKAF,NF,GIMP,DATA,TRIE2)
 I GU'="" S AT="" F I=1:1 S AT=$O(@GU@(AT)) Q:(AT="")!ABORT  D VISUA(GKAA,GKAF,AT,GIMP,DATA,TRIE1,TRIE2)
 I ABORT G FIN
 S NO=0
 D CIMP(TRIE1,GIMP,.NO),CIMP(TRIE2,GIMP,.NO)
 D:IMPR=0 AFF^%TLKEGL3(GIMP)
 D:IMPR=1 IMPRES(GIMP,DEV)
FIN K @(GIMP),@(DATA),@(TRIE)
 Q
 
CIMP(GL,GI,NO) 
 N A,R,T,L,M,I,I2,I3,I4,I5
 S A=""
 F I=1:1 S A=$O(@GL@(A)) Q:A=""  S R="" F I2=1:1 S R=$O(@GL@(A,R)) Q:R=""  S T="" F I3=1:1 S T=$O(@GL@(A,R,T)) Q:T=""  D BOUC2
 Q
BOUC2 S L="" F I4=1:1 S L=$O(@GL@(A,R,T,L)) Q:L=""  S M="" F I5=1:1 S M=$O(@GL@(A,R,T,L,M)) Q:M=""  S NO=NO+1,@GI@(NO)=@GL@(A,R,T,L,M)
 Q
 
VISUA(GKA,GKF,AT,GIMP,DATA,GTRI1,GTRI2) 
 I $E(AT,1)="$" D VATT(GKF,AT,GIMP,DATA,GTRI2) Q
 D VATT(GKA,AT,GIMP,DATA,GTRI1)
 Q
 
VATT(GL,AT,GIMP,DATA,GTRI) 
 
 N MOD,LI,REP,TR,I,I2,U,U2,CH,ER
 S REP=""
 F I=1:1 S REP=$O(@GL@(AT,REP)) Q:(REP="")!ABORT  S TR="" F I2=1:1 S TR=$O(@GL@(AT,REP,TR)) Q:TR=""  S LI="" F U=1:1 S LI=$O(@GL@(AT,REP,TR,LI)) Q:LI=""  S MOD="" F U2=1:1 S MOD=$O(@GL@(AT,REP,TR,LI,MOD)) Q:MOD=""  D VIMP(GTRI)
 Q
 
VIMP(GLO) 
 
 
 
 N REA
 I $$ABEND^%TLKEGL3(MSG,.REA) S ABORT=1 Q
 I REA=1 D POCLEPA^%VVIDEO W $$^%QZCHW("Un instant...")
 S @DATA@("D",1,"D")=AT
 S @DATA@("D",3,"D")=TR,@DATA@("D",4,"D")=LI
 S:REP'=0 @DATA@("D",2,"D")=REP S:REP=0 @DATA@("D",2,"D")=" "
 S:MOD'=0 @DATA@("D",5,"D")=MOD S:MOD=0 @DATA@("D",5,"D")=" "
 S CH=$$^%QZCHFO(DATA,.ER) I ER Q
 S @GLO@(AT,REP,TR,LI,MOD)=CH
 Q
 
IMPRES(GL,DV) 
 N I,L,TEMP,TIT
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S TIT=$$CONCAS^%QZCHAD(TEMP,"TITRE")
 D MSG^%VZEATT($$^%QZCHW("Impression en cours..."))
 S @TIT@(1)=$J(" ",39)_"CAS D'EMPLOIS DES ATTRIBUTS ET DES FONCTIONS"
 S @TIT@(2)=$$TITRE
 D IMPT^%VPRINT(GIMP,TIT)
 D ^%VZEAVT($$^%QZCHW("Impression terminee"))
 K @(TEMP)
 Q
TITRE() 
 N A,M,T,L,MSG,R
 S A="Attribut",M="Mode",T="Traitement",L="Ligne",R="Repertoire"
 S MSG="  "_A_$$CAD(A,37)_R_$$CAD(R,36)_T_$$CAD(T,33)_L_$$CAD(L,11)_M_$$CAD(M,13)
 Q MSG
CAD(V,N) Q $J("",N-$L(V))

