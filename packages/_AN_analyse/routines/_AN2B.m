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

;%AN2B^INT^1^59547,73865^0
%AN2B ;
 
 
 
 
 
M(M) Q:'(ERRMES)
 D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
 
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
 
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
LEC1 S P=P+1 D LEC^%AN7,CAR Q
 
FONC2 
 S NF=$$^%QZCHW("$ABAQUE"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF ABAQ^%AN29
 S NF=$$^%QZCHW("$ARCHIVER.DONNEES"),L=$L(NF) I $E(CH,P,(P+L)-1)=NF S VERBAN="$ARCHIVER.DONNEES",TYPVER="FONCTION",PARLIS="EXPR/EXPR/EXPR/EXPR/~EXPR" G ^%ANVERB
 S NF=$$^%QZCHW("$AJOUTER.DELAI"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF AJDEL^%AN58
 S NF=$$^%QZCHW("$AJOUTER.HEURES.DELAI"),L=$L(NF) I $E(CH,P,(P+L)-1)=NF S VERBAN="$AJOUTER.HEURES.DELAI",TYPVER="FONCTION",PARLIS="EXPR/EXPR/EXPR" G ^%ANVERB
 S NF=$$^%QZCHW("$ALEAL"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF ALEAL^%AN35
 S NF=$$^%QZCHW("$ARRONDIR"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF ARROND^%AN17
 S NF=$$^%QZCHW("$CHOISIR"),L=$L(NF) I $E(CH,P,(P+L)-1)=NF S VERBAN="$CHOISIR",TYPVER="FONCTION",PARLIS="EXPR/EXPR/EXPR/EXPR/EXPR/EXPR" G ^%ANVERB
 S NF=$$^%QZCHW("$COMPARER"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF COMPAR^%AN57
 
 S NF=$$^%QZCHW("$COMPLEMENT"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF COMPL^%AN30
 S NF=$$^%QZCHW("$CONSULTATION.ASSOCIATIVE"),L=$L(NF) I $E(CH,P,(P+L)-1)=NF S VERBAN="$CONSULTATION.ASSOCIATIVE",TYPVER="FONCTION",PARLIS="EXPR/EXPR/~EXPR" G ^%ANVERB
 S NF=$$^%QZCHW("$CONVERTIR.PERIODE.EN.DATE"),L=$L(NF) I $E(CH,P,(P+L)-1)=NF S VERBAN="$CONVERTIR.PERIODE.EN.DATE",TYPVER="FONCTION",PARLIS="EXPR/EXPR/EXPR/EXPR" G ^%ANVERB
 S NF=$$^%QZCHW("$CONVERTIR.DATE.EN.PERIODE"),L=$L(NF) I $E(CH,P,(P+L)-1)=NF S VERBAN="$CONVERTIR.DATE.EN.PERIODE",TYPVER="FONCTION",PARLIS="EXPR/EXPR/EXPR/~EXPR" G ^%ANVERB
 S NF=$$^%QZCHW("$COPIERL"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF COP^%AN31
 S NF=$$^%QZCHW("$CREER.DROITE"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF DROITE^%AN63
 S NF=$$^%QZCHW("$CREER.POINT"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF POINT^%AN64
 S NF=$$^%QZCHW("$CREER.ARC"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF ARC^%AN64
 S NF=$$^%QZCHW("$CREER.CERCLE"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF CERCLE^%AN63
 S NF=$$^%QZCHW("$CREER.ELLIPSE"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF ELLI^%AN64
 S NF=$$^%QZCHW("$CREER.DEMIE.ELLIPSE"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF ELLI^%AN64
 S NF=$$^%QZCHW("$CREER.FLECHE"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF FLECHE^%AN65
 S NF=$$^%QZCHW("$CREER.RACCORDEMENT"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF RACCOR^%AN65
 S NF=$$^%QZCHW("$CREER.TEXTE"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF TEXTE^%AN64
 S NF=$$^%QZCHW("$DERNIER.INDICE"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF DERNI^%AN53
 S NF=$$^%QZCHW("$EQUILIBRER"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF EQUI^%AN52
 S NF=$$^%QZCHW("$EVALUER"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF EVALUER^%AN47
 S NF=$$^%QZCHW("$EXAMINER.REPERTOIRES"),L=$L(NF) I $E(CH,P,(P+L)-1)=NF S VERBAN="$EXAMINER.REPERTOIRES",TYPVER="FONCTION",PARLIS="" G ^%ANVERB
 S NF=$$^%QZCHW("$HISTOGRAMME"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF HISTO^%AN37
 S NF=$$^%QZCHW("$INTERSECTION"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF INTER^%AN30
 S NN=$$^%QZCHW("$JALONNER"),L=$L(NN) G:$E(CH,P,(P+L)-1)=NN JALON^%AN57
 S NF=$$^%QZCHW("$MENTAILLE"),L=$L(NF) I $E(CH,P,(P+L)-1)=NF S VERBAN="$MENTAILLE",TYPVER="FONCTION",PARLIS="EXPR/EXPR/EXPR/EXPR" G ^%ANVERB
 S NF=$$^%QZCHW("$MESSAGE"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF MESSAG^%AN29
 S NF=$$^%QZCHW("$MOIS"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF MOIS^%AN41
 S NF=$$^%QZCHW("$PARCOURIR.LIEN.INITIALISATION"),L=$L(NF) I $E(CH,P,(P+L)-1)=NF S VERBAN="$PARCOURIR.LIEN.INITIALISATION",TYPVER="FONCTION",PARLIS="EXPR/EXPR/EXPR/ADRESSE/EXPR/EXPR/EXPR/~EXPR/~EXPR/~EXPR/~EXPR/~EXPR" G ^%ANVERB
 S NF=$$^%QZCHW("$PARCOURIR.LIEN.SEQUENCE"),L=$L(NF) I $E(CH,P,(P+L)-1)=NF S VERBAN="$PARCOURIR.LIEN.SEQUENCE",TYPVER="FONCTION",PARLIS="EXPR/EXPR/EXPR/ADRESSE/ADRESSE" G ^%ANVERB
 S NF=$$^%QZCHW("$PLANIFIER"),L=$L(NF) I $E(CH,P,(P+L)-1)=NF S VERBAN="$PLANIFIER",TYPVER="FONCTION",PARLIS="EXPR/EXPR/EXPR/EXPR/~EXPR" G ^%ANVERB
 S NF=$$^%QZCHW("$POPER"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF POPER^%AN59
 S NF=$$^%QZCHW("$PREDICAT"),L=$L(NF) I $E(CH,P,(P+L)-1)=NF S VERBAN="$PREDICAT",TYPVER="FONCTION",PARLIS="EXPR/~EXPR/~VARTEMP" G ^%ANVERB
 S NF=$$^%QZCHW("$PREMIER.INDICE"),L=$L(NF) I $E(CH,P,(P+L)-1)=NF S VERBAN="$PREMIER.INDICE",TYPVER="FONCTION",PARLIS="ADRESSE" G ^%ANVERB
 S NF=$$^%QZCHW("$PRENDRE.SEMAPHORE"),L=$L(NF) I $E(CH,P,(P+L)-1)=NF S VERBAN="$PRENDRE.SEMAPHORE",TYPVER="FONCTION",PARLIS="EXPR/EXPR" G ^%ANVERB
 S NF=$$^%QZCHW("$REQUETE"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF REQ^%AN30
 S NF=$$^%QZCHW("$RETRANCHER.DELAI"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF RETDEL^%AN58
 S NF=$$^%QZCHW("$RETRANCHER.HEURES.DELAI"),L=$L(NF) I $E(CH,P,(P+L)-1)=NF S VERBAN="$RETRANCHER.HEURES.DELAI",TYPVER="FONCTION",PARLIS="EXPR/EXPR/EXPR" G ^%ANVERB
 S NF=$$^%QZCHW("$RESOUDRE"),L=$L(NF) I $E(CH,P,(P+L)-1)=NF S VERBAN="$RESOUDRE",TYPVER="FONCTION",PARLIS="EXPR/EXPR/EXPR/EXPR" G ^%ANVERB
 S NF=$$^%QZCHW("$RETROUVER.NUMERO.D.EQUIPE"),L=$L(NF) I $E(CH,P,(P+L)-1)=NF S VERBAN="$RETROUVER.NUMERO.D.EQUIPE",TYPVER="FONCTION",PARLIS="EXPR/EXPR/EXPR" G ^%ANVERB
 S NF=$$^%QZCHW("$SEMAINE"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF SEMAI^%AN41
 S NF=$$^%QZCHW("$SUBSTITUER"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF SUBST^%AN22
 S NF=$$^%QZCHW("$TRIMESTRE"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF TRIM^%AN41
 S NF=$$^%QZCHW("$UNION"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF UNION^%AN30
 S NF=$$^%QZCHW("$VALEURL"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF VALR^%AN31
FONC0 D M("Fonction inconnue ...")
 K @(TEMPO) D EMPV^%ANGEPIL(TEMPO) S RESULT=0
FONC1 S:NOCOMPIL=1 %COMPIL=""
 G DEPIL^%ANGEPIL

