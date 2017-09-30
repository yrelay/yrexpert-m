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

;%TLIACTH^INT^1^59547,74029^0
%TLIACTH ;
 
 
ITEATT 
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Auscultation d'un individu"))
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMPO)
 S @TEMPO@(1)="IN",@TEMPO@(2)="VAR",@TEMPO@(3)="ORD",@TEMPO@(4)="RPER"
 S @TEMPO@(5)="VPER",@TEMPO@(6)="L",@TEMPO@(7)="ETIQ",@TEMPO@(8)="%I"
 S @TEMPO@(9)="LLIST",@TEMPO@(10)="TTYP",@TEMPO@(11)="NOE",@TEMPO@(12)="OBJ"
 S @TEMPO@(13)="BA",@TEMPO@(14)="PARTIE",@TEMPO@(15)="LI"
 S @TEMPO@(16)="STOP",@TEMPO@(17)="ETIQ",@TEMPO@(18)="GLOSTO"
 S @TEMPO@(19)="RETOURGO",@TEMPO@(20)="RETOUROK",@TEMPO@(21)="ATTR"
 S @TEMPO@(22)="NOEUACT",@TEMPO@(23)="TETE",@TEMPO@(24)="ANOM"
 S @TEMPO@(25)="%OORD",@TEMPO@(26)="%VALE",@TEMPO@(27)="%ATTR"
 S @TEMPO@(28)="ORD",@TEMPO@(29)="NORD",@TEMPO@(30)="ARRET"
 D EMPV^%ANGEPIL(TEMPO) K @(TEMPO)
 S ANOM=$$RED($$RED(ACTI,1),"TEXTE")
 I $D(CXT(ANOM)) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Variable ")_ANOM_$$^%QZCHW(" deja utilisee")) G MAJIV
 S VAR=$$RED($$RED(ACTI,2),"TEXTE")
 I $D(CXT(VAR)) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Variable ")_VAR_$$^%QZCHW(" deja utilisee")) G MAJIV
 S NORD=$$RED($$RED(ACTI,3),"TEXTE")
 I $D(CXT(NORD)) D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("Variable ")_NORD_$$^%QZCHW(" deja utilisee")) G MAJIV
 S NOE=$$RED(ACTI,4)
 S ETIQ=$$RED($$RED(ACTI,5),"TEXTE")
 I NOE=0 S BA=CXT("@","BASE"),OBJ=CXT("@","OBJET") G SUITIT2
 S VPER=$$RED(NOE,3) I VPER=0 S BA=CXT("@","BASE"),OBJ=CXT("@","OBJET") G SUITIT
 S OBJ=$$RED(VPER,"TEXTE")
 G:$E(OBJ)'="%" SUITI
 S VPER=OBJ,BA=$$^%QCAZG("CXT(OBJ,""BASE"")"),OBJ=$$^%QCAZG("CXT(OBJ,""OBJET"")")
 I (BA="")!(OBJ="") D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible determiner individu ")_VPER) G MAJIV
 G SUITIT
SUITI S OBJ=$$OBPROX2^%QSCALVU(OBJ,CXT("@","BASE"),CXT("@","OBJET"),.BA)
 I (BA="")!(OBJ="") D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible determiner individu ")) G MAJIV
SUITIT S OBJ=$$OBPROX2^%QSCALVU($$RED($$RED(NOE,1),"TEXTE"),BA,OBJ,.BA)
 I (OBJ="")!(BA="") D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible determiner individu ")) G MAJIV
SUITIT2 S TEMPO=$$CONCAS^%QZCHAD("^TEMPO",$J_","_$P($ZPOS,"^",2))
 S:'($D(@TEMPO)) @TEMPO=0
 S (@TEMPO,%LL)=@TEMPO+1,IN=""
 S ATTR=""
BATTR S ATTR=$$NXTRIA^%QSTRUC8(BA,OBJ,ATTR)
 G:ATTR="" BF
 S VAL=""
