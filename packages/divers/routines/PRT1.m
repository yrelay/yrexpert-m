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

;PRT1^INT^1^59547,74868^0
PRT1 ;
 
 
 
 
 
METTLER(NUMPT,ORDRE,GLORES) 
 N TIMOUT,VX,NOK
 
 S TIMOUT=1
 S $ZT="ERRMET^PRT1"
 O NUMPT::TIMOUT E  G ERRMETT
 S $ZT=""
 
 F I=1:1 U NUMPT R VX:TIMOUT W *
 
 U NUMPT W !,ORDRE,!
 
 S NOK=0 F I=1:1 U PT R RES(I):TIMOUT W *
 
 S MAXI=I-1 F J=1:1:MAXI S @GLORES@(J)=RES(J)
 C PT
 Q 1
TEST 
 S @GLORES@(1)="ES"
 I ORDRE="S" S @GLORES@(2)="",@GLORES@(3)="S     125,14   G  " Q 1
 I ORDRE="ID" S @GLORES@(3)="AAA",@GLORES@(5)="BBB",@GLORES@(7)="CCC",(@GLORES@(4),@GLORES@(6),@GLORES@(2))="" Q 1
 I ORDRE="T" Q 1
ERRMET 
 S $ZT=""
 Q 0
 
 
 
 
 
 
INITCAPT 
 D INITMET
 Q
 
INITMET 
 S ^CAPTEUR("METTLER","TARE","COMMENT",1)="tare : on recupere dans TEMPRES(1) la valeur ES inutile"
 S ^CAPTEUR("METTLER","TARE")="S OKLEC=1-DTM S:OKLEC OKLEC=$$METTLER^PRT1(NUMPT,""T"",TEMPRES)"
 S ^CAPTEUR("METTLER","POIDS","COMMENT",1)="poids : la valeur est dans TEMPRES(3) format: 4->12 poids avec la virgule comme separateur decimal"
 S ^CAPTEUR("METTLER","POIDS","COMMENT",2)=" unite de 14 a 17"
 S ^CAPTEUR("METTLER","POIDS")="S OKLEC=1-DTM S:OKLEC OKLEC=$$METTLER^PRT1(NUMPT,""S"",TEMPRES) S:OKLEC VAR1=$TR($TR($E(@TEMPRES@(3),4,12),"" "",""""),"","","".""),VAR2=$TR($E(@TEMPRES@(3),14,17),""  "","""")"
 S ^CAPTEUR("METTLER","IDENT","COMMENT",1)="identification : 3 infos stockees dans TEMPRES de 3,5 et 7"
 S ^CAPTEUR("METTLER","IDENT")="S OKLEC=1-DTM S:OKLEC OKLEC=$$METTLER^PRT1(NUMPT,""ID"",TEMPRES) S:OKLEC VAR1=@TEMPRES@(3),VAR2=@TEMPRES@(5),VAR3=@TEMPRES@(7)"
 Q
 ;

