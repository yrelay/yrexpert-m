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

;%TLBAREG^INT^1^59547,74028^0
%TLBAREG ;
 K @(TEMPO) S @TEMPO@(1)="COND",@TEMPO@(2)="ACTI",@TEMPO@(3)="TYP"
 S @TEMPO@(4)="EXP",@TEMPO@(5)="POS",@TEMPO@(6)="NOM",@TEMPO@(7)="ROUT"
 S @TEMPO@(8)="NOEUACT",@TEMPO@(9)="TETE",@TEMPO@(10)="GLOSTO"
 D EMPV^%ANGEPIL(TEMPO)
 
 I ABANDON!HALT G FREGLE
 I (MODAF=1)!(MODAF=2) D POCLEPA^%VVIDEO
 S ECHEC=0,DEBRAN=""
 S GLOSTO="^[QUI]TTL(TRT,2)"
 I '($D(@GLOSTO@(NUMRG))) G FREGLE
 S TETE=@GLOSTO@(NUMRG,"TETE")
 S COND=$$RED(TETE,1)
 S ACTI=$$RED(TETE,2)
 S TYP=$$RED(ACTI,"TYPE")
 I TYP="COMMENT" S ECHEC=-1 G MESREG
 I (MODAF'=0)&(MODEX'=3) D ADD^%TLIFEN("ACT",@GLOSTO@(NUMRG))
 I ((COND=0)!(EXEC=3))!(MODEX=3) G ACTION
 
 
CONDIT D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW(" * Evaluation partie condition"))
 
 S EXP=$$SUBST^%ANARBR2(COND,.CXT,"ATT^%TLIACT3",.POS)
 I POS=0 D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Impossible evaluer la partie condition")) S ECHEC=1 G MESREG
 
 I EXP=0 D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Partie condition fausse")) S ECHEC=1 G MESREG
 
 D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW("  Partie condition vraie"))
 
ACTION 
 I MODEX=3 S NOEUACT=$S($D(@GLOETD@(NIVEAU,"ACTION")):@GLOETD@(NIVEAU,"ACTION"),1:2),ACTI=$$RED(TETE,NOEUACT) G BOUCACT
 D:MODAF'=0 ADD^%TLIFEN("LOG",$$^%QZCHW(" * Activation partie action"))
 S NOEUACT=2
BOUCACT 
 S NOM=$$RED(ACTI,"TEXTE")
 
 I NOM="$TRAITER" S ROUT="TRAITER^%TLBAAC2" G TROUVE
 I NOM="$TRAITERL" S ROUT="TRAITER^%TLBAAC2" G TROUVE
 I NOM="$ITERER" S ROUT="ITER^%TLBAAC1" G TROUVE
 I NOM="$ITERERVAL" S ROUT="ITERVAL^%TLBAAC1" G TROUVE
 
 I NOM="$PARCOURIR.LIEN" S ROUT="PLIEN^%TLBAACA" G TROUVE
 I NOM="$PARCOURIR.NOMENCLATURE" S ROUT="PNOM^%TLBAACN" G TROUVE
 I NOM="$PARCOURIR.VALEURS" S ROUT="ITERVAL^%TLBAAC1" G TROUVE
 I NOM="$REPETER" S ROUT="BOUCLER^%TLBAAC3" G TROUVE
 I NOM="$AUSCULTER" S ROUT="AUSCUL^%TLBAAC2" G TROUVE
 I NOM="$ALLER.A" S ROUT="ALLER^%TLBAAC3" G TROUVE
 D ACTION^%TLIACT3 G RETAC3
TROUVE 
 D EMPIL^%ANGEPIL("RETACT^%TLBAREG") G @ROUT
RETACT 
 I (MODAF=3)&(('(ABANDON))&('(HALT))) D LLINE^%TLBAIF
RETAC3 
 D PA^%QSGESTI(CXT("%","BASE"),CXT("%","OBJET"),"%NOM.TRAITEMENT.COURANT",TRT,1)
 S NOEUACT=NOEUACT+1,ACTI=$$RED(TETE,NOEUACT)
 I ((((ACTI'=0)&('(ABANDON)))&('(ARRET)))&('(STOP)))&('(HALT)) G BOUCACT
 I ABANDON!HALT S @GLOETD@(NIVEAU,"ACTION")=NOEUACT-1
MESREG 
 I ABANDON!(MODAF'=2) G FREGLE
 I ECHEC=1 D ADD^%TLIFEN("LOG",$$^%QZCHW(" la regle a echoue"))
 I ECHEC=0 D ADD^%TLIFEN("LOG",$$^%QZCHW(" la regle a reussi"))
FREGLE 
 G DEPIL^%ANGEPIL
 
 
RED(N,A) Q:'($D(^[QUI]ANSA(N,A))) $S(A?.N:0,1:"") Q ^[QUI]ANSA(N,A)
 ;
 ;

