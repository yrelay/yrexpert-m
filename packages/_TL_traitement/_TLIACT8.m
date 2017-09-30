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

;%TLIACT8^INT^1^59547,74029^0
%TLIACT8 ;
 
 
 
 
 
DATET 
 N NOAT1,NOAT2,OK,ATT1,ATT2,IND1,IND2,VAR1,VAR2,REP1,REP2,ENT1,ENT2,VALDAT,NOE1,NOE2,VALE,L,POSS
 S NOAT2=$$RED(ACTI,4),NOAT1=$$RED(ACTI,1)
 I '($$ATTR^%TLIACT4(NOAT1,.ATT1,.IND1,.VAR1,.REP1)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  1er parametre non evaluable")) S ECHEC=1 Q
 I NOAT2=0 S ATT2=ATT1,IND2=IND1,VAR2=VAR1,REP2=REP1 G SUIT
 I '($$ATTR^%TLIACT4(NOAT2,.ATT2,.IND2,.VAR2,.REP2)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  individu a modifier non evaluable")) S ECHEC=1 Q
SUIT S POSS=1,VALDAT=$$SUBST^%ANARBR2(NOAT1,.CXT,"ATT^%TLIACT3",.POSS)
 I (VALDAT="")!(POSS=0) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  1er parametre non evaluable")) S ECHEC=1 Q
 S ENT1=$$SUBST^%ANARBR2($$RED(ACTI,2),.CXT,"ATT^%TLIACT3",.POSS)
 I (POSS=0)!(ENT1="") D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer 1er format")) S ECHEC=1 Q
 S ENT2=$$SUBST^%ANARBR2($$RED(ACTI,3),.CXT,"ATT^%TLIACT3",.POSS)
 I (POSS=0)!(ENT2="") D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer 2eme format")) S ECHEC=1 Q
 I '($D(^RQSGLU("QMDA"))) D ^%QMDAINI
 I '($D(^RQSGLU("QMDA","FORM",ENT1))) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  1er format inexistant")) S ECHEC=1 Q
 I '($D(^RQSGLU("QMDA","FORM",ENT2))) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  2eme format inexistant")) S ECHEC=1 Q
 S VALE=$$^%QMDAINT(VALDAT,ENT1)
 I VALE="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  1er parametre ne correspond pas au format specifie")) S ECHEC=1 Q
 S VALE=$$^%QMDAFFI(VALE,ENT2)
 D AFFAT^%TLIACTS(REP2,VAR2,ATT2,VALE,IND2)
 Q
 
ITERVAL 
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMPO)
 S @TEMPO@(1)="IN",@TEMPO@(2)="VAR",@TEMPO@(3)="ORD",@TEMPO@(4)="RPER"
 S @TEMPO@(5)="VPER",@TEMPO@(6)="L",@TEMPO@(7)="ETIQ",@TEMPO@(8)="%I"
 S @TEMPO@(9)="LLIST",@TEMPO@(10)="TTYP",@TEMPO@(11)="NOE",@TEMPO@(12)="OBJ"
 S @TEMPO@(13)="BA",@TEMPO@(14)="PARTIE",@TEMPO@(15)="LI"
 S @TEMPO@(16)="STOP",@TEMPO@(17)="ETIQ",@TEMPO@(18)="GLOSTO"
 S @TEMPO@(19)="RETOURGO",@TEMPO@(20)="RETOUROK",@TEMPO@(21)="ATTR"
 S @TEMPO@(22)="NOEUACT",@TEMPO@(23)="TETE",@TEMPO@(24)="ARRET"
 S @TEMPO@(25)="TRBOUC"
 D EMPV^%ANGEPIL(TEMPO) K @(TEMPO)
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Iteration sur attribut multivalue"))
 S VAR=$$RED($$RED(ACTI,1),"TEXTE")
 S ORD=$$RED($$RED(ACTI,2),"TEXTE")
 K CXT(VAR),CXT(ORD)
 S NOE=$$RED(ACTI,3)
 S ETIQ=$$RED($$RED(ACTI,4),"TEXTE")
 G SUITIT
 S VPER=$$RED(NOE,3) I VPER=0 S BA=CXT("@","BASE"),OBJ=CXT("@","OBJET") G SUITIT
 S OBJ=$$RED(VPER,"TEXTE")
 G:$E(OBJ)'="%" SUITI
 S VPER=OBJ,BA=$$^%QCAZG("CXT(OBJ,""BASE"")"),OBJ=$$^%QCAZG("CXT(OBJ,""OBJET"")")
 I (BA="")!(OBJ="") D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible determiner individu ")_VPER) G MAJIV
 G SUITIT
SUITI S BA=$$NOMINT^%QSF(OBJ),OBJ=$$OBJPROX^%QSCALVU(OBJ,CXT("@","BASE"),CXT("@","OBJET"))
I I (BA="")!(OBJ="") D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible determiner individu ")) G MAJIV
SUITIT I '($$ATTR^%TLIACT4(NOE,.ATTR,.II,.OBJ,.BA)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible determiner individu ")) G MAJIV
 S LLIST=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LISTVAL") K @(LLIST)
 D MVG^%QSCALVA(BA,OBJ,ATTR,LLIST,.TTYP)
 I @LLIST=0 D:MODAF ADD^%TLIFEN("LOG","  "_ATTR_"--->"_$$^%QZCHW(" Attribut inexistant")) G MAJIV
 S TEMPO=$$CONCAS^%QZCHAD("^TEMPO",$J_","_$P($ZPOS,"^",2))
 S:'($D(@TEMPO)) @TEMPO=0
 S (@TEMPO,%LL)=@TEMPO+1,IN=""
BOUCV S IN=$O(@LLIST@(IN))
 G:IN="" BOUCF
 S @TEMPO@(%LL,IN)=@LLIST@(IN)
 G BOUCV
BOUCF K @(LLIST)
 S IN="",ARRET=0,PARTIE="",TRBOUC=1
 S RETOURGO="RETIT^%TLIACT8"
BOUCIND S IN=$O(@TEMPO@(%LL,IN))
 G:IN="" FINIT
 S CXT("%",VAR)=@TEMPO@(%LL,IN),CXT("%",ORD)=IN
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),VAR,CXT("%",VAR),1),PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),ORD,IN,1)
 G GO^%TLIACT1
RETIT S TEMPO=$$CONCAS^%QZCHAD("^TEMPO",$J_","_$P($ZPOS,"^",2)),%LL=@TEMPO
 G:((ARRET=1)!(ABANDON=1))!(HALT=1) FINIT
 G BOUCIND
FINIT D:((MODAF'=0)&(ABANDON'=1))&(HALT=0) ADD^%TLIFEN("LOG",$$^%QZCHW("  Fin de l'iteration"))
 I %LL=1 K @(TEMPO) G MAJIV
 K @TEMPO@(%LL) S @TEMPO=%LL-1
MAJIV D DEPV^%ANGEPIL
 G REBOUCA^%TLIACT1
 
RED(N,A) 
 Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

