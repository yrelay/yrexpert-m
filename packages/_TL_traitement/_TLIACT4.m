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

;%TLIACT4^INT^1^59547,74029^0
%TLIACT4 ;
 
 
 
 
 
ITER 
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMPO)
 S @TEMPO@(1)="IN",@TEMPO@(2)="VAR",@TEMPO@(3)="ORD",@TEMPO@(4)="RPER"
 S @TEMPO@(5)="VPER",@TEMPO@(6)="L",@TEMPO@(7)="ETIQ",@TEMPO@(8)="%I"
 S @TEMPO@(9)="LLIST",@TEMPO@(10)="TTYP",@TEMPO@(11)="NOE",@TEMPO@(12)="OBJ"
 S @TEMPO@(13)="BA",@TEMPO@(14)="PARTIE",@TEMPO@(15)="LI"
 S @TEMPO@(16)="STOP",@TEMPO@(17)="ETIQ",@TEMPO@(18)="GLOSTO"
 S @TEMPO@(19)="RETOURGO",@TEMPO@(20)="RETOUROK",@TEMPO@(21)="TETE"
 S @TEMPO@(22)="NOEUACT",@TEMPO@(22)="TRBOUC"
 D EMPV^%ANGEPIL(TEMPO) K @(TEMPO)
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Iteration sur les fils"))
 S VAR=$$RED($$RED(ACTI,1),"TEXTE")
 S ORD=$$RED($$RED(ACTI,2),"TEXTE")
 S NOE=$$RED(ACTI,3)
 S ETIQ=$$RED($$RED(ACTI,4),"TEXTE")
 G:'($$ATTR^%TLIACT4(NOE,.RPER,.VPER,.OBJ,.BA)) REBOUCA^%TLIACT1
 S LLIST=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"FILS") K @(LLIST)
 D MVG^%QSCALVA(BA,OBJ,RPER,LLIST,.TTYP)
 I @LLIST=0 D:MODAF ADD^%TLIFEN("LOG","  "_OBJ_"--->"_$$^%QZCHW("Pas d'individu fils")) G MAJI
 S TEMPO=$$CONCAS^%QZCHAD("^TEMPO",$J_","_$P($ZPOS,"^",2))
 I '($D(@TEMPO)) S @TEMPO=0
 S (%LL,@TEMPO)=@TEMPO+1
 S IN="",TRBOUC=1
RECOPB S IN=$O(@LLIST@(IN)) G:IN="" RECOPF
 S @TEMPO@(%LL,IN)=@LLIST@(IN)
 G RECOPB
RECOPF K @(LLIST)
 S IN="",NOE=$S(TTYP=2:OBJ_",",1:""),ARRET=0
 S BA=$$REPD^%QSGEL2(BA,RPER)
 S IN=-1,PARTIE="" K CXT(VAR)
 S RETOURGO="AJINDRET^%TLIACT4"
AJIND S IN=$N(@TEMPO@(%LL,IN))
 G:IN=-1 AJINDF
 S CXT(VAR,"OBJET")=NOE_@TEMPO@(%LL,IN),CXT(VAR,"BASE")=BA
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),VAR,CXT(VAR,"OBJET"),1),PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),ORD,IN,1)
 D:MODAF CLEAR^%QUPILF("ATT"),ADD^%TLIFEN("ATT",CXT(VAR,"OBJET"))
 G GO^%TLIACT1
AJINDRET S TEMPO=$$CONCAS^%QZCHAD("^TEMPO",$J_","_$P($ZPOS,"^",2)),%LL=@TEMPO
 G:((ARRET=1)!(ABANDON=1))!(HALT=1) AJINDF
 G AJIND
AJINDF I %LL=1 K @(TEMPO) G AJINDF2
 K @TEMPO@(%LL) S @TEMPO=%LL-1
AJINDF2 S ARRET=0
 D:(MODAF'=0)&(ABANDON'=1) ADD^%TLIFEN("LOG",$$^%QZCHW("  Fin iteration"))
