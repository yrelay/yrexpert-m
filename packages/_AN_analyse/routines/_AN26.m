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

;%AN26^INT^1^59547,73865^0
AN26 ;
 
 
 
 
 
 
 
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
ITERER K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="V1",@TEMPO@(3)="V2",@TEMPO@(4)="V3",@TEMPO@(5)="V4",@TEMPO@(6)="VIA" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$ITERER"))+1 D LEC
 D EMPIL^%ANGEPIL("ITERER0^%AN26") G VARTEMP^%AN3
ITERER0 G:RESULT=0 DEPIL^%ANGEPIL S V1=NORES
 D CAR
 I C'=";" D M("Un "";"" apres la variable ..."),KILL^%ANA(V1) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("ITERER1^%AN26") G VARTEMP^%AN3
ITERER1 I RESULT=0 D KILL^%ANA(V1) G DEPIL^%ANGEPIL
 D CAR S V2=NORES
 I C'=";" D M("Une "";"" apres la variable numero d'ordre ..."),KILL^%ANA(V1),KILL^%ANA(V2) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("ITERER2^%AN26") G ATTRIBUT^%AN3
ITERER2 I RESULT=0 D KILL^%ANA(V1),KILL^%ANA(V2) G DEPIL^%ANGEPIL
 D CAR S V3=NORES
 I C'=";" D M("Une "";"" apres le chemin ..."),KILL^%ANA(V1),KILL^%ANA(V2),KILL^%ANA(V3) S RESULT=0 G DEPIL^%ANGEPIL
 S VIA=$$RED^%ANA(V3,2) G:VIA=0 ITERER3
 S ATL=$$RED^%ANA(V3,1),LV=$$RED^%ANA(ATL,"TEXTE")
 I (LV="LIEN")!(LV="INVERSE") S LV=LV_"."_$$RED^%ANA(VIA,"TEXTE") D SET^%ANA(ATL,"TEXTE",LV),SET^%ANA(V3,2,0),KILL^%ANA(VIA) G ITERER3
 D M("Pas d'indice dans le chemin ... "),KILL^%ANA(V1),KILL^%ANA(V2),KILL^%ANA(V3) S RESULT=0 G DEPIL^%ANGEPIL
ITERER3 
 S VIA=$$RED^%ANA(V3,3) G:VIA=0 ITERER4 S VIA=$$RED^%ANA(VIA,"TEXTE") G:VIA="" ITERER4
 I $E(VIA)'="%" D M("Le ""^"" doit etre suivi d'une variable ou ne pas exister ... "),KILL^%ANA(V1),KILL^%ANA(V2),KILL^%ANA(V3) S RESULT=0 G DEPIL^%ANGEPIL
ITERER4 D LEC,EMPIL^%ANGEPIL("ITERER5^%AN26") G CHAINE^%AN1
ITERER5 I RESULT=0 D M("Une chaine etait attendue ... "),KILL^%ANA(V1),KILL^%ANA(V2),KILL^%ANA(V3) G DEPIL^%ANGEPIL
 D CAR S V4=NORES
 I C'=")" D M("Il manque une "")"" ..."),KILL^%ANA(V1),KILL^%ANA(V2),KILL^%ANA(V3),KILL^%ANA(V4) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$ITERER")
 D SET^%ANA(NORES,1,V1),SET^%ANA(NORES,2,V2),SET^%ANA(NORES,3,V3),SET^%ANA(NORES,4,V4) G DEPIL^%ANGEPIL
 
DATET 
 K @(TEMPO) S @TEMPO@(1)="A1",@TEMPO@(2)="I1",@TEMPO@(3)="I22",@TEMPO@(4)="I",@TEMPO@(5)="A2",A2=0 D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$DATET")) D LEC
 D CAR I C'="(" D M(" Une ""("" etait attendue apres $DATET") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("DATET1^%AN26") G ATTRIBUT^%AN3
DATET1 G:RESULT=0 DEPIL^%ANGEPIL S A1=NORES
 D CAR I C'=";" D M(" Un "";"" apres l'attribut..."),KILL^%ANA(A1) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("DATET2^%AN26") G EXPRESS^%AN4
DATET2 G:RESULT=0 DEPIL^%ANGEPIL S I1=NORES
 D CAR I C'=";" D M(" Un "";"" apres le 1er format..."),KILL^%ANA(I1) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("DATET3^%AN26") G EXPRESS^%AN4
DATET3 G:RESULT=0 DEPIL^%ANGEPIL S I22=NORES
 D CAR G:C=")" DATFIN I C'=";" D M(" Un "";"" apres le 2eme format...ou une "")"" comme fin de $DATET "),KILL^%ANA(I22) S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("DATET4^%AN26") G ATTRIBUT^%AN3
DATET4 G:RESULT=0 DEPIL^%ANGEPIL S A2=NORES
 D CAR I C'=")" D M(" Une "")"" etait attendue a la fin de $DATET..."),KILL^%ANA(A2) S RESULT=0 G DEPIL^%ANGEPIL
DATFIN D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$DATET"),SET^%ANA(NORES,1,A1),SET^%ANA(NORES,2,I1),SET^%ANA(NORES,3,I22),SET^%ANA(NORES,4,A2)
 G DEPIL^%ANGEPIL
 
 
COMMEN S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","COMMENT"),SET^%ANA(NORES,"TEXTE",CH)
 G RET^%ANGEPIL
 ;

