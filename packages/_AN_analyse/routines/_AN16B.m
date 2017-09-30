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

;%AN16B^INT^1^59547,73865^0
%AN16B ;
 
 
 
 
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
ACT2 
 
 S NN=$$^%QZCHW("$NETTOYER.ECRAN"),L=$L(NN) I $E(CH,P,(P+L)-1)=NN S VERBAN="$NETTOYER.ECRAN",TYPVER="ACTION",PARLIS="" G ^%ANVERB
 S NN=$$^%QZCHW("$PARCOURIR.LIEN"),L=$L(NN) I $E(CH,P,P+L)=(NN_"(") S VERBAN="$PARCOURIR.LIEN",TYPVER="ACTION",PARLIS="VARTEMP/VARTEMP/VARTEMP/EXPR/~VARTEMP/EXPR/~EXPR/~EXPR" G ^%ANVERB
 S NN=$$^%QZCHW("$PARCOURIR.LIEN.CONCLUSION"),L=$L(NN) I $E(CH,P,P+L)=(NN_"(") S VERBAN="$PARCOURIR.LIEN.CONCLUSION",TYPVER="ACTION",PARLIS="EXPR" G ^%ANVERB
 S NN=$$^%QZCHW("$PARCOURIR.NOMENCLATURE"),L=$L(NN) I $E(CH,P,P+L)=(NN_"(") S VERBAN="$PARCOURIR.NOMENCLATURE",TYPVER="ACTION",PARLIS="VARTEMP/VARTEMP/VARTEMP/VARTEMP/LIAISON/EXPR/~EXPR/~EXPR/~EXPR" G ^%ANVERB
 S NN=$$^%QZCHW("$PARCOURIR.VALEURS"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") POURVAL^%AN24
 S NN=$$^%QZCHW("$PARTAGER.EXECUTION"),L=$L(NN) I $E(CH,P,P+L)=(NN_"(") S VERBAN="$PARTAGER.EXECUTION",TYPVER="ACTION",PARLIS="EXPR" G ^%ANVERB
 S NN=$$^%QZCHW("$PARTITIONNER"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") PART^%AN39
 S NN=$$^%QZCHW("$PASSERELLE.ENTREE"),L=$L(NN) G:$E(CH,P,(P+L)-1)=NN PASSI^%AN61
 S NN=$$^%QZCHW("$PASSERELLE.SORTIE"),L=$L(NN) G:$E(CH,P,(P+L)-1)=NN PASSO^%AN61
 S NN=$$^%QZCHW("$PAUSE"),L=$L(NN) I $E(CH,P,P+L)=(NN_"(") S VERBAN="$PAUSE",TYPVER="ACTION",PARLIS="~EXPR" G ^%ANVERB
 S NN=$$^%QZCHW("$POINT.COLLECTION"),L=$L(NN) G:$E(CH,P,(P+L)-1)=NN POINT^%AN62
 S NN=$$^%QZCHW("$PORT"),L=$L(NN) G:$E(CH,P,(P+L)-1)=NN PORT^%AN58
 S NN=$$^%QZCHW("$PROLOGUE"),L=$L(NN) G:$E(CH,P,(P+L)-1)=NN PROLOG^%AN40
 S NN=$$^%QZCHW("$QUEMANDER"),L=$L(NN) G:$E(CH,P,(P+L)-1)=NN QUEMAND^%AN45
 S NN=$$^%QZCHW("$REAFFICHER"),L=$L(NN) G:$E(CH,P,(P+L)-1)=NN REA^%AN28
 S NN=$$^%QZCHW("$RECUPERER.VALEURS"),L=$L(NN) I $E(CH,P,P+L)=(NN_"(") S VERBAN="$RECUPERER.VALEURS",TYPVER="ACTION",PARLIS="EXPR/EXPR/~EXPR/~EXPR" G ^%ANVERB
 S NN=$$^%QZCHW("$RELACHER.SEMAPHORE"),L=$L(NN) I $E(CH,P,P+L)=(NN_"(") S VERBAN="$RELACHER.SEMAPHORE",TYPVER="ACTION",PARLIS="EXPR" G ^%ANVERB
 S NN=$$^%QZCHW("$RENOMMER"),L=$L(NN) I $E(CH,P,P+L)=(NN_"(") S VERBAN="$RENOMMER",TYPVER="ACTION",PARLIS="EXPR/EXPR/EXPR" G ^%ANVERB
 S NN=$$^%QZCHW("$REPETER"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") BOUCLER^%AN40
 S NN=$$^%QZCHW("$RESTAURER.DONNEES"),L=$L(NN) I $E(CH,P,P+L)=(NN_"(") S VERBAN="$RESTAURER.DONNEES",TYPVER="ACTION",PARLIS="EXPR/EXPR" G ^%ANVERB
 S NN=$$^%QZCHW("$RETIRERL"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") SUPINDL^%AN27
 S NN=$$^%QZCHW("$RETIRER.OBJET"),L=$L(NN) G:$E(CH,P,(P+L)-1)=NN RETOBJ^%AN62
 S NN=$$^%QZCHW("$SAISIR"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") SAISIR^%AN59
 S NN=$$^%QZCHW("$SAISIR.ATTRIBUTS.MULTIVALUES"),L=$L(NN)
 I $E(CH,P,P+L)=(NN_"(") S VERBAN="$SAISIR.ATTRIBUTS.MULTIVALUES",TYPVER="ACTION",PARLIS="EXPR/EXPR/EXPR/EXPR/EXPR/EXPR/EXPR/EXPR/~EXPR/~EXPR/~EXPR/~EXPR/~EXPR" G ^%ANVERB
 S NN=$$^%QZCHW("$SAISIR.MULTIPLE"),L=$L(NN) I $E(CH,P,P+L)=(NN_"(") S VERBAN="$SAISIR.MULTIPLE",TYPVER="ACTION",PARLIS="EXPR/EXPR/~EXPR/~EXPR" G ^%ANVERB
 S NN=$$^%QZCHW("$SOMME"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") SOMME^%AN43
 S NN=$$^%QZCHW("$SORTIR.BOUCLE"),L=$L(NN) G:$E(CH,P,(P+L)-1)=NN ARRET^%AN14
 S NN=$$^%QZCHW("$SUPPRIMER.ELEMENT"),L=$L(NN) G:$E(CH,P,(P+L)-1)=NN RETELE^%AN63
 S NN=$$^%QZCHW("$SUPPRIMER.OBJET"),L=$L(NN) G:$E(CH,P,(P+L)-1)=NN SUPOBJ^%AN61
 S NN=$$^%QZCHW("$SUPPRIMER.COLLECTION"),L=$L(NN) G:$E(CH,P,(P+L)-1)=NN SUPCOL^%AN62
 S NN=$$^%QZCHW("$TEXTE.NOTE"),L=$L(NN) I $E(CH,P,P+L)=(NN_"(") S VERBAN="$TEXTE.NOTE",TYPVER="ACTION",PARLIS="EXPR/EXPR/~EXPR" G ^%ANVERB
 S NN=$$^%QZCHW("$TOTALISER"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") TOTAL^%AN43
 S NN=$$^%QZCHW("$TOTEML"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") TOTEML^%AN38
 S NN=$$^%QZCHW("$TRACER"),L=$L(NN) I $E(CH,P,P+L)=(NN_"(") S VERBAN="$TRACER",TYPVER="ACTION",PARLIS="~EXPR/~EXPR/~EXPR/~EXPR" G ^%ANVERB
 S NN=$$^%QZCHW("$TRAITER"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") TRAITER^%AN23
 S NN=$$^%QZCHW("$TRAITERL"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") TRAITL^%AN28
 S NN=$$^%QZCHW("$TRANSFERT.TODKBMS"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") TRANSTD^%AN40
 S NN=$$^%QZCHW("$TRANSFERER.SAISIE"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") TRASAI^%AN58
 S NN=$$^%QZCHW("$TRIERL"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") TRIER^%AN31
 S NN=$$^%QZCHW("$VALORISER"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") VALI^%AN41
 S NN=$$^%QZCHW("$VALORISERL"),L=$L(NN) G:$E(CH,P,P+L)=(NN_"(") VALOL^%AN41
 S NN=$$^%QZCHW("$WAIT"),L=$L(NN) I $E(CH,P,P+L)=(NN_"(") S VERBAN="$WAIT",TYPVER="ACTION",PARLIS="EXPR" G ^%ANVERB
 D M("Action inconnue ...") K @(TEMPO)
 D EMPV^%ANGEPIL(TEMPO) S RESULT=0
 
ACTI1 S %COMPIL=""
 G DEPIL^%ANGEPIL

