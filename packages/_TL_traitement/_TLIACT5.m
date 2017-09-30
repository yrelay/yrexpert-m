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

;%TLIACT5^INT^1^59547,74029^0
%TLIACT5 ;
 
 
 
 
 
AJOUTL 
 N ADR,ADRT,CARD,L,QUIT,VAR
 D INIT
 I QUIT=1 S ECHEC=1 Q
 I $D(@ADR@(VAR)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("   L'individu ")_VAR_$$^%QZCHW(" est deja present dans la liste ")_L) S ECHEC=1 Q
 Q:MODEX=1
 S @ADR@(VAR)="",CARD=$$^%QSCALVA("L0",L,"CARD")+1
 G:ADRT="" AJOUTLM
 S @ADRT@(CARD)=VAR,@ADR@(VAR)=CARD
AJOUTLM D MOD D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("   Individu insere dans la liste ")_L) Q
 
INIT 
 S QUIT=0
 S POS=1
 S L=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POS)
 I (L="")!(POS=0) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("   Impossible d'evaluer le nom de la liste")) S QUIT=1 Q
 S VAR=$$RED(ACTI,2)
 I '($$EX^%QSGEST7(L)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("    Liste inconnue")) S QUIT=1 Q
 I VAR=0 S VAR=CXT("@","OBJET") G FINIT
 S VAR=$$SUBST^%ANARBR2(VAR,.CXT,"ATT^%TLIACT3",.POS)
 I (VAR="")!(POS=0) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("   Impossible d'evaluer le nom de l'individu a ajouter")) S QUIT=1 Q
FINIT S ADR=$$ADRLIS^%QSGEST7(L)
 S ADRT=$$ADRLT^%QSGEST7(L)
 Q
MOD 
 D PA^%QSGESTI("L0",L,"CARD",CARD,1),PA^%QSGESTI("L0",L,"DATE.UTILISATION",$$31^%QMDATE1($$DATENO2^%QMDATE($H)),1),PA^%QSGESTI("L0",L,"HEURE.UTILISATION",$$HEUREX^%QMDATE($H),1)
 Q
 
 
SUPPL 
 N ADR,CARD,L,QUIT,VAR,ADRT,%I,%J,%J1,ADTEMP
 D INIT I QUIT=1 S ECHEC=1 Q
 I '($D(@ADR@(VAR))) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("   L'individu ")_VAR_$$^%QZCHW(" n'existe pas dans la liste ")_L) S ECHEC=1 Q
 Q:MODEX=1
 K @ADR@(VAR) S CARD=$$^%QSCALVA("L0",L,"CARD")-1
 G:ADRT="" SUPPLM
 
 
 S %J=""
 F %I=1:1 S %J=$O(@ADRT@(%J)) Q:%J=""  I @ADRT@(%J)=VAR K @ADRT@(%J) Q
 G SUPPLM
 
 S %J="",ADTEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 K @(ADTEMP)
 F %I=1:1 S %J=$O(@ADRT@(%J)) Q:%J=""  S @ADTEMP@(%I)=@ADRT@(%J) I @ADRT@(%J)=VAR K @ADRT@(%J),@ADTEMP@(%I) S %I=%I-1
 S %J="" K @(ADRT)
 F %I=0:0 S %J=$O(@ADTEMP@(%J)) Q:%J=""  S @ADRT@(%J)=@ADTEMP@(%J)
 K @(ADTEMP)
SUPPLM D MOD D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("   Individu supprime dans la liste ")_L) Q
 
 
FMOD N MODL,TYPDT,NOM
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("   Edition d'un modele"))
 D SAUVVAL^%TLUTIL
 I '($$OKR^%INCOIN("ED")) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Acces a GDX interdit")) S ECHEC=1 G FINMOD
 S MODL=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POS)
 I (MODL="")!(POS=0) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible de trouver le nom du modele")) S ECHEC=1 G FINMOD
 I '($$EXISTE^%EDDGEST(MODL)) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Modele inconnu")) S ECHEC=1 G FINMOD
 S TYPDT=$$RED($$RED(ACTI,3),"TEXTE")
 S NOM=$$RED(ACTI,2)
 I NOM=0 D EDIMOD(MODL,CXT("@","BASE"),CXT("@","OBJET"),TYPDT) G FINMOD
 S NOM=$$RED(NOM,"TEXTE")
 I '($D(CXT(NOM,"BASE"))) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  La base de l'individu fils n'est pas definie")) S ECHEC=1 G FINMOD
 I '($D(CXT(NOM,"OBJET"))) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  L'individu fils n'est pas defini")) S ECHEC=1 G FINMOD
 D EDIMOD(MODL,CXT(NOM,"BASE"),CXT(NOM,"OBJET"),TYPDT)
