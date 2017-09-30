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

;TLIACTM^INT^1^59547,74869^0
TLIACTM ;
 
 
 
 
 
 
 
 
 
 
 
TRTNOM 
 D:MODAF'=0 POCLEPA^%VVIDEO
 S IN="",ARRET=0,PARTIE=""
 S GLOSTO=@"ORIGINE($J)"
 S CXT(VARO,"BASE")=CXT("@","BASE")
 G:PAR="PROFONDEUR" PROFON
 
 
 
 S RETOURGO="RETLAR^%TLIACTM"
 S INIV="",VNIV=0
BLARN S INIV=$S(SEN="EN.DESCENDANT":$O(@TEMPOLI@(INIV)),1:$ZP(@TEMPOLI@(INIV)))
 G:INIV="" FINIT
 S NB="",VNIV=VNIV+1
 S CXT("%",NIV)=VNIV
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),NIV,INIV,1)
BLARNN S NB=$O(@TEMPOLI@(INIV,"OBJ",NB))
 G:NB="" BLARN
 S O=@TEMPOLI@(INIV,"OBJ",NB)
 S CXT(VARO,"OBJET")=O
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),VARO,O,1)
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),ORD,@TEMPOLI@(INIV,"OBJ",NB,"ORD"),1)
 
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),PERE,@TEMPOLI@(INIV,"OBJ",NB,"PERE"),1)
 K @TEMPOLI@(INIV,"OBJ",NB)
 G GO^%TLIACTI
RETLAR G:(ARRET=1)!(ABANDON=1) FINIT
 G BLARNN
 
 
PROFON 
 
 S GCLE="",CLE="""""",VNIV=1
 G:SEN="EN.MONTANT" PRMON
 
 S RETOURGO="PROFDRET^%TLIACTM"
PROFD S CLE=$O(@(TEMPOLI_GCLE_CLE_")"))
 G:CLE'="" PROFDS
 G:GCLE="" FINIT
 S VNIV=VNIV-1
 S NVIRG=$L(GCLE,",")
 S CLE=$P(GCLE,",",NVIRG-1),GCLE=$P(GCLE,",",1,NVIRG-2)_","
 S:GCLE="," GCLE=""
 G PROFD
PROFDS 
 S CXT("%",NIV)=VNIV
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),NIV,VNIV,1)
 S:GCLE="," GCLE=""
 S O=@(TEMPOLI_GCLE_CLE_")")
 
 S PE=$P(O,"^",3),OR=$P(O,"^",2),O=$P(O,"^")
 S CXT(VARO,"OBJET")=O
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),VARO,O,1)
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),ORD,OR,1)
 
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),PERE,PE,1)
 G GO^%TLIACTI
 
PROFDRET G:(ARRET=1)!(ABANDON=1) FINIT
 S VNIV=VNIV+1
 S GCLE=GCLE_CLE_",",CLE=""""""
 G PROFD
 
 
PRMON 
 S RETOURGO="PROFMRET^%TLIACTM"
PROFM S CLE=$O(@(TEMPOLI_GCLE_CLE_")"))
 G:CLE'="" PROFMS
 G:GCLE="" FINIT
 S NVIRG=$L(GCLE,",")
 S CLE=$P(GCLE,",",NVIRG-1),GCLE=$P(GCLE,",",1,NVIRG-2)_","
 
 S CXT("%",NIV)=VNIV
 S VNIV=VNIV-1
 S:GCLE="," GCLE=""
 S O=@(TEMPOLI_GCLE_CLE_")")
 
 S PE=$P(O,"^",3),OR=$P(O,"^",2),O=$P(O,"^")
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),NIV,VNIV,1)
 S CXT(VARO,"OBJET")=O
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),VARO,O,1)
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),ORD,OR,1)
 
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),PERE,PE,1)
 
 G GO^%TLIACTI
PROFMRET G:(ARRET=1)!(ABANDON=1) FINIT
 G PROFM
 
PROFMS S GCLE=GCLE_CLE_",",CLE=""""""
 S VNIV=VNIV+1
 G PROFM
 
 
FINIT D:(MODAF'=0)&(ABANDON'=1) ADD^%TLIFEN("LOG",$$^%QZCHW("  Fin du parcours"))
 D ADTEMP^%TLIACTL
 S %LL=@TEMPL
 I %LL=1 K @(TEMPL) G MAJIV
 K @TEMPL@(%LL) S @TEMPL=%LL-1