BVAL S VAL=$$NXTRIAV^%QSTRUC8(BA,OBJ,ATTR,VAL)
 G:VAL="" BATTR
 S ORD=""
BORD S ORD=$$NXTRIAVO^%QSTRUC8(BA,OBJ,ATTR,VAL,ORD)
 G:ORD="" BVAL
 S @TEMPO@(%LL,ATTR,ORD,VAL)=""
 G BORD
BF S %ATTR="",ARRET=0,PARTIE=""
 S RETOURGO="RETIT^%TLIACTH"
RATT S %ATTR=$O(@TEMPO@(%LL,%ATTR))
 G:%ATTR="" FINIT
 S %OORD=""
RORD S %OORD=$O(@TEMPO@(%LL,%ATTR,%OORD))
 G:%OORD="" RATT
 S %VALE=""
RVAL S %VALE=$O(@TEMPO@(%LL,%ATTR,%OORD,%VALE))
 G:%VALE="" RORD
 S CXT("%",ANOM)=%ATTR,CXT("%",VAR)=%VALE,CXT("%",NORD)=%OORD
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),VAR,%VALE,1),PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),NORD,%OORD,1),PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),ANOM,%ATTR,1)
 G GO^%TLIACT1
RETIT S TEMPO=$$CONCAS^%QZCHAD("^TEMPO",$J_","_$P($ZPOS,"^",2)),%LL=@TEMPO
 G:((ARRET=1)!(ABANDON=1))!(HALT=1) FINIT
 G RVAL
FINIT D:((MODAF'=0)&(ABANDON'=1))&(HALT=0) ADD^%TLIFEN("LOG",$$^%QZCHW("  Fin iteration"))
 I %LL=1 K @(TEMPO) G MAJIV
 K @TEMPO@(%LL) S @TEMPO=%LL-1
MAJIV D DEPV^%ANGEPIL
 G REBOUCA^%TLIACT1
 
 
WAIT 
 N TEMPS,NO,POS
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Attente"))
 S POS=1,TEMPS=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POS)
 I (TEMPS="")!(POS=0) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Temps d'attente impossible a determiner")) S ECHEC=1 Q
 S TEMPS=TEMPS+0
 H @TEMPS
 Q
 
 
QUEM 
 N SAIS,BASE,IND,POS,SMODAFF
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Activation d'une saisie"))
 S POS=1,SAIS=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POS)
 I (SAIS="")!(POS=0) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible d'evaluer nom de la saisie")) S ECHEC=1 Q
 I '($$IR^%QSGEST5("SAISIE.I",SAIS)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("   Saisie inexistante")) S ECHEC=1 Q
 S BASE=$$RED(ACTI,2)
 I BASE=0 S BASE=CXT("@","BASE"),IND=CXT("@","OBJET") G ACTQUEM
 S IND=$$RED(BASE,"TEXTE")
 G:$E(IND)'="%" QUEM2
 S BASE=$$^%QCAZG("CXT("""_IND_""",""BASE"")"),IND=$$^%QCAZG("CXT("""_IND_""",""OBJET"")")
 I (BASE="")!(IND="") D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible d'evaluer individu")) S ECHEC=1 Q
 G ACTQUEM
QUEM2 S IND=$$OBPROX2^%QSCALVU(IND,CXT("@","BASE"),CXT("@","OBJET"),.BASE)
 I (BASE="")!(IND="") D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible d'evaluer individu")) S ECHEC=1 Q
ACTQUEM 
 D SAUVECR^%TLUTIL
 D CLEPAG^%VVIDEO
 D ACTAFF^%QMEAACT("SAISIE.I",SAIS,0,0,78,10,0,11,78,11,BASE,IND,"$$AFFICH^%QMEAROU","AFFECT^%QMEAROU")
 D CLEPAG^%VVIDEO
 
 S:$D(MODAFF) SMODAFF=MODAFF
 N MODAFF
 S:$D(SMODAFF) MODAFF=0
 D RESTECR^%TLUTIL
 Q
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

