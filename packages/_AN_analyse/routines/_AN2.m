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

;%AN2^INT^1^59547,73865^0
%AN2 ;
 
 
 
 
 
 
 
 
 
 
 
 
M(M) Q:'(ERRMES)
 D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
 
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
 
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
LEC1 S P=P+1 D LEC^%AN7,CAR Q
 
FONCTION 
 K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(3)="L",@TEMPO@(4)="NF" D EMPV^%ANGEPIL(TEMPO)
 S NORES=0 D CAR
 G:$$^%QCAZG("^SANAREQ($J)")'=1 FONCTS
 
 S NF=$$^%QZCHW("$PARAM"),L=$L(NF) I $E(CH,P,(P+L)-1)=NF D EMPIL^%ANGEPIL("FONC1^%AN2") G FPARAM^%AN18
 D M("Fonction non autorisee lors de la definition d'une requete ...")
 S RESULT=0 G DEPIL^%ANGEPIL
FONCTS 
 I C'="$" D M("Une fonction commence toujours par un $ ...") S RESULT=0 G DEPIL^%ANGEPIL
 D EMPIL^%ANGEPIL("FONC1^%AN2")
 S NF=$$^%QZCHW("$ABS"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF ABS^%AN49
 S NF=$$^%QZCHW("$ACQUERIR"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF ACQU^%AN44
 S NF=$$^%QZCHW("$ALEAN"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF ALEAN^%AN44
 S NF=$$^%QZCHW("$ARCSIN"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF ARCSIN^%AN33
 S NF=$$^%QZCHW("$ARCOS"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF ARCOS^%AN33
 S NF=$$^%QZCHW("$ARCOTG"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF ARCOTG^%AN49
 S NF=$$^%QZCHW("$ARCTG"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF ARCTG^%AN32
 S NF=$$^%QZCHW("$CHRONOMETRE"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF CHRONO^%AN32
 S NF=$$^%QZCHW("$COS"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF COS^%AN33
 S NF=$$^%QZCHW("$COTG"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF COTG^%AN33
 S NF=$$^%QZCHW("$CREER.SYNONYME"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF CRESYN^%AN56
 S NF=$$^%QZCHW("$DATE"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF DATE^%AN10
 S N=$$^%QZCHW("$ENCOMBREMENT.NOTE"),L=$L(N) G:$E(CH,P,(P+L)-1)=N ENCOMBR^%AN46
 S NF=$$^%QZCHW("$EQUIVALENT"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF EQU^%AN12
 S NF=$$^%QZCHW("$EVALUER"),L=$L(NF) I $E(CH,P,(P+L)-1)=NF S VERBAN="$EVALUER",TYPVER="FONCTION",PARLIS="EXPR/EXPR/~EXPR/~EXPR" G ^%ANVERB
 S NF=$$^%QZCHW("$EXP"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF EXP^%AN32
 S NF=$$^%QZCHW("$FORMATER.NOMBRE"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF FOMAT^%AN59
 S NF=$$^%QZCHW("$HEURE"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF HEURE^%AN10
 S NF=$$^%QZCHW("$JUSTIFIER"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF JUST^%AN17
 S NF=$$^%QZCHW("$LN"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF LOGN^%AN49
 S NF=$$^%QZCHW("$LOG"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF LOG^%AN49
 S NF=$$^%QZCHW("$LONGUEUR"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF LONG^%AN17
 S NF=$$^%QZCHW("$MAJOR"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF MAJOR^%AN35
 S NF=$$^%QZCHW("$MAJUSCULE"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF MAJ^%AN55
 S NF=$$^%QZCHW("$MAX"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF MAX^%AN35
 S NF=$$^%QZCHW("$MINOR"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF MINOR^%AN35
 S NF=$$^%QZCHW("$MINUSCULE"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF MIN^%AN55
 S NF=$$^%QZCHW("$MIN"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF MIN^%AN35
 S NF=$$^%QZCHW("$NETTOYER"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF NETTOY^%AN17
 S NF=$$^%QZCHW("$NOMBRE.D.OUVRABLES.ENTRE.DATES"),L=$L(NF) I $E(CH,P,(P+L)-1)=NF S VERBAN="$NOMBRE.D.OUVRABLES.ENTRE.DATES",TYPVER="FONCTION",PARLIS="EXPR/EXPR/~EXPR" G ^%ANVERB
 S NF=$$^%QZCHW("$NOM.INDIVIDU.LIEN"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF INDLIE^%AN48
 S NF=$$^%QZCHW("$NOM.UTILISATEUR"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF VARUSER^%AN33
 S NF=$$^%QZCHW("$NOM"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF FNOM^%AN18
 S NF=$$^%QZCHW("$PARTIE"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF FPAR^%AN18
 S NF=$$^%QZCHW("$PUIS"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF PUIS^%AN32
 S NF=$$^%QZCHW("$SIN"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF SINUS^%AN33
 S NF=$$^%QZCHW("$SQR"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF SQR^%AN32
 S NF=$$^%QZCHW("$SQ"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF SQ^%AN32
 S NF=$$^%QZCHW("$SSCH"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF FSSCH^%AN18
 S NF=$$^%QZCHW("$SYNONYME"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF SYN^%AN56
 S NF=$$^%QZCHW("$TG"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF TANG^%AN32
 S NF=$$^%QZCHW("$TROUVER"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF TROUV^%AN17
 G:NOCOMPIL=0 FONTXT
 S %COMPIL=""
 G:$D(^NAVARACT($J)) FONC0
 
 G FONC2^%AN2B
 
FONC0 D M("Fonction inconnue ...")
 K @(TEMPO) D EMPV^%ANGEPIL(TEMPO) S RESULT=0
FONC1 S:NOCOMPIL=1 %COMPIL=""
 G DEPIL^%ANGEPIL
 
FONTXT 
 G:$$^%QCAZG("%PROVEN")'="SD" FONC0
 S NF=$$^%QZCHW("$SYMBOLE"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF SYMB^%AN60
 G:HB=1 FONC0
 S NF=$$^%QZCHW("$HAUT"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF HAUT^%AN60
 S NF=$$^%QZCHW("$BAS"),L=$L(NF) G:$E(CH,P,(P+L)-1)=NF BAS^%AN60
 G FONC0

