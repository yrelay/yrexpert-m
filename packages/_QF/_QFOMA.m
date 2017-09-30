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

;%QFOMA^INT^1^59547,73876^0
%QFOMA ;
 N CUSTO
 S CUSTO=$$TEMP^%SGUTIL
 D INT("","","",CUSTO)
 K @(CUSTO)
 Q
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
INT(LBASE,STOCK,CREA,CUSTOM) 
 B
 N LISTES,TEMP,CTR,LLISRES
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"INT")
 S LISTES=$$CONCAS^%QZCHAD(TEMP,"LISTES")
 
 D SEL(LISTES,LBASE,.CTR)
 G:CTR'="" ABANDO
 D INT1(LISTES,STOCK,CREA,CUSTOM)
 Q
 
TEST(LISTE) 
 N LLISRES,CUSTOM,SEL
 S CUSTOM=$$TEMP^%SGUTIL
 S SEL=$$TEMP^%SGUTIL
 S @SEL@(LISTE)=""
 S LLISRES=$$GEN^%QCAPOP("GRP")
 D CREERL^%QS0XG1(LLISRES,"L0","^[QUI]ZLIGTRAI("""_LLISRES_""")","GROUPAGE","GROUPAGE")
 D INT1(SEL,LLISRES,"","",CUSTOM)
 Q
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
INT1(LISTES,LLISTEN,STOCK,CREA,CUSTOM) 
 N TEMP,CTR,STOCK1,CREA1,CUSTOM1,I
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"INT1")
 S CUSTOM1=$$CONCAS^%QZCHAD(TEMP,"CUSTOM1")
 S MEN1=$$CONCAS^%QZCHAD(TEMP,"MEN1")
 
 D KILL
 
 S @CUSTOM1@("LISTE")=$$CONCAS^%QZCHAD(TEMP,"LISTE")
 
 I STOCK="" S STOCK="STO^%QFOMA"
 I CREA="" S CREA="$$QGCREA^%QFOMA"
 S STOCK1=$$CONCAS^%QZCHAD(STOCK,"^GRESUL($J)")
 S CREA1=$$CONCAT^%QZCHAD(CREA,"NLISTE")
 S @CUSTOM1@("CREGR")="$$CREAGRO^%QFCREGR"
 S:$D(@CUSTOM@("CREGR")) @CUSTOM1@("CREGR")=$$CONCAT^%QZCHAD(@CUSTOM@("CREGR"),"BASE,NUFA,UC")
 S @CUSTOM1@("SUPGR")="$$SAIS0^%QFSUPGR(GR)"
 S:$D(@CUSTOM@("SUPGR")) @CUSTOM1@("SUPGR")=$$CONCAT^%QZCHAD(@CUSTOM@("SUPGR"),"GR")
 S @CUSTOM1@("FUSGR")="$$SAIS0^%QFFUSGR(BASE,NUFA,UC)"
 S:$D(@CUSTOM@("FUSGR")) @CUSTOM1@("FUSGR")=$$CONCAT^%QZCHAD(@CUSTOM@("FUSGR"),"BASE,NUFA,UC")
 
 S @CUSTOM1@("AFFOBJ")=""
 S:$D(@CUSTOM@("AFFOBJ")) @CUSTOM1@("AFFOBJ")=$$CONCAT^%QZCHAD(@CUSTOM@("AFFOBJ"),"GR,OBJ,.RETOUR")
 S @CUSTOM1@("PLACER")=""
 S:$D(@CUSTOM@("PLACER")) @CUSTOM1@("PLACER")=$$CONCAT^%QZCHAD(@CUSTOM@("PLACER"),"PLACE,SG,OBJ,.AFF")
 S @CUSTOM1@("RAPPEL")=""
 S:$D(@CUSTOM@("RAPPEL")) @CUSTOM1@("RAPPEL")=$$CONCAT^%QZCHAD(@CUSTOM@("RAPPEL"),"RAPP,SG,OBJ,.AFF")
 
 S @CUSTOM1@("INTGR")=""
 S:$D(@CUSTOM@("INTGR")) @CUSTOM1@("INTGR")=$$CONCAT^%QZCHAD(@CUSTOM@("INTGR"),"OBJ,.AFF")
 
 S @CUSTOM1@("FUSGR")=""
 S:$D(@CUSTOM@("FUSGR")) @CUSTOM1@("FUSGR")=$$CONCAT^%QZCHAD(@CUSTOM@("FUSGR"),"BASE,NUFA,UC,LISTE")
 
 S @MEN1@(1)=$$^%QZCHW("Gauche")_"^"_"SLPAG",@MEN1@(1,"EQU")="<"
 S @MEN1@(2)=$$^%QZCHW("Droite")_"^"_"SLPAD",@MEN1@(2,"EQU")=">"
 I $D(@CUSTOM@("SLCOT")) S CTR=$O(@CUSTOM@("SLCOT","")) F I=3:1 Q:CTR=""  S @MEN1@(I)=@CUSTOM@("SLCOT",CTR),CTR=$O(@CUSTOM@("SLCOT",CTR))
 
 S @CUSTOM1@("TITRE")=$$^%QZCHW("Groupage")
 S:$D(@CUSTOM@("TITRE")) @CUSTOM1@("TITRE")=@CUSTOM@("TITRE")
 
 G:'($$^%QFINIT2(LISTES,LLISTEN)) ABANDO
 W *-1 S CTRLA=0,CTRLF=0
 D ^%QFDECI
 G FIN:$$^%QCAZG("CTRLF"),ABANDO
FIN 
 D MSG("Fin, et stockage des resultats.")
 D ^%QFSTOCK
 S OK=1 D KILL
 
 D ON^%VZEATT
 D @STOCK1
 D OFF^%VZEATT
 K ^GRESUL($J)
 Q
ABANDO 
 D MSG("Abandon, les resultats ne seront pas pris en compte.")
 S OK=0 D KILL
 Q
KILL K ^ATTR($J),^LISTES($J),^AFFPAG($J),^PAG($J),^PAD($J),^GRV($J)
 K ^[QUI]GROUPE($J),^[QUI]GRATT($J),^[QUI]GRLISTE($J),^[QUI]GROAFF($J)
 K @(TEMP)
 Q
MSG(MSG) D ^%VSQUEAK,POCLEPA^%VVIDEO,BLD^%VVIDEO W $P(MSG,",",1),$$NORM^%VVIDEO1,",",$P(MSG,",",2) H 1 D POCLEPA^%VVIDEO Q
 
SEL(SEL,LBASE,CTR) 
 N LISTE S CTR=""
 S LISTE=$$SEL^%QS0SEL1(LBASE,$$^%QZCHW("GROUPAGE"))
 I LISTE="" S CTR="A" Q
 S @SEL@(LISTE)=""
 Q
STO(LLISTE) 
 D ^%QFSTO(LLISTE) Q
QGCREA(LISTE) 
 Q $$^%QFCREA(LISTE)

