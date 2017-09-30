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

;JALLIRE^INT^1^59547,74867^0
JALLIRE(IDAR,IDOD,IDOF,OP) 
 
 
 
 
 
 
 
 
 
 
 
 N I,ID,ARTICLE,COMPOSANT,OPERATION,JAL,FIN,OFFSET
 S ARTICLE=$$^%QSCALVA($$ART^JALRPJ,IDAR,$$GA^JALRPJ) Q:ARTICLE=""
 S COMPOSANT=IDAR_","_ARTICLE,FIN=0
 S:IDOD="" OFFSET=0 S:IDOD'="" OFFSET=IDOD-1
 F I=1:1 D STO Q:((I+OFFSET)=IDOF)!FIN
 S OP=OFFSET
 Q
STO S OPERATION=$$VALOR^%QSGEST6($$GAMME^JALRPJ,COMPOSANT,$$GO^JALRPJ,I+OFFSET) I OPERATION="" S FIN=1 Q
 S OP(I)=OPERATION
 S OP(I,0)=$$^%QSCALVA($$OP^JALRPJ,COMPOSANT_","_OPERATION,"MACHINE")
 S JAL=$$^%QSCALVA($$OP^JALRPJ,COMPOSANT_","_OPERATION,"DATE.JALON")
 S:JAL'="" OP(I,1)=$$DH31^%QMDATE(JAL)
 Q
TEST K OP
 D JALLIRE("5206K01",5,9,.OP)
 Q

