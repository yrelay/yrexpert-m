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

;LKWRIT^INT^1^59547,74868^0
LKYWRIT(BASE,IND,DATA,BLK,BLKI) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N ATT,I,VAL,TYPE,J,OR,ERR,ATTI,VA
 S ATTI=$O(@DATA@(BASE,"D",""))
 S @BLK@(BLKI)=$$FORMAT^LKZFORM("*DEBUT"_$$NOMLOG^%QSF(BASE),@DATA@(BASE,"L")),BLKI=BLKI+1
 F I=0:0 Q:ATTI=""  D T1 S ATTI=$O(@DATA@(BASE,"D",ATTI))
 S @BLK@(BLKI)=$$^LKZFORM($$CONCAS^%QZCHAD(DATA,BASE),.ERR)
 S @BLK@(BLKI)=$$FORMAT^LKZFORM("*FIN"_$$NOMLOG^%QSF(BASE),@DATA@(BASE,"L")),BLKI=BLKI+1
 Q
T1 S ATT=@DATA@(BASE,"D",ATTI,"ATT")
 D MV^%QSCALVA(BASE,IND,ATT,.VAL,.TYPE) B
 I VAL=0 Q
 I TYPE=0 S VA=$O(VAL("")),@DATA@(BASE,"D",ATTI,"D")=VA Q
 
 I TYPE=0 Q
 S OR=$O(VAL(""))
 F J=0:0 Q:OR=""  D T2 S OR=$O(VAL(OR))
 Q
T2 D ^LKWRIT($$NOMINT^%QSF(ATT),VAL(OR),DATA,BLK,.BLKI) Q

