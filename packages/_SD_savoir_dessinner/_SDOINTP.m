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

;%SDOINTP^INT^1^59547,73889^0
SDOINTP ;
 
 
 
 
 N %C,%R,OBJ,PK,VERS,X,Y
DEF 
 D ^%SDOBJ($$^%QZCHW("Interpretation d'un objet graphique"),1,.OBJ,.VERS)
 
 I OBJ="" Q
 K PK
 D EXT(OBJ,VERS)
 G DEF
 
 
 
 
 
EXT(OBJ,VERS) 
 N ADR,COL,VERC
 
 
 S COL=$$GEN^%QCAPOP("SDX")
 S VERC=1
 
 S ADR=$$DEF^%SDCCMS(COL,VERC)
 S @ADR@("OBJ",1,"R",OBJ,VERS)=""
 
 S @ADR@("OBJ",1,"ECH")=1,@ADR@("OBJ",1,"ANG")=0
 S @ADR@("OBJ",1,"X")=0,@ADR@("OBJ",1,"Y")=0
 
 D EXT^%SDCDEF(COL,VERC,1,0)
 
 D SUPPR^%SDCCMS(COL,VERC)
 Q
 
 
 
 
 
 
INTERP(OBJ,VERS,XO,YO,ANGO,ECHO,XOC,YOC) 
 N COND,NUM,LIG,STO,STO2,E,TL,VIS,CONDIT
 S EF=0,VIS=1
 
 S STO2=$$DEF^%SDOCMS(OBJ,VERS)
 S STO=$$COMP^%SDOCMS(OBJ,VERS)
 
 S NUM=""
ELEM S NUM=$O(@STO@(NUM))
 I NUM="" Q
 I '($D(@STO2@("EL",NUM,"COND"))) G ELEM2
 S COND=@STO2@("EL",NUM,"COND")
 I '($$EXISTE^%SDOCTEX(COND)) G ELEM2
 
 S OK=0,LIG=""
LOOPC S LIG=$O(^[QUI]SDCOND(COND,"COMP",LIG))
 I LIG="" G FLOOPC
 S CONDIT="I "_^[QUI]SDCOND(COND,"COMP",LIG)_" S OK=1"
 X CONDIT
 I '(OK) G ELEM
 G LOOPC
FLOOPC I '(OK) G ELEM
ELEM2 S TL=$$TYPL($$TYPL^%SDEGEST(OBJ,VERS,NUM))
 S LIG=""
LIG S LIG=$O(@STO@(NUM,LIG)) I LIG="" G ELEM
 X @STO@(NUM,LIG)
 G LIG
 
TYPL(TL) 
 N T
 S T=$S(TL="INVISIBLE":"I",TL="MIXTE":"M",TL="POINTILLE":"P",TL="COURT":"C",TL="LONG":"L",1:"F")
 Q T

