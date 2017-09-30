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

;TOERRZE^INT^1^59768,79741^0
TOERRZE ;
 
 N ZE K ^DOLARZE($I)
 S ZE=$ZE
 ;HL I '(DTM) S PROG=$P($ZE,">",2),PROG="^"_$P(PROG,"^",2),ADERROR="RETERR"_PROG,%EXPLIC=1,^DOLARZE($I)=ZE
 ;HL I DTM S PROG=$P(ZE,">",2),PROG="^"_$P(PROG,"^",2),ADERROR="RETERR"_PROG,%EXPLIC=1,(ZE,^DOLARZE($I))=$$^%SYSBUG($ZERR)_$P(ZE,">",2)
 S PROG=$P($ZE,">",2),PROG="^"_$P(PROG,"^",2),ADERROR="RETERR"_PROG,%EXPLIC=1,^DOLARZE($I)=ZE
 
 I (ZE["UNDEFINED")!(ZE["DIVIDE") G FIN
 D CLEPAG^%VVIDEO
TRAC I $D(^ABANDON($I,NUFA)) G H
 S ^ABANDON($I,NUFA)=1 D ^%QMDAK0 S RR=^[QUI]TREEWORK(NUFA,0),AA=$P(RR,"^",4),AAA=$P(AA,"/",1),RAA=$P(AA,"/",2,299)
 D ZD^%QMDATE4 W $$^%QZCHW("Un instant...") D ^TOET S %ABEND=1,%EXPLIC=0,^ERREXEC(QUI,AAA,NUFA)=ZE_"#"_%DAT_"#"_HEURE_"#"_RAA_"#"_$S($D(SOURCE):SOURCE,1:"")
 S DXG=10,DXD=30,DYH=7,DYB=11,GRAPH=1,MSG=$$^%QZCHW("ABANDON !") D TO4^%VZCD
 S DX=20,DY=13 X XY W $$^%QZCHW("Desole ! ") I '($D(SOURCE)) W $$^%QZCHW("Je ne peux vous en dire plus....") G FIN
 W $$^%QZCHW("Erreur detectee en cours d'analyse de : "),!,!,?15,SOURCE S END="END" D ADR2^TOERRIMP I BATCH=0 W !,!,"[RETURN] " R *RET
FIN K PROG,RR,AA,AAA,RAA Q
H 
 D ^%VZEAVT($$^%QZCHW("erreur definitive detectee en cours d'analyse")_" : "_NUFA)
 H

