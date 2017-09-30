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

;%LXIQ^INT^1^59547,73870^0
LEXIQ(ROUTAFF) 
 
 
 
 
 
 
 
 
 
EXT 
 N REP
DEB D POCLEPA^%VVIDEO W $$^%QZCHW(" (L)exique/(C)onsultation breve/[RETURN] ") R *REP:^TOZE($I,"ATTENTE") S:REP=-1 REP=13
 S REP=$C(REP) G:REP=$$^%QZCHW("C") BREV G:REP=$$^%QZCHW("L") LEX
 G FIN
FIN I $A(REP)=13 D POCLEPA^%VVIDEO Q
FIN1 D:ROUTAFF'="" @ROUTAFF
 D POCLEPA^%VVIDEO Q
 
BREV 
 D CLEPAG^%VVIDEO,80^%VVIDEO
 D ^%LXCONS
 G FIN1
 
LEX 
 N TEMPO,I,%I,TLEX
 S TEMPO=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"GLOB") K @(TEMPO)
 F I="MOD","Y1","P1","LI","PL","P" I $D(@I) S @TEMPO@(I)=@I
 S TLEX(1)=PCH
 D CLEPAG^%VVIDEO,POINT^%VAJOUT("LEXIQUE","TLEX")
 S I="" F %I=0:0 S I=$O(@TEMPO@(I)) Q:I=""  S @I=@TEMPO@(I)
 G FIN1
 
 
 
 
LEXI 
 N MOD,Y1,P1,LI,PL,P
 D CLEPAG^%VVIDEO,^%VAJOUT("LEXIQUE") Q
 
CONS 
 D ^%LXCONS Q
 
 
AFF(MOT) 
 S ^MOT($J)=MOT
 D ^%VZEATT
 D MEM^%QCAMEM
 D ^%VCLEVAR
 S MOT=^MOT($J)
 K ^MOT($J)
 S RES(1)=MOT
 G:'($D(^[QUI]TOLEX(MOT))) AFFG
 S RES=^[QUI]TOLEX(MOT)
 F %I=1:1:7 S RES(%I+1)=$P(RES,"^",%I)
 G AFFG2
AFFG F %I=2:1:8 S RES(%I)=""
AFFG2 D AFFICH^%VACTGRQ("LEXIQUE",.RES)
 K
 D RMEM^%QCAMEM
 Q
 ;