MAJI D DEPV^%ANGEPIL
 G REBOUCA^%TLIACT1
 
 
CREERL 
 N VAR1,CAR1,CAR2,CARI2,NOM,ADRESSE,L,POS
 S VAR1=$$RED($$RED(ACTI,1),"TEXTE"),CAR1=$$RED($$RED(ACTI,2),"TEXTE")
 S CAR2=$$SUBST^%ANARBR2($$RED(ACTI,3),.CXT,"ATT^%TLIACT3",.POS)
 I (CAR2="")!(POS=0) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("   Impossible d'evaluer le nom du repertoire")) S ECHEC=1 Q
 S CARI2=$$NOMINT^%QSF(CAR2) I CARI2="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Repertoire inconnu")) S ECHEC=1 Q
 G:$L(CAR1)'>3 SCREERL
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Le prefixe ne doit pas depasser 3 caracteres")) S ECHEC=1 Q
SCREERL S NOM=$$GEN^%QCAPOP(CAR1),ADRESSE="^[QUI]ZLIGTRAI("_""""_NOM_""""_")"
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),VAR1,NOM,1)
 S CXT(VAR1,"OBJET")=NOM,CXT(VAR1,"BASE")="L0"
 I MODEX=1 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Liste ")_NOM_$$^%QZCHW(" creee")) Q
 D CREER^%QSGES11(CARI2,NOM,CAR2,0,"TRAITEMENT",ADRESSE,TRT)
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Liste ")_NOM_$$^%QZCHW(" creee"))
 Q
 
 
ELIML 
 N ADR,L,SOU,POS
 S POS=1
 S L=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POS)
 I (L="")!(POS=0) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("   Impossible d'evaluer le nom de la liste")) S ECHEC=1 Q
 I '($$EX^%QSGEST7(L)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Liste inconnue")) S ECHEC=1 Q
 Q:MODEX=1
 D ELIML^%QS0XG1(L)
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Liste ")_L_$$^%QZCHW(" detruite"))
 Q
 
 
 
 
 
 
 
 
 
 
 
ATTR(NOEUD,ATT,IND,VAR,REP) N TYP
 S ATT=$$RED($$RED(NOEUD,1),"TEXTE")
 S IND=$$RED(NOEUD,2) I (IND=0)!(IND="") S IND=1 G VAR
 S TYP=$$RED(IND,"TYPE"),IND=$$RED(IND,"TEXTE")
 G:(TYP="CHAINE")!(TYP="NOMBRE") VAR
 S IND=$$^%QSCALVA(CXT("%","BASE"),CXT("%","OBJET"),IND)
 I IND="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer indice ")_IND) Q 0
VAR I $E(ATT)="%" S REP=CXT("%","BASE"),VAR=CXT("%","OBJET") Q 1
 S VAR=$$RED(NOEUD,3) I VAR=0 S VAR=CXT("@","OBJET"),REP=CXT("@","BASE") G FIN
 S VAR=$$RED(VAR,"TEXTE")
 G:$E(VAR)="%" FILS
 G:VAR'="LISTE" PROX
 S REP="L0",VAR=$$^%QCAZG("LISTE")
 I VAR="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Aucune liste diponible")) Q 0
 G FIN
PROX N VAR2
 S VAR2=VAR,REP=$$REPD^%QSGEL2(CXT("@","BASE"),VAR),VAR=$$OBJPROX^%QSCALVU(VAR,CXT("@","BASE"),CXT("@","OBJET"))
 I VAR="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible trouver individu du repertoire ")_VAR2) Q 0
 G FIN
FILS I ('($D(CXT(VAR,"BASE"))))!('($D(CXT(VAR,"OBJET")))) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer variable ")_VAR) Q 0
 S REP=CXT(VAR,"BASE"),VAR=CXT(VAR,"OBJET")
FIN Q 1
 
RED(N,A) 
 Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

