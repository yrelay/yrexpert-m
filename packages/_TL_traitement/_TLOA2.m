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

;%TLOA2^INT^1^59547,74030^0
%TLOA2 ;;06:15 PM  24 Apr 1992; ; 03 May 93  7:07 PM
 
 
 
 
 
 
 
 
 
 
REQUET(IDEB,NBREG) 
 N LPARAM,IPAR,VAL,NBPAR
 
 S LPARAM=$$TEMP^%SGUTIL
 S IPAR=1,NBPAR=NBREG-2
 F IPAR=1:1:NBPAR I $D(^[QUI]RQS1(V(IDEB),"PARAMETRES",IPAR)) S @LPARAM@(^[QUI]RQS1(V(IDEB),"PARAMETRES",IPAR))=V((IDEB+IPAR)+1)
 I $$GET^%SGVAR("ECR") D POCLEPA^%VVIDEO
 S VAL=$$ACTIVEP^%QSINTER(V(IDEB),V(IDEB+1),$S(NBPAR:LPARAM,1:""))
 K @(LPARAM)
 
 Q VAL
 
 
EXISTE(IDEB,NBREG) 
 
 
 
 
 
 
 
 I V(IDEB+5)=$C(0) Q $S(V(IDEB+2)=$C(0):$$AIR^%QSGE5(V(IDEB+3),V(IDEB+4),V(IDEB+1)),1:$$OAIR^%QSGE5(V(IDEB+3),V(IDEB+4),V(IDEB+1),V(IDEB+2)))
 I V(IDEB+2)'=$C(0) Q $$OVAIR^%QSGE5(V(IDEB+3),V(IDEB+4),V(IDEB+1),V(IDEB+5),V(IDEB+2))
 Q $$VAIR^%QSGE5(V(IDEB+3),V(IDEB+4),V(IDEB+1),V(IDEB+5))
 ;