FINMOD D RESTVAL^%TLUTIL
 U 0 S ARRET=0
 Q
 
EDIMOD(MODL,REPO,NOMO,TYPDT) 
 N BASE,OBJET,VAR,GLO,CONT,ADRM,I,LIGNE,MOD,VALPLA
 S:'($D(GDX)) GDX=0
 S VAR="OBJET DE BASE"
 S (CONT(VAR,"BASE"),BASE)=REPO,(CONT(VAR,"OBJET"),OBJET)=NOMO
 I TYPDT'=1 N LISTEMOD
 S GLO="^[QUI]EDMOD(MODL)",LISTEMOD(MODL)=1
 S %PORT=$$^%QCAZG("^TABIDENT(WHOIS,""TABTRA"")"),%TERM=$$^%QCAZG("^TABIDENT(WHOIS,""TYPTAB"")") S:%PORT="" %PORT=0 S:%TERM="" %TERM=0
 S:$D(^[QUI]EDMOD(MODL,"VAR")) BASE=CONT(VAR,"BASE"),OBJET=CONT(VAR,"OBJET")
 K ^V($J,"%")
 I '($$^%EDPRLG) Q
 I (TYPDT=1)&(GDX'=0) G FMOD2
 D INIT^%EDCENVL S %9T=$$^%EDCVAR("%9T",1)
 S %FONC="PRENDRE" D ^%PBPZ
 
FMOD2 S MOD=MODL,VALPLA=" ",ADRM(MOD)=0
 D DEB^%SGMESU("DKBMS->GDX")
 D TRANSIN
 D FIN^%SGMESU("DKBMS->GDX")
 S LIGNE=""
BCEXR S LIGNE=$O(^[QUI]EDMOD(MODL,"COMP",LIGNE))
 G:ARRET!(LIGNE="") FBCEXR
 I ^[QUI]EDMOD(MODL,"COMP",LIGNE)="" G FBCEXR
 X ^[QUI]EDMOD(MODL,"COMP",LIGNE)
 G BCEXR
 
FBCEXR S GDX=1 K LISTEMOD(MODL)
 D DEB^%SGMESU("GDX->DKBMS")
 D TRANSOUT
 D FIN^%SGMESU("GDX->DKBMS")
 I TYPDT'=1 D ^%EDEPLG S GDX=0
 Q
 
TRANSIN 
 N ATT,ORD,VAL
 D PARCAO^%QSTRUC8(CXT("%","BASE"),CXT("%","OBJET"),"S ^V($J,""%"",ATT,ORD)=VAL")
 Q
 N %ATT,%VAL,%ORD
 S %ATT=""
BOUCIN S %ATT=$$NXTRIA^%QSTRUC8(CXT("%","BASE"),CXT("%","OBJET"),%ATT) Q:%ATT=""
 S %ORD=""
BINORD S %ORD=$$NXTRIAO^%QSTRUC8(CXT("%","BASE"),CXT("%","OBJET"),%ATT,%ORD) G:%ORD="" BOUCIN
 S ^V($J,"%",%ATT,%ORD)=$$VALEUR^%QSTRUC8(CXT("%","BASE"),CXT("%","OBJET"),%ATT,%ORD)
 G BINORD
 
TRANSOUT N %ATT,%VAL,%ORD
 G:WHOIS("ETUDE")'=0 OUTETU
 S %ATT=""
BOUT S %ATT=$O(^V($J,"%",%ATT)) Q:%ATT=""  S %ORD=""
BOUTORTD S %ORD=$O(^V($J,"%",%ATT,%ORD)) G:%ORD="" BOUT
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),%ATT,^V($J,"%",%ATT,%ORD),%ORD)
 G BOUTORTD
OUTETU N REFI,REFA
 S REFI=$$REFC^%QXPGESD(WHOIS("ETUDE"),CXT("%","BASE"),CXT("%","OBJET"))
 S %ATT=""
BETUA S %ATT=$O(^V($J,"%",%ATT)) Q:%ATT=""  S %ORD=""
 S REFA=$$REFAIC^%QXPGESD(WHOIS("ETUDE"),CXT("%","BASE"),CXT("%","OBJET"),REFI,%ATT)
BETUD S %ORD=$O(^V($J,"%",%ATT,%ORD)) G:%ORD="" BETUA
 D PUSHMAT2^%QXPPRI7(WHOIS("ETUDE"),WHOIS("NDCOUR"),"VALEURS",REFA,%ORD,^V($J,"%",%ATT,%ORD))
 G BETUD
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