MAJIV D DEPV^%ANGEPIL
 G RETBOUCA^%TLIACTI
 
 
FEX N CH,FONC,I,LVAR,NACT,NPAR,POSS
 D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Appel d'une fonction externe"))
 S POSS=1,FONC=$$SUBST^%ANARBR2($$RED^%ANA(ACTI,1),.CXT,"ATT^%TLIACT3",.POSS)
 I (POSS=0)!(FONC="") D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer nom fonction externe")) S ECHEC=1 Q
 I '($D(^TTLEXTER(FONC))) D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Fonction externe inconnue")) S ECHEC=1 Q
 S CH=^TTLEXTER(FONC)
 S NACT=$P(CH,"|",1),NPAR=$P(CH,"|",2)
 I $$RED^%ANA(ACTI,NPAR+1)=0 D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Nombre de parametres incorrect")) S ECHEC=1 Q
 S POSS=1 F I=1:1:NPAR D TVAL Q:'(POSS)
 I '(POSS) D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer parametre")_" "_I) S ECHEC=1 Q
 D @(NACT_$S(NPAR=0:"",1:"("_$$PARAM_")"))
 D:MODAF'=0 REAFF^%TLUTIL,ADD^%TLIFEN("LOG",$$^%QZCHW("  Activation terminee"))
 Q
TVAL S LVAR(I)=$$SUBST^%ANARBR2($$RED^%ANA(ACTI,I+1),.CXT,"ATT^%TLIACT3",.POSS) Q
PARAM() N I,J,R
 S R="",S=""
 F I=1:1:NPAR S J=LVAR(I),J=$S(J="":"""""",J?.N:J,1:""""_$$ZSUBST^%QZCHSUB(J,"""","""""")_""""),R=R_I_",",S=S_J_","
 Q $E(S,1,$L(S)-1)
 
 
TOT D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Totalisation"))
 N POSS,ATT,LIS,VAL,OR,VLI,IN,VAR,REP2,ATOT,AA,OO,II,RR,VALI,TYP,V
 I '($$ATTR^%TLIACT4($$RED^%ANA(ACTI,1),.AA,.OO,.II,.RR)) D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Valeur a totaliser impossible a determiner")) S VAL="",ECHEC=1 Q
 S VAL=0,TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"TOTAL")
 K @(TEMP)
 D MVG^%QSCALVA(RR,II,AA,TEMP,.TYP)
 S VAL=0
 G:@TEMP=0 FBTOT
 S V=""
BTOT S V=$O(@TEMP@(V))
 G:V="" FBTOT
 S VAL=VAL+@TEMP@(V)
 G BTOT
FBTOT K @(TEMP)
 S ATOT=$$RED^%ANA(ACTI,2)
 S LIS=$$RED^%ANA($$RED^%ANA(ATOT,1),"TEXTE")
 I LIS="" D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Attr./Var. resultat incorrect")) S ECHEC=1 Q
 S OR=$$SUBST^%ANARBR2($$RED^%ANA(ATOT,2),.CXT,"ATT^%TLIACT3",.POSS)
 S:OR="" OR=1
 G:$E(LIS)'="%" MAJTOT
 S VALI=$$SUBST^%ANARBR2(ATOT,.CXT,"ATT^%TLIACT3",.POSS)
 S:(VALI="")!(POSS=0) VALI=0
 S VAL=VALI+VAL
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),LIS,VAL,OR)
 D:MODEX=2 STATT^%TLBAATT(CXT("%","BASE"),CXT("%","OBJET"),LIS,VAL,OR,$S(VALI=0:"AJOUT",1:"MODIFICATION"))
 D:MODAF'=0 ADD^%TLIFEN("ATT",LIS_" <-- "_VAL)
 Q
MAJTOT S VLI=$S($$EXI^%TLIACT2(LIS,OR):$$VAL^%TLIACT2(LIS,OR)+VAL,1:VAL)
 D ATT^%TLIACT2(LIS,VLI,OR)
 D:MODAF'=0 ADD^%TLIFEN("LISTE",LIS_" = "_VLI)
 Q

