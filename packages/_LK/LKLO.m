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

;LKLO^INT^1^59547,74867^0
LKLO(AS,NS,DS,AD,ND,DD,PROT,VECT,ID,IF,CNT) 
 N EXTERNE S EXTERNE="" G DEB
 
LKLO1(AS,NS,DS,AD,ND,DD,PROT,VECT,ID,IF,CNT,EXTERNE) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
DEB N I,ROOTS,ROOTD,ERRA,TEMP,DATA,PAR,PVECT,ER,DATAD,DATAS,ADRPROT,LOCAL
 
 
 
 S ROOTS="^[QUI]LK("""_AS_""","""_NS_""","""_DS_""")"
 S ROOTD="^[QUI]LK("""_AD_""","""_ND_""","""_DD_""")"
 S ERRA=$$EX^LKZ(ROOTS)_",""ERR"")"
 S TEMP="^TEMPORAI($J,""LKLO"")"
 S DATAS=$$EX^LKZ(ROOTS)_",""DATA"")"
 S DATAD=$$EX^LKZ(ROOTD)_",""DATA"")"
 S PAR=$$EX^LKZ(TEMP)_",""PAR"")"
 S PVECT=$$EX^LKZ(TEMP)_",""PVECT"")"
 S ADRPROT=PROT_"^LKLOPRO"
 S LOCAL=$$CONCAS^%QZCHAD(TEMP,"LOCAL")
 K @(TEMP)
 F I="ROOTS","AS","NS","DS","ROOTD","AD","ND","DD","PROT","VECT" S @PAR@(I)=@I
 D ^%QCAGLTX(VECT,PAR)
 D ^%QCAGLTX(ADRPROT,PVECT)
 
 D LOCAL(PAR,LOCAL)
 
 D EXTERNE(EXTERNE,PAR)
 
 K @(ROOTD)
 S @("ER=$$"_@PVECT@("FCT")_"(ID,IF,CNT,LOCAL)")
 K @(TEMP)
 Q ER
 
 
LOCAL(PAR,LOCAL) 
 N I,LOCALP,ROU
 S LOCALP=$O(@PAR@("TABLEL",""))
 F I=0:0 Q:LOCALP=""  D LOCAL1 S LOCALP=$O(@PAR@("TABLEL",LOCALP))
 Q
LOCAL1 S ROU=@PAR@("TABLEL",LOCALP)
 D ^%QCAGLTX(ROU,$$CONCAS^%QZCHAD(LOCAL,LOCALP))
 Q
 
EXTERNE(EXT,PAR) 
 I ($D(@PAR@("LKEX"))#10)=0 S @PAR@("LKEX")=""
 I ($D(@PAR@("LKEX","EXTERNE"))#10)=0 S @PAR@("LKEX","EXTERNE")=""
 I EXT="" Q
 S @PAR@("LKEX","EXTERNE")=$$CONCAS^%QZCHAD(EXTERNE,"LKEX")
 Q
 
TEST K ^[QUI]LK("AVEX","M","D")
 S ER=$$LKLO("NSC","N","D","AVEX","M","D","LOST","AVEX^LKTLAVEX","",10,1)
 Q

