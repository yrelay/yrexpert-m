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

;%QMCP8^INT^1^59547,73876^0
QMCP8(STRUCT,WHOIS1,QUI1,REP1,PATH) 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N TEMP,PILE,I,REPE1,LIENS,LIEN,REPE1F,INTERDL
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"")
 S PILE=$$CONCAS^%QZCHAD(TEMP,"PILE")
 S LIENS=$$CONCAS^%QZCHAD(TEMP,"LIENS")
 S INTERDL=$$CONCAS^%QZCHAD(TEMP,"INTERDL")
 K @(TEMP)
 D INITFI^%QCASTA(PILE)
 D PUSH^%QCASTA(PILE,REP1)
 F I=0:0 Q:$$PILEVIDE^%QCASTA(PILE)  D T1
 K @(TEMP)
 Q
T1 K @(LIENS)
 S REPE1=$$POP^%QCASTA(PILE)
 S @STRUCT@("S",REPE1,"BDI")=REPE1
 D LIEN^%QMCPZ(WHOIS1,QUI1,REPE1,LIENS)
 S LIEN=$O(@LIENS@(""))
 F I=0:0 Q:LIEN=""  D T2 S LIEN=$O(@LIENS@(LIEN))
 Q
 
T2 
 I $D(@INTERDL@(LIEN)) Q
 I PATH["F",@LIENS@(LIEN)=2 D T3 Q
 I PATH["P",@LIENS@(LIEN)=1 D T3 Q
 Q
 
T3 D LIENR^%QMCPZ(WHOIS1,QUI1,LIEN,REPE1,.REPE1F)
 
 D PUSH^%QCASTA(PILE,REPE1F)
 S @STRUCT@("S",REPE1,"R",LIEN)=LIEN
 
 S @INTERDL@(LIEN)=""
 Q
 
 
 
 
 
 
 
FAMILLE(STRUCT,WHOIS,QUI1,REP1,PATH) 
 N STOP,REP11
 S STOP=0
 I PATH["F" D ^%QMCP8(STRUCT,WHOIS,QUI1,REP1,"F") S STOP=1
 I PATH["P" D ^%QMCP8(STRUCT,WHOIS,QUI1,REP1,"P") S STOP=1
 I STOP Q
 
 D ^%QMCP8(STRUCT,WHOIS,QUI1,REP1,"P")
 
 S REP11=$$RGPERE^%QSGES17(REP1)
 I REP11="" Q
 
 D ^%QMCP8(STRUCT,WHOIS,QUI1,REP11,"F")
 Q
TEST X ^TEST
 S QUI1=QUI
 S REP1="MOZ"
 S STRUCT1="XX"
 D FAMILLE(STRUCT1,WHOIS,QUI1,REP1,"S")
 Q

