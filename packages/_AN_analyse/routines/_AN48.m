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

;%AN48^INT^1^59547,73865^0
AN48 ;
 
 
 
 
 
 
M(M) Q:'(ERRMES)  D POCLEPA^%VVIDEO,^%VSQUEAK W $$^%QZCHW(M) H 2 D POCLEPA^%VVIDEO Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
LEC1 S P=P+1 D LEC^%AN7,CAR Q
 
 
INDLIE 
 K @(TEMPO)
 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="V1"
 D EMPV^%ANGEPIL(TEMPO)
 
 F I=1:1:$L($$^%QZCHW("$NOM.INDIVIDU.LIEN"))+1 D LEC
 
 D EMPIL^%ANGEPIL("INDLI1^%AN48") G EXPRESS^%AN4
INDLI1 
 I RESULT=0 G DEPIL^%ANGEPIL
 S V1=$$NEW^%ANA D SET^%ANA(V1,1,NORES)
 D CAR
 
 I C'=";" D M(""";"" "_$$^%QZCHW("manquant apres le nom du premier individu")),KILL^%ANA(V1) S RESULT=0 G DEPIL^%ANGEPIL
 
 D LEC
 D EMPIL^%ANGEPIL("INDLI2^%AN48") G EXPRESS^%AN4
INDLI2 
 I RESULT=0 D KILL^%ANA(V1) G DEPIL^%ANGEPIL
 D SET^%ANA(V1,2,NORES)
 D CAR
 
 I C'=";" D M(""";"" "_$$^%QZCHW("manquant apres le nom du lien")),KILL^%ANA(V1) S RESULT=0 G DEPIL^%ANGEPIL
 
 D LEC
 D EMPIL^%ANGEPIL("INDLI3^%AN48") G EXPRESS^%AN4
INDLI3 
 I RESULT=0 D KILL^%ANA(V1) G DEPIL^%ANGEPIL
 D SET^%ANA(V1,3,NORES)
 D CAR
 
 I C'=")" D M(""")"" "_$$^%QZCHW("manquant apres le nom du second individu")),KILL^%ANA(V1) S RESULT=0 G DEPIL^%ANGEPIL
STOTYP 
 S NORES=V1 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$NOM.INDIVIDU.LIEN")
 
 D LEC
 G DEPIL^%ANGEPIL
 
ATTRIB 
 K @(TEMPO)
 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="REP",@TEMPO@(3)="IND",@TEMPO@(4)="VAL"
 S @TEMPO@(5)="ATTR",@TEMPO@(6)="ORD"
 D EMPV^%ANGEPIL(TEMPO)
 S (REP,IND,ATTR,VAL,ORD)=0
 
 F I=1:1:$L($$^%QZCHW("$ATTRIBUER"))+1 D LEC
 
 D EMPIL^%ANGEPIL("ATTRIB1^%AN48") G EXPRESS^%AN4
ATTRIB1 
 I RESULT=0 G DEPIL^%ANGEPIL
 S REP=NORES
 D CAR
 
 I C'=";" D M(""";"" "_$$^%QZCHW("manquant apres le reperrtoire")) G ATTRERR
 
 D LEC
 D EMPIL^%ANGEPIL("ATTRIB2^%AN48") G EXPRESS^%AN4
ATTRIB2 
 G:RESULT=0 ATTRERR
 S IND=NORES
 D CAR
 
 I C'=";" D M(""";"" "_$$^%QZCHW("manquant apres l'individu")) G ATTRERR
 
 D LEC
 D EMPIL^%ANGEPIL("ATTRIB3^%AN48") G EXPRESS^%AN4
ATTRIB3 
 G:RESULT=0 ATTRERR
 S ATTR=NORES
 D CAR
 
 I C'=";" D M(""";"" "_$$^%QZCHW("manquant apres l'attribut")) G ATTRERR
 
 D LEC
 D EMPIL^%ANGEPIL("ATTRIB4^%AN48") G EXPRESS^%AN4
ATTRIB4 
 G:RESULT=0 ATTRERR
 S VAL=NORES
 D CAR
 G:C=")" ATTRFIN
 
 I C'=";" D M(""";"" "_$$^%QZCHW("manquant apres l'individu")) G ATTRERR
 
 D LEC
 D EMPIL^%ANGEPIL("ATTRIB5^%AN48") G EXPRESS^%AN4
ATTRIB5 
 G:RESULT=0 ATTRERR
 S ORD=NORES
 D CAR
 
 I C'=")" D M(""")"" "_$$^%QZCHW("manquant apres le no d'ordre")) G ATTRERR
ATTRFIN S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$ATTRIBUER")
 D SET^%ANA(NORES,1,REP),SET^%ANA(NORES,2,IND),SET^%ANA(NORES,3,ATTR)
 D SET^%ANA(NORES,4,VAL),SET^%ANA(NORES,5,ORD)
 
 D LEC
 G DEPIL^%ANGEPIL
ATTRERR 
 D KILL^%ANA(REP),KILL^%ANA(IND),KILL^%ANA(ATTR),KILL^%ANA(VAL),KILL^%ANA(ORD)
 S RESULT=0
 G DEPIL^%ANGEPIL

