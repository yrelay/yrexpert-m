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

;%TLIACTT^INT^1^59547,74029^0
%TLIACTT ;
 
 
 
 
 
PASSI 
 N NODEVI,TYPPAS,NOMPAS,TYPACT,SOURCE,MSG,POS
 D:MODAF ADD^%TLIFEN("LOG","     "_$$^%QZCHW("Activation d'une passerelle"))
 
 S NODEVI=$$RED(ACTI,1)
 S TYPPAS=$$SUBST^%ANARBR2(NODEVI,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer type passerelle") G ERRP
 I (TYPPAS'="ATTRIBUT.VALEUR")&(TYPPAS'="SUITE.VALEURS") S MSG=$$^%QZCHW("Type inconnu") G ERRP
 
 S NODEVI=$$RED(ACTI,2)
 S NOMPAS=$$SUBST^%ANARBR2(NODEVI,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer nom passerelle") G ERRP
 I TYPPAS="SUITE.VALEURS",'($D(^[QUI]LKY2(NOMPAS))) S MSG=$$^%QZCHW("Passerelle inconnue") G ERRP
 
 S NODEVI=$$RED(ACTI,3)
 S SOURCE=$$SUBST^%ANARBR2(NODEVI,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer du fichier source") G ERRP
 
 G:TYPPAS="ATTRIBUT.VALEUR" PV
 I '($D(^[QUI]RQSDON("LK",NOMPAS))) S MSG=$$^%QZCHW("Passerelle non validee") G ERRP
 I ^[QUI]RQSDON("LK",NOMPAS,"ETAT")'="OK" S MSG=$$^%QZCHW("Passerelle non valide") G ERRP
 I ^[QUI]RQSDON("LK",NOMPAS,"OKNOM")'=1 S MSG=$$^%QZCHW("Passerelle non valide en entree") G ERRP
 G FINSITY
 
PV 
FINSITY 
 D ACTIV^LKMNTX0(MODAF,$S(TYPPAS="SUITE.VALEURS":"EC",1:"PV"),NOMPAS,SOURCE)
 Q
 
ERRP D:MODAF ADD^%TLIFEN("LOG","  "_MSG)
 S ECHEC=1 K @(TEMP) Q
 
 
PASSO 
 N NODEVI,TYPPAS,NOMPAS,TYPACT,SOURCE,MSG,POS
 D:MODAF ADD^%TLIFEN("LOG","     "_$$^%QZCHW("Activation d'une passerelle de sortie"))
 
 S NODEVI=$$RED(ACTI,1)
 S TYPPAS=$$SUBST^%ANARBR2(NODEVI,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer type passerelle") G ERRP
 I (TYPPAS'="ATTRIBUT.VALEUR")&(TYPPAS'="SUITE.VALEURS") S MSG=$$^%QZCHW("Type inconnu") G ERRP
 
 S NODEVI=$$RED(ACTI,2)
 S NOMPAS=$$SUBST^%ANARBR2(NODEVI,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer nom passerelle") G ERRP
 I TYPPAS="SUITE.VALEURS",'($D(^[QUI]LKY2(NOMPAS))) S MSG=$$^%QZCHW("Passerelle inconnue") G ERRP
 
 S NODEVI=$$RED(ACTI,3)
 S LISTE=$$SUBST^%ANARBR2(NODEVI,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer nom de la liste") G ERRP
 
 S NODEVI=$$RED(ACTI,4)
 S FICHIER=$$SUBST^%ANARBR2(NODEVI,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer nom du fichier") G ERRP
 
 G:TYPPAS="ATTRIBUT.VALEUR" PVO
 I '($D(^[QUI]RQSDON("LK",NOMPAS))) S MSG=$$^%QZCHW("Passerelle non validee") G ERRP
 I ^[QUI]RQSDON("LK",NOMPAS,"ETAT")'="OK" S MSG=$$^%QZCHW("Passerelle non valide") G ERRP
 D ACTIV^LKYECRI(MODAF,NOMPAS,LISTE,FICHIER)
 G FSTYO
 
PVO 
 D ACTIV^LKXECRI(MODAF,LISTE,FICHIER)
FSTYO 
 I MODAF=1 D REAF^%TLIFEN
 Q
 
 
DESSIN 
 N %PORT,%TERM,%DESSIN,%MOUV,COL,VERS,POS,MSG,X0,Y0,AGR
 D:MODAF ADD^%TLIFEN("LOG","   "_$$^%QZCHW("Impression d'une collection"))
 
 S COL=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer nom collection") G ERR
 
 S VERS=$$SUBST^%ANARBR2($$RED(ACTI,2),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer version") G ERR
 I '($$EXI^%SDCCMS(COL,VERS)) S MSG=$$^%QZCHW("Collection inexistante") G ERR
 S X0=$$RED(ACTI,3),Y0=$$RED(ACTI,4),AGR=$$RED(ACTI,5)
 I ((X0=0)&(Y0=0))&(AGR=0) S (X0,Y0,AGR)="" G FDES
 S X0=$$SUBST^%ANARBR2(X0,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer coordonnee en X") G ERR
 I '($$POS^%QZNBN(X0)) S MSG=$$^%QZCHW("coordonnee en X non positif") G ERR
 S Y0=$$SUBST^%ANARBR2(Y0,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer coordonnee en Y") G ERR
 I '($$POS^%QZNBN(Y0)) S MSG=$$^%QZCHW("coordonnee en Y non positif") G ERR
 I AGR=0 S AGR=1 G FDES
 S AGR=$$SUBST^%ANARBR2(AGR,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer coeff. agrandissement") G ERR
 I '($$POS^%QZNBN(AGR)) S MSG=$$^%QZCHW("coeff.agrandissement non positif") G ERR
FDES 
 D INIT^%SDSCIMP(1)
 D TRAIT^%SDSCIMP(X0,Y0)
 S X0=$$CONV^%SDSCPT(X0)*10,Y0=$$CONV^%SDSCPT(Y0)*10
 D INIT5^%PBMFN(COL,VERS,X0,Y0)
 D ^%SDSCACT(COL,VERS,1,0,%PORT,%TERM,%DESSIN,AGR)
 D FIN^%SDSCIMP(1)
 K ^V($J,"%")
 D:MODAF ADD^%TLIFEN("LOG","   "_$$^%QZCHW("Fin de l'impression"))
 Q
 
 
SUPCOL 
 N COL,VERS,POS,MSG
 D:MODAF ADD^%TLIFEN("LOG","   "_$$^%QZCHW("Suppression d'une collection"))
 
 S COL=$$SUBST^%ANARBR2($$RED(ACTI,1),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer nom collection") G ERR
 
 S VERS=$$SUBST^%ANARBR2($$RED(ACTI,2),.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 S MSG=$$^%QZCHW("Imposs. evaluer version") G ERR
 I '($$EXI^%SDCCMS(COL,VERS)) S MSG=$$^%QZCHW("Collection inexistante") G ERR
 D SUPPR^%SDCCMS(COL,VERS)
 D:MODAF ADD^%TLIFEN("LOG","   "_$$^%QZCHW("Collection supprimee"))
 Q
 
ERR 
 D:MODAF ADD^%TLIFEN("LOG","   "_MSG)
 S ECHEC=1 Q
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)

