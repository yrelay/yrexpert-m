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

;%QSQUES3^INT^1^59547,73883^0
QSQUES3 ;
 
 
 
 
 
 I BASE="" D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Veuillez definir Repertoire en premier ...") H 3 D POCLEPA^%VVIDEO Q
 D ^%QULIMO(0,6,50,6,"VAR",.NOLV,"UCA^%QSQUES3(1)","UCS^%QSQUES3")
 S DEJAVARI=$D(VAR) D POCLEPA^%VVIDEO Q
 
UCA(BOOL) 
 N BACO,CH,I,J,LOC,POSIT,T,SAVY1,SX,SY,TETE,VA,VPER,%PROVEN,ATTD,APPD
 S SX=DX,SY=DY,SAVY1=Y1,POSIT=1,%PROVEN="RQS",(ATTD,APPD)=0
 S ^SANAREQ($J)=1
 I BOOL D INIT^%AN7(SX,SY) S TETE=$$VAL^%QULIMO("TETE") G SUIT
 D INIT2^%AN7(SX,SY) S TETE=VAR(P1C,"TETE")
SUIT G:TETE="" SUCA
 S T=$$RED^%ANA(TETE,"LVAR") F I=1:1 S J=$P(T,",",I) Q:J=""  K LVAR(J)
 D KILLB^%ANA(TETE)
 
SUCA S T=Y1,OK=$$L1^%AN13(T,.POSIT,.TETE)
 I '(OK) G:'(ERRMES) FINOK D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Erreur de syntaxe ...") H 3 D POCLEPA^%VVIDEO G FINOK
 G SUITOK
FINOK K ^SANAREQ($J) D END^%AN7,KILLB^%ANA(TETE) S Y1=SAVY1 Q
SUITOK D SET^%ANA(TETE,"LVAR","")
 
 
 
 
 K LOC S OK=1 D C1($$RED^%ANA(TETE,1))
 I '(OK) D END^%AN7,KILL^%ANA(TETE) S Y1=SAVY1 K ^SANAREQ($J) Q
 S VA="",VPER="",OK=1 D C2($$RED^%ANA(TETE,2))
 I '(OK) D END^%AN7,KILL^%ANA(TETE) S Y1=SAVY1 K ^SANAREQ($J) Q
 S BACO=$S(VA="":$$NOMINT^%QSF(BASE),1:LVAR(VA)),CH="",VA=BACO
 S OK=1 D C3($$RED^%ANA(TETE,2))
 I '(OK) D END^%AN7,KILL^%ANA(TETE) S Y1=SAVY1 K ^SANAREQ($J) Q
 S LOC=-1,I="" F J=0:0 S LOC=$N(LOC(LOC)) Q:LOC=-1  S LBA(LOC)=BACO,LVAR(LOC)=BACO,I=I_LOC_","
 D SET^%ANA(TETE,"CHEMIN",CH)
 D SET^%ANA(TETE,"CIBLE",VA)
 D SET^%ANA(TETE,"BASE",BACO)
 D SET^%ANA(TETE,"LVAR",$E(I,1,$L(I)-1))
 I VPER'="" D SET^%ANA(TETE,"PERE",VPER)
 I '(BOOL) S VAR(P1C,"TETE")=TETE G SUITFIN
 D AFF^%QULIMO("TETE",TETE)
SUITFIN D END^%AN7
 S Y1=SAVY1 K ^SANAREQ($J) Q
 
 
C1(TA) G @("C1"_$E($$RED^%ANA(TA,"TYPE"),1,3))
C1VAR N V S V=$$RED^%ANA(TA,"TEXTE") I $D(LVAR(V)) D:ERRMES ^%VZEAVT($$^%QZCHW("L'individu intermediaire ")_V_$$^%QZCHW(" a deja ete utilise")) S OK=0 Q
 S LOC(V)="" Q
C1LIS D C1($$RED^%ANA(TA,1)) Q:'(OK)  D C1($$RED^%ANA(TA,2)) Q
 
C2(TA) Q:TA=0  G @("C2"_$E($$RED^%ANA(TA,"TYPE"),1,3))
C2CHE D C2($$RED^%ANA(TA,1)) Q:'(OK)  D C2($$RED^%ANA(TA,2)) Q
C2LIE D C2($$RED^%ANA(TA,1)) Q
C2ATT D C2($$RED^%ANA(TA,3)) Q
C2VAR N V S V=$$RED^%ANA(TA,"TEXTE")
 I $D(LVAR(V))&$D(LOC(V)) D:ERRMES ^%VZEAVT($$^%QZCHW("Vous ne pouvez pas utiliser l'individu ")_V_$$^%QZCHW(" ainsi")) S OK=0 Q
 I '($D(LVAR(V))) D:ERRMES ^%VZEAVT(V_$$^%QZCHW(" est inconnu")) S OK=0 Q
 S VA=V,VPER=V Q
 
C3(TA) Q:TA=0  G @("C3"_$E($$RED^%ANA(TA,"TYPE"),1,3))
C3CHE D C3($$RED^%ANA(TA,1)) Q:'(OK)  D C3($$RED^%ANA(TA,2)) Q
C3LIE D C3($$RED^%ANA(TA,1)) Q
C3ATT D C3($$RED^%ANA(TA,3)),C3($$RED^%ANA(TA,1)) Q
C3VAR S BACO=LVAR($$RED^%ANA(TA,"TEXTE")) Q
C3NOM N V S V=$$RED^%ANA(TA,"TEXTE") I $D(LVAR(V)) S BACO=LVAR(V) Q
 I '($D(^[QUI]RQSLIEN(BACO,V))) D:ERRMES ^%VZEAVT($$^%QZCHW("L'attribut ")_V_$$^%QZCHW(" n'est pas un lien")) S OK=0 Q
 S CH=V,BACO=$P(^[QUI]RQSLIEN(BACO,V),"^",2) Q
 
UCS N I,J,L,T
 
 S T=$$VAL^%QULIMO("TETE"),L=$$RED^%ANA(T,"LVAR")
 F I=1:1 S J=$P(L,",",I) Q:J=""  I $D(UTIL(J)) D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW("Impossible, un critere de selection en a besoin ...") H 3 D POCLEPA^%VVIDEO G ERRS
 F I=1:1 S J=$P(L,",",I) Q:J=""  K LVAR(J)
 D KILL^%ANA(T) S OK=1 Q
ERRS S OK=0 Q
 
M(M) Q:'(ERRMES)  D ^%VZEAVT(M) Q

