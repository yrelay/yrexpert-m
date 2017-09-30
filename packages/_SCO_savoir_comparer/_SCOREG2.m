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

;%SCOREG2^INT^1^59547,73888^0
SCOREG2 ;
 
 
 
 
 
UCA(BOOL) N P,I,J,L1,RESULT,L2,L3,LL1,POSIT,SAVY1,CH,SX,SY,T,NORES,%COMPIL,TEMPO
 N %PROVEN,NOCOMPIL,ATTD,APPD,LVAR
 S %PROVEN="RQS",SAVY1=Y1,POSIT=1,SX=DX,SY=DY,CH=Y1,%COMPIL="BIDON POUR REQUETES"
 S NOCOMPIL=1,(ATTD,APPD)=0,(LVAR("REFERENCE"),LVAR("CIBLE"))=""
 S ^SANAREQ($J)=1
 I BOOL D INIT^%AN7(SX,SY) S NORES=$$VAL^%QULIMO("TETE") G SUIT
 D INIT2^%AN7(SX,SY)
 S NORES=CONT(P1C,"TETE")
SUIT G:NORES="" L0
 
 D KILLB^%ANA(NORES)
 
L0 D INIT^%ANGEPIL S NORES=0,RESULT=1,CH=Y1,P=1
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMPO)
 S @TEMPO@(1)="C" D EMPV^%ANGEPIL(TEMPO)
 S I=1
BOUC S C=$E(CH,I) I C=" " S I=I+1 G BOUC
 N LIB,LL
 D EMPIL^%ANGEPIL("LRET^%SCOREG2")
 S LIB=$$^%QZCHW("$EXISTE"),LL=$L(LIB)
 
 I ($E(CH,I,(I+LL)-1)=LIB)!(C="'") G CRIT^%AN4
 
 S LIB=$$^%QZCHW("$POURCENT"),LL=$L(LIB)
 I $E(CH,I,(I+LL)-1)=LIB G CRIT^%AN4
 
 G CRITERE^%AN5
 
LRET I '(RESULT) G:'(ERRMES) ERRA D MES($$^%QZCHW("Erreur de syntaxe")_" ...") G ERRA
 S L3=0 D CVAR2(NORES)
 S I=-1 F J=0:0 S I=$N(L3(I)) Q:I=-1  I I'="@",'($D(LVAR(I))) G:'(ERRMES) ERRA D MES(I_" "_$$^%QZCHW("incorrect")_" ...") G ERRA
 D CAR^%AN1
 I C'="" D M^%AN1("Caracteres en trop a la fin de la phrase ..."),M^%AN1("Erreur de syntaxe ... ") G ERRA
 I '(BOOL) S CONT(P1C,"TETE")=NORES G FINENDA
 I BOOL D AFF^%QULIMO("TETE",NORES)
FINENDA D END^%AN7
 S OK=1,Y1=SAVY1
 D EPIL^%ANGEPIL
 K @(TEMPO),^SANAREQ($J)
 Q
ERRA D END^%AN7,KILL^%ANA(NORES)
 S OK=0,Y1=SAVY1,DX=SX,DY=SY
 D EPIL^%ANGEPIL
 K @(TEMPO),^SANAREQ($J)
 Q
 
UCS 
 N TETE
 S TETE=$$VAL^%QULIMO("TETE")
 D KILL^%ANA(TETE)
 S OK=1
 Q
 
CVAR2(T) Q:T=0
 G @($E($$RED^%ANA(T,"TYPE"),1,5)_2)
 
COMPA2 D CVAR2($$RED^%ANA(T,1)),CVAR2($$RED^%ANA(T,2)),CVAR2($$RED^%ANA(T,3)) Q
OPERA2 D CVAR2($$RED^%ANA(T,1)),CVAR2($$RED^%ANA(T,2)) Q
ATTRI2 N VA S VA=$$RED^%ANA(T,3)
 Q:VA=0
 D CVAR2(VA) Q
VARIA2 N NOM S NOM=$$RED^%ANA(T,"TEXTE")
VARIAS S:'($D(L3(NOM))) L3=L3+1,L3(NOM)="" Q
NOM2 N NOM S NOM=$$RED^%ANA(T,"TEXTE")
NOM2S S:'($D(L3(NOM))) L3=L3+1,L3(NOM)="" Q
NOMBR2 Q
CHAIN2 Q
COUPL2 Q
NEGAT2 D CVAR2($$RED^%ANA(T,1)) Q
FONCT2 N I
 F I=1:1 Q:'($$EXIFILS^%ANA(T,I))  D CVAR2($$RED^%ANA(T,I))
 Q
AFFEC2 D CVAR2($$RED^%ANA(T,2)) Q
 
 
MES(M) D POCLEPA^%VVIDEO,^%VSQUEAK W M H 3 D POCLEPA^%VVIDEO Q

