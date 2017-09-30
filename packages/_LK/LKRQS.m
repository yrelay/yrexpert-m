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

;LKRQS^INT^1^59547,74867^0
LKRQS(AS,NS,DS,DD,PROT,VECT,ID,IF) 
 N EXTERNE S EXTERNE="",RT=0 G DEB
LKRQS1(AS,NS,DS,DD,PROT,VECT,ID,IF,EXTERNE) 
 S RT=1
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
DEB N I,ROOTS,TEMP,DATAS,PAR,PVECT,ER,A,ADRPROT,TABATT
 N LOCAL,LOCAL1
 S ROOTS="^[QUI]LK("""_AS_""","""_NS_""","""_DS_""")"
 S TEMP=$$CONCAS^LKZ("^TEMPORAI($J)",$P($ZPOS,"^",2))
 S DATAS=$$EX^LKZ(ROOTS)_",""DATA"")"
 S PAR=$$EX^LKZ(TEMP)_",""PAR"")"
 S PVECT=$$EX^LKZ(TEMP)_",""PVECT"")"
 S ADRPROT=PROT_"^LKRQSPRO"
 S TABATT=$$CONCAS^LKZ(PAR,"TABATT")
 K @(TEMP)
 F I="ROOTS","AS","NS","DS","DD","PROT","VECT" S @PAR@(I)=@I
 D ^%QCAGLTX(VECT,PAR)
 D ^%QCAGLTX(ADRPROT,PVECT)
 S LOCAL=$$CONCAS^%QZCHAD(TEMP,"TABLES.LOCALES")
 S LOCAL1=$$CONCAS^%QZCHAD(TEMP,"PAR,TABLEL")
 
 D STOTBL(LOCAL1,LOCAL)
 
 D EXTERNE(EXTERNE,PAR)
 
 
 S:'(RT) A="ER=$$"_@PVECT@("FCT")_"(PAR,TABATT,ID,IF)"
 S:RT A="ER=$$"_@PVECT@("FCT")_"(PAR,TABATT,ID,IF,EXTERNE)"
 S @(A)
 K @(TEMP)
 Q ER
 
STOTBL(TBL,LOCAL) 
 N I,LOC
 S LOC=$O(@TBL@(""))
 F I=0:0 Q:LOC=""  D STOTB1 S LOC=$O(@TBL@(LOC))
 Q
STOTB1 D ^%QCAGLTX(@TBL@(LOC),$$CONCAT^%QZCHAD(LOCAL,""""_LOC_""""))
 Q
 
EXTERNE(EXT,PAR) 
 I ($D(@PAR@("LKEX"))#10)=0 S @PAR@("LKEX")=""
 I ($D(@PAR@("LKEX","EXTERNE"))#10)=0 S @PAR@("LKEX","EXTERNE")=""
 I EXT="" Q
 S @PAR@("LKEX","EXTERNE")=$$CONCAS^%QZCHAD(EXTERNE,"LKEX")
 Q
 
TEST K ^TEMPORAI($J) D CLEPAG^%VVIDEO
 S ER=$$LKRQS("AVEX","A2","53626,38050","53626,38050","AVEXRQ","AVEX2^LKTXAVEX","","")
 W !,ER
 Q

