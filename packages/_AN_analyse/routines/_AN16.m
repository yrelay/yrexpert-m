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

;%AN16^INT^1^59547,73865^0
%AN16 ;
 
 
 
 
M(M) Q:'(ERRMES)
 D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
 
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
 
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
 
ACTION K @(TEMPO)
 S @TEMPO@(1)="L",@TEMPO@(2)="NN" D EMPV^%ANGEPIL(TEMPO)
 D EMPIL^%ANGEPIL("ACTI1^%AN16")
 S NN=$$^%QZCHW("$MOZART"),L=$L(NN)
 G:$E(CH,P,(P+L)-1)]NN ACT2^%AN16B
 S NN=$$^%QZCHW("$ABANDON"),L=$L(NN) G:$E(CH,P,(P+L)-1)=NN ABANDON^%AN14
 S NN=$$^%QZCHW("$ADDITIONNER"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") ADDIT^%AN59
 S NN=$$^%QZCHW("$ADRESSE"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") ADRESSE^%AN38
 S NN=$$^%QZCHW("$AJOUTERL"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") AJINDL^%AN27
 S NN=$$^%QZCHW("$AJOUTER.OBJET"),L=$L(NN) G:$E(CH,P,(P+L)-1)=NN AJOBJ^%AN62
 S NN=$$^%QZCHW("$ALLER.A"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") ALLER^%AN44
 S NN=$$^%QZCHW("$ASSISTER.EXECUTION"),L=$L(NN) I $E(CH,P,(P+L)-1)=NN S VERBAN="$ASSISTER.EXECUTION",TYPVER="ACTION",PARLIS="~EXPR" G ^%ANVERB
 S NN=$$^%QZCHW("$ATTRIBUER"),L=$L(NN) G:$E(CH,P,(P+L)-1)=NN ATTRIB^%AN48
 S NN=$$^%QZCHW("$AUSCULTER"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") ITEATT^%AN43
 S NN=$$^%QZCHW("$CONFIGURER"),L=$L(NN) G:$E(CH,P,(P+L)-1)=NN CONFIG^%AN66
 S NN=$$^%QZCHW("$CONTEXTE.COLLECTION"),L=$L(NN) G:$E(CH,P,(P+L)-1)=NN CNTCOL^%AN62
 S NN=$$^%QZCHW("$CONTEXTE.OBJET"),L=$L(NN) G:$E(CH,P,(P+L)-1)=NN CNTOBJ^%AN61
 S NN=$$^%QZCHW("$COPIER.GAMME"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") COPGA^%AN53
 S NN=$$^%QZCHW("$COPIER.INDIVIDU"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") COPIER^%AN45
 S NN=$$^%QZCHW("$CORPS"),L=$L(NN) G:$E(CH,P,(P+L)-1)=NN CORPS^%AN40
 S NN=$$^%QZCHW("$CREER.ACTION"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") CRACT^%AN53
 S NN=$$^%QZCHW("$CREER.INDIVIDU"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") CREER^%AN36
 S NN=$$^%QZCHW("$CREER.SAISIE"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") CRSAIS^%AN59
 S NN=$$^%QZCHW("$CREERL"),L=$L(NN) I $E(CH,P,(P+L)-1)=NN S VERBAN="$CREERL",TYPVER="ACTION",PARLIS="ADRESSE/EXPR/EXPR/~EXPR" G ^%ANVERB
 
 S NN=$$^%QZCHW("$DATET"),L=$L(NN) G:$E(CH,P,(P+L)-1)=NN DATET^%AN26
 S NN=$$^%QZCHW("$DEJALONNER"),L=$L(NN) G:$E(CH,P,(P+L)-1)=NN DEJAL^%AN49
 S NN=$$^%QZCHW("$DELIER.INDIVIDU"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") DELIER^%AN36
 S NN=$$^%QZCHW("$DEMANDER"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") DMD^%AN40
 S NN=$$^%QZCHW("$DEPOUILLER"),L=$L(NN) G:$E(CH,P,(P+L)-1)=NN DEPOU^%AN29
 S NN=$$^%QZCHW("$DESSINER.SCENE"),L=$L(NN) G:$E(CH,P,(P+L)-1)=NN DESSIN^%AN65
 S NN=$$^%QZCHW("$DIALOGUE"),L=$L(NN) I $E(CH,P,(P+L)-1)=NN S VERBAN="$DIALOGUE",TYPVER="ACTION",PARLIS="EXPR/~EXPR/~VARTEMP" G ^%ANVERB
 S NN=$$^%QZCHW("$DMD"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") MESDMD^%AN43
 
 S NN=$$^%QZCHW("$EDITER.LIEN"),L=$L(NN) I $E(CH,P,(P+L)-1)=NN S VERBAN="$EDITER.LIEN",TYPVER="ACTION",PARLIS="EXPR/EXPR/EXPR/EXPR/~EXPR/~EXPR/~EXPR/~EXPR/~EXPR" G ^%ANVERB
 
 
 S NN=$$^%QZCHW("$ELIMINER"),L=$L(NN) I $E(CH,P,P+L)=(NN_"(") S VERBAN="$ELIMINER",TYPVER="ACTION",PARLIS="ADRESSE/~EXPR" G ^%ANVERB
 S NN=$$^%QZCHW("$ELIMINER.INDIVIDU"),L=$L(NN) G:$E(CH,P,(P+L)-1)=NN SUPPR^%AN22
 S NN=$$^%QZCHW("$ELIMINERL"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") ELIML^%AN27
 S NN=$$^%QZCHW("$EPILOGUE"),L=$L(NN) G:$E(CH,P,(P+L)-1)=NN EPILOG^%AN40
 S NN=$$^%QZCHW("$ETIQUETTE"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") ETIQ^%AN14
 S NN=$$^%QZCHW("$FEXTER"),L=$L(NN) G:$E(CH,P,(P+L)-1)=NN FEX^%AN28
 S NN=$$^%QZCHW("$FIN.TRAITER.LISTE"),L=$L(NN) G:$E(CH,P,(P+L)-1)=NN HALT^%AN14
 S NN=$$^%QZCHW("$FIN"),L=$L(NN) G:$E(CH,P,(P+L)-1)=NN FIN^%AN14
 S NN=$$^%QZCHW("$FIXER.DUREE.ATTENTE"),L=$L(NN) I $E(CH,P,(P+L)-1)=NN S VERBAN="$FIXER.DUREE.ATTENTE",TYPVER="ACTION",PARLIS="~EXPR/~EXPR" G ^%ANVERB
 S NN=$$^%QZCHW("$GROUPER.MANUEL"),L=$L(NN) I $E(CH,P,(P+L)-1)=NN S VERBAN="$GROUPER.MANUEL",TYPVER="ACTION",PARLIS="VARTEMP/EXPR/~EXPR/~EXPR/~EXPR/~EXPR" G ^%ANVERB
 S NN=$$^%QZCHW("$HISTORIQUE"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") HISTO^%AN31
 S NN=$$^%QZCHW("$IMPRIMER.HISTO"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") IMPH^%AN37
 S NN=$$^%QZCHW("$IMPRIMER.ETAT"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") IMPRIM^%AN28
 S NN=$$^%QZCHW("$IMPRIMERL"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") IMPRL^%AN54
 S NN=$$^%QZCHW("$INDIVIDU"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") INDIV^%AN45
 S NN=$$^%QZCHW("$ITERER"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") ITERER^%AN26
 S NN=$$^%QZCHW("$LIER.INDIVIDU"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") LIER^%AN36
 S NN=$$^%QZCHW("$LISTE.ATTRIBUT"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") LATTR^%AN39
 S NN=$$^%QZCHW("$LISTE.INDICE"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") LIND^%AN39
 S NN=$$^%QZCHW("$MODELE"),L=$L(NN) G:$E(CH,P,(P+L)-1)=NN MODELE^%AN23
 S NN=$$^%QZCHW("$MOYENNE"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") MOYEN^%AN22
 S NN=$$^%QZCHW("$MOZART"),L=$L(NN) G:$E(CH,P,(P+L)-1)=NN MOZ^%AN54
 S NN=$$^%QZCHW("$NETTOYER.ECRAN"),L=$L(NN) I $E(CH,P,(P+L)-1)=NN S VERBAN="$NETTOYER.ECRAN",TYPVER="ACTION",PARLIS="" G ^%ANVERB
 
 G ACT2^%AN16B
 
ACTI1 S %COMPIL=""
 G DEPIL^%ANGEPIL

