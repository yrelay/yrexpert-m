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

;%SDSYMB^INT^1^59547,73889^0
SDSYMB(CAR,XO,YO,TAILLE,%PORT,%TERM) 
 
 
 
 
DEB 
 I '($D(^[QUI]SDSYMBO(CAR))) Q
 N SAVECO
 S SAVECO=ECHO
 N SYM,TL,NUM,LIG,ST
 S ECHO=(SAVECO*TAILLE)*1E-1
 S SYM=CAR
 
 S ST="^[QUI]SDSYMBC(SYM)"
 S NUM=""
ELEM S NUM=$O(@ST@(NUM)) I NUM="" G FIN
 S TL=$$TYPL($$TYPE(SYM,NUM))
 S LIG=""
LIG S LIG=$O(@ST@(NUM,LIG)) I LIG="" G ELEM
 X @ST@(NUM,LIG)
 G LIG
 
FIN S ECHO=SAVECO
 Q
 
TYPL(TL) 
 N T
 S T=$S(TL="INVISIBLE":"I",TL="MIXTE":"M",TL="POINT":"P",TL="COURT":"C",TL="LONG":"L",1:"F")
 Q T
 
TYPE(SYM,EL) 
 Q $$ZSUBST^%QZCHSUB($$GETLBLAN^%VTLBLAN($P(^[QUI]SDSYMBT(SYM,EL),";",4)),"""","")

