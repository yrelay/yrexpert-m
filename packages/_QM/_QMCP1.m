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

;%QMCP1^INT^1^59547,73876^0
QMCP1(WHOIS1,QUI,LISTE,BASE,STRUCT,COOR,WHOIS2,QUI2,INTERD,MODE,VISU) ;;12:20 PM  12 Jun 1991
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 N O,I,PILE,STRUCT1,TEMP,DX,DY,BASE1,IND1
 S DX=0,DY=23 X XY
 S TEMP=$$TEMP^%QZCHAD($P($ZPOS,"^",2),"") K @(TEMP)
 S PILE=$$CONCAS^%QZCHAD(TEMP,"PILE")
 S:INTERD="" INTERD=$$CONCAS^%QZCHAD(TEMP,"INTERD")
 S STRUCT1=STRUCT
 
 
 D INITFI^%QCASTA(PILE)
 
 S O=$O(@LISTE@(""))
 F I=0:0 Q:O=""  D T1 S O=$O(@LISTE@(O))
 K @(TEMP)
 
 Q
 
T1 
 I MODE=1,'($D(@COOR@(BASE,O))) Q
 
 
 D PUSH^%QCASTA(PILE,O_"^"_BASE)
 F I=0:0 Q:$$PILEVIDE^%QCASTA(PILE)  S IND1=$$POP^%QCASTA(PILE),BASE1=$P(IND1,"^",2),IND1=$P(IND1,"^",1) I $D(@INTERD@(BASE1,IND1))=0 D INCR,COPY^%QMCP2(PILE,WHOIS1,QUI,BASE1,IND1,COOR,STRUCT1,WHOIS2,QUI2,MODE) S @INTERD@(BASE1,IND1)=""
 Q
 
INCR I '(VISU) Q
 I VISU=1 W "." Q
 D MSG^%VZEATT(WHOIS1_" : "_$$NOMLOG^%QMCPZ(WHOIS1,QUI,BASE1)_" "_IND1_" --> "_WHOIS2_" : "_$$NOMLOG^%QMCPZ(WHOIS2,QUI2,$S(($D(@STRUCT@("S",BASE1,"BDI"))#10)=1:@STRUCT@("S",BASE1,"BDI"),1:""))_" "_$$NOM^%QMCP2(COOR,BASE1,IND1))
 Q

