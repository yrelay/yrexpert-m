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

;TORQXMA^INT^1^59547,74875^0
TORQXMA(LISTE,AB) 
 
 
 
 
 
 
 
 
 
 
 N I,LLISTE,REP,LCRIT,REQUETE,LETUDE,LLISAD,LTRANSF,CTR,TEMP,LILA
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S LILA=$$CONCAS^%QZCHAD(TEMP,"LILA")
 
 S REQUETE="%LISTES DE TRANSFERT"
 S REP="LISTE"
 S LCRIT(1)="$EXISTE(DATE.ETUDE.TOTEM)"
 S LCRIT(1,"TETE")=0
 D SUPPRIME^%QSINTER(REQUETE,1)
 S LLISTE=$$CREER^%QSINTE(REQUETE,REP,"",.LCRIT,"")
 
 S LLISAD=$$ADRLIS^%QSGEST7(LLISTE)
 
 S LTRANSF=$$CHOIX^%QS0SEL1(LLISAD,$$^%QZCHW("Quelle liste de transfert ?"))
 I LTRANSF="" D DEL^%QSGES11(LLISTE),FIN Q 1
 
 S REQUETE="%LISTE D'ETUDES"
 S REP=$$RI^TORQXIN
 K LCRIT
 S LCRIT(1)="LISTE="_LTRANSF
 S LCRIT(1,"TETE")=0
 D SUPPRIME^%QSINTER(REQUETE,1)
 S LETUDE=$$CREER^%QSINTE(REQUETE,REP,"",.LCRIT,"")
 
 D LATT^TORQXPA(LILA)
 D ADD^%QMLILA("%ATTRIBUTS D'UNE ETUDE",LILA)
 
 
 
 
A D CHOIXIND^%QS0LECR(LETUDE,LILA,0,2,LISTE,.CTR,0)
 
 D DEL^%QSGES11(LLISTE)
 D DEL^%QSGES11(LTRANSF)
 I CTR'="" D FIN Q 1
 D FIN Q 0
 
FIN K @(TEMP)
 
TEST S LISTE="^TUTU"
 D ^TORQXMA(LISTE,.AB)
 Q
TESTI D CRE^TORQXIN("TOT_NO_ETUDE","P0","7543L01,BDE","BDE:66/88/","RAS","RQS88030192")
 Q

