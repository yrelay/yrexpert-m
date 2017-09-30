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

;%AN9^INT^1^59547,73866^0
AN9 ;
 
 
 
 
 
M(M) Q:'(ERRMES)
 D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
 
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
 
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
MODELE(CH) 
 N TEMPO,RESULT,NORES,CO,I,L,N,P
 N %COMPCOMP,%COMP1,%COMP2,%COMP3,%COMP4,%COMP5,%NEG,%GDX
 N %I,LET,MET,NOCOMPIL
 K ^SANAREQ($J)
 S (ATTD,APPD,APPEX)=0
 S MET=$$^%QZCHW("ET"),LET=$L(MET)
 S NOCOMPIL=0
 S P=1,TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),""),%GDX="OUI"
 D CAR I C=":" S %COMPIL=";" Q 1
 K @(TEMPO)
 S %COMPCOMP=""
 S RESULT=1,NORES="" D INIT^%ANGEPIL
 S N=$$^%QZCHW("SI"),L=$L(N),CO=0 G:$E(CH,P,(P+L)-1)'=N SM
 D EMPIL^%ANGEPIL("MOD1^%AN9") G CONDIT^%AN4
MOD1 I RESULT=0 K @(TEMPO) D EPIL^%ANGEPIL Q 0
 S CO=NORES
 S %COMPCOMP=%COMPIL
SM D CAR,EMPIL^%ANGEPIL("FM^%AN9")
 S %COMPIL=""
 G ACTI:C="$",AFFECT^%AN8:C="%"
 D M("Erreur de syntaxe... "),EPIL^%ANGEPIL,KILL^%ANA(CO)
 K @(TEMPO) Q 0
FM I RESULT=0 D KILL^%ANA(CO),EPIL^%ANGEPIL K @(TEMPO) Q 0
 D CAR
 I ($L(%COMPCOMP)+$L(%COMPIL))>500 D M("Cette phrase est trop longue et ne peut-etre compilee"),KILL^%ANA(NORES),KILL^%ANA(CO),EPIL^%ANGEPIL K @(TEMPO) Q 0
 I $E(CH,P,(P+LET)-1)'=MET S %COMPCOMP=%COMPCOMP_%COMPIL G FM2
 S %COMPCOMP=%COMPCOMP_%COMPIL_" "
 F %I=1:1:LET D LEC
 G SM
FM2 I ":"'[C D M("Erreur de syntaxe en fin de ligne ..."),KILL^%ANA(NORES),KILL^%ANA(CO),EPIL^%ANGEPIL K @(TEMPO) Q 0
 S %COMPIL=%COMPCOMP
 D KILL^%ANA(CO),KILL^%ANA(NORES),EPIL^%ANGEPIL
 K @(TEMPO) Q 1
 
ACTI 
 K @(TEMPO) S @TEMPO@(1)="C",@TEMPO@(2)="N",@TEMPO@(3)="L"
 D EMPV^%ANGEPIL(TEMPO),EMPIL^%ANGEPIL("ACTI1^%AN9")
 S NORES=0
 S N=$$^%QZCHW("$ADRESSE"),L=$L(N) G:$E(CH,P,P+L)=(N_"(") ADRESSE^%AN38
 S N=$$^%QZCHW("$ALIGNER"),L=$L(N) G:$E(CH,P,(P+L)-1)=N ALIGNER^%AN14
 S N=$$^%QZCHW("$ALLER.A"),L=$L(N) G:$E(CH,P,P+L)=(N_"(") ALLER^%AN44
 S N=$$^%QZCHW("$AUSCULTER"),L=$L(N) G:$E(CH,P,P+L)=(N_"(") ITEATT^%AN43
 S N=$$^%QZCHW("$CADRE"),L=$L(N) G:$E(CH,P,P+L)=(N_"(") CADRE^%AN19
 S N=$$^%QZCHW("$CADRER.TEXTE"),L=$L(N) G:$E(CH,P,P+L)=(N_"(") CADTXT^%AN55
 S N=$$^%QZCHW("$CODE.BARRE"),L=$L(N) G:$E(CH,P,(P+L)-1)=N CODBAR^%AN67
 S N=$$^%QZCHW("$DESSINER.SCENE"),L=$L(N) G:$E(CH,P,(P+L)-1)=N DESSIN^%AN65
 S N=$$^%QZCHW("$ETIQUETTE"),L=$L(N) G:$E(CH,P,(P+L)-1)=N ETIQ^%AN14
 S N=$$^%QZCHW("$FIN"),L=$L(N) G:$E(CH,P,(P+L)-1)=N FIN^%AN14
 S N=$$^%QZCHW("$FORMAT"),L=$L(N) G:$E(CH,P,(P+L)-1)=N FORMAT^%AN23
 S N=$$^%QZCHW("$HACHURER.FORT"),L=$L(N) G:$E(CH,P,(P+L)-1)=N HACHURF^%AN42
 S N=$$^%QZCHW("$HACHURER"),L=$L(N) G:$E(CH,P,(P+L)-1)=N HACHUR^%AN42
 S N=$$^%QZCHW("$IMPRIMER.NOTE"),L=$L(N) G:$E(CH,P,(P+L)-1)=N NOTE^%AN46
 S N=$$^%QZCHW("$INDIVIDU"),L=$L(N) G:$E(CH,P,(P+L)-1)=N INDIV^%AN45
 S N=$$^%QZCHW("$MODELE"),L=$L(N) G:$E(CH,P,(P+L)-1)=N MODELE^%AN23
 S N=$$^%QZCHW("$NOMBRE.COPIES"),L=$L(N) G:$E(CH,P,(P+L)-1)=N COPY^%AN67
 S N=$$^%QZCHW("$PAGE"),L=$L(N) G:$E(CH,P,(P+L)-1)=N PAGE^%AN14
 S N=$$^%QZCHW("$PARCOURIR.VALEURS"),L=$L(N) G:$E(CH,P,(P+L)-1)=N POURVAL^%AN24
 S N=$$^%QZCHW("$POUR"),L=$L(N) G:$E(CH,P,(P+L)-1)=N POUR^%AN24
 S N=$$^%QZCHW("$PLACERP"),L=$L(N) G:$E(CH,P,(P+L)-1)=N PLACERP^%AN14
 S N=$$^%QZCHW("$PLACERD"),L=$L(N) G:$E(CH,P,(P+L)-1)=N PLACERD^%AN14
 S N=$$^%QZCHW("$PLACER"),L=$L(N) G:$E(CH,P,(P+L)-1)=N PLACER^%AN14
 S N=$$^%QZCHW("$REPETER"),L=$L(N) G:$E(CH,P,P+L)=(N_"(") BOUCLER^%AN40
 S N=$$^%QZCHW("$SELECTIONNER.BAC"),L=$L(N) G:$E(CH,P,(P+L)-1)=N BAC^%AN57
 S N=$$^%QZCHW("$TRAIT"),L=$L(N) G:$E(CH,P,P+L)=(N_"(") TRAIT^%AN8
 S N=$$^%QZCHW("$TRAITER"),L=$L(N) G:$E(CH,P,(P+L)-1)=N TRAITER^%AN23
 D M("Cette fonction n'est pas admise.")
 K @(TEMPO) D EMPV^%ANGEPIL(TEMPO)
 S RESULT=0
ACTI1 G DEPIL^%ANGEPIL

