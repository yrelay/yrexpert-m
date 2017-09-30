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

;%AN41^INT^1^59547,73865^0
AN41 ;
 
 
 
 
 
 
 
 
 
 
 
M(M) Q:'(ERRMES)  D ^%VZEAVT($$^%QZCHW(M)) Q
CAR S C=$E(CH,P,P) D AFF^%AN7(C) Q
LEC N B F B=0:0 S P=P+1 D LEC^%AN7,CAR Q:C'=" "
 Q
 
VALOL 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="LIST",@TEMPO@(3)="AREC",@TEMPO@(4)="ATT",@TEMPO@(5)="NATT" D EMPV^%ANGEPIL(TEMPO)
 S (AREC,ATT,LIST)=0
 F I=1:1:$L($$^%QZCHW("$VALORISERL")) D LEC
 D CAR I C'="(" D M("Une ( etait attendue apres $VALORISERL") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("VALO1^%AN41") G ATTRIBUT^%AN3
VALO1 G:RESULT=0 ERVALO
 S AREC=NORES
 D CAR
 I C'=";" D M("Un ; etait attendu apres l'attribut resultat") G ERVALO
 D LEC,EMPIL^%ANGEPIL("VALO2^%AN41") G ATTRIBUT^%AN3
VALO2 G:RESULT=0 ERVALO
 S ATT=NORES
 S NATT=$$RED^%ANA($$RED^%ANA(ATT,1),"TEXTE")
 I $E(NATT,1)="%" D M("Le nom de l'attribut ne doit pas commencer par %") G ERVALO
 D CAR I C=")" S LIST=0 G FVALO
 I C'=";" D M("Un ; etait attendu apres le nom de l'attribut") G ERVALO
 D LEC,EMPIL^%ANGEPIL("VALO3^%AN41") G EXPRESS^%AN4
VALO3 G:RESULT=0 ERVALO
 S LIST=NORES
 D CAR
 I C'=")" D M("Une ) etait attendue a la fin de $VALORISERL") G ERVALO
FVALO D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$VALORISERL")
 D SET^%ANA(NORES,1,AREC),SET^%ANA(NORES,2,ATT),SET^%ANA(NORES,3,LIST)
 G DEPIL^%ANGEPIL
ERVALO S RESULT=0 D KILL^%ANA(AREC),KILL^%ANA(ATT),KILL^%ANA(LIST)
 G DEPIL^%ANGEPIL
 
VALI 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="AREC",@TEMPO@(3)="ATT",@TEMPO@(4)="NATT" D EMPV^%ANGEPIL(TEMPO)
 S (AREC,ATT)=0
 F I=1:1:$L($$^%QZCHW("$VALORISER")) D LEC
 D CAR I C'="(" D M("Une ( etait attendue apres $VALORISER") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("VALI1^%AN41") G ATTRIBUT^%AN3
VALI1 G:RESULT=0 ERVALI
 S AREC=NORES
 D CAR
 I C'=";" D M("Un ; etait attendu apres l'attribut resultat") G ERVALI
 D LEC,EMPIL^%ANGEPIL("VALI2^%AN41") G ATTRIBUT^%AN3
VALI2 G:RESULT=0 ERVALI
 S ATT=NORES
 S NATT=$$RED^%ANA($$RED^%ANA(ATT,1),"TEXTE")
 I $E(NATT,1)="%" D M("Le nom de l'attribut ne doit pas commencer par %") G ERVALI
 D CAR
 I C'=")" D M("Une ) etait attendue a la fin de $VALORISER") G ERVALI
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","ACTION"),SET^%ANA(NORES,"TEXTE","$VALORISER")
 D SET^%ANA(NORES,1,AREC),SET^%ANA(NORES,2,ATT)
 G DEPIL^%ANGEPIL
ERVALI S RESULT=0 D KILL^%ANA(AREC),KILL^%ANA(ATT)
 G DEPIL^%ANGEPIL
 
SEMAI 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="DAT" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$SEMAINE")) D LEC
 D CAR I C'="(" D M("Une ( etait attendue apres $SEMAINE") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("SEM1^%AN41") G EXPRESS^%AN4
SEM1 I RESULT=0 G DEPIL^%ANGEPIL
 S DAT=NORES
 D CAR
 I C'=")" D M("Une ) etait attendue a la fin de $SEMAINE") S RESULT=0 D KILL^%ANA(DAT) G DEPIL^%ANGEPIL
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$SEMAINE")
 D SET^%ANA(NORES,1,DAT)
 G DEPIL^%ANGEPIL
 
MOIS 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="DAT" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$MOIS")) D LEC
 D CAR I C'="(" D M("Une ( etait attendue apres $MOIS") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("MOIS1^%AN41") G EXPRESS^%AN4
MOIS1 I RESULT=0 G DEPIL^%ANGEPIL
 S DAT=NORES
 D CAR
 I C'=")" D M("Une ) etait attendue a la fin de $MOIS") S RESULT=0 D KILL^%ANA(DAT) G DEPIL^%ANGEPIL
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$MOIS")
 D SET^%ANA(NORES,1,DAT)
 G DEPIL^%ANGEPIL
 
TRIM 
 K @(TEMPO) S @TEMPO@(1)="I",@TEMPO@(2)="DAT" D EMPV^%ANGEPIL(TEMPO)
 F I=1:1:$L($$^%QZCHW("$TRIMESTRE")) D LEC
 D CAR I C'="(" D M("Une ( etait attendue apres $TRIMESTRE") S RESULT=0 G DEPIL^%ANGEPIL
 D LEC,EMPIL^%ANGEPIL("TRIM1^%AN41") G EXPRESS^%AN4
TRIM1 I RESULT=0 G DEPIL^%ANGEPIL
 S DAT=NORES
 D CAR
 I C'=")" D M("Une ) etait attendue a la fin de $TRIMESTRE") S RESULT=0 D KILL^%ANA(DAT) G DEPIL^%ANGEPIL
 D LEC
 S NORES=$$NEW^%ANA
 D SET^%ANA(NORES,"TYPE","FONCTION"),SET^%ANA(NORES,"TEXTE","$TRIMESTRE")
 D SET^%ANA(NORES,1,DAT)
 G DEPIL^%ANGEPIL

