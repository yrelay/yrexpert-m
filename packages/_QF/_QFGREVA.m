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

;%QFGREVA^INT^1^59547,73875^0
QFGREVA ;
 
 
 
 
 
 
 
 
 
 
 
 
 
IND(LISTE,IND,CATTS,MODE) 
 N ATT,I,BASE
 S BASE=$$BASE^%QSGEST7(LISTE)
 S ATT=$O(@CATTS@(""))
 F I=0:0 Q:ATT=""  D IND1 S ATT=$O(@CATTS@(ATT))
 Q
IND1 D PA^%QSGESTI("L0",LISTE,ATT,$$^%QSCALVA("L0",LISTE,ATT)+($$^%QSCALVA(BASE,IND,ATT)*MODE),1)
 Q
 
 
 
 
 
 
 
 
LIND(LISTE,ACUMUL,CUMUL) 
 N BASE,ADR,IND,I,CUMUL1,TEMP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LIND")
 S CUMUL1=$$CONCAS^%QZCHAD(TEMP,"CUMUL1")
 K @(TEMP)
 S BASE=$$BASE^%QSGEST7(LISTE)
 S ADR=$$ADRLIS^%QSGEST7(LISTE)
 I ((BASE="")!(ADR=0))!(ADR="") Q
 D LOAD("","",ACUMUL,CUMUL1)
 D LOAD("","",ACUMUL,CUMUL)
 S IND=$O(@ADR@(""))
 F I=0:0 Q:IND=""  D LIND1 S IND=$O(@ADR@(IND))
 K @(TEMP)
 Q
LIND1 D LOAD(BASE,IND,ACUMUL,CUMUL1)
 D OP(CUMUL,CUMUL1,CUMUL,"+")
 Q
 
STORE(BASE,IND,ACUMUL,CUMUL) 
 N ATT,I
 S ATT=""
 F I=0:0 S ATT=$O(@ACUMUL@(ATT)) Q:ATT=""  D PA^%QSGESTI(BASE,IND,ATT,@CUMUL@(ATT),1)
 Q
 
LOAD(BASE,IND,ACUMUL,CUMUL) 
 N ATT,I
 S ATT=""
 F I=0:0 S ATT=$O(@ACUMUL@(ATT)) Q:ATT=""  S @CUMUL@(ATT)=$$^%QSCALVA(BASE,IND,ATT)+0
 Q
 
 
 
OP(CUMUL1,CUMUL2,CUMUL3,MODE) 
 N ATT,I
 S ATT=""
 F I=0:0 S ATT=$O(@CUMUL1@(ATT)) Q:ATT=""  S @("@CUMUL3@(ATT)=@CUMUL1@(ATT)"_MODE_"@CUMUL2@(ATT)")
 Q
 
 
 
 
 
 
LISTE(LISTE,ACUMUL) 
 N CUMUL,TEMP
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"LISTE")
 S CUMUL=$$CONCAS^%QZCHAD(TEMP,"CUMUL1")
 K @(TEMP)
 D LIND(LISTE,ACUMUL,CUMUL)
 D STORE("L0",LISTE,ACUMUL,CUMUL)
 K @(TEMP)
 Q
 
 
 
INIT(LISTIND,LLISTEN,ACUMUL) 
 N ADR,L,I,ADRL
 D LISTE(LISTIND,ACUMUL)
 S ADR=$$ADRLIS^%QSGEST7(LLISTEN)
 I (ADR="")!(ADR=0) Q
 S L=""
 F I=0:0 S L=$O(@ADR@(L)) Q:L=""  D LISTE(L,ACUMUL)
 D LISTE(LLISTEN,ACUMUL)
 Q
 
 
 
 
AFFEC(LISTIND,LLISTEN,AF,GROAFF) 
 N ADR,I,L
 D AFFECL(LISTIND,AF,-1,GROAFF)
 S ADR=$$ADRLIS^%QSGEST7(LLISTEN) I (ADR=0)!(ADR="") Q
 
 S L=$O(@ADR@("")) K @(GROAFF)
 F I=0:0 Q:L=""  D AFFECL(L,AF,-1,GROAFF) S L=$O(@ADR@(L))
 
 S L=$O(@ADR@(""))
 F I=0:0 Q:L=""  D AFFECL(L,AF,1,GROAFF) S L=$O(@ADR@(L))
 Q
 
AFFECL(L,AF,MODE,GROAFF) 
 N ADR,I,O
 S ADR=$$ADRLIS^%QSGEST7(L)
 I (ADR=0)!(ADR="") Q
 S O=$O(@ADR@(""))
 F I=0:0 Q:O=""  D AFFECO(L,O,AF,MODE) S O=$O(@ADR@(O))
 Q
AFFECO(L,O,AF,MODE) 
 I MODE=1 S @GROAFF@(O,L)="" Q
 I MODE=0 K @GROAFF@(O,L) Q
 I MODE=-1 K @GROAFF@(O)
 Q

