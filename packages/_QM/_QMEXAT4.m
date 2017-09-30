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

;%QMEXAT4^INT^1^59547,73878^0
%QMEXAT4 ;;09:53 AM  16 Jan 1993; 16 Jan 93  9:12 AM ; 26 Mar 93  3:41 PM
 
COMPGEN(ATN) 
 S GLO="^[QUI]RQSGLO(""ATN"")"
 S @GLO@(ATN,"UCONT",1)=$$^%QZCHW("reseau")
 S @GLO@(ATN,"UCONT",1,"COM")=$$^%QZCHW("modifification du reseau")
 S @GLO@(ATN,"UCONT",1,"ROUT")="RESEAU^%QMEXAT4"
 S @GLO@(ATN,"GETCARA","VISIBLE")="$$VISIBLE^%QMEXCAR("""_ATN_""")"
 S @GLO@(ATN,"GETCARA","SUPETU")="$$SUPETU^%QMEXCAR("""_ATN_""")"
 
 S @GLO@(ATN,"UCONT",2)=$$^%QZCHW("contexte")
 S @GLO@(ATN,"UCONT",2,"COM")=$$^%QZCHW("valeur actuelle des attributs")
 S @GLO@(ATN,"UCONT",2,"ROUT")="CTXTE^%QMEXAT4"
 Q
 
RESEAU(ATN) 
 D EDITE^%QMEXO1(ATN)
 S REAFF=1
 Q
CTXTE(ATN) 
 D MEMX^%QCAMEM
 K (QUI,WHOIS)
 D CURRENT^%IS,VARSYS^%QCSAP
 D ^%QSMOVIS
 D RMEMX^%QCAMEM
 S REAFF=1,MODG=0
 Q

