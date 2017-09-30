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

;%TLIACTA^INT^1^59547,74029^0
%TLIACTA ;
 
 
 
 
 
TOTEML N ZLILA,L,SAVLI,POS,ADRL,LATT,OATT,BASEL,BATCH,CHOIX,I,NBTOT,NBTC,PREM,VALOBJL,EXISTEL,ADLIST,TEMPO,KEEPIDT
 K ^KLNTOT($J)
 I '($$OKR^%INCOIN("TO")) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Acces TOTEM interdit")) Q
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Activation de TOTEM"))
 S L=$$RED(ACTI,2),POS=1 G:L=0 CRLIST
 S L=$$SUBST^%ANARBR2(L,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Nom liste individus impossible a evaluer")) Q
STOT1 I '($$EX^%QSGEST7(L)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Liste individus inexistante")) Q
 S BASEL=$$^%QSCALVA("L0",L,"BASE")
 I BASEL="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Repertoire des individus liste inconnu")) Q
 S ADLIST=$$^%QSCALVA("L0",L,"ADRESSE")
 I ADLIST="" D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Adresse de stockage individus inconnue")) Q
 S ZLILA=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer nom de la liste des attributs")) Q
 S NBTOT=$$^%QSCALVA("L0",L,"CARD"),NBTC=1,PREM=1,VALOBJL=$$^%QSCALVA("L0",L,"OBJET.TOTEM")
 S EXISTEL=$S(VALOBJL'="":1,1:0)
 K ^TRAITES($J) S ^TRAITES($J,"CARD")=1
 I (ZLILA="")!(ZLILA="*") S LATT=ZLILA G ACTOT
 S ADRL=$$LIST^%QMLILA(ZLILA)
 S LATT=$S(ADRL="":"*",1:"LISTE")
 
 S OATT=""
 F I=0:0 S OATT=$O(@ADRL@(OATT)) Q:(OATT="")!(OATT]"A")  S:@ADRL@(OATT)'="" LATT(@ADRL@(OATT))=""
ACTOT S BATCH=1,CHOIX="SANS DIALOGUE",KEEPIDT=LATT=""
 D POCLEPA^%VVIDEO
 D SAUVVAL^%TLUTIL
 D MEMX^%QCAMEM
 
 
 
 
 
 D BEG2^TORQSIDF
 D 80^%VVIDEO
 I '(DTM) K (WHOIS,QUI,BASEL,L,ZLILA,LATT,ADR,NOML,BATCH) G ACTOT1
 S TAB125=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TUER") K @(TAB125)
 F I="WHOIS","QUI","BASEL","L","ZLILA","LATT","ADR","NOML","BATCH","TAB125" S @TAB125@(I)=""
 D KEXMEM^%QCAMEM(TAB125)
ACTOT1 D CURRENT^%IS,VARSYS^%QCSAP
 D T0^TORQSB01(L,.LATT)
 
 
 
 
 
 
 K  D RMEMX^%QCAMEM
 I L["zzz" D DEL^%QSGES11(L)
 D RESTVAL^%TLUTIL
 D CLEPAG^%VVIDEO,REAFF^%TLUTIL
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Fin activation de TOTEM"))
 Q
CRLIST 
 S L=$$GEN^%QCAPOP("zzz")
 D ^%QSGES11($$^%QSCALVA("L0",LISTE,"BASE"),L,"zzz",0,"","")
 D STOCK^%QSGES11(L,CXT("@","OBJET"))
 G STOT1
 
INVISIBLE S DX=1,DY=1 X XY W $$^%QZCHW("Traitement en cours...")
 D INDBAS^%TLIACT3
 Q
 
 
BOUCLER 
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMPO)
 S @TEMPO@(1)="ETIQ",@TEMPO@(2)="CONDSOR",@TEMPO@(3)="ECHN"
 S @TEMPO@(4)="ARRET",@TEMPO@(5)="I",@TEMPO@(6)="TETE"
 S @TEMPO@(7)="EXP",@TEMPO@(8)="POS",@TEMPO@(9)="PARTIE",@TEMPO@(10)="L"
 S @TEMPO@(11)="RETOURGO",@TEMPO@(12)="RETOUROK"
 S @TEMPO@(13)="LI",@TEMPO@(14)="NOEUACT",@TEMPO@(15)="STOP"
 S @TEMPO@(16)="TRBOUC"
 D EMPV^%ANGEPIL(TEMPO)
 K @(TEMPO)
 S TRBOUC=1
 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("repetition sous-traitement"))
 S ETIQ=$$RED($$RED(ACTI,1),"TEXTE")
 S CONDSOR=$$RED(ACTI,2)
 
 D:MODAF ADD^%TLIFEN("LOG","  *"_$$^%QZCHW("initialisation"))
 
 S ECHN=3,TETE=ACTI
BINIT 
 S ACTI=$$RED(TETE,ECHN) I ACTI=0 G FBINIT
 D AFF^%TLIACT3
 S ECHN=ECHN+1 G BINIT
FBINIT 
 D:MODAF ADD^%TLIFEN("LOG","  *"_$$^%QZCHW("initialisation terminee"))
 
BOUC 
 
 S PARTIE="PROLOGUE",RETOURGO="RETPRO^%TLIACTA"
 G GO^%TLIACT1
RETPRO 
 I ((ARRET=1)!(ABANDON=1))!(HALT=1) G FBOUC
 
 
 S PARTIE="CORPS",RETOURGO="RETCOR^%TLIACTA"
 G GO^%TLIACT1
RETCOR 
 I ((ARRET=1)!(ABANDON=1))!(HALT=1) G FBOUC
 
 
 S PARTIE="EPILOGUE",RETOURGO="RETEPI^%TLIACTA"
 G GO^%TLIACT1
RETEPI 
 I ((ARRET=1)!(ABANDON=1))!(HALT=1) G FBOUC
 
 
 D:MODAF ADD^%TLIFEN("LOG","* "_$$^%QZCHW("evaluation condition de sortie"))
 S EXP=$$SUBST^%ANARBR2(CONDSOR,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("evaluation impossible")) G FBOUC
 I EXP=0 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("condition fausse")) G BOUC
 D:MODAF ADD^%TLIFEN("LOG","  "_$$^%QZCHW("condition vraie"))
FBOUC 
 S ARRET=0
 D:((MODAF'=0)&(ABANDON'=1))&(HALT=0) ADD^%TLIFEN("LOG","  "_$$^%QZCHW("fin de la boucle"))
 D DEPV^%ANGEPIL
 G REBOUCA^%TLIACT1
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

