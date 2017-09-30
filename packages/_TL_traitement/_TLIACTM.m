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

;%TLIACTM^INT^1^59547,74029^0
%TLIACTM ;
 
 
 
 
 
 
 
 
 
 
 
TRTNOM 
 D:MODAF POCLEPA^%VVIDEO
 S IN="",ARRET=0,PARTIE=""
 S CXT(PERE,"BASE")=CXT("@","BASE")
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
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),PERE,@TEMPOLI@(INIV,"OBJ",NB,"P"),1)
 S CXT(PERE,"OBJET")=@TEMPOLI@(INIV,"OBJ",NB,"P")
 K @TEMPOLI@(INIV,"OBJ",NB)
 G GO^%TLIACT1
RETLAR G:((ARRET=1)!(ABANDON=1))!(HALT=1) FINIT
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
 S PA=$P(O,"^",3),OR=$P(O,"^",2),O=$P(O,"^")
 S CXT(VARO,"OBJET")=O
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),VARO,O,1)
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),ORD,OR,1)
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),PERE,PA,1)
 S CXT(PERE,"OBJET")=PA
 G GO^%TLIACT1
 
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
 S PA=$P(O,"^",3),OR=$P(O,"^",2),O=$P(O,"^")
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),NIV,VNIV,1)
 S CXT(VARO,"OBJET")=O,CXT(PERE,"OBJET")=PA
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),VARO,O,1)
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),ORD,OR,1)
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),PERE,PA,1)
 G GO^%TLIACT1
PROFMRET G:((ARRET=1)!(ABANDON=1))!(HALT=1) FINIT
 G PROFM
 
PROFMS S GCLE=GCLE_CLE_",",CLE=""""""
 S VNIV=VNIV+1
 G PROFM
 
 
FINIT D:((MODAF'=0)&(ABANDON'=1))&(HALT=0) ADD^%TLIFEN("LOG",$$^%QZCHW("  Fin du parcours"))
 D ADTEMP^%TLIACTL
 S %LL=@TEMPL
 I %LL=1 K @(TEMPL) G MAJIV
 K @TEMPL@(%LL) S @TEMPL=%LL-1
MAJIV K CXT(VARO),CXT(PERE),CXT(ORD),CXT(NIV)
 D PSV^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),VARO)
 D PSV^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),PERE)
 D PSV^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),ORD)
 D PSV^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),NIV)
 G:MODEX'=2 MAJIV2
 D STATT^%TLBAATT(CXT("%","BASE"),CXT("%","OBJET"),VARO,"","*","SUPPRESSION")
 D STATT^%TLBAATT(CXT("%","BASE"),CXT("%","OBJET"),PERE,"","*","SUPPRESSION")
 D STATT^%TLBAATT(CXT("%","BASE"),CXT("%","OBJET"),ORD,"","*","SUPPRESSION")
 D STATT^%TLBAATT(CXT("%","BASE"),CXT("%","OBJET"),NIV,"","*","SUPPRESSION")
MAJIV2 D DEPV^%ANGEPIL
 G REBOUCA^%TLIACT1
 
 
FEX N CH,FONC,I,LVAR,NACT,NPAR,POSS,TYPPAR
 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Appel d'une fonction externe"))
 S POSS=1,FONC=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POSS)
 I (POSS=0)!(FONC="") D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer nom fonction externe")) S ECHEC=1 Q
 I '($D(^TTLEXTER(FONC))) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Fonction externe inconnue")) S ECHEC=1 Q
 S CH=^TTLEXTER(FONC)
 S NACT=$P(CH,"|",1),NPAR=$P(CH,"|",2),TYPPAR=$P(CH,"|",3)
 I $$RED(ACTI,NPAR+1)=0 D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Nombre de parametres incorrect")) S ECHEC=1 Q
 S POSS=1 F I=1:1:NPAR D TVAL Q:'(POSS)
 I '(POSS) D:MODAF ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer parametre")_" "_I) S ECHEC=1 Q
 D @(NACT_$S(NPAR=0:"",1:"("_$$PARAM_")"))
 D:MODAF REAFF^%TLUTIL,ADD^%TLIFEN("LOG",$$^%QZCHW("  Activation terminee"))
 Q
 
 
TVAL I $P(TYPPAR,"/",I)="ADR" S LVAR(I)=$$RED(ACTI,I+1) Q
 S LVAR(I)=$$SUBST^%ANARBR2($$RED(ACTI,I+1),.CXT,"ATT^%TLIACT3",.POSS)
 Q
 
PARAM() N I,J,R
 S R="",S=""
 F I=1:1:NPAR S J=LVAR(I),J=$S(J="":"""""",J?.N:J,1:""""_$$ZSUBST^%QZCHSUB(J,"""","""""")_""""),R=R_I_",",S=S_J_","
 Q $E(S,1,$L(S)-1)
 
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

